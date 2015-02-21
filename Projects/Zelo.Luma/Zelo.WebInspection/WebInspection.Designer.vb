<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class WebInspection
    Inherits Zelo.Luma.MainPage

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
        Me.GuiButton1 = New Zelo.Luma.GUIButton
        Me.cmdZoom100 = New Zelo.Luma.GUIButton
        Me.cmdMoveUp = New Zelo.Luma.GUIButton
        Me.cmdMoveDown = New Zelo.Luma.GUIButton
        Me.cmdMoveRight = New Zelo.Luma.GUIButton
        Me.cmdMoveLeft = New Zelo.Luma.GUIButton
        Me.cmdMoveP6 = New Zelo.Luma.GUINavigation
        Me.cmdMoveP5 = New Zelo.Luma.GUINavigation
        Me.cmdMoveP4 = New Zelo.Luma.GUINavigation
        Me.cmdMoveP3 = New Zelo.Luma.GUINavigation
        Me.cmdMoveP2 = New Zelo.Luma.GUINavigation
        Me.cmdMoveP1 = New Zelo.Luma.GUINavigation
        Me.GuiButton6 = New Zelo.Luma.GUIButton
        Me.cmdZoomIn = New Zelo.Luma.GUIButton
        Me.cmdZoomOut = New Zelo.Luma.GUIButton
        Me.cmdChangeCamera = New Zelo.Luma.GUIButton
        Me.cmdMirror = New Zelo.Luma.GUIButton
        Me.cmdRotate = New Zelo.Luma.GUIButton
        Me.picCameraImage = New System.Windows.Forms.PictureBox
        CType(Me.picCameraImage, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GuiButton1
        '
        Me.GuiButton1.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.GuiButton1.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.GuiButton1.BorderColor = System.Drawing.Color.Black
        Me.GuiButton1.BorderWidth = 0
        Me.GuiButton1.EditMode = False
        Me.GuiButton1.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.GuiButton1.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.GuiButton1.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.GuiButton1.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.GuiButton1.Location = New System.Drawing.Point(84, 603)
        Me.GuiButton1.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.GuiButton1.Name = "GuiButton1"
        Me.GuiButton1.Radius = 55
        Me.GuiButton1.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.GuiButton1.ShadowColor = System.Drawing.Color.LightGray
        Me.GuiButton1.ShadowWidth = 2
        Me.GuiButton1.Size = New System.Drawing.Size(618, 66)
        Me.GuiButton1.TabIndex = 15
        Me.GuiButton1.Text = ""
        Me.GuiButton1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.GuiButton1.TextAngle = 0
        '
        'cmdZoom100
        '
        Me.cmdZoom100.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdZoom100.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdZoom100.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdZoom100.BorderColor = System.Drawing.Color.Black
        Me.cmdZoom100.BorderWidth = 0
        Me.cmdZoom100.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdZoom100.EditMode = False
        Me.cmdZoom100.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdZoom100.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdZoom100.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdZoom100.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdZoom100.Location = New System.Drawing.Point(774, 190)
        Me.cmdZoom100.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdZoom100.Name = "cmdZoom100"
        Me.cmdZoom100.Radius = 40
        Me.cmdZoom100.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdZoom100.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdZoom100.ShadowWidth = 2
        Me.cmdZoom100.Size = New System.Drawing.Size(52, 51)
        Me.cmdZoom100.TabIndex = 16
        Me.cmdZoom100.Text = "100%"
        Me.cmdZoom100.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdZoom100.TextAngle = 0
        '
        'cmdMoveUp
        '
        Me.cmdMoveUp.BackColorFaded1 = System.Drawing.Color.Red
        Me.cmdMoveUp.BackColorFaded2 = System.Drawing.Color.Red
        Me.cmdMoveUp.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveUp.BorderWidth = 0
        Me.cmdMoveUp.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveUp.EditMode = False
        Me.cmdMoveUp.Font = New System.Drawing.Font("Wingdings 3", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdMoveUp.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveUp.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveUp.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveUp.Location = New System.Drawing.Point(769, 10)
        Me.cmdMoveUp.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdMoveUp.Name = "cmdMoveUp"
        Me.cmdMoveUp.Radius = 55
        Me.cmdMoveUp.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveUp.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveUp.ShadowWidth = 2
        Me.cmdMoveUp.Size = New System.Drawing.Size(64, 64)
        Me.cmdMoveUp.TabIndex = 17
        Me.cmdMoveUp.Text = "г"
        Me.cmdMoveUp.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveUp.TextAngle = 0
        '
        'cmdMoveDown
        '
        Me.cmdMoveDown.BackColorFaded1 = System.Drawing.Color.Red
        Me.cmdMoveDown.BackColorFaded2 = System.Drawing.Color.Red
        Me.cmdMoveDown.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveDown.BorderWidth = 0
        Me.cmdMoveDown.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveDown.EditMode = False
        Me.cmdMoveDown.Font = New System.Drawing.Font("Wingdings 3", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdMoveDown.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveDown.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveDown.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveDown.Location = New System.Drawing.Point(769, 539)
        Me.cmdMoveDown.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdMoveDown.Name = "cmdMoveDown"
        Me.cmdMoveDown.Radius = 55
        Me.cmdMoveDown.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveDown.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveDown.ShadowWidth = 2
        Me.cmdMoveDown.Size = New System.Drawing.Size(64, 64)
        Me.cmdMoveDown.TabIndex = 18
        Me.cmdMoveDown.Text = "х"
        Me.cmdMoveDown.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveDown.TextAngle = 0
        '
        'cmdMoveRight
        '
        Me.cmdMoveRight.BackColorFaded1 = System.Drawing.Color.Red
        Me.cmdMoveRight.BackColorFaded2 = System.Drawing.Color.Red
        Me.cmdMoveRight.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveRight.BorderWidth = 0
        Me.cmdMoveRight.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveRight.EditMode = False
        Me.cmdMoveRight.Font = New System.Drawing.Font("Wingdings 3", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdMoveRight.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveRight.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveRight.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveRight.Location = New System.Drawing.Point(710, 603)
        Me.cmdMoveRight.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdMoveRight.Name = "cmdMoveRight"
        Me.cmdMoveRight.Radius = 55
        Me.cmdMoveRight.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveRight.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveRight.ShadowWidth = 2
        Me.cmdMoveRight.Size = New System.Drawing.Size(64, 64)
        Me.cmdMoveRight.TabIndex = 20
        Me.cmdMoveRight.Text = "ф"
        Me.cmdMoveRight.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveRight.TextAngle = 0
        '
        'cmdMoveLeft
        '
        Me.cmdMoveLeft.BackColorFaded1 = System.Drawing.Color.Red
        Me.cmdMoveLeft.BackColorFaded2 = System.Drawing.Color.Red
        Me.cmdMoveLeft.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveLeft.BorderWidth = 0
        Me.cmdMoveLeft.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveLeft.EditMode = False
        Me.cmdMoveLeft.Font = New System.Drawing.Font("Wingdings 3", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdMoveLeft.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveLeft.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveLeft.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveLeft.Location = New System.Drawing.Point(12, 603)
        Me.cmdMoveLeft.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdMoveLeft.Name = "cmdMoveLeft"
        Me.cmdMoveLeft.Radius = 55
        Me.cmdMoveLeft.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveLeft.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveLeft.ShadowWidth = 2
        Me.cmdMoveLeft.Size = New System.Drawing.Size(64, 64)
        Me.cmdMoveLeft.TabIndex = 19
        Me.cmdMoveLeft.Text = "е"
        Me.cmdMoveLeft.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveLeft.TextAngle = 0
        '
        'cmdMoveP6
        '
        Me.cmdMoveP6.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdMoveP6.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP6.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP6.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveP6.BorderWidth = 0
        Me.cmdMoveP6.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveP6.EditMode = False
        Me.cmdMoveP6.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.cmdMoveP6.ForeColor = System.Drawing.Color.Black
        Me.cmdMoveP6.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveP6.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveP6.Location = New System.Drawing.Point(583, 612)
        Me.cmdMoveP6.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdMoveP6.Name = "cmdMoveP6"
        Me.cmdMoveP6.NavigationID = Zelo.Luma.NavigationPages.BaseSettingsPage
        Me.cmdMoveP6.Radius = 36
        Me.cmdMoveP6.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveP6.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveP6.ShadowWidth = 2
        Me.cmdMoveP6.Size = New System.Drawing.Size(87, 42)
        Me.cmdMoveP6.TabIndex = 64
        Me.cmdMoveP6.Text = "P6"
        Me.cmdMoveP6.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveP6.TextAngle = 0
        '
        'cmdMoveP5
        '
        Me.cmdMoveP5.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdMoveP5.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP5.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP5.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveP5.BorderWidth = 0
        Me.cmdMoveP5.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveP5.EditMode = False
        Me.cmdMoveP5.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.cmdMoveP5.ForeColor = System.Drawing.Color.Black
        Me.cmdMoveP5.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveP5.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveP5.Location = New System.Drawing.Point(488, 612)
        Me.cmdMoveP5.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdMoveP5.Name = "cmdMoveP5"
        Me.cmdMoveP5.NavigationID = Zelo.Luma.NavigationPages.BaseSettingsPage
        Me.cmdMoveP5.Radius = 36
        Me.cmdMoveP5.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveP5.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveP5.ShadowWidth = 2
        Me.cmdMoveP5.Size = New System.Drawing.Size(87, 42)
        Me.cmdMoveP5.TabIndex = 63
        Me.cmdMoveP5.Text = "P5"
        Me.cmdMoveP5.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveP5.TextAngle = 0
        '
        'cmdMoveP4
        '
        Me.cmdMoveP4.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdMoveP4.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP4.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP4.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveP4.BorderWidth = 0
        Me.cmdMoveP4.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveP4.EditMode = False
        Me.cmdMoveP4.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.cmdMoveP4.ForeColor = System.Drawing.Color.Black
        Me.cmdMoveP4.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveP4.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveP4.Location = New System.Drawing.Point(393, 612)
        Me.cmdMoveP4.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdMoveP4.Name = "cmdMoveP4"
        Me.cmdMoveP4.NavigationID = Zelo.Luma.NavigationPages.BaseSettingsPage
        Me.cmdMoveP4.Radius = 36
        Me.cmdMoveP4.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveP4.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveP4.ShadowWidth = 2
        Me.cmdMoveP4.Size = New System.Drawing.Size(87, 42)
        Me.cmdMoveP4.TabIndex = 62
        Me.cmdMoveP4.Text = "P4"
        Me.cmdMoveP4.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveP4.TextAngle = 0
        '
        'cmdMoveP3
        '
        Me.cmdMoveP3.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdMoveP3.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP3.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP3.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveP3.BorderWidth = 0
        Me.cmdMoveP3.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveP3.EditMode = False
        Me.cmdMoveP3.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.cmdMoveP3.ForeColor = System.Drawing.Color.Black
        Me.cmdMoveP3.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveP3.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveP3.Location = New System.Drawing.Point(298, 612)
        Me.cmdMoveP3.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdMoveP3.Name = "cmdMoveP3"
        Me.cmdMoveP3.NavigationID = Zelo.Luma.NavigationPages.BaseSettingsPage
        Me.cmdMoveP3.Radius = 36
        Me.cmdMoveP3.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveP3.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveP3.ShadowWidth = 2
        Me.cmdMoveP3.Size = New System.Drawing.Size(87, 42)
        Me.cmdMoveP3.TabIndex = 67
        Me.cmdMoveP3.Text = "P3"
        Me.cmdMoveP3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveP3.TextAngle = 0
        '
        'cmdMoveP2
        '
        Me.cmdMoveP2.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdMoveP2.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP2.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP2.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveP2.BorderWidth = 0
        Me.cmdMoveP2.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveP2.EditMode = False
        Me.cmdMoveP2.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.cmdMoveP2.ForeColor = System.Drawing.Color.Black
        Me.cmdMoveP2.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveP2.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveP2.Location = New System.Drawing.Point(203, 612)
        Me.cmdMoveP2.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdMoveP2.Name = "cmdMoveP2"
        Me.cmdMoveP2.NavigationID = Zelo.Luma.NavigationPages.BaseSettingsPage
        Me.cmdMoveP2.Radius = 36
        Me.cmdMoveP2.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveP2.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveP2.ShadowWidth = 2
        Me.cmdMoveP2.Size = New System.Drawing.Size(87, 42)
        Me.cmdMoveP2.TabIndex = 66
        Me.cmdMoveP2.Text = "P2"
        Me.cmdMoveP2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveP2.TextAngle = 0
        '
        'cmdMoveP1
        '
        Me.cmdMoveP1.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdMoveP1.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP1.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveP1.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveP1.BorderWidth = 0
        Me.cmdMoveP1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveP1.EditMode = False
        Me.cmdMoveP1.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.cmdMoveP1.ForeColor = System.Drawing.Color.Black
        Me.cmdMoveP1.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveP1.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveP1.Location = New System.Drawing.Point(108, 612)
        Me.cmdMoveP1.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdMoveP1.Name = "cmdMoveP1"
        Me.cmdMoveP1.NavigationID = Zelo.Luma.NavigationPages.BaseSettingsPage
        Me.cmdMoveP1.Radius = 36
        Me.cmdMoveP1.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveP1.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveP1.ShadowWidth = 2
        Me.cmdMoveP1.Size = New System.Drawing.Size(87, 42)
        Me.cmdMoveP1.TabIndex = 65
        Me.cmdMoveP1.Text = "P1"
        Me.cmdMoveP1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveP1.TextAngle = 0
        '
        'GuiButton6
        '
        Me.GuiButton6.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.GuiButton6.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.GuiButton6.BorderColor = System.Drawing.Color.Black
        Me.GuiButton6.BorderWidth = 0
        Me.GuiButton6.EditMode = False
        Me.GuiButton6.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.GuiButton6.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.GuiButton6.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.GuiButton6.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.GuiButton6.Location = New System.Drawing.Point(769, 91)
        Me.GuiButton6.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.GuiButton6.Name = "GuiButton6"
        Me.GuiButton6.Radius = 55
        Me.GuiButton6.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.GuiButton6.ShadowColor = System.Drawing.Color.LightGray
        Me.GuiButton6.ShadowWidth = 2
        Me.GuiButton6.Size = New System.Drawing.Size(64, 252)
        Me.GuiButton6.TabIndex = 68
        Me.GuiButton6.Text = ""
        Me.GuiButton6.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.GuiButton6.TextAngle = 0
        '
        'cmdZoomIn
        '
        Me.cmdZoomIn.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdZoomIn.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdZoomIn.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdZoomIn.BorderColor = System.Drawing.Color.Black
        Me.cmdZoomIn.BorderWidth = 0
        Me.cmdZoomIn.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdZoomIn.EditMode = False
        Me.cmdZoomIn.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdZoomIn.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdZoomIn.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdZoomIn.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdZoomIn.Location = New System.Drawing.Point(774, 113)
        Me.cmdZoomIn.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdZoomIn.Name = "cmdZoomIn"
        Me.cmdZoomIn.Radius = 40
        Me.cmdZoomIn.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdZoomIn.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdZoomIn.ShadowWidth = 2
        Me.cmdZoomIn.Size = New System.Drawing.Size(52, 77)
        Me.cmdZoomIn.TabIndex = 69
        Me.cmdZoomIn.Text = "zoom in"
        Me.cmdZoomIn.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdZoomIn.TextAngle = 0
        '
        'cmdZoomOut
        '
        Me.cmdZoomOut.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdZoomOut.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdZoomOut.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdZoomOut.BorderColor = System.Drawing.Color.Black
        Me.cmdZoomOut.BorderWidth = 0
        Me.cmdZoomOut.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdZoomOut.EditMode = False
        Me.cmdZoomOut.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdZoomOut.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdZoomOut.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdZoomOut.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdZoomOut.Location = New System.Drawing.Point(774, 241)
        Me.cmdZoomOut.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdZoomOut.Name = "cmdZoomOut"
        Me.cmdZoomOut.Radius = 40
        Me.cmdZoomOut.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdZoomOut.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdZoomOut.ShadowWidth = 2
        Me.cmdZoomOut.Size = New System.Drawing.Size(52, 77)
        Me.cmdZoomOut.TabIndex = 70
        Me.cmdZoomOut.Text = "zoom out"
        Me.cmdZoomOut.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdZoomOut.TextAngle = 0
        '
        'cmdChangeCamera
        '
        Me.cmdChangeCamera.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdChangeCamera.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdChangeCamera.BorderColor = System.Drawing.Color.Black
        Me.cmdChangeCamera.BorderWidth = 0
        Me.cmdChangeCamera.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdChangeCamera.EditMode = False
        Me.cmdChangeCamera.Enabled = False
        Me.cmdChangeCamera.Font = New System.Drawing.Font("Wingdings 3", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdChangeCamera.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdChangeCamera.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdChangeCamera.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdChangeCamera.Location = New System.Drawing.Point(769, 408)
        Me.cmdChangeCamera.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdChangeCamera.Name = "cmdChangeCamera"
        Me.cmdChangeCamera.Radius = 55
        Me.cmdChangeCamera.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdChangeCamera.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdChangeCamera.ShadowWidth = 2
        Me.cmdChangeCamera.Size = New System.Drawing.Size(64, 64)
        Me.cmdChangeCamera.TabIndex = 71
        Me.cmdChangeCamera.Text = "O"
        Me.cmdChangeCamera.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdChangeCamera.TextAngle = 0
        '
        'cmdMirror
        '
        Me.cmdMirror.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMirror.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMirror.BorderColor = System.Drawing.Color.Black
        Me.cmdMirror.BorderWidth = 0
        Me.cmdMirror.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMirror.EditMode = False
        Me.cmdMirror.Font = New System.Drawing.Font("Wingdings", 18.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdMirror.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdMirror.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMirror.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMirror.Location = New System.Drawing.Point(769, 470)
        Me.cmdMirror.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdMirror.Name = "cmdMirror"
        Me.cmdMirror.Radius = 55
        Me.cmdMirror.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMirror.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMirror.ShadowWidth = 2
        Me.cmdMirror.Size = New System.Drawing.Size(64, 64)
        Me.cmdMirror.TabIndex = 72
        Me.cmdMirror.Text = "де"
        Me.cmdMirror.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMirror.TextAngle = 0
        '
        'cmdRotate
        '
        Me.cmdRotate.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRotate.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRotate.BorderColor = System.Drawing.Color.Black
        Me.cmdRotate.BorderWidth = 0
        Me.cmdRotate.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdRotate.EditMode = False
        Me.cmdRotate.Font = New System.Drawing.Font("Wingdings 3", 18.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdRotate.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRotate.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdRotate.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdRotate.Location = New System.Drawing.Point(769, 344)
        Me.cmdRotate.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdRotate.Name = "cmdRotate"
        Me.cmdRotate.Radius = 55
        Me.cmdRotate.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdRotate.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdRotate.ShadowWidth = 2
        Me.cmdRotate.Size = New System.Drawing.Size(64, 64)
        Me.cmdRotate.TabIndex = 73
        Me.cmdRotate.Text = "Q"
        Me.cmdRotate.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdRotate.TextAngle = 0
        '
        'picCameraImage
        '
        Me.picCameraImage.BackColor = System.Drawing.Color.Black
        Me.picCameraImage.Location = New System.Drawing.Point(12, 24)
        Me.picCameraImage.Name = "picCameraImage"
        Me.picCameraImage.Size = New System.Drawing.Size(746, 559)
        Me.picCameraImage.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.picCameraImage.TabIndex = 74
        Me.picCameraImage.TabStop = False
        '
        'WebInspection
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.BackColor = System.Drawing.Color.White
        Me.Controls.Add(Me.picCameraImage)
        Me.Controls.Add(Me.cmdRotate)
        Me.Controls.Add(Me.cmdMirror)
        Me.Controls.Add(Me.cmdChangeCamera)
        Me.Controls.Add(Me.cmdZoomOut)
        Me.Controls.Add(Me.cmdZoomIn)
        Me.Controls.Add(Me.cmdZoom100)
        Me.Controls.Add(Me.GuiButton6)
        Me.Controls.Add(Me.cmdMoveP3)
        Me.Controls.Add(Me.cmdMoveP2)
        Me.Controls.Add(Me.cmdMoveP1)
        Me.Controls.Add(Me.cmdMoveP6)
        Me.Controls.Add(Me.cmdMoveP5)
        Me.Controls.Add(Me.cmdMoveP4)
        Me.Controls.Add(Me.cmdMoveRight)
        Me.Controls.Add(Me.cmdMoveLeft)
        Me.Controls.Add(Me.cmdMoveDown)
        Me.Controls.Add(Me.cmdMoveUp)
        Me.Controls.Add(Me.GuiButton1)
        Me.Name = "WebInspection"
        CType(Me.picCameraImage, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GuiButton1 As Zelo.Luma.GUIButton
    Friend WithEvents cmdZoom100 As Zelo.Luma.GUIButton
    Friend WithEvents cmdMoveUp As Zelo.Luma.GUIButton
    Friend WithEvents cmdMoveDown As Zelo.Luma.GUIButton
    Friend WithEvents cmdMoveRight As Zelo.Luma.GUIButton
    Friend WithEvents cmdMoveLeft As Zelo.Luma.GUIButton
    Friend WithEvents cmdMoveP6 As Zelo.Luma.GUINavigation
    Friend WithEvents cmdMoveP5 As Zelo.Luma.GUINavigation
    Friend WithEvents cmdMoveP4 As Zelo.Luma.GUINavigation
    Friend WithEvents cmdMoveP3 As Zelo.Luma.GUINavigation
    Friend WithEvents cmdMoveP2 As Zelo.Luma.GUINavigation
    Friend WithEvents cmdMoveP1 As Zelo.Luma.GUINavigation
    Friend WithEvents GuiButton6 As Zelo.Luma.GUIButton
    Friend WithEvents cmdZoomIn As Zelo.Luma.GUIButton
    Friend WithEvents cmdZoomOut As Zelo.Luma.GUIButton
    Friend WithEvents cmdChangeCamera As Zelo.Luma.GUIButton
    Friend WithEvents cmdMirror As Zelo.Luma.GUIButton
    Friend WithEvents cmdRotate As Zelo.Luma.GUIButton
    Friend WithEvents picCameraImage As System.Windows.Forms.PictureBox

End Class
