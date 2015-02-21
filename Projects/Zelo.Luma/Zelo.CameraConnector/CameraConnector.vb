' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Imports System.Threading
Imports System.Net.Sockets
Imports System.Net
Imports System
Imports System.Text

Public Class CameraConnector
    Implements IDisposable

#Region "Costants"
#End Region

#Region "Variables"
    Protected m_intPort As Integer
    Protected m_objSocketListener As AsynchronousSocketListener
    Protected m_objThread As Thread
    Protected m_arbyBufferData() As Byte = New [Byte](1024) {}
    Protected m_intBufferLength As Integer = 0

#End Region

#Region "Event"
    Public Event CameraSpeedUpdated(ByVal _objSender As Object, ByVal _intSpeedTime As Integer)
    Public Event CameraPositionUpdated(ByVal _objSender As Object, ByVal _intCobID As Integer, ByVal _intLongValue As Integer, ByVal _intLatValue As Integer)
#End Region

#Region "Properties"

#End Region

#Region "Methods"

    Protected Sub SpeedUpdatedEventHandler(ByVal _objSender As Object, ByVal _intSpeedTime As Integer)
        RaiseEvent CameraSpeedUpdated(_objSender, _intSpeedTime)
    End Sub

    Protected Sub PositionUpdatedEventHandler(ByVal _objSender As Object, ByVal _intCobID As Integer, ByVal _intLongValue As Integer, ByVal _intLatValue As Integer)
        RaiseEvent CameraPositionUpdated(_objSender, _intCobID, _intLongValue, _intLatValue)
    End Sub

    Protected Sub RequestToSendEventHandler(ByVal _objSender As Object, ByRef _arbyData() As Byte, ByRef _intLength As Integer)
        If m_intBufferLength > 0 Then
            Buffer.BlockCopy(m_arbyBufferData, 0, _arbyData, 0, 1024)
            _intLength = m_intBufferLength

            Array.Clear(m_arbyBufferData, 0, 1024)
            m_intBufferLength = 0
        End If

    End Sub

    Public Sub New(Optional ByVal _intPort As Integer = 13000)
        m_intPort = _intPort

        m_objSocketListener = New AsynchronousSocketListener
        AddHandler m_objSocketListener.SpeedUpdated, AddressOf SpeedUpdatedEventHandler
        AddHandler m_objSocketListener.PositionUpdated, AddressOf PositionUpdatedEventHandler
        AddHandler m_objSocketListener.RequestToSend, AddressOf RequestToSendEventHandler

        m_objThread = New Thread(AddressOf Me.ServerLoop)
        m_objThread.Priority = Threading.ThreadPriority.Lowest
        m_objThread.Name = "Luma.ServerLoop"
        m_objThread.Start()
    End Sub

    Private Sub ServerLoop()
        m_objSocketListener.StartListening(m_intPort)
    End Sub

    Public Sub Close()
        If Not m_objSocketListener Is Nothing Then
            RemoveHandler m_objSocketListener.SpeedUpdated, AddressOf SpeedUpdatedEventHandler
            RemoveHandler m_objSocketListener.PositionUpdated, AddressOf PositionUpdatedEventHandler
            RemoveHandler m_objSocketListener.RequestToSend, AddressOf RequestToSendEventHandler
            m_objSocketListener = Nothing
        End If

        If Not m_objThread Is Nothing Then
            m_objThread.Abort()
            m_objThread = Nothing
        End If
    End Sub

    Public Sub SendCylinderLength(ByVal _dblCylinderLength As Double)

        Dim intCylinderLength As Integer
        intCylinderLength = CInt(_dblCylinderLength * 1000)

        m_arbyBufferData(m_intBufferLength) = &H0 : m_intBufferLength += 1
        m_arbyBufferData(m_intBufferLength) = &H0 : m_intBufferLength += 1
        m_arbyBufferData(m_intBufferLength) = CByte(intCylinderLength Mod 256) : m_intBufferLength += 1
        intCylinderLength -= intCylinderLength Mod 256
        intCylinderLength = intCylinderLength \ 256

        m_arbyBufferData(m_intBufferLength) = CByte(intCylinderLength Mod 256) : m_intBufferLength += 1
        intCylinderLength -= intCylinderLength Mod 256
        intCylinderLength = intCylinderLength \ 256

        m_arbyBufferData(m_intBufferLength) = CByte(intCylinderLength Mod 256) : m_intBufferLength += 1
        intCylinderLength -= intCylinderLength Mod 256
        intCylinderLength = intCylinderLength \ 256

        m_arbyBufferData(m_intBufferLength) = CByte(intCylinderLength Mod 256) : m_intBufferLength += 1

        m_arbyBufferData(m_intBufferLength) = &H2 : m_intBufferLength += 1
        m_arbyBufferData(m_intBufferLength) = &H7E : m_intBufferLength += 1 'Cilinder Size


    End Sub


    Public Sub Flash(Optional ByVal _strCameraName As String = "PCCAM", Optional ByVal _intPort As Integer = 3000)
        'Dim objTCPClient As TcpClient
        'Dim objNetworkStream As NetworkStream
        'Dim arobjMsg(8) As [Byte]

        'arobjMsg(0) = CByte(Asc("F"))
        'arobjMsg(1) = CByte(Asc("l"))
        'arobjMsg(2) = CByte(Asc("a"))
        'arobjMsg(3) = CByte(Asc("s"))
        'arobjMsg(4) = CByte(Asc("h"))
        'arobjMsg(5) = CByte(Asc("N"))
        'arobjMsg(6) = CByte(Asc("o"))
        'arobjMsg(8) = CByte(Asc("w"))

        'objTCPClient = New TcpClient

        'Try
        '    objTCPClient.Connect("PCCAM", 3000)
        '    objNetworkStream = objTCPClient.GetStream()

        '    If Not objNetworkStream Is Nothing Then
        '        objNetworkStream.Write(arobjMsg, 0, arobjMsg.Length)
        '    End If

        'Catch ex As Exception
        'Finally
        '    objNetworkStream = Nothing
        '    If Not objTCPClient Is Nothing Then
        '        Try
        '            objTCPClient.Close()
        '        Catch ex As Exception

        '        End Try
        '    End If
        '    objTCPClient = Nothing
        'End Try

    End Sub

    Public Sub Dispose() Implements System.IDisposable.Dispose
    End Sub

#End Region

End Class
