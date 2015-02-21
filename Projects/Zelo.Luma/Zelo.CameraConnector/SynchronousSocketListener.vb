' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'

Imports System.Net
Imports System.Net.Sockets
Imports System.Text

Public Class SynchronousSocketListener

    ' Incoming data from the client.
    Public Shared data As String = Nothing

    'Public Event SpeedUpdated(ByVal _objSender As Object, ByVal _intSpeedTime As Integer)
    'Public Event PositionUpdated(ByVal _objSender As Object, ByVal _intCobID As Integer, ByVal _intLongValue As Integer, ByVal _intLatValue As Integer)
    'Public Event RequestToSend(ByVal _objSender As Object, ByRef _arbyData() As Byte, ByRef _intLenth As Integer)



    Public Shared Sub StartListening()
        ' Data buffer for incoming data.
        Dim bytes() As Byte = New [Byte](1024) {}

        ' Establish the local endpoint for the socket.
        ' Dns.GetHostName returns the name of the 
        ' host running the application.
        Dim ipHostInfo As IPHostEntry = Dns.GetHostEntry(Dns.GetHostName())
        Dim ipAddress As IPAddress = ipHostInfo.AddressList(0)
        Dim localEndPoint As New IPEndPoint(ipAddress, 11000)

        ' Create a TCP/IP socket.
        Dim listener As New Socket(AddressFamily.InterNetwork, _
            SocketType.Stream, ProtocolType.Tcp)

        ' Bind the socket to the local endpoint and 
        ' listen for incoming connections.
        Try
            listener.Bind(localEndPoint)
            listener.Listen(10)

            ' Start listening for connections.
            While True
                Console.WriteLine("Waiting for a connection...")
                ' Program is suspended while waiting for an incoming connection.
                Dim handler As Socket = listener.Accept()
                data = Nothing

                ' An incoming connection needs to be processed.
                While True
                    bytes = New Byte(1024) {}
                    Dim bytesRec As Integer = handler.Receive(bytes)
                    data += Encoding.ASCII.GetString(bytes, 0, bytesRec)
                    If data.IndexOf("<EOF>") > -1 Then
                        Exit While
                    End If
                End While

                ' Show the data on the console.
                Console.WriteLine("Text received : {0}", data)

                ' Echo the data back to the client.
                Dim msg As Byte() = Encoding.ASCII.GetBytes(data)

                handler.Send(msg)
                handler.Shutdown(SocketShutdown.Both)
                handler.Close()
            End While

        Catch e As Exception
            Console.WriteLine(e.ToString())
        End Try

        Console.WriteLine(ControlChars.Cr + "Press ENTER to continue...")
        Console.Read()
    End Sub 'StartListening
End Class