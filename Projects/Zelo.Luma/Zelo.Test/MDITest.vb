Imports System.Globalization

Public Class MDITest

    Private Sub CloseToolStripMenuItem_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CloseToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub BasicControlsToolStripMenuItem_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BasicControlsToolStripMenuItem.Click
        Dim objTestBasicControls As New TestBasicControls
        objTestBasicControls.WindowState = FormWindowState.Maximized
        objTestBasicControls.MdiParent = Me
        ToolStripStatusTestName.Text = "Basic Controls"
        objTestBasicControls.Show()
    End Sub

    Private Sub ParametersResetToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ParametersResetToolStripMenuItem.Click
        GlobalParameters.Reset()
    End Sub

    Private Sub NavigationToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NavigationToolStripMenuItem.Click
        Dim objTestNavigation As New TestNavigation
        objTestNavigation.WindowState = FormWindowState.Maximized
        objTestNavigation.MdiParent = Me
        ToolStripStatusTestName.Text = "Navigation"
        objTestNavigation.Show()
    End Sub

    Private Sub ItalianToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ItalianToolStripMenuItem.Click
        Threading.Thread.CurrentThread.CurrentUICulture = New CultureInfo("it-IT")
        Threading.Thread.CurrentThread.CurrentCulture = New CultureInfo("it-IT")
        ItalianToolStripMenuItem.Checked = True
        EnglishToolStripMenuItem.Checked = False
    End Sub

    Private Sub EnglishToolStripMenuItem_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EnglishToolStripMenuItem.Click
        Threading.Thread.CurrentThread.CurrentUICulture = New CultureInfo("en-GB")
        Threading.Thread.CurrentThread.CurrentCulture = New CultureInfo("en-GB")
        ItalianToolStripMenuItem.Checked = False
        EnglishToolStripMenuItem.Checked = True
    End Sub

    Private Sub CommunicationToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CommunicationToolStripMenuItem.Click
        Dim objCommunication As New Communication
        objCommunication.WindowState = FormWindowState.Maximized
        objCommunication.MdiParent = Me
        ToolStripStatusTestName.Text = "Communication"
        objCommunication.Show()

    End Sub

    Private Sub SelectorToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SelectorToolStripMenuItem.Click
        Dim objTestSelector As New TestSelector
        objTestSelector.WindowState = FormWindowState.Maximized
        objTestSelector.MdiParent = Me
        ToolStripStatusTestName.Text = "TestSelector"
        objTestSelector.Show()
    End Sub

    Private Sub WebServerToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles WebServerToolStripMenuItem.Click
        MsgBox("No more implementated")

        'Dim objWebServer As New TestWebServer
        'objWebServer.WindowState = FormWindowState.Maximized
        'objWebServer.MdiParent = Me
        'ToolStripStatusTestName.Text = "objWebServer"
        'objWebServer.Show()

    End Sub
End Class
