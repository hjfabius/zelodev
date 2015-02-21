<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUIRegisterCross
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
        Me.picBall = New System.Windows.Forms.PictureBox
        Me.pnlMain = New System.Windows.Forms.Panel
        Me.tblMain = New System.Windows.Forms.TableLayoutPanel
        Me.picIconBottom = New System.Windows.Forms.PictureBox
        Me.picIconLeft = New System.Windows.Forms.PictureBox
        Me.picIconTop = New System.Windows.Forms.PictureBox
        Me.picIconRight = New System.Windows.Forms.PictureBox
        Me.guiLine1 = New Zelo.Luma.GUIRectangle
        Me.guiLine2 = New Zelo.Luma.GUIRectangle
        Me.guiLine3 = New Zelo.Luma.GUIRectangle
        Me.guiLine4 = New Zelo.Luma.GUIRectangle
        CType(Me.picBall, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.pnlMain.SuspendLayout()
        Me.tblMain.SuspendLayout()
        CType(Me.picIconBottom, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picIconLeft, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picIconTop, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picIconRight, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'picBall
        '
        Me.picBall.Image = Global.Zelo.Luma.My.Resources.Resources.greenStar
        Me.picBall.Location = New System.Drawing.Point(65, 63)
        Me.picBall.Name = "picBall"
        Me.picBall.Size = New System.Drawing.Size(16, 17)
        Me.picBall.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picBall.TabIndex = 1
        Me.picBall.TabStop = False
        '
        'pnlMain
        '
        Me.pnlMain.BackColor = System.Drawing.Color.White
        Me.pnlMain.Controls.Add(Me.picBall)
        Me.pnlMain.Controls.Add(Me.tblMain)
        Me.pnlMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlMain.Location = New System.Drawing.Point(0, 0)
        Me.pnlMain.Margin = New System.Windows.Forms.Padding(0)
        Me.pnlMain.Name = "pnlMain"
        Me.pnlMain.Size = New System.Drawing.Size(200, 200)
        Me.pnlMain.TabIndex = 2
        '
        'tblMain
        '
        Me.tblMain.ColumnCount = 5
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 8.0!))
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 8.0!))
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 9.0!))
        Me.tblMain.Controls.Add(Me.picIconBottom, 2, 4)
        Me.tblMain.Controls.Add(Me.picIconLeft, 0, 2)
        Me.tblMain.Controls.Add(Me.picIconTop, 2, 0)
        Me.tblMain.Controls.Add(Me.picIconRight, 4, 2)
        Me.tblMain.Controls.Add(Me.guiLine1, 1, 2)
        Me.tblMain.Controls.Add(Me.guiLine2, 2, 1)
        Me.tblMain.Controls.Add(Me.guiLine3, 3, 2)
        Me.tblMain.Controls.Add(Me.guiLine4, 2, 3)
        Me.tblMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tblMain.Location = New System.Drawing.Point(0, 0)
        Me.tblMain.Margin = New System.Windows.Forms.Padding(0)
        Me.tblMain.Name = "tblMain"
        Me.tblMain.RowCount = 5
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 8.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 8.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 8.0!))
        Me.tblMain.Size = New System.Drawing.Size(200, 200)
        Me.tblMain.TabIndex = 0
        '
        'picIconBottom
        '
        Me.picIconBottom.Dock = System.Windows.Forms.DockStyle.Fill
        Me.picIconBottom.Image = Global.Zelo.Luma.My.Resources.Resources.iconDarkMan
        Me.picIconBottom.Location = New System.Drawing.Point(95, 192)
        Me.picIconBottom.Margin = New System.Windows.Forms.Padding(0)
        Me.picIconBottom.Name = "picIconBottom"
        Me.picIconBottom.Size = New System.Drawing.Size(8, 8)
        Me.picIconBottom.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.picIconBottom.TabIndex = 3
        Me.picIconBottom.TabStop = False
        '
        'picIconLeft
        '
        Me.picIconLeft.Dock = System.Windows.Forms.DockStyle.Fill
        Me.picIconLeft.Image = Global.Zelo.Luma.My.Resources.Resources.iconDarkMinus
        Me.picIconLeft.Location = New System.Drawing.Point(0, 96)
        Me.picIconLeft.Margin = New System.Windows.Forms.Padding(0)
        Me.picIconLeft.Name = "picIconLeft"
        Me.picIconLeft.Size = New System.Drawing.Size(8, 8)
        Me.picIconLeft.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.picIconLeft.TabIndex = 4
        Me.picIconLeft.TabStop = False
        '
        'picIconTop
        '
        Me.picIconTop.Dock = System.Windows.Forms.DockStyle.Fill
        Me.picIconTop.Image = Global.Zelo.Luma.My.Resources.Resources.iconDarkGear
        Me.picIconTop.Location = New System.Drawing.Point(95, 0)
        Me.picIconTop.Margin = New System.Windows.Forms.Padding(0)
        Me.picIconTop.Name = "picIconTop"
        Me.picIconTop.Size = New System.Drawing.Size(8, 8)
        Me.picIconTop.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.picIconTop.TabIndex = 2
        Me.picIconTop.TabStop = False
        '
        'picIconRight
        '
        Me.picIconRight.Dock = System.Windows.Forms.DockStyle.Fill
        Me.picIconRight.Image = Global.Zelo.Luma.My.Resources.Resources.Disabled_iconDarkPlus
        Me.picIconRight.Location = New System.Drawing.Point(190, 96)
        Me.picIconRight.Margin = New System.Windows.Forms.Padding(0)
        Me.picIconRight.Name = "picIconRight"
        Me.picIconRight.Size = New System.Drawing.Size(10, 8)
        Me.picIconRight.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.picIconRight.TabIndex = 5
        Me.picIconRight.TabStop = False
        '
        'guiLine1
        '
        Me.guiLine1.BackColorFaded1 = System.Drawing.Color.Black
        Me.guiLine1.BackColorFaded2 = System.Drawing.Color.Black
        Me.guiLine1.BorderColor = System.Drawing.Color.Black
        Me.guiLine1.BorderWidth = 0
        Me.guiLine1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiLine1.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiLine1.Location = New System.Drawing.Point(8, 99)
        Me.guiLine1.Margin = New System.Windows.Forms.Padding(0, 3, 0, 5)
        Me.guiLine1.Name = "guiLine1"
        Me.guiLine1.Radius = 0
        Me.guiLine1.RectangleStyle = Zelo.Luma.RectangleStyle.Squared
        Me.guiLine1.ShadowColor = System.Drawing.Color.LightGray
        Me.guiLine1.ShadowWidth = 0
        Me.guiLine1.Size = New System.Drawing.Size(87, 1)
        Me.guiLine1.TabIndex = 6
        '
        'guiLine2
        '
        Me.guiLine2.BackColorFaded1 = System.Drawing.Color.Black
        Me.guiLine2.BackColorFaded2 = System.Drawing.Color.Black
        Me.guiLine2.BorderColor = System.Drawing.Color.Black
        Me.guiLine2.BorderWidth = 0
        Me.guiLine2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiLine2.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiLine2.Location = New System.Drawing.Point(98, 8)
        Me.guiLine2.Margin = New System.Windows.Forms.Padding(3, 0, 5, 0)
        Me.guiLine2.Name = "guiLine2"
        Me.guiLine2.Radius = 0
        Me.guiLine2.RectangleStyle = Zelo.Luma.RectangleStyle.Squared
        Me.guiLine2.ShadowColor = System.Drawing.Color.LightGray
        Me.guiLine2.ShadowWidth = 0
        Me.guiLine2.Size = New System.Drawing.Size(1, 88)
        Me.guiLine2.TabIndex = 7
        '
        'guiLine3
        '
        Me.guiLine3.BackColorFaded1 = System.Drawing.Color.Black
        Me.guiLine3.BackColorFaded2 = System.Drawing.Color.Black
        Me.guiLine3.BorderColor = System.Drawing.Color.Black
        Me.guiLine3.BorderWidth = 0
        Me.guiLine3.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiLine3.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiLine3.Location = New System.Drawing.Point(103, 99)
        Me.guiLine3.Margin = New System.Windows.Forms.Padding(0, 3, 0, 5)
        Me.guiLine3.Name = "guiLine3"
        Me.guiLine3.Radius = 0
        Me.guiLine3.RectangleStyle = Zelo.Luma.RectangleStyle.Squared
        Me.guiLine3.ShadowColor = System.Drawing.Color.LightGray
        Me.guiLine3.ShadowWidth = 0
        Me.guiLine3.Size = New System.Drawing.Size(87, 1)
        Me.guiLine3.TabIndex = 8
        '
        'guiLine4
        '
        Me.guiLine4.BackColorFaded1 = System.Drawing.Color.Black
        Me.guiLine4.BackColorFaded2 = System.Drawing.Color.Black
        Me.guiLine4.BorderColor = System.Drawing.Color.Black
        Me.guiLine4.BorderWidth = 0
        Me.guiLine4.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiLine4.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiLine4.Location = New System.Drawing.Point(98, 104)
        Me.guiLine4.Margin = New System.Windows.Forms.Padding(3, 0, 5, 0)
        Me.guiLine4.Name = "guiLine4"
        Me.guiLine4.Radius = 0
        Me.guiLine4.RectangleStyle = Zelo.Luma.RectangleStyle.Squared
        Me.guiLine4.ShadowColor = System.Drawing.Color.LightGray
        Me.guiLine4.ShadowWidth = 0
        Me.guiLine4.Size = New System.Drawing.Size(1, 88)
        Me.guiLine4.TabIndex = 9
        '
        'GUIRegisterCross
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.pnlMain)
        Me.Margin = New System.Windows.Forms.Padding(0)
        Me.Name = "GUIRegisterCross"
        Me.Size = New System.Drawing.Size(200, 200)
        CType(Me.picBall, System.ComponentModel.ISupportInitialize).EndInit()
        Me.pnlMain.ResumeLayout(False)
        Me.pnlMain.PerformLayout()
        Me.tblMain.ResumeLayout(False)
        CType(Me.picIconBottom, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picIconLeft, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picIconTop, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picIconRight, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents picBall As System.Windows.Forms.PictureBox
    Friend WithEvents pnlMain As System.Windows.Forms.Panel
    Friend WithEvents tblMain As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents picIconBottom As System.Windows.Forms.PictureBox
    Friend WithEvents picIconLeft As System.Windows.Forms.PictureBox
    Friend WithEvents picIconTop As System.Windows.Forms.PictureBox
    Friend WithEvents picIconRight As System.Windows.Forms.PictureBox
    Friend WithEvents guiLine1 As Zelo.Luma.GUIRectangle
    Friend WithEvents guiLine2 As Zelo.Luma.GUIRectangle
    Friend WithEvents guiLine3 As Zelo.Luma.GUIRectangle
    Friend WithEvents guiLine4 As Zelo.Luma.GUIRectangle

End Class
