<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Test
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.lstMessages = New System.Windows.Forms.ListBox
        Me.cmdMoveLeft = New System.Windows.Forms.Button
        Me.cmdMoveStop = New System.Windows.Forms.Button
        Me.cmdMoveRight = New System.Windows.Forms.Button
        Me.barSpeed = New System.Windows.Forms.TrackBar
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.cmdMoveLeftHome = New System.Windows.Forms.Button
        Me.tmrPolling = New System.Windows.Forms.Timer(Me.components)
        Me.txtCurrentSpeed = New System.Windows.Forms.TextBox
        Me.txtCurrentCurrent = New System.Windows.Forms.TextBox
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label7 = New System.Windows.Forms.Label
        Me.txtCurrentPosition = New System.Windows.Forms.TextBox
        Me.cmdSetHome = New System.Windows.Forms.Button
        Me.cmdGo = New System.Windows.Forms.Button
        Me.barPosition = New System.Windows.Forms.TrackBar
        Me.barCurrentCurrent = New System.Windows.Forms.ProgressBar
        Me.barCurrentSpeed = New System.Windows.Forms.ProgressBar
        Me.cmdLogs = New System.Windows.Forms.Button
        Me.cmdHomeRight = New System.Windows.Forms.Button
        Me.Label8 = New System.Windows.Forms.Label
        Me.txtAnInput1 = New System.Windows.Forms.TextBox
        Me.Label9 = New System.Windows.Forms.Label
        Me.txtAnInput2 = New System.Windows.Forms.TextBox
        Me.cmdAnalogUpdate = New System.Windows.Forms.Button
        CType(Me.barSpeed, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.barPosition, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'lstMessages
        '
        Me.lstMessages.FormattingEnabled = True
        Me.lstMessages.Location = New System.Drawing.Point(12, 107)
        Me.lstMessages.Name = "lstMessages"
        Me.lstMessages.Size = New System.Drawing.Size(268, 199)
        Me.lstMessages.TabIndex = 1
        Me.lstMessages.Visible = False
        '
        'cmdMoveLeft
        '
        Me.cmdMoveLeft.BackColor = System.Drawing.SystemColors.Info
        Me.cmdMoveLeft.Location = New System.Drawing.Point(12, 17)
        Me.cmdMoveLeft.Name = "cmdMoveLeft"
        Me.cmdMoveLeft.Size = New System.Drawing.Size(75, 22)
        Me.cmdMoveLeft.TabIndex = 3
        Me.cmdMoveLeft.Text = "left"
        Me.cmdMoveLeft.UseVisualStyleBackColor = False
        '
        'cmdMoveStop
        '
        Me.cmdMoveStop.BackColor = System.Drawing.SystemColors.Info
        Me.cmdMoveStop.Location = New System.Drawing.Point(93, 17)
        Me.cmdMoveStop.Name = "cmdMoveStop"
        Me.cmdMoveStop.Size = New System.Drawing.Size(106, 22)
        Me.cmdMoveStop.TabIndex = 4
        Me.cmdMoveStop.Text = "stop"
        Me.cmdMoveStop.UseVisualStyleBackColor = False
        '
        'cmdMoveRight
        '
        Me.cmdMoveRight.BackColor = System.Drawing.SystemColors.Info
        Me.cmdMoveRight.Location = New System.Drawing.Point(205, 17)
        Me.cmdMoveRight.Name = "cmdMoveRight"
        Me.cmdMoveRight.Size = New System.Drawing.Size(75, 22)
        Me.cmdMoveRight.TabIndex = 5
        Me.cmdMoveRight.Text = "right"
        Me.cmdMoveRight.UseVisualStyleBackColor = False
        '
        'barSpeed
        '
        Me.barSpeed.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.barSpeed.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.barSpeed.LargeChange = 2500
        Me.barSpeed.Location = New System.Drawing.Point(313, 5)
        Me.barSpeed.Maximum = 20000
        Me.barSpeed.Minimum = 200
        Me.barSpeed.Name = "barSpeed"
        Me.barSpeed.Orientation = System.Windows.Forms.Orientation.Vertical
        Me.barSpeed.Size = New System.Drawing.Size(45, 301)
        Me.barSpeed.SmallChange = 500
        Me.barSpeed.TabIndex = 6
        Me.barSpeed.TickFrequency = 500
        Me.barSpeed.Value = 500
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.Label1.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label1.Location = New System.Drawing.Point(354, 284)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(25, 13)
        Me.Label1.TabIndex = 7
        Me.Label1.Text = "200"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.Label2.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label2.Location = New System.Drawing.Point(354, 17)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(37, 13)
        Me.Label2.TabIndex = 8
        Me.Label2.Text = "20000"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.Label3.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label3.Location = New System.Drawing.Point(354, 153)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(37, 13)
        Me.Label3.TabIndex = 9
        Me.Label3.Text = "10000"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.Label4.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label4.Location = New System.Drawing.Point(354, 217)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(31, 13)
        Me.Label4.TabIndex = 10
        Me.Label4.Text = "5000"
        '
        'cmdMoveLeftHome
        '
        Me.cmdMoveLeftHome.BackColor = System.Drawing.SystemColors.Info
        Me.cmdMoveLeftHome.Location = New System.Drawing.Point(12, 45)
        Me.cmdMoveLeftHome.Name = "cmdMoveLeftHome"
        Me.cmdMoveLeftHome.Size = New System.Drawing.Size(75, 23)
        Me.cmdMoveLeftHome.TabIndex = 11
        Me.cmdMoveLeftHome.Text = "home left"
        Me.cmdMoveLeftHome.UseVisualStyleBackColor = False
        '
        'tmrPolling
        '
        Me.tmrPolling.Interval = 50
        '
        'txtCurrentSpeed
        '
        Me.txtCurrentSpeed.Location = New System.Drawing.Point(111, 318)
        Me.txtCurrentSpeed.Name = "txtCurrentSpeed"
        Me.txtCurrentSpeed.Size = New System.Drawing.Size(56, 20)
        Me.txtCurrentSpeed.TabIndex = 12
        Me.txtCurrentSpeed.Text = "0"
        Me.txtCurrentSpeed.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'txtCurrentCurrent
        '
        Me.txtCurrentCurrent.Location = New System.Drawing.Point(111, 344)
        Me.txtCurrentCurrent.Name = "txtCurrentCurrent"
        Me.txtCurrentCurrent.Size = New System.Drawing.Size(56, 20)
        Me.txtCurrentCurrent.TabIndex = 13
        Me.txtCurrentCurrent.Text = "0"
        Me.txtCurrentCurrent.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label5.Location = New System.Drawing.Point(12, 321)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(75, 13)
        Me.Label5.TabIndex = 14
        Me.Label5.Text = "Current Speed"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label6.Location = New System.Drawing.Point(12, 347)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(78, 13)
        Me.Label6.TabIndex = 15
        Me.Label6.Text = "Current Current"
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label7.Location = New System.Drawing.Point(12, 373)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(81, 13)
        Me.Label7.TabIndex = 17
        Me.Label7.Text = "Current Position"
        '
        'txtCurrentPosition
        '
        Me.txtCurrentPosition.Location = New System.Drawing.Point(111, 370)
        Me.txtCurrentPosition.Name = "txtCurrentPosition"
        Me.txtCurrentPosition.Size = New System.Drawing.Size(219, 20)
        Me.txtCurrentPosition.TabIndex = 16
        Me.txtCurrentPosition.Text = "0"
        Me.txtCurrentPosition.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'cmdSetHome
        '
        Me.cmdSetHome.BackColor = System.Drawing.SystemColors.Info
        Me.cmdSetHome.Location = New System.Drawing.Point(93, 46)
        Me.cmdSetHome.Name = "cmdSetHome"
        Me.cmdSetHome.Size = New System.Drawing.Size(106, 22)
        Me.cmdSetHome.TabIndex = 18
        Me.cmdSetHome.Text = "set home"
        Me.cmdSetHome.UseVisualStyleBackColor = False
        '
        'cmdGo
        '
        Me.cmdGo.BackColor = System.Drawing.SystemColors.Info
        Me.cmdGo.Location = New System.Drawing.Point(342, 370)
        Me.cmdGo.Name = "cmdGo"
        Me.cmdGo.Size = New System.Drawing.Size(56, 22)
        Me.cmdGo.TabIndex = 19
        Me.cmdGo.Text = "go"
        Me.cmdGo.UseVisualStyleBackColor = False
        '
        'barPosition
        '
        Me.barPosition.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.barPosition.LargeChange = 1500
        Me.barPosition.Location = New System.Drawing.Point(12, 409)
        Me.barPosition.Maximum = 11000
        Me.barPosition.Name = "barPosition"
        Me.barPosition.Size = New System.Drawing.Size(576, 45)
        Me.barPosition.SmallChange = 100
        Me.barPosition.TabIndex = 20
        Me.barPosition.TickFrequency = 500
        Me.barPosition.TickStyle = System.Windows.Forms.TickStyle.Both
        Me.barPosition.Value = 500
        '
        'barCurrentCurrent
        '
        Me.barCurrentCurrent.BackColor = System.Drawing.Color.White
        Me.barCurrentCurrent.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.barCurrentCurrent.Location = New System.Drawing.Point(173, 344)
        Me.barCurrentCurrent.Maximum = 4600
        Me.barCurrentCurrent.Name = "barCurrentCurrent"
        Me.barCurrentCurrent.Size = New System.Drawing.Size(225, 20)
        Me.barCurrentCurrent.Step = 50
        Me.barCurrentCurrent.TabIndex = 21
        '
        'barCurrentSpeed
        '
        Me.barCurrentSpeed.BackColor = System.Drawing.Color.White
        Me.barCurrentSpeed.ForeColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.barCurrentSpeed.Location = New System.Drawing.Point(173, 318)
        Me.barCurrentSpeed.Maximum = 20000
        Me.barCurrentSpeed.Name = "barCurrentSpeed"
        Me.barCurrentSpeed.Size = New System.Drawing.Size(225, 20)
        Me.barCurrentSpeed.Step = 50
        Me.barCurrentSpeed.TabIndex = 22
        '
        'cmdLogs
        '
        Me.cmdLogs.BackColor = System.Drawing.SystemColors.Info
        Me.cmdLogs.Location = New System.Drawing.Point(15, 74)
        Me.cmdLogs.Name = "cmdLogs"
        Me.cmdLogs.Size = New System.Drawing.Size(45, 22)
        Me.cmdLogs.TabIndex = 23
        Me.cmdLogs.Text = "logs"
        Me.cmdLogs.UseVisualStyleBackColor = False
        '
        'cmdHomeRight
        '
        Me.cmdHomeRight.BackColor = System.Drawing.SystemColors.Info
        Me.cmdHomeRight.Location = New System.Drawing.Point(205, 46)
        Me.cmdHomeRight.Name = "cmdHomeRight"
        Me.cmdHomeRight.Size = New System.Drawing.Size(75, 23)
        Me.cmdHomeRight.TabIndex = 25
        Me.cmdHomeRight.Text = "home right"
        Me.cmdHomeRight.UseVisualStyleBackColor = False
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label8.Location = New System.Drawing.Point(446, 16)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(59, 13)
        Me.Label8.TabIndex = 27
        Me.Label8.Text = "An. Input 1"
        '
        'txtAnInput1
        '
        Me.txtAnInput1.Location = New System.Drawing.Point(511, 13)
        Me.txtAnInput1.Name = "txtAnInput1"
        Me.txtAnInput1.Size = New System.Drawing.Size(56, 20)
        Me.txtAnInput1.TabIndex = 26
        Me.txtAnInput1.Text = "0"
        Me.txtAnInput1.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label9.Location = New System.Drawing.Point(446, 42)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(59, 13)
        Me.Label9.TabIndex = 29
        Me.Label9.Text = "An. Input 2"
        '
        'txtAnInput2
        '
        Me.txtAnInput2.Location = New System.Drawing.Point(511, 39)
        Me.txtAnInput2.Name = "txtAnInput2"
        Me.txtAnInput2.Size = New System.Drawing.Size(56, 20)
        Me.txtAnInput2.TabIndex = 28
        Me.txtAnInput2.Text = "0"
        Me.txtAnInput2.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'cmdAnalogUpdate
        '
        Me.cmdAnalogUpdate.BackColor = System.Drawing.SystemColors.Info
        Me.cmdAnalogUpdate.Location = New System.Drawing.Point(511, 65)
        Me.cmdAnalogUpdate.Name = "cmdAnalogUpdate"
        Me.cmdAnalogUpdate.Size = New System.Drawing.Size(56, 22)
        Me.cmdAnalogUpdate.TabIndex = 30
        Me.cmdAnalogUpdate.Text = "update"
        Me.cmdAnalogUpdate.UseVisualStyleBackColor = False
        '
        'Test
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.ClientSize = New System.Drawing.Size(600, 483)
        Me.Controls.Add(Me.cmdAnalogUpdate)
        Me.Controls.Add(Me.Label9)
        Me.Controls.Add(Me.txtAnInput2)
        Me.Controls.Add(Me.Label8)
        Me.Controls.Add(Me.txtAnInput1)
        Me.Controls.Add(Me.cmdHomeRight)
        Me.Controls.Add(Me.cmdLogs)
        Me.Controls.Add(Me.barCurrentSpeed)
        Me.Controls.Add(Me.barCurrentCurrent)
        Me.Controls.Add(Me.barPosition)
        Me.Controls.Add(Me.cmdGo)
        Me.Controls.Add(Me.cmdSetHome)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.txtCurrentPosition)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.txtCurrentCurrent)
        Me.Controls.Add(Me.txtCurrentSpeed)
        Me.Controls.Add(Me.cmdMoveLeftHome)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.barSpeed)
        Me.Controls.Add(Me.cmdMoveRight)
        Me.Controls.Add(Me.cmdMoveStop)
        Me.Controls.Add(Me.cmdMoveLeft)
        Me.Controls.Add(Me.lstMessages)
        Me.Name = "Test"
        Me.Text = "Test"
        CType(Me.barSpeed, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.barPosition, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lstMessages As System.Windows.Forms.ListBox
    Friend WithEvents cmdMoveLeft As System.Windows.Forms.Button
    Friend WithEvents cmdMoveStop As System.Windows.Forms.Button
    Friend WithEvents cmdMoveRight As System.Windows.Forms.Button
    Friend WithEvents barSpeed As System.Windows.Forms.TrackBar
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents cmdMoveLeftHome As System.Windows.Forms.Button
    Friend WithEvents tmrPolling As System.Windows.Forms.Timer
    Friend WithEvents txtCurrentSpeed As System.Windows.Forms.TextBox
    Friend WithEvents txtCurrentCurrent As System.Windows.Forms.TextBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents txtCurrentPosition As System.Windows.Forms.TextBox
    Friend WithEvents cmdSetHome As System.Windows.Forms.Button
    Friend WithEvents cmdGo As System.Windows.Forms.Button
    Friend WithEvents barPosition As System.Windows.Forms.TrackBar
    Friend WithEvents barCurrentCurrent As System.Windows.Forms.ProgressBar
    Friend WithEvents barCurrentSpeed As System.Windows.Forms.ProgressBar
    Friend WithEvents cmdLogs As System.Windows.Forms.Button
    Friend WithEvents cmdHomeRight As System.Windows.Forms.Button
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents txtAnInput1 As System.Windows.Forms.TextBox
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents txtAnInput2 As System.Windows.Forms.TextBox
    Friend WithEvents cmdAnalogUpdate As System.Windows.Forms.Button
End Class
