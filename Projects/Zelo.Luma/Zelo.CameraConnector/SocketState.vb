' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'

Imports System
Imports System.Net
Imports System.Net.Sockets
Imports System.Text


' State object for reading client data asynchronously
Public Class SocketState
    ' Client  socket.
    Public workSocket As Socket = Nothing
    ' Size of receive buffer.
    Public Const BufferSize As Integer = 1024
    ' Receive buffer.
    Public Buffer(BufferSize) As Byte
    ' Received data string.
    Public sb As New StringBuilder()

    Public Results As New Results
End Class 'StateObject