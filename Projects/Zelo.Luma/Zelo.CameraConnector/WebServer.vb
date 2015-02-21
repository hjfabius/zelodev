' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Imports System.Threading
Imports System.Net.Sockets
Imports System.Net
Imports System
Imports System.Text

Public Class WebServer
    Implements IDisposable

#Region "Costants"
    Private Const mc_intLocalIPPort As Int32 = 13000
#End Region

#Region "Variables"
    Private m_objLocalIPAddress As IPAddress
    Private m_intLocalIPPort As Int32
    Private m_htobjCameras As Hashtable
    Private m_objSocketClient As Socket
    Private m_objNetworkStream As NetworkStream
    Private m_objThread As Thread
    Private m_blnClosing As Boolean
    Private m_blnAutoClosing As Boolean
    Private m_objTcpListener As TcpListener
#End Region

#Region "Event"
    Public Event Action(ByRef _objSender As Object, ByVal _strAction As String)
    Public Event Closed(ByRef _objSender As Object)
    Public Event ClientConnectionStatusChanged(ByRef _objSender As Object, ByVal _strIPAddress As String, ByVal _blnConnected As Boolean)

    Public Event ReadyToSendAMessage(ByRef _objSender As Object, ByRef _arobjMessage() As Byte, ByRef _blnCancel As Boolean)
    Public Event ReadyToReceiveAMessage(ByRef _objSender As Object, ByRef _blnCancel As Boolean)

    Public Event MessageSent(ByRef _objSender As Object, ByRef _arobjMessage() As Byte)
    Public Event MessageReceived(ByRef _objSender As Object, ByRef _arobjMessage() As Byte)
#End Region

#Region "Properties"


    Public ReadOnly Property IPAddress() As String
        Get
            Return m_objLocalIPAddress.ToString
        End Get
    End Property

    Public ReadOnly Property IPPort() As String
        Get
            Return m_intLocalIPPort.ToString
        End Get
    End Property

#End Region

#Region "Methods"

