' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'

Imports System.Net
Imports System.Net.Sockets
Imports System.Text
Imports System.Threading


Public Class AsynchronousSocketListener

    Public Event SpeedUpdated(ByVal _objSender As Object, ByVal _intSpeedTime As Integer)
    Public Event PositionUpdated(ByVal _objSender As Object, ByVal _intCobID As Integer, ByVal _intLongValue As Integer, ByVal _intLatValue As Integer)
    Public Event RequestToSend(ByVal _objSender As Object, ByRef _arbyData() As Byte, ByRef _intLength As Integer)

    ' Thread signal.
    Public Shared m_objManualResetEvent As New ManualResetEvent(False)

    Public Sub New()

    End Sub 'New


    Public Sub StartListening(ByVal _intPort As Integer)
        ' Data buffer for incoming data.
        Dim bytes() As Byte = New [Byte](1024) {}
        Dim iConnection As Integer = 1

        ' Establish the local endpoint for the socket.
        ' The DNS name of the computer
        Dim ipHostInfo As IPHostEntry = Dns.GetHostEntry(Dns.GetHostName())
        Dim ipAddress As IPAddress = ipHostInfo.AddressList(0)
        Dim localEndPoint As New IPEndPoint(ipAddress, _intPort)

        ' Intializes a TCP/IP socket.
        Dim objSocketListener As New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)

        ' Bind the socket to the local endpoint and listen for incoming 
        ' connections.
        Try
            objSocketListener.Bind(localEndPoint)
            objSocketListener.Listen(100)

            While iConnection > 0
                ' Set the event to nonsignaled state.
                m_objManualResetEvent.Reset()

                ' Start an asynchronous socket to listen for connections.
                objSocketListener.BeginAccept(New AsyncCallback(AddressOf AcceptCallback), objSocketListener)

                ' Wait until a connection is made before continuing.
                m_objManualResetEvent.WaitOne()
            End While

        Catch e As Exception
            Throw e
        End Try
    End Sub 'StartListening


    Public Sub AcceptCallback(ByVal ar As IAsyncResult)
        ' Signal the main thread to continue.
        m_objManualResetEvent.Set()

        ' Get the socket that handles the client request.
        Dim objSocketListener As Socket = CType(ar.AsyncState, Socket)
        Dim handler As Socket = objSocketListener.EndAccept(ar)

        ' Create the state object.
        Dim state As New SocketState()
        state.Results.CylinderSize = 480000
        state.workSocket = handler

        'Send welcome message
        Send(handler, "Welcome")

        handler.BeginReceive(state.Buffer, 0, SocketState.BufferSize, 0, New AsyncCallback(AddressOf ReadCallback), state)
    End Sub 'AcceptCallback


    Public Sub ReadCallback(ByVal ar As IAsyncResult)
        ' Retrieve the state object and the handler socket
        ' from the asynchronous state object.
        Dim state As SocketState = CType(ar.AsyncState, SocketState)
        Dim handler As Socket = state.workSocket
        Dim intOffset As Integer
        Dim objResult As Result
        Dim intLateral As Integer
        Dim intLongitudinal As Integer

        Dim arbySendData() As Byte = New [Byte](SocketState.BufferSize) {}
        Dim intSendLength As Integer

        ' Read data from client socket. 

        Dim bytesRead As Integer

        Try
            If handler.Connected Then
                bytesRead = handler.EndReceive(ar)
            Else
                bytesRead = 0
            End If

            If bytesRead > 0 Then
                ' There might be more data, so store the data received so far.
                state.Results.Clear()

                intOffset = AnalyzeString(state, 0)
                'Debug.Write(state.Results.ToString())

                RaiseEvent SpeedUpdated(Me, state.Results.Speed)

                For Each objResult In state.Results.Values
                    If objResult.LatError = Nothing Then
                        intLateral = 0
                    Else
                        intLateral = objResult.LatError
                    End If

                    If objResult.LongError = Nothing Then
                        intLongitudinal = 0
                    Else
                        intLongitudinal = objResult.LongError
                    End If

                    RaiseEvent PositionUpdated(Me, objResult.CobID, intLongitudinal, intLateral)

                Next

                Buffer.BlockCopy(state.Buffer, intOffset + 1, state.Buffer, 0, SocketState.BufferSize - intOffset)
                Array.Clear(state.Buffer, SocketState.BufferSize - intOffset, intOffset + 1)

                handler.BeginReceive(state.Buffer, 0, SocketState.BufferSize, 0, New AsyncCallback(AddressOf ReadCallback), state)

            End If

            intSendLength = 0
            RaiseEvent RequestToSend(Me, arbySendData, intSendLength)
            If intSendLength > 0 Then
                handler.BeginSend(arbySendData, 0, intSendLength, 0, New AsyncCallback(AddressOf SendCallback), handler)
            End If
        Catch ex As SocketException
            Debug.Print("Socket Exception - " & ex.Message)
            'Catch ex As Exception
            '    Throw ex
        End Try


    End Sub 'ReadCallback

    Private Function AnalyzeString(ByRef _objStateObject As SocketState, ByVal _intIndexOffset As Integer) As Integer
        Dim intIndexOffset As Integer = -1
        Dim intResult As Integer = 0
        Dim intValue As Integer
        Dim intDirection As Integer
        Dim intCobId As Integer

        For intCobId = &H7F To &H8F
            If Not _objStateObject.Results.Updated(intCobId) Then
                intIndexOffset = Array.IndexOf(_objStateObject.Buffer, CByte(intCobId), _intIndexOffset)
                If intIndexOffset <> -1 Then
                    intResult = Math.Max(intIndexOffset, AnalyzeString(_objStateObject, intIndexOffset + 1))
                    If intIndexOffset > 6 Then
                        intValue = BitConverter.ToInt32(_objStateObject.Buffer, intIndexOffset - 5)
                        intDirection = _objStateObject.Buffer(intIndexOffset - 7)

                        Select Case intDirection
                            Case 0
                                If intCobId = &H7F Then 'Speed
                                    _objStateObject.Results.Speed = intValue
                                End If
                            Case 1 'lateral
                                _objStateObject.Results.SetLatValue(intCobId, intValue)
                            Case 2 'longitudinal
                                _objStateObject.Results.SetLongValue(intCobId, intValue)
                        End Select
                    End If

                    If _objStateObject.Results.Updated(intCobId) Then
                        Continue For
                    End If
                End If
            End If
        Next

        Return intResult

    End Function


    Private Sub Send(ByVal handler As Socket, ByVal data As [String])
        ' Convert the string data to byte data using ASCII encoding.
        Dim byteData As Byte() = Encoding.ASCII.GetBytes(data)

        ' Begin sending the data to the remote device.
        handler.BeginSend(byteData, 0, byteData.Length, 0, New AsyncCallback(AddressOf SendCallback), handler)
    End Sub 'Send


    Private Sub SendCallback(ByVal ar As IAsyncResult)
        Try
            ' Retrieve the socket from the state object.
            Dim handler As Socket = CType(ar.AsyncState, Socket)

            ' Complete sending the data to the remote device.
            Dim bytesSent As Integer

            If handler.Connected Then
                bytesSent = handler.EndSend(ar)
            Else
                bytesSent = 0
            End If

            'handler.Shutdown(SocketShutdown.Both)
            'handler.Close()

        Catch e As Exception
            Throw e
        End Try
    End Sub

End Class