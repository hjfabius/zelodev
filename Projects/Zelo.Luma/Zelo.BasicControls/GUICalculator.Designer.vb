<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUICalculator
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
        Me.tblMain = New System.Windows.Forms.TableLayoutPanel
        Me.guiDisplay = New Zelo.Luma.GUIButton
        Me.guiKeyDot = New Zelo.Luma.GUIButton
        Me.guiKeyEscape = New Zelo.Luma.GUIButton
        Me.guiKey7 = New Zelo.Luma.GUIButton
        Me.guiKeyEnter = New Zelo.Luma.GUIButton
        Me.guiKey3 = New Zelo.Luma.GUIButton
        Me.guiKey8 = New Zelo.Luma.GUIButton
        Me.guiKey2 = New Zelo.Luma.GUIButton
        Me.guiKey9 = New Zelo.Luma.GUIButton
        Me.guiKey1 = New Zelo.Luma.GUIButton
        Me.guiKey4 = New Zelo.Luma.GUIButton
        Me.guiKey6 = New Zelo.Luma.GUIButton
        Me.guiKeyBack = New Zelo.Luma.GUIButton
        Me.guiKey5 = New Zelo.Luma.GUIButton
        Me.guiKey0 = New Zelo.Luma.GUIButton
        Me.guiBackground = New Zelo.Luma.GUIButton
        Me.tblMain.SuspendLayout()
        Me.SuspendLayout()
        '
        'tblMain
        '
        Me.tblMain.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.tblMain.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.tblMain.ColumnCount = 4
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.0!))
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.0!))
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.0!))
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.0!))
        Me.tblMain.Controls.Add(Me.guiDisplay, 0, 0)
        Me.tblMain.Controls.Add(Me.guiKeyDot, 2, 4)
        Me.tblMain.Controls.Add(Me.guiKeyEscape, 3, 1)
        Me.tblMain.Controls.Add(Me.guiKey7, 0, 1)
        Me.tblMain.Controls.Add(Me.guiKeyEnter, 3, 3)
        Me.tblMain.Controls.Add(Me.guiKey3, 2, 3)
        Me.tblMain.Controls.Add(Me.guiKey8, 1, 1)
        Me.tblMain.Controls.Add(Me.guiKey2, 1, 3)
        Me.tblMain.Controls.Add(Me.guiKey9, 2, 1)
        Me.tblMain.Controls.Add(Me.guiKey1, 0, 3)
        Me.tblMain.Controls.Add(Me.guiKey4, 0, 2)
        Me.tblMain.Controls.Add(Me.guiKey6, 2, 2)
        Me.tblMain.Controls.Add(Me.guiKeyBack, 3, 2)
        Me.tblMain.Controls.Add(Me.guiKey5, 1, 2)
        Me.tblMain.Controls.Add(Me.guiKey0, 0, 4)
        Me.tblMain.Location = New System.Drawing.Point(20, 47)
        Me.tblMain.Margin = New System.Windows.Forms.Padding(0)
        Me.tblMain.Name = "tblMain"
        Me.tblMain.RowCount = 5
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.36!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66!))
        Me.tblMain.Size = New System.Drawing.Size(266, 408)
        Me.tblMain.TabIndex = 62
        '
        'guiDisplay
        '
        Me.guiDisplay.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiDisplay.BackColorFaded1 = System.Drawing.Color.White
        Me.guiDisplay.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer))
        Me.guiDisplay.BorderColor = System.Drawing.Color.Black
        Me.guiDisplay.BorderWidth = 0
        Me.tblMain.SetColumnSpan(Me.guiDisplay, 4)
        Me.guiDisplay.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiDisplay.EditMode = True
        Me.guiDisplay.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiDisplay.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiDisplay.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiDisplay.Location = New System.Drawing.Point(0, 0)
        Me.guiDisplay.Margin = New System.Windows.Forms.Padding(0, 0, 0, 16)
        Me.guiDisplay.Name = "guiDisplay"
        Me.guiDisplay.Radius = 60
        Me.guiDisplay.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiDisplay.ShadowColor = System.Drawing.Color.Red
        Me.guiDisplay.ShadowWidth = 2
        Me.guiDisplay.Size = New System.Drawing.Size(266, 120)
        Me.guiDisplay.TabIndex = 1
        Me.guiDisplay.Text = "100"
        Me.guiDisplay.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiDisplay.TextAngle = 0
        '
        'guiKeyDot
        '
        Me.guiKeyDot.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKeyDot.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKeyDot.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKeyDot.BorderColor = System.Drawing.Color.Black
        Me.guiKeyDot.BorderWidth = 0
        Me.guiKeyDot.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKeyDot.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKeyDot.EditMode = False
        Me.guiKeyDot.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKeyDot.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKeyDot.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKeyDot.Location = New System.Drawing.Point(132, 337)
        Me.guiKeyDot.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKeyDot.Name = "guiKeyDot"
        Me.guiKeyDot.Radius = 55
        Me.guiKeyDot.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKeyDot.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKeyDot.ShadowWidth = 2
        Me.guiKeyDot.Size = New System.Drawing.Size(66, 71)
        Me.guiKeyDot.TabIndex = 57
        Me.guiKeyDot.Text = "."
        Me.guiKeyDot.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKeyDot.TextAngle = 0
        '
        'guiKeyEscape
        '
        Me.guiKeyEscape.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKeyEscape.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKeyEscape.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKeyEscape.BorderColor = System.Drawing.Color.Black
        Me.guiKeyEscape.BorderWidth = 0
        Me.guiKeyEscape.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKeyEscape.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKeyEscape.EditMode = False
        Me.guiKeyEscape.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKeyEscape.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKeyEscape.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKeyEscape.Location = New System.Drawing.Point(198, 136)
        Me.guiKeyEscape.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKeyEscape.Name = "guiKeyEscape"
        Me.guiKeyEscape.Radius = 55
        Me.guiKeyEscape.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKeyEscape.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKeyEscape.ShadowWidth = 2
        Me.guiKeyEscape.Size = New System.Drawing.Size(68, 67)
        Me.guiKeyEscape.TabIndex = 58
        Me.guiKeyEscape.Text = "Esc"
        Me.guiKeyEscape.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKeyEscape.TextAngle = 0
        '
        'guiKey7
        '
        Me.guiKey7.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKey7.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey7.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey7.BorderColor = System.Drawing.Color.Black
        Me.guiKey7.BorderWidth = 0
        Me.guiKey7.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKey7.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKey7.EditMode = False
        Me.guiKey7.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKey7.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKey7.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKey7.Location = New System.Drawing.Point(0, 136)
        Me.guiKey7.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKey7.Name = "guiKey7"
        Me.guiKey7.Radius = 55
        Me.guiKey7.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKey7.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKey7.ShadowWidth = 2
        Me.guiKey7.Size = New System.Drawing.Size(66, 67)
        Me.guiKey7.TabIndex = 47
        Me.guiKey7.Text = "7"
        Me.guiKey7.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKey7.TextAngle = 0
        '
        'guiKeyEnter
        '
        Me.guiKeyEnter.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKeyEnter.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKeyEnter.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKeyEnter.BorderColor = System.Drawing.Color.Black
        Me.guiKeyEnter.BorderWidth = 0
        Me.guiKeyEnter.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKeyEnter.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKeyEnter.EditMode = False
        Me.guiKeyEnter.Font = New System.Drawing.Font("Wingdings 3", 24.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.guiKeyEnter.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKeyEnter.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKeyEnter.Location = New System.Drawing.Point(198, 270)
        Me.guiKeyEnter.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKeyEnter.Name = "guiKeyEnter"
        Me.guiKeyEnter.Radius = 55
        Me.guiKeyEnter.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.tblMain.SetRowSpan(Me.guiKeyEnter, 2)
        Me.guiKeyEnter.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKeyEnter.ShadowWidth = 2
        Me.guiKeyEnter.Size = New System.Drawing.Size(68, 138)
        Me.guiKeyEnter.TabIndex = 46
        Me.guiKeyEnter.Text = "8"
        Me.guiKeyEnter.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKeyEnter.TextAngle = 0
        '
        'guiKey3
        '
        Me.guiKey3.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKey3.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey3.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey3.BorderColor = System.Drawing.Color.Black
        Me.guiKey3.BorderWidth = 0
        Me.guiKey3.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKey3.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKey3.EditMode = False
        Me.guiKey3.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKey3.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKey3.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKey3.Location = New System.Drawing.Point(132, 270)
        Me.guiKey3.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKey3.Name = "guiKey3"
        Me.guiKey3.Radius = 55
        Me.guiKey3.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKey3.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKey3.ShadowWidth = 2
        Me.guiKey3.Size = New System.Drawing.Size(66, 67)
        Me.guiKey3.TabIndex = 55
        Me.guiKey3.Text = "3"
        Me.guiKey3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKey3.TextAngle = 0
        '
        'guiKey8
        '
        Me.guiKey8.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKey8.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey8.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey8.BorderColor = System.Drawing.Color.Black
        Me.guiKey8.BorderWidth = 0
        Me.guiKey8.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKey8.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKey8.EditMode = False
        Me.guiKey8.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKey8.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKey8.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKey8.Location = New System.Drawing.Point(66, 136)
        Me.guiKey8.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKey8.Name = "guiKey8"
        Me.guiKey8.Radius = 55
        Me.guiKey8.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKey8.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKey8.ShadowWidth = 2
        Me.guiKey8.Size = New System.Drawing.Size(66, 67)
        Me.guiKey8.TabIndex = 48
        Me.guiKey8.Text = "8"
        Me.guiKey8.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKey8.TextAngle = 0
        '
        'guiKey2
        '
        Me.guiKey2.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKey2.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey2.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey2.BorderColor = System.Drawing.Color.Black
        Me.guiKey2.BorderWidth = 0
        Me.guiKey2.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKey2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKey2.EditMode = False
        Me.guiKey2.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKey2.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKey2.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKey2.Location = New System.Drawing.Point(66, 270)
        Me.guiKey2.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKey2.Name = "guiKey2"
        Me.guiKey2.Radius = 55
        Me.guiKey2.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKey2.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKey2.ShadowWidth = 2
        Me.guiKey2.Size = New System.Drawing.Size(66, 67)
        Me.guiKey2.TabIndex = 54
        Me.guiKey2.Text = "2"
        Me.guiKey2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKey2.TextAngle = 0
        '
        'guiKey9
        '
        Me.guiKey9.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKey9.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey9.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey9.BorderColor = System.Drawing.Color.Black
        Me.guiKey9.BorderWidth = 0
        Me.guiKey9.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKey9.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKey9.EditMode = False
        Me.guiKey9.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKey9.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKey9.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKey9.Location = New System.Drawing.Point(132, 136)
        Me.guiKey9.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKey9.Name = "guiKey9"
        Me.guiKey9.Radius = 55
        Me.guiKey9.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKey9.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKey9.ShadowWidth = 2
        Me.guiKey9.Size = New System.Drawing.Size(66, 67)
        Me.guiKey9.TabIndex = 49
        Me.guiKey9.Text = "9"
        Me.guiKey9.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKey9.TextAngle = 0
        '
        'guiKey1
        '
        Me.guiKey1.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKey1.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey1.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey1.BorderColor = System.Drawing.Color.Black
        Me.guiKey1.BorderWidth = 0
        Me.guiKey1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKey1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKey1.EditMode = False
        Me.guiKey1.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKey1.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKey1.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKey1.Location = New System.Drawing.Point(0, 270)
        Me.guiKey1.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKey1.Name = "guiKey1"
        Me.guiKey1.Radius = 55
        Me.guiKey1.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKey1.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKey1.ShadowWidth = 2
        Me.guiKey1.Size = New System.Drawing.Size(66, 67)
        Me.guiKey1.TabIndex = 53
        Me.guiKey1.Text = "1"
        Me.guiKey1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKey1.TextAngle = 0
        '
        'guiKey4
        '
        Me.guiKey4.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKey4.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey4.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey4.BorderColor = System.Drawing.Color.Black
        Me.guiKey4.BorderWidth = 0
        Me.guiKey4.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKey4.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKey4.EditMode = False
        Me.guiKey4.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKey4.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKey4.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKey4.Location = New System.Drawing.Point(0, 203)
        Me.guiKey4.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKey4.Name = "guiKey4"
        Me.guiKey4.Radius = 55
        Me.guiKey4.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKey4.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKey4.ShadowWidth = 2
        Me.guiKey4.Size = New System.Drawing.Size(66, 67)
        Me.guiKey4.TabIndex = 50
        Me.guiKey4.Text = "4"
        Me.guiKey4.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKey4.TextAngle = 0
        '
        'guiKey6
        '
        Me.guiKey6.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKey6.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey6.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey6.BorderColor = System.Drawing.Color.Black
        Me.guiKey6.BorderWidth = 0
        Me.guiKey6.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKey6.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKey6.EditMode = False
        Me.guiKey6.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKey6.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKey6.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKey6.Location = New System.Drawing.Point(132, 203)
        Me.guiKey6.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKey6.Name = "guiKey6"
        Me.guiKey6.Radius = 55
        Me.guiKey6.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKey6.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKey6.ShadowWidth = 2
        Me.guiKey6.Size = New System.Drawing.Size(66, 67)
        Me.guiKey6.TabIndex = 52
        Me.guiKey6.Text = "6"
        Me.guiKey6.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKey6.TextAngle = 0
        '
        'guiKeyBack
        '
        Me.guiKeyBack.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKeyBack.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKeyBack.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKeyBack.BorderColor = System.Drawing.Color.Black
        Me.guiKeyBack.BorderWidth = 0
        Me.guiKeyBack.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKeyBack.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKeyBack.EditMode = False
        Me.guiKeyBack.Font = New System.Drawing.Font("Wingdings 3", 24.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.guiKeyBack.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKeyBack.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKeyBack.Location = New System.Drawing.Point(198, 203)
        Me.guiKeyBack.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKeyBack.Name = "guiKeyBack"
        Me.guiKeyBack.Radius = 55
        Me.guiKeyBack.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKeyBack.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKeyBack.ShadowWidth = 2
        Me.guiKeyBack.Size = New System.Drawing.Size(68, 67)
        Me.guiKeyBack.TabIndex = 45
        Me.guiKeyBack.Text = "3"
        Me.guiKeyBack.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKeyBack.TextAngle = 0
        '
        'guiKey5
        '
        Me.guiKey5.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKey5.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey5.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey5.BorderColor = System.Drawing.Color.Black
        Me.guiKey5.BorderWidth = 0
        Me.guiKey5.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKey5.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKey5.EditMode = False
        Me.guiKey5.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKey5.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKey5.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKey5.Location = New System.Drawing.Point(66, 203)
        Me.guiKey5.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKey5.Name = "guiKey5"
        Me.guiKey5.Radius = 55
        Me.guiKey5.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKey5.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKey5.ShadowWidth = 2
        Me.guiKey5.Size = New System.Drawing.Size(66, 67)
        Me.guiKey5.TabIndex = 51
        Me.guiKey5.Text = "5"
        Me.guiKey5.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKey5.TextAngle = 0
        '
        'guiKey0
        '
        Me.guiKey0.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiKey0.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey0.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiKey0.BorderColor = System.Drawing.Color.Black
        Me.guiKey0.BorderWidth = 0
        Me.tblMain.SetColumnSpan(Me.guiKey0, 2)
        Me.guiKey0.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiKey0.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiKey0.EditMode = False
        Me.guiKey0.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiKey0.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiKey0.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiKey0.Location = New System.Drawing.Point(0, 337)
        Me.guiKey0.Margin = New System.Windows.Forms.Padding(0)
        Me.guiKey0.Name = "guiKey0"
        Me.guiKey0.Radius = 55
        Me.guiKey0.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiKey0.ShadowColor = System.Drawing.Color.LightGray
        Me.guiKey0.ShadowWidth = 2
        Me.guiKey0.Size = New System.Drawing.Size(132, 71)
        Me.guiKey0.TabIndex = 56
        Me.guiKey0.Text = "0"
        Me.guiKey0.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiKey0.TextAngle = 0
        '
        'guiBackground
        '
        Me.guiBackground.BackColor = System.Drawing.Color.White
        Me.guiBackground.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiBackground.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiBackground.BorderColor = System.Drawing.Color.Black
        Me.guiBackground.BorderWidth = 0
        Me.guiBackground.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiBackground.EditMode = False
        Me.guiBackground.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiBackground.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.guiBackground.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiBackground.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiBackground.Location = New System.Drawing.Point(0, 0)
        Me.guiBackground.Margin = New System.Windows.Forms.Padding(0)
        Me.guiBackground.Name = "guiBackground"
        Me.guiBackground.Radius = 100
        Me.guiBackground.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiBackground.ShadowColor = System.Drawing.Color.LightGray
        Me.guiBackground.ShadowWidth = 2
        Me.guiBackground.Size = New System.Drawing.Size(307, 477)
        Me.guiBackground.TabIndex = 61
        Me.guiBackground.Text = ""
        Me.guiBackground.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.guiBackground.TextAngle = 0
        '
        'GUICalculator
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.Controls.Add(Me.tblMain)
        Me.Controls.Add(Me.guiBackground)
        Me.Name = "GUICalculator"
        Me.Size = New System.Drawing.Size(307, 477)
        Me.tblMain.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents tblMain As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents guiDisplay As Zelo.Luma.GUIButton
    Friend WithEvents guiKeyDot As Zelo.Luma.GUIButton
    Friend WithEvents guiKeyEscape As Zelo.Luma.GUIButton
    Friend WithEvents guiKey7 As Zelo.Luma.GUIButton
    Friend WithEvents guiKeyEnter As Zelo.Luma.GUIButton
    Friend WithEvents guiKey3 As Zelo.Luma.GUIButton
    Friend WithEvents guiKey8 As Zelo.Luma.GUIButton
    Friend WithEvents guiKey2 As Zelo.Luma.GUIButton
    Friend WithEvents guiKey9 As Zelo.Luma.GUIButton
    Friend WithEvents guiKey1 As Zelo.Luma.GUIButton
    Friend WithEvents guiKey4 As Zelo.Luma.GUIButton
    Friend WithEvents guiKey6 As Zelo.Luma.GUIButton
    Friend WithEvents guiKeyBack As Zelo.Luma.GUIButton
    Friend WithEvents guiKey5 As Zelo.Luma.GUIButton
    Friend WithEvents guiKey0 As Zelo.Luma.GUIButton
    Friend WithEvents guiBackground As Zelo.Luma.GUIButton

End Class