#Region "Init & Close"
    Public Sub Start(Optional ByVal _intPort As Integer = mc_intLocalIPPort)
        Try
            m_htobjCameras = New Hashtable
            m_objLocalIPAddress = Dns.GetHostEntry(Dns.GetHostName()).AddressList(0)
            m_intLocalIPPort = mc_intLocalIPPort
            m_blnClosing = False
            m_blnAutoClosing = False

        Catch ex As Exception
            RaiseEvent Action(Me, "Impossible to create a connnection on the port " & m_intLocalIPPort)
            Throw New Exception("Impossible to create a connnection on the port " & m_intLocalIPPort, ex)
        End Try

        Try
            m_objThread = New Thread(AddressOf Me.ServerLoop)
            m_objThread.Priority = Threading.ThreadPriority.Lowest
            m_objThread.Name = "ServerLoop"
            m_objThread.Start()

            'm_objThread.GetData()

        Catch ex As Exception

            RaiseEvent Action(Me, "Impossible to start server thread")
            Throw New Exception("Impossible to start server thread", ex)
        End Try

    End Sub

    Private Sub ConnectionLost()
        Try
            'Dim objSocket As Socket
            'objSocket = New Socket(AddressFamily.Unspecified, SocketType.Stream, ProtocolType.IP)
            'objSocket.Connect(New IPEndPoint(m_objLocalIPAddress, m_intLocalIPPort))
            'objSocket.Close()

            If Not m_objTcpListener Is Nothing Then
                m_objTcpListener.Stop()
                m_objTcpListener = Nothing
            End If

            If Not m_objSocketClient Is Nothing AndAlso _
                    m_objSocketClient.Connected Then
                m_objSocketClient.Close()
                m_objSocketClient = Nothing
            End If
        Catch ex As Exception
            MsgBox("m_objSocketClient.Close - " & ex.Message)
            Throw ex
        End Try

        If Not m_objNetworkStream Is Nothing Then
            m_objNetworkStream.Close()
            m_objNetworkStream = Nothing
        End If

    End Sub

    Public Sub Close()
        Try
            m_blnClosing = True

            ConnectionLost()

            Try
                If Not m_blnAutoClosing AndAlso _
                    m_objThread.IsAlive Then
                    m_objThread.Abort()
                End If
                m_objThread = Nothing
            Catch ex As Exception
                MsgBox("m_objThread.abort - " & ex.Message)
                Throw ex
            End Try

            RaiseEvent Closed(Me)

        Catch ex As Exception
            MsgBox(ex.Message)
            'Throw ex
        End Try
    End Sub

    Public Sub Dispose() Implements System.IDisposable.Dispose
        m_htobjCameras.Clear()

        m_htobjCameras = Nothing
        m_objLocalIPAddress = Nothing
    End Sub

    Private Sub ServerLoop()
        Dim strIPAddress As String

        m_objTcpListener = New TcpListener(m_objLocalIPAddress, m_intLocalIPPort)
        m_objTcpListener.Start()

        'Waiting for incoming calls
        RaiseEvent Action(Me, "Server is waiting for connections...")
        m_objSocketClient = m_objTcpListener.AcceptSocket
        strIPAddress = CType(m_objSocketClient.RemoteEndPoint, IPEndPoint).Address.ToString

        'Check if dummy socket is opened by itself to force the appliction end
        If CType(m_objTcpListener.LocalEndpoint, IPEndPoint).ToString.Equals(strIPAddress) Then
            m_objTcpListener.Stop()
            m_objTcpListener = Nothing
            Return
        End If

        RaiseEvent Action(Me, "Connection received from " & strIPAddress & ":" & CType(m_objSocketClient.RemoteEndPoint, IPEndPoint).Port)

        m_objNetworkStream = New NetworkStream(m_objSocketClient)


        RaiseEvent ClientConnectionStatusChanged(Me, strIPAddress, True)

        'looping wait for messages
        While Not m_objSocketClient Is Nothing AndAlso _
                m_objSocketClient.Connected AndAlso _
                Not m_objSocketClient.Poll(1000, SelectMode.SelectError) 'Seems to work in one test
            'ReceiveMessage()
            SendMessage()
        End While

        m_objTcpListener.Stop()
        m_objTcpListener = Nothing

        RaiseEvent Action(Me, "Connection closed")


    End Sub

    Public Sub SendMessage()
        Dim arobjMsg(8) As [Byte]
        arobjMsg(0) = CByte(Asc("F"))
        arobjMsg(1) = CByte(Asc("l"))
        arobjMsg(2) = CByte(Asc("a"))
        arobjMsg(3) = CByte(Asc("s"))
        arobjMsg(4) = CByte(Asc("h"))
        arobjMsg(5) = CByte(0)
        arobjMsg(6) = CByte(0)

        Try
            If Not m_objNetworkStream Is Nothing AndAlso _
                m_objNetworkStream.CanWrite Then
                m_objNetworkStream.Write(arobjMsg, 0, 6)
            End If

        Catch ex As Exception
            Debug.Print("Error sending message")
        End Try

    End Sub

