Public Class TestWebServer

    'Protected WithEvents objWebServer As WebServer

    'Private Sub cmdStart_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdStart.Click
    '    objWebServer = New WebServer
    '    AddHandler objWebServer.Action, AddressOf ActionEventHandler
    '    AddHandler objWebServer.MessageReceived, AddressOf MessageReceivedEventHandler

    '    objWebServer.Start()

    '    AddMessage("Web server stared on " & objWebServer.IPAddress & ":" & objWebServer.IPPort)
    'End Sub

    'Private Sub AddMessage(ByVal _strMessage As String)
    '    Debug.Print(_strMessage)
    '    'lstMessage.Items.Add(_strMessage)
    '    'lstMessage.SelectedIndex = lstMessage.Items.Count - 1
    'End Sub

    'Private Sub cmdClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdClose.Click
    '    If Not objWebServer Is Nothing Then
    '        objWebServer.Close()
    '        RemoveHandler objWebServer.Action, AddressOf ActionEventHandler
    '        RemoveHandler objWebServer.MessageReceived, AddressOf MessageReceivedEventHandler
    '        objWebServer = Nothing
    '        AddMessage("Web server closed")
    '    Else
    '        AddMessage("Web server already closed")
    '    End If
    'End Sub

    'Private Sub MessageReceivedEventHandler(ByRef _objSender As Object, ByRef _arobjMessage() As Byte)
    '    AddMessage("Message received")
    'End Sub

    'Private Sub ActionEventHandler(ByRef _objSender As Object, ByVal _strAction As String)
    '    AddMessage("Action: " & _strAction)
    'End Sub
End Class