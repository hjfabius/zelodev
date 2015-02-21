Public Class Test
    Protected WithEvents m_objInLineGuide As InLineGuide

    Protected Sub ChangeStatus(ByVal _blnConnected As Boolean)
        cmdMoveLeft.Enabled = _blnConnected
        cmdMoveRight.Enabled = _blnConnected
        cmdMoveStop.Enabled = _blnConnected
        barSpeed.Enabled = _blnConnected
        cmdMoveLeftHome.Enabled = _blnConnected
        cmdSetHome.Enabled = _blnConnected
        cmdGo.Enabled = _blnConnected
        barPosition.Enabled = _blnConnected
        tmrPolling.Enabled = _blnConnected
    End Sub

    Private Sub cmdMoveLeft_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveLeft.Click
        m_objInLineGuide.MoveLeft()
    End Sub

    Private Sub cmdMoveStop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveStop.Click
        m_objInLineGuide.Stop()
    End Sub

    Private Sub cmdMoveRight_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveRight.Click
        m_objInLineGuide.MoveRight()
    End Sub

    Private Sub barSpeed_Scroll(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles barSpeed.Scroll
        m_objInLineGuide.MaxSpeed = barSpeed.Value
    End Sub

    Private Sub cmdMoveLeftHome_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveLeftHome.Click
        m_objInLineGuide.HomingLeft()
    End Sub

    Private Sub tmrPolling_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tmrPolling.Tick
        tmrPolling.Enabled = False
        txtCurrentCurrent.Text = m_objInLineGuide.CurrentCurrent.ToString
        txtCurrentSpeed.Text = m_objInLineGuide.CurrentSpeed.ToString
        txtCurrentPosition.Text = m_objInLineGuide.CurrentPosition.ToString
        txtAnInput1.Text = m_objInLineGuide.AnalogicInput(0).ToString
        txtAnInput2.Text = m_objInLineGuide.AnalogicInput(1).ToString

        barCurrentCurrent.Value = m_objInLineGuide.CurrentCurrent
        barCurrentSpeed.Value = m_objInLineGuide.CurrentSpeed

        tmrPolling.Enabled = True
    End Sub

    Private Sub cmdSetHome_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSetHome.Click
        m_objInLineGuide.SetHome()
        txtCurrentPosition.Text = "0"
    End Sub

    Private Sub cmdGo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdGo.Click
        Dim strValue As String
        strValue = InputBox("Insert New Position", "In Line Guide", m_objInLineGuide.CurrentPosition.ToString)
        If Not strValue Is Nothing AndAlso _
            strValue.Length > 0 Then
            m_objInLineGuide.CurrentPosition = CInt(strValue)
            barPosition.Value = barPosition.Maximum - CInt(strValue)
        End If
    End Sub

    Private Sub barPosition_Scroll(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles barPosition.Scroll
        m_objInLineGuide.CurrentPosition = barPosition.Maximum - barPosition.Value
    End Sub

    Private Sub m_objInLineGuide_NewMessageEvent(ByRef sender As Object, ByVal _shoSlaveID As Short, ByVal _strMessage As String) Handles m_objInLineGuide.NewMessageEvent
        lstMessages.Items.Add(_strMessage)
        lstMessages.SelectedIndex = lstMessages.Items.Count - 1
    End Sub

    Public Sub New()
        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        m_objInLineGuide = New InLineGuide
        m_objInLineGuide.Open(1, SerialPort.Com6, BaudRate.BaudRate57600, True)
        m_objInLineGuide.GuideLength = 11000
        Try
            barPosition.Value = barPosition.Maximum - m_objInLineGuide.CurrentPosition
            barSpeed.Value = m_objInLineGuide.MaxSpeed
            Me.ChangeStatus(True)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Test_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        m_objInLineGuide.GoHome()
        m_objInLineGuide.Close()
        m_objInLineGuide.Dispose()
        m_objInLineGuide = Nothing
    End Sub

    Private Sub cmdLogs_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdLogs.Click
        lstMessages.Visible = Not lstMessages.Visible
    End Sub

    Private Sub cmdHomeRight_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdHomeRight.Click
        m_objInLineGuide.HomingRight()
    End Sub

    Private Sub cmdAnalogUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdAnalogUpdate.Click
        txtAnInput1.Text = m_objInLineGuide.AnalogicInput(0).ToString
        txtAnInput2.Text = m_objInLineGuide.AnalogicInput(1).ToString
    End Sub
End Class