#End Region

    '#Region "TCP Server"
    '    Private Sub ServerLoop()
    '        Dim strIPAddress As String

    '        Try
    '            m_blnClosing = False
    '            m_blnAutoClosing = False

    '            m_objTcpListener = New TcpListener(m_objLocalIPAddress, m_intLocalIPPort)
    '            m_objTcpListener.Start()
    '            RaiseEvent Action(Me, "TcpListener created on " & Me.IPAddress & ":" & Me.IPPort)
    '            RaiseEvent Action(Me, "TcpListener is waiting for a connection... ")

    '            'Waiting for incoming calls
    '            m_objSocketClient = m_objTcpListener.AcceptSocket
    '            strIPAddress = CType(m_objSocketClient.RemoteEndPoint, IPEndPoint).Address.ToString

    '            'Check if dummy socket is opened by itself to force the appliction end
    '            If CType(m_objTcpListener.LocalEndpoint, IPEndPoint).ToString.Equals(strIPAddress) Then
    '                m_objTcpListener.Stop()
    '                m_objTcpListener = Nothing
    '                Return
    '            End If

    '            m_objTcpListener.Stop()
    '            m_objTcpListener = Nothing


    '            ' Get a stream object for reading and writing
    '            m_objNetworkStream = New NetworkStream(m_objSocketClient)

    '            RaiseEvent Action(Me, "TcpListener has received a a connection from IP " & strIPAddress)
    '            RaiseEvent ClientConnectionStatusChanged(Me, strIPAddress, True)

    '            'looping wait for messages
    '            While Not m_objSocketClient Is Nothing AndAlso _
    '                    m_objSocketClient.Connected AndAlso _
    '                    Not m_objSocketClient.Poll(1000, SelectMode.SelectError) 'Seems to work in one test
    '                ReceiveMessage()
    '                SendMessage()
    '            End While

    '            'Debug.WriteLine("Closing socket")

    '            RaiseEvent ClientConnectionStatusChanged(Me, strIPAddress, False)

    '            If Not m_blnClosing Then
    '                m_blnAutoClosing = True
    '                Me.Close()
    '            End If

    '        Catch ex As Exception
    '            If Not m_blnClosing Then
    '                MsgBox("ServerLoop - " & ex.Message)
    '                Throw ex
    '            End If
    '            'Finally
    '            'Me.Close()
    '        End Try

    '    End Sub

    '    Private Sub SendMessage()
    '        Dim arobjMsg(Jobs.Constants.COM_MAX_SIZE_MESSAGE - 1) As [Byte]
    '        Dim blnCancel As Boolean
    '        Dim i As Int32

    '        Try
    '            blnCancel = True
    '            RaiseEvent ReadyToSendAMessage(Me, arobjMsg, blnCancel)
    '            If Not blnCancel Then
    '                m_objNetworkStream.Write(arobjMsg, 0, Jobs.Constants.COM_MAX_SIZE_MESSAGE)
    '                Debug.WriteLine("Message Sent")
    '                RaiseEvent MessageSent(Me, arobjMsg)
    '            End If
    '        Catch ex As Exception
    '            MsgBox("SendMessage - " & ex.Message)
    '            Throw ex
    '        End Try


    '    End Sub

    Private Sub ReceiveMessage()
        'Dim arobjMsg(Jobs.Constants.COM_MAX_SIZE_MESSAGE - 1) As [Byte]
        Dim arobjMsg(10 - 1) As [Byte]
        Dim blnCancel As Boolean
        Dim strMessage As String
        Dim i As Int32
        Dim objASCIIEncoding As System.Text.ASCIIEncoding

        Try

            blnCancel = True
            If m_objNetworkStream.DataAvailable Then
                RaiseEvent ReadyToReceiveAMessage(Me, blnCancel)
                If Not blnCancel Then
                    ' Loop to receive all the data sent by the client.
                    'Do
                    i = m_objNetworkStream.Read(arobjMsg, 0, arobjMsg.Length)
                    If i > 0 Then
                        'Loop Until i = 0
                        objASCIIEncoding = New Text.ASCIIEncoding
                        strMessage = objASCIIEncoding.GetString(arobjMsg).Trim

                        If strMessage.StartsWith("QUIT") Then
                            Debug.WriteLine("Quit!")
                            ConnectionLost()
                        End If
                        RaiseEvent MessageReceived(Me, arobjMsg)
                        'Thread.CurrentThread.Sleep(1)
                    End If
                End If
            End If
        Catch ex As Exception
            Throw ex
        End Try

    End Sub

    Public Shared Function FromByteArrayToString(ByRef _arobjMessage() As Byte) As String
        Return Encoding.ASCII.GetString(_arobjMessage, 0, _arobjMessage.Length)
    End Function

#End Region


End Class
