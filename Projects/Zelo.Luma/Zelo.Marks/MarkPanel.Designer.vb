<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MarkPanel
    Inherits System.Windows.Forms.UserControl

    'UserControl overrides dispose to clean up the component list.
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
        Me.cmdKeyOk = New Zelo.Luma.GUIButton
        Me.cmdKeyEsc = New Zelo.Luma.GUIButton
        Me.cmdKey3 = New Zelo.Luma.GUIButton
        Me.cmdKey2 = New Zelo.Luma.GUIButton
        Me.cmdKey1 = New Zelo.Luma.GUIButton
        Me.cmdKey6 = New Zelo.Luma.GUIButton
        Me.cmdKey5 = New Zelo.Luma.GUIButton
        Me.cmdKey4 = New Zelo.Luma.GUIButton
        Me.cmdKey9 = New Zelo.Luma.GUIButton
        Me.cmdKey8 = New Zelo.Luma.GUIButton
        Me.cmdKey7 = New Zelo.Luma.GUIButton
        Me.cmdKey12 = New Zelo.Luma.GUIButton
        Me.cmdKey11 = New Zelo.Luma.GUIButton
        Me.cmdKey10 = New Zelo.Luma.GUIButton
        Me.lblActiveLongitudinal = New Zelo.Luma.GUIButton
        Me.pnlMark = New System.Windows.Forms.Panel
        Me.SuspendLayout()
        '
        'lblTitle
        '
        Me.lblTitle.AutoSize = True
        Me.lblTitle.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblTitle.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblTitle.ForeColor = System.Drawing.Color.White
        Me.lblTitle.Location = New System.Drawing.Point(257, 118)
        Me.lblTitle.Name = "lblTitle"
        Me.lblTitle.Size = New System.Drawing.Size(170, 29)
        Me.lblTitle.TabIndex = 43
        Me.lblTitle.Text = "Mark Selector"
        '
        'cmdKeyOk
        '
        Me.cmdKeyOk.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKeyOk.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKeyOk.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKeyOk.BorderColor = System.Drawing.Color.Black
        Me.cmdKeyOk.BorderWidth = 0
        Me.cmdKeyOk.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKeyOk.EditMode = False
        Me.cmdKeyOk.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKeyOk.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKeyOk.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKeyOk.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKeyOk.Location = New System.Drawing.Point(408, 290)
        Me.cmdKeyOk.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKeyOk.Name = "cmdKeyOk"
        Me.cmdKeyOk.Radius = 55
        Me.cmdKeyOk.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKeyOk.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKeyOk.ShadowWidth = 2
        Me.cmdKeyOk.Size = New System.Drawing.Size(67, 132)
        Me.cmdKeyOk.TabIndex = 42
        Me.cmdKeyOk.Text = "Ok"
        Me.cmdKeyOk.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKeyOk.TextAngle = 0
        '
        'cmdKeyEsc
        '
        Me.cmdKeyEsc.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKeyEsc.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKeyEsc.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKeyEsc.BorderColor = System.Drawing.Color.Black
        Me.cmdKeyEsc.BorderWidth = 0
        Me.cmdKeyEsc.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKeyEsc.EditMode = False
        Me.cmdKeyEsc.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKeyEsc.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKeyEsc.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKeyEsc.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKeyEsc.Location = New System.Drawing.Point(408, 158)
        Me.cmdKeyEsc.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKeyEsc.Name = "cmdKeyEsc"
        Me.cmdKeyEsc.Radius = 55
        Me.cmdKeyEsc.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKeyEsc.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKeyEsc.ShadowWidth = 2
        Me.cmdKeyEsc.Size = New System.Drawing.Size(67, 66)
        Me.cmdKeyEsc.TabIndex = 41
        Me.cmdKeyEsc.Text = "Esc"
        Me.cmdKeyEsc.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKeyEsc.TextAngle = 0
        '
        'cmdKey3
        '
        Me.cmdKey3.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey3.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey3.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey3.BorderColor = System.Drawing.Color.Black
        Me.cmdKey3.BorderWidth = 0
        Me.cmdKey3.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey3.EditMode = False
        Me.cmdKey3.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey3.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey3.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey3.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey3.Location = New System.Drawing.Point(341, 356)
        Me.cmdKey3.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey3.Name = "cmdKey3"
        Me.cmdKey3.Radius = 55
        Me.cmdKey3.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey3.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey3.ShadowWidth = 2
        Me.cmdKey3.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey3.TabIndex = 40
        Me.cmdKey3.Tag = "3"
        Me.cmdKey3.Text = "3"
        Me.cmdKey3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey3.TextAngle = 0
        '
        'cmdKey2
        '
        Me.cmdKey2.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey2.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey2.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey2.BorderColor = System.Drawing.Color.Black
        Me.cmdKey2.BorderWidth = 0
        Me.cmdKey2.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey2.EditMode = False
        Me.cmdKey2.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey2.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey2.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey2.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey2.Location = New System.Drawing.Point(274, 356)
        Me.cmdKey2.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey2.Name = "cmdKey2"
        Me.cmdKey2.Radius = 55
        Me.cmdKey2.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey2.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey2.ShadowWidth = 2
        Me.cmdKey2.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey2.TabIndex = 39
        Me.cmdKey2.Tag = "2"
        Me.cmdKey2.Text = "2"
        Me.cmdKey2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey2.TextAngle = 0
        '
        'cmdKey1
        '
        Me.cmdKey1.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey1.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey1.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey1.BorderColor = System.Drawing.Color.Black
        Me.cmdKey1.BorderWidth = 0
        Me.cmdKey1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey1.EditMode = False
        Me.cmdKey1.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey1.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey1.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey1.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey1.Location = New System.Drawing.Point(207, 356)
        Me.cmdKey1.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey1.Name = "cmdKey1"
        Me.cmdKey1.Radius = 55
        Me.cmdKey1.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey1.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey1.ShadowWidth = 2
        Me.cmdKey1.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey1.TabIndex = 38
        Me.cmdKey1.Tag = "1"
        Me.cmdKey1.Text = "1"
        Me.cmdKey1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey1.TextAngle = 0
        '
        'cmdKey6
        '
        Me.cmdKey6.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey6.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey6.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey6.BorderColor = System.Drawing.Color.Black
        Me.cmdKey6.BorderWidth = 0
        Me.cmdKey6.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey6.EditMode = False
        Me.cmdKey6.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey6.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey6.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey6.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey6.Location = New System.Drawing.Point(341, 290)
        Me.cmdKey6.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey6.Name = "cmdKey6"
        Me.cmdKey6.Radius = 55
        Me.cmdKey6.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey6.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey6.ShadowWidth = 2
        Me.cmdKey6.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey6.TabIndex = 37
        Me.cmdKey6.Tag = "6"
        Me.cmdKey6.Text = "6"
        Me.cmdKey6.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey6.TextAngle = 0
        '
        'cmdKey5
        '
        Me.cmdKey5.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey5.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey5.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey5.BorderColor = System.Drawing.Color.Black
        Me.cmdKey5.BorderWidth = 0
        Me.cmdKey5.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey5.EditMode = False
        Me.cmdKey5.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey5.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey5.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey5.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey5.Location = New System.Drawing.Point(274, 290)
        Me.cmdKey5.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey5.Name = "cmdKey5"
        Me.cmdKey5.Radius = 55
        Me.cmdKey5.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey5.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey5.ShadowWidth = 2
        Me.cmdKey5.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey5.TabIndex = 36
        Me.cmdKey5.Tag = "5"
        Me.cmdKey5.Text = "5"
        Me.cmdKey5.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey5.TextAngle = 0
        '
        'cmdKey4
        '
        Me.cmdKey4.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey4.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey4.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey4.BorderColor = System.Drawing.Color.Black
        Me.cmdKey4.BorderWidth = 0
        Me.cmdKey4.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey4.EditMode = False
        Me.cmdKey4.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey4.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey4.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey4.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey4.Location = New System.Drawing.Point(207, 290)
        Me.cmdKey4.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey4.Name = "cmdKey4"
        Me.cmdKey4.Radius = 55
        Me.cmdKey4.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey4.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey4.ShadowWidth = 2
        Me.cmdKey4.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey4.TabIndex = 35
        Me.cmdKey4.Tag = "4"
        Me.cmdKey4.Text = "4"
        Me.cmdKey4.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey4.TextAngle = 0
        '
        'cmdKey9
        '
        Me.cmdKey9.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey9.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey9.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey9.BorderColor = System.Drawing.Color.Black
        Me.cmdKey9.BorderWidth = 0
        Me.cmdKey9.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey9.EditMode = False
        Me.cmdKey9.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey9.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey9.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey9.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey9.Location = New System.Drawing.Point(341, 224)
        Me.cmdKey9.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey9.Name = "cmdKey9"
        Me.cmdKey9.Radius = 55
        Me.cmdKey9.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey9.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey9.ShadowWidth = 2
        Me.cmdKey9.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey9.TabIndex = 34
        Me.cmdKey9.Tag = "9"
        Me.cmdKey9.Text = "9"
        Me.cmdKey9.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey9.TextAngle = 0
        '
        'cmdKey8
        '
        Me.cmdKey8.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey8.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey8.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey8.BorderColor = System.Drawing.Color.Black
        Me.cmdKey8.BorderWidth = 0
        Me.cmdKey8.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey8.EditMode = False
        Me.cmdKey8.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey8.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey8.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey8.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey8.Location = New System.Drawing.Point(274, 224)
        Me.cmdKey8.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey8.Name = "cmdKey8"
        Me.cmdKey8.Radius = 55
        Me.cmdKey8.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey8.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey8.ShadowWidth = 2
        Me.cmdKey8.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey8.TabIndex = 33
        Me.cmdKey8.Tag = "8"
        Me.cmdKey8.Text = "8"
        Me.cmdKey8.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey8.TextAngle = 0
        '
        'cmdKey7
        '
        Me.cmdKey7.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey7.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey7.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey7.BorderColor = System.Drawing.Color.Black
        Me.cmdKey7.BorderWidth = 0
        Me.cmdKey7.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey7.EditMode = False
        Me.cmdKey7.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey7.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey7.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey7.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey7.Location = New System.Drawing.Point(207, 224)
        Me.cmdKey7.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey7.Name = "cmdKey7"
        Me.cmdKey7.Radius = 55
        Me.cmdKey7.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey7.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey7.ShadowWidth = 2
        Me.cmdKey7.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey7.TabIndex = 32
        Me.cmdKey7.Tag = "7"
        Me.cmdKey7.Text = "7"
        Me.cmdKey7.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey7.TextAngle = 0
        '
        'cmdKey12
        '
        Me.cmdKey12.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey12.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey12.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey12.BorderColor = System.Drawing.Color.Black
        Me.cmdKey12.BorderWidth = 0
        Me.cmdKey12.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey12.EditMode = False
        Me.cmdKey12.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey12.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey12.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey12.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey12.Location = New System.Drawing.Point(341, 158)
        Me.cmdKey12.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey12.Name = "cmdKey12"
        Me.cmdKey12.Radius = 55
        Me.cmdKey12.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey12.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey12.ShadowWidth = 2
        Me.cmdKey12.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey12.TabIndex = 31
        Me.cmdKey12.Tag = "12"
        Me.cmdKey12.Text = "12"
        Me.cmdKey12.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey12.TextAngle = 0
        '
        'cmdKey11
        '
        Me.cmdKey11.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey11.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey11.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey11.BorderColor = System.Drawing.Color.Black
        Me.cmdKey11.BorderWidth = 0
        Me.cmdKey11.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey11.EditMode = False
        Me.cmdKey11.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey11.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey11.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey11.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey11.Location = New System.Drawing.Point(274, 158)
        Me.cmdKey11.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey11.Name = "cmdKey11"
        Me.cmdKey11.Radius = 55
        Me.cmdKey11.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey11.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey11.ShadowWidth = 2
        Me.cmdKey11.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey11.TabIndex = 30
        Me.cmdKey11.Tag = "11"
        Me.cmdKey11.Text = "11"
        Me.cmdKey11.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey11.TextAngle = 0
        '
        'cmdKey10
        '
        Me.cmdKey10.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey10.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey10.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdKey10.BorderColor = System.Drawing.Color.Black
        Me.cmdKey10.BorderWidth = 0
        Me.cmdKey10.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdKey10.EditMode = False
        Me.cmdKey10.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdKey10.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdKey10.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdKey10.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdKey10.Location = New System.Drawing.Point(207, 158)
        Me.cmdKey10.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdKey10.Name = "cmdKey10"
        Me.cmdKey10.Radius = 55
        Me.cmdKey10.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdKey10.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdKey10.ShadowWidth = 2
        Me.cmdKey10.Size = New System.Drawing.Size(67, 66)
        Me.cmdKey10.TabIndex = 29
        Me.cmdKey10.Tag = "10"
        Me.cmdKey10.Text = "10"
        Me.cmdKey10.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdKey10.TextAngle = 0
        '
        'lblActiveLongitudinal
        '
        Me.lblActiveLongitudinal.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblActiveLongitudinal.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblActiveLongitudinal.BorderColor = System.Drawing.Color.Black
        Me.lblActiveLongitudinal.BorderWidth = 0
        Me.lblActiveLongitudinal.EditMode = False
        Me.lblActiveLongitudinal.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblActiveLongitudinal.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblActiveLongitudinal.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblActiveLongitudinal.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblActiveLongitudinal.Location = New System.Drawing.Point(191, 106)
        Me.lblActiveLongitudinal.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblActiveLongitudinal.Name = "lblActiveLongitudinal"
        Me.lblActiveLongitudinal.Radius = 55
        Me.lblActiveLongitudinal.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblActiveLongitudinal.ShadowColor = System.Drawing.Color.LightGray
        Me.lblActiveLongitudinal.ShadowWidth = 2
        Me.lblActiveLongitudinal.Size = New System.Drawing.Size(301, 334)
        Me.lblActiveLongitudinal.TabIndex = 28
        Me.lblActiveLongitudinal.Text = ""
        Me.lblActiveLongitudinal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblActiveLongitudinal.TextAngle = 0
        '
        'pnlMark
        '
        Me.pnlMark.Location = New System.Drawing.Point(3, 3)
        Me.pnlMark.Name = "pnlMark"
        Me.pnlMark.Size = New System.Drawing.Size(177, 652)
        Me.pnlMark.TabIndex = 44
        '
        'MarkPanel
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.pnlMark)
        Me.Controls.Add(Me.lblTitle)
        Me.Controls.Add(Me.cmdKeyOk)
        Me.Controls.Add(Me.cmdKeyEsc)
        Me.Controls.Add(Me.cmdKey3)
        Me.Controls.Add(Me.cmdKey2)
        Me.Controls.Add(Me.cmdKey1)
        Me.Controls.Add(Me.cmdKey6)
        Me.Controls.Add(Me.cmdKey5)
        Me.Controls.Add(Me.cmdKey4)
        Me.Controls.Add(Me.cmdKey9)
        Me.Controls.Add(Me.cmdKey8)
        Me.Controls.Add(Me.cmdKey7)
        Me.Controls.Add(Me.cmdKey12)
        Me.Controls.Add(Me.cmdKey11)
        Me.Controls.Add(Me.cmdKey10)
        Me.Controls.Add(Me.lblActiveLongitudinal)
        Me.Name = "MarkPanel"
        Me.Size = New System.Drawing.Size(498, 658)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblTitle As System.Windows.Forms.Label
    Friend WithEvents cmdKeyOk As Zelo.Luma.GUIButton
    Friend WithEvents cmdKeyEsc As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey3 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey2 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey1 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey6 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey5 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey4 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey9 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey8 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey7 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey12 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey11 As Zelo.Luma.GUIButton
    Friend WithEvents cmdKey10 As Zelo.Luma.GUIButton
    Friend WithEvents lblActiveLongitudinal As Zelo.Luma.GUIButton
    Friend WithEvents pnlMark As System.Windows.Forms.Panel

End Class
