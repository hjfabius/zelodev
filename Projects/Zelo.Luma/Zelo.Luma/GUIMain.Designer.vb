<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUIMain
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
        Me.lblTitle = New System.Windows.Forms.Label
        Me.pnlMain = New System.Windows.Forms.Panel
        Me.lblProjectName = New Zelo.Luma.GUIButton
        Me.lblClientName = New Zelo.Luma.GUIButton
        Me.lblProject = New Zelo.Luma.GUIButton
        Me.lblClient = New Zelo.Luma.GUIButton
        Me.guiRectangleTop = New Zelo.Luma.GUIRectangle
        Me.guiRectangleLeft = New Zelo.Luma.GUIRectangle
        Me.guiRoundedAngleTopLeft = New Zelo.Luma.GUIRoundedAngle
        Me.PictureBox2 = New System.Windows.Forms.PictureBox
        Me.picBack = New System.Windows.Forms.PictureBox
        Me.picHome = New System.Windows.Forms.PictureBox
        Me.PictureBox1 = New System.Windows.Forms.PictureBox
        Me.lblStatusValue = New Zelo.Luma.GUIButton
        Me.lblStatus = New Zelo.Luma.GUIButton
        Me.lblSpeedValue = New Zelo.Luma.GUIButton
        Me.lblSpeed = New Zelo.Luma.GUIButton
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picBack, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picHome, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'lblTitle
        '
        Me.lblTitle.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.lblTitle.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblTitle.Font = New System.Drawing.Font("Arial", 27.75!, System.Drawing.FontStyle.Bold)
        Me.lblTitle.ForeColor = System.Drawing.Color.White
        Me.lblTitle.Location = New System.Drawing.Point(211, 1)
        Me.lblTitle.Name = "lblTitle"
        Me.lblTitle.Size = New System.Drawing.Size(815, 44)
        Me.lblTitle.TabIndex = 4
        Me.lblTitle.Text = "Main Label"
        '
        'pnlMain
        '
        Me.pnlMain.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.pnlMain.BackColor = System.Drawing.Color.White
        Me.pnlMain.Location = New System.Drawing.Point(172, 75)
        Me.pnlMain.Name = "pnlMain"
        Me.pnlMain.Size = New System.Drawing.Size(840, 681)
        Me.pnlMain.TabIndex = 45
        '
        'lblProjectName
        '
        Me.lblProjectName.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(25, Byte), Integer), CType(CType(184, Byte), Integer))
        Me.lblProjectName.BackColorFaded1 = System.Drawing.Color.White
        Me.lblProjectName.BackColorFaded2 = System.Drawing.Color.White
        Me.lblProjectName.BorderColor = System.Drawing.Color.Black
        Me.lblProjectName.BorderWidth = 0
        Me.lblProjectName.EditMode = False
        Me.lblProjectName.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.lblProjectName.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblProjectName.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblProjectName.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblProjectName.Location = New System.Drawing.Point(0, 348)
        Me.lblProjectName.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblProjectName.Name = "lblProjectName"
        Me.lblProjectName.Radius = 25
        Me.lblProjectName.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblProjectName.ShadowColor = System.Drawing.Color.LightGray
        Me.lblProjectName.ShadowWidth = 2
        Me.lblProjectName.Size = New System.Drawing.Size(153, 91)
        Me.lblProjectName.TabIndex = 21
        Me.lblProjectName.Text = "Nome progetto"
        Me.lblProjectName.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblProjectName.TextAngle = 0
        '
        'lblClientName
        '
        Me.lblClientName.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(30, Byte), Integer), CType(CType(194, Byte), Integer))
        Me.lblClientName.BackColorFaded1 = System.Drawing.Color.White
        Me.lblClientName.BackColorFaded2 = System.Drawing.Color.White
        Me.lblClientName.BorderColor = System.Drawing.Color.Black
        Me.lblClientName.BorderWidth = 0
        Me.lblClientName.EditMode = False
        Me.lblClientName.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.lblClientName.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblClientName.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblClientName.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblClientName.Location = New System.Drawing.Point(0, 206)
        Me.lblClientName.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblClientName.Name = "lblClientName"
        Me.lblClientName.Radius = 25
        Me.lblClientName.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblClientName.ShadowColor = System.Drawing.Color.LightGray
        Me.lblClientName.ShadowWidth = 2
        Me.lblClientName.Size = New System.Drawing.Size(153, 91)
        Me.lblClientName.TabIndex = 20
        Me.lblClientName.Text = "Nome cliente"
        Me.lblClientName.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblClientName.TextAngle = 0
        '
        'lblProject
        '
        Me.lblProject.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(25, Byte), Integer), CType(CType(184, Byte), Integer))
        Me.lblProject.BackColorFaded1 = System.Drawing.Color.White
        Me.lblProject.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblProject.BorderColor = System.Drawing.Color.Black
        Me.lblProject.BorderWidth = 0
        Me.lblProject.EditMode = False
        Me.lblProject.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.lblProject.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblProject.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblProject.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblProject.Location = New System.Drawing.Point(0, 311)
        Me.lblProject.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblProject.Name = "lblProject"
        Me.lblProject.Radius = 25
        Me.lblProject.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblProject.ShadowColor = System.Drawing.Color.LightGray
        Me.lblProject.ShadowWidth = 2
        Me.lblProject.Size = New System.Drawing.Size(153, 34)
        Me.lblProject.TabIndex = 19
        Me.lblProject.Text = "Project"
        Me.lblProject.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.lblProject.TextAngle = 0
        '
        'lblClient
        '
        Me.lblClient.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(30, Byte), Integer), CType(CType(194, Byte), Integer))
        Me.lblClient.BackColorFaded1 = System.Drawing.Color.White
        Me.lblClient.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblClient.BorderColor = System.Drawing.Color.Black
        Me.lblClient.BorderWidth = 0
        Me.lblClient.EditMode = False
        Me.lblClient.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.lblClient.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblClient.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblClient.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblClient.Location = New System.Drawing.Point(0, 169)
        Me.lblClient.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblClient.Name = "lblClient"
        Me.lblClient.Radius = 25
        Me.lblClient.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblClient.ShadowColor = System.Drawing.Color.LightGray
        Me.lblClient.ShadowWidth = 2
        Me.lblClient.Size = New System.Drawing.Size(153, 34)
        Me.lblClient.TabIndex = 18
        Me.lblClient.Text = "Client"
        Me.lblClient.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.lblClient.TextAngle = 0
        '
        'guiRectangleTop
        '
        Me.guiRectangleTop.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.guiRectangleTop.BackColor = System.Drawing.Color.Transparent
        Me.guiRectangleTop.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiRectangleTop.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiRectangleTop.BorderColor = System.Drawing.Color.Black
        Me.guiRectangleTop.BorderWidth = 0
        Me.guiRectangleTop.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiRectangleTop.Location = New System.Drawing.Point(-6, 0)
        Me.guiRectangleTop.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.guiRectangleTop.Name = "guiRectangleTop"
        Me.guiRectangleTop.Radius = 0
        Me.guiRectangleTop.RectangleStyle = Zelo.Luma.RectangleStyle.Squared
        Me.guiRectangleTop.ShadowColor = System.Drawing.Color.Gray
        Me.guiRectangleTop.ShadowWidth = 0
        Me.guiRectangleTop.Size = New System.Drawing.Size(1032, 47)
        Me.guiRectangleTop.TabIndex = 1
        '
        'guiRectangleLeft
        '
        Me.guiRectangleLeft.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.guiRectangleLeft.BackColor = System.Drawing.Color.Transparent
        Me.guiRectangleLeft.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiRectangleLeft.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(25, Byte), Integer), CType(CType(104, Byte), Integer))
        Me.guiRectangleLeft.BorderColor = System.Drawing.Color.Black
        Me.guiRectangleLeft.BorderWidth = 0
        Me.guiRectangleLeft.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiRectangleLeft.Location = New System.Drawing.Point(0, 46)
        Me.guiRectangleLeft.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.guiRectangleLeft.Name = "guiRectangleLeft"
        Me.guiRectangleLeft.Radius = 0
        Me.guiRectangleLeft.RectangleStyle = Zelo.Luma.RectangleStyle.Squared
        Me.guiRectangleLeft.ShadowColor = System.Drawing.Color.Gray
        Me.guiRectangleLeft.ShadowWidth = 0
        Me.guiRectangleLeft.Size = New System.Drawing.Size(153, 756)
        Me.guiRectangleLeft.TabIndex = 0
        '
        'guiRoundedAngleTopLeft
        '
        Me.guiRoundedAngleTopLeft.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiRoundedAngleTopLeft.ForeColor = System.Drawing.Color.White
        Me.guiRoundedAngleTopLeft.Location = New System.Drawing.Point(153, 46)
        Me.guiRoundedAngleTopLeft.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.guiRoundedAngleTopLeft.Name = "guiRoundedAngleTopLeft"
        Me.guiRoundedAngleTopLeft.RoundAngle = Zelo.Luma.RoundAngle.BottomRight
        Me.guiRoundedAngleTopLeft.Size = New System.Drawing.Size(57, 53)
        Me.guiRoundedAngleTopLeft.TabIndex = 15
        '
        'PictureBox2
        '
        Me.PictureBox2.Image = Global.Zelo.Luma.My.Resources.Resources.prismLogo
        Me.PictureBox2.Location = New System.Drawing.Point(0, 672)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(153, 84)
        Me.PictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox2.TabIndex = 46
        Me.PictureBox2.TabStop = False
        '
        'picBack
        '
        Me.picBack.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.picBack.Cursor = System.Windows.Forms.Cursors.Hand
        Me.picBack.Image = Global.Zelo.Luma.My.Resources.Resources.rewind
        Me.picBack.Location = New System.Drawing.Point(30, 12)
        Me.picBack.Name = "picBack"
        Me.picBack.Size = New System.Drawing.Size(50, 47)
        Me.picBack.TabIndex = 44
        Me.picBack.TabStop = False
        '
        'picHome
        '
        Me.picHome.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.picHome.Cursor = System.Windows.Forms.Cursors.Hand
        Me.picHome.Image = Global.Zelo.Luma.My.Resources.Resources.home
        Me.picHome.Location = New System.Drawing.Point(93, 12)
        Me.picHome.Name = "picHome"
        Me.picHome.Size = New System.Drawing.Size(46, 47)
        Me.picHome.TabIndex = 43
        Me.picHome.TabStop = False
        '
        'PictureBox1
        '
        Me.PictureBox1.Image = Global.Zelo.Luma.My.Resources.Resources.zeloLogo
        Me.PictureBox1.Location = New System.Drawing.Point(0, 99)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(153, 60)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox1.TabIndex = 16
        Me.PictureBox1.TabStop = False
        '
        'lblStatusValue
        '
        Me.lblStatusValue.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(25, Byte), Integer), CType(CType(184, Byte), Integer))
        Me.lblStatusValue.BackColorFaded1 = System.Drawing.Color.White
        Me.lblStatusValue.BackColorFaded2 = System.Drawing.Color.White
        Me.lblStatusValue.BorderColor = System.Drawing.Color.Black
        Me.lblStatusValue.BorderWidth = 0
        Me.lblStatusValue.EditMode = False
        Me.lblStatusValue.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.lblStatusValue.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblStatusValue.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblStatusValue.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblStatusValue.Location = New System.Drawing.Point(0, 490)
        Me.lblStatusValue.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblStatusValue.Name = "lblStatusValue"
        Me.lblStatusValue.Radius = 25
        Me.lblStatusValue.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblStatusValue.ShadowColor = System.Drawing.Color.LightGray
        Me.lblStatusValue.ShadowWidth = 2
        Me.lblStatusValue.Size = New System.Drawing.Size(153, 34)
        Me.lblStatusValue.TabIndex = 48
        Me.lblStatusValue.Text = "Stato"
        Me.lblStatusValue.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblStatusValue.TextAngle = 0
        '
        'lblStatus
        '
        Me.lblStatus.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(25, Byte), Integer), CType(CType(184, Byte), Integer))
        Me.lblStatus.BackColorFaded1 = System.Drawing.Color.White
        Me.lblStatus.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblStatus.BorderColor = System.Drawing.Color.Black
        Me.lblStatus.BorderWidth = 0
        Me.lblStatus.EditMode = False
        Me.lblStatus.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.lblStatus.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblStatus.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblStatus.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblStatus.Location = New System.Drawing.Point(0, 453)
        Me.lblStatus.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblStatus.Name = "lblStatus"
        Me.lblStatus.Radius = 25
        Me.lblStatus.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblStatus.ShadowColor = System.Drawing.Color.LightGray
        Me.lblStatus.ShadowWidth = 2
        Me.lblStatus.Size = New System.Drawing.Size(153, 34)
        Me.lblStatus.TabIndex = 47
        Me.lblStatus.Text = "Status"
        Me.lblStatus.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.lblStatus.TextAngle = 0
        '
        'lblSpeedValue
        '
        Me.lblSpeedValue.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(25, Byte), Integer), CType(CType(184, Byte), Integer))
        Me.lblSpeedValue.BackColorFaded1 = System.Drawing.Color.White
        Me.lblSpeedValue.BackColorFaded2 = System.Drawing.Color.White
        Me.lblSpeedValue.BorderColor = System.Drawing.Color.Black
        Me.lblSpeedValue.BorderWidth = 0
        Me.lblSpeedValue.EditMode = False
        Me.lblSpeedValue.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.lblSpeedValue.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblSpeedValue.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblSpeedValue.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblSpeedValue.Location = New System.Drawing.Point(0, 575)
        Me.lblSpeedValue.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblSpeedValue.Name = "lblSpeedValue"
        Me.lblSpeedValue.Radius = 25
        Me.lblSpeedValue.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblSpeedValue.ShadowColor = System.Drawing.Color.LightGray
        Me.lblSpeedValue.ShadowWidth = 2
        Me.lblSpeedValue.Size = New System.Drawing.Size(153, 34)
        Me.lblSpeedValue.TabIndex = 50
        Me.lblSpeedValue.Text = "---.- mt/min"
        Me.lblSpeedValue.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.lblSpeedValue.TextAngle = 0
        '
        'lblSpeed
        '
        Me.lblSpeed.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(25, Byte), Integer), CType(CType(184, Byte), Integer))
        Me.lblSpeed.BackColorFaded1 = System.Drawing.Color.White
        Me.lblSpeed.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblSpeed.BorderColor = System.Drawing.Color.Black
        Me.lblSpeed.BorderWidth = 0
        Me.lblSpeed.EditMode = False
        Me.lblSpeed.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.lblSpeed.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblSpeed.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblSpeed.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblSpeed.Location = New System.Drawing.Point(0, 538)
        Me.lblSpeed.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblSpeed.Name = "lblSpeed"
        Me.lblSpeed.Radius = 25
        Me.lblSpeed.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblSpeed.ShadowColor = System.Drawing.Color.LightGray
        Me.lblSpeed.ShadowWidth = 2
        Me.lblSpeed.Size = New System.Drawing.Size(153, 34)
        Me.lblSpeed.TabIndex = 49
        Me.lblSpeed.Text = "Speed"
        Me.lblSpeed.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.lblSpeed.TextAngle = 0
        '
        'GUIMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(1024, 768)
        Me.Controls.Add(Me.lblSpeedValue)
        Me.Controls.Add(Me.lblStatusValue)
        Me.Controls.Add(Me.lblSpeed)
        Me.Controls.Add(Me.lblStatus)
        Me.Controls.Add(Me.PictureBox2)
        Me.Controls.Add(Me.picBack)
        Me.Controls.Add(Me.picHome)
        Me.Controls.Add(Me.lblProjectName)
        Me.Controls.Add(Me.lblClientName)
        Me.Controls.Add(Me.lblProject)
        Me.Controls.Add(Me.lblClient)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.lblTitle)
        Me.Controls.Add(Me.guiRectangleTop)
        Me.Controls.Add(Me.guiRectangleLeft)
        Me.Controls.Add(Me.pnlMain)
        Me.Controls.Add(Me.guiRoundedAngleTopLeft)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.KeyPreview = True
        Me.Name = "GUIMain"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
        Me.Text = "Lumà"
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picBack, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picHome, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents guiRectangleLeft As Zelo.Luma.GUIRectangle
    Friend WithEvents guiRectangleTop As Zelo.Luma.GUIRectangle
    Friend WithEvents lblTitle As System.Windows.Forms.Label
    Friend WithEvents guiRoundedAngleTopLeft As Zelo.Luma.GUIRoundedAngle
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents lblClient As Zelo.Luma.GUIButton
    Friend WithEvents lblProject As Zelo.Luma.GUIButton
    Friend WithEvents lblProjectName As Zelo.Luma.GUIButton
    Friend WithEvents lblClientName As Zelo.Luma.GUIButton
    Friend WithEvents picHome As System.Windows.Forms.PictureBox
    Friend WithEvents picBack As System.Windows.Forms.PictureBox
    Friend WithEvents pnlMain As System.Windows.Forms.Panel
    Friend WithEvents PictureBox2 As System.Windows.Forms.PictureBox
    Friend WithEvents lblStatusValue As Zelo.Luma.GUIButton
    Friend WithEvents lblStatus As Zelo.Luma.GUIButton
    Friend WithEvents lblSpeedValue As Zelo.Luma.GUIButton
    Friend WithEvents lblSpeed As Zelo.Luma.GUIButton
End Class
