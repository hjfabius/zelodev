<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUIRegister
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
        Me.tblTotal = New System.Windows.Forms.TableLayoutPanel
        Me.lblTop = New System.Windows.Forms.Label
        Me.lblLateral = New System.Windows.Forms.Label
        Me.lblLongitudinal = New System.Windows.Forms.Label
        Me.lblGroupNumber = New System.Windows.Forms.Label
        Me.picErrorLateral = New System.Windows.Forms.PictureBox
        Me.picErrorLongitudinal = New System.Windows.Forms.PictureBox
        Me.pnlHorizontalLine = New System.Windows.Forms.Panel
        Me.pnlVerticalLine = New System.Windows.Forms.Panel
        Me.picMode = New System.Windows.Forms.PictureBox
        Me.guiRegisterCross = New Zelo.Luma.GUIRegisterCross
        Me.PictureBox4 = New System.Windows.Forms.PictureBox
        Me.tblTotal.SuspendLayout()
        CType(Me.picErrorLateral, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picErrorLongitudinal, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picMode, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox4, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'tblTotal
        '
        Me.tblTotal.BackColor = System.Drawing.Color.White
        Me.tblTotal.ColumnCount = 5
        Me.tblTotal.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23.18169!))
        Me.tblTotal.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 41.72704!))
        Me.tblTotal.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.06085!))
        Me.tblTotal.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 1.0!))
        Me.tblTotal.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.03042!))
        Me.tblTotal.Controls.Add(Me.lblTop, 0, 0)
        Me.tblTotal.Controls.Add(Me.lblLateral, 1, 4)
        Me.tblTotal.Controls.Add(Me.lblLongitudinal, 1, 3)
        Me.tblTotal.Controls.Add(Me.lblGroupNumber, 0, 3)
        Me.tblTotal.Controls.Add(Me.picErrorLateral, 2, 4)
        Me.tblTotal.Controls.Add(Me.picErrorLongitudinal, 2, 3)
        Me.tblTotal.Controls.Add(Me.pnlHorizontalLine, 0, 2)
        Me.tblTotal.Controls.Add(Me.pnlVerticalLine, 3, 3)
        Me.tblTotal.Controls.Add(Me.picMode, 4, 3)
        Me.tblTotal.Controls.Add(Me.guiRegisterCross, 0, 1)
        Me.tblTotal.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tblTotal.Location = New System.Drawing.Point(0, 0)
        Me.tblTotal.Margin = New System.Windows.Forms.Padding(0)
        Me.tblTotal.Name = "tblTotal"
        Me.tblTotal.RowCount = 5
        Me.tblTotal.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 6.0!))
        Me.tblTotal.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100.0!))
        Me.tblTotal.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 1.0!))
        Me.tblTotal.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 24.0!))
        Me.tblTotal.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 24.0!))
        Me.tblTotal.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20.0!))
        Me.tblTotal.Size = New System.Drawing.Size(145, 200)
        Me.tblTotal.TabIndex = 0
        '
        'lblTop
        '
        Me.lblTop.BackColor = System.Drawing.Color.Red
        Me.tblTotal.SetColumnSpan(Me.lblTop, 5)
        Me.lblTop.Dock = System.Windows.Forms.DockStyle.Fill
        Me.lblTop.Location = New System.Drawing.Point(0, 0)
        Me.lblTop.Margin = New System.Windows.Forms.Padding(0)
        Me.lblTop.Name = "lblTop"
        Me.lblTop.Size = New System.Drawing.Size(145, 6)
        Me.lblTop.TabIndex = 6
        '
        'lblLateral
        '
        Me.lblLateral.BackColor = System.Drawing.Color.White
        Me.lblLateral.Dock = System.Windows.Forms.DockStyle.Fill
        Me.lblLateral.Font = New System.Drawing.Font("Arial", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblLateral.Location = New System.Drawing.Point(33, 176)
        Me.lblLateral.Margin = New System.Windows.Forms.Padding(0)
        Me.lblLateral.Name = "lblLateral"
        Me.lblLateral.Size = New System.Drawing.Size(60, 24)
        Me.lblLateral.TabIndex = 11
        Me.lblLateral.Text = "0"
        Me.lblLateral.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'lblLongitudinal
        '
        Me.lblLongitudinal.BackColor = System.Drawing.Color.White
        Me.lblLongitudinal.Dock = System.Windows.Forms.DockStyle.Fill
        Me.lblLongitudinal.Font = New System.Drawing.Font("Arial", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblLongitudinal.Location = New System.Drawing.Point(33, 152)
        Me.lblLongitudinal.Margin = New System.Windows.Forms.Padding(0)
        Me.lblLongitudinal.Name = "lblLongitudinal"
        Me.lblLongitudinal.Size = New System.Drawing.Size(60, 24)
        Me.lblLongitudinal.TabIndex = 3
        Me.lblLongitudinal.Text = "0"
        Me.lblLongitudinal.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'lblGroupNumber
        '
        Me.lblGroupNumber.BackColor = System.Drawing.Color.Red
        Me.lblGroupNumber.Dock = System.Windows.Forms.DockStyle.Fill
        Me.lblGroupNumber.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblGroupNumber.ForeColor = System.Drawing.Color.White
        Me.lblGroupNumber.Location = New System.Drawing.Point(0, 152)
        Me.lblGroupNumber.Margin = New System.Windows.Forms.Padding(0)
        Me.lblGroupNumber.Name = "lblGroupNumber"
        Me.tblTotal.SetRowSpan(Me.lblGroupNumber, 2)
        Me.lblGroupNumber.Size = New System.Drawing.Size(33, 48)
        Me.lblGroupNumber.TabIndex = 0
        Me.lblGroupNumber.Text = "1"
        Me.lblGroupNumber.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'picErrorLateral
        '
        Me.picErrorLateral.BackColor = System.Drawing.Color.White
        Me.picErrorLateral.Dock = System.Windows.Forms.DockStyle.Fill
        Me.picErrorLateral.Image = Global.Zelo.Luma.My.Resources.Resources.iconDarkManMiddle
        Me.picErrorLateral.Location = New System.Drawing.Point(93, 176)
        Me.picErrorLateral.Margin = New System.Windows.Forms.Padding(0, 0, 1, 0)
        Me.picErrorLateral.Name = "picErrorLateral"
        Me.picErrorLateral.Size = New System.Drawing.Size(13, 24)
        Me.picErrorLateral.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.picErrorLateral.TabIndex = 9
        Me.picErrorLateral.TabStop = False
        Me.picErrorLateral.Visible = False
        Me.picErrorLateral.WaitOnLoad = True
        '
        'picErrorLongitudinal
        '
        Me.picErrorLongitudinal.BackColor = System.Drawing.Color.White
        Me.picErrorLongitudinal.Dock = System.Windows.Forms.DockStyle.Fill
        Me.picErrorLongitudinal.Image = Global.Zelo.Luma.My.Resources.Resources.iconDarkMinusMiddle
        Me.picErrorLongitudinal.Location = New System.Drawing.Point(93, 152)
        Me.picErrorLongitudinal.Margin = New System.Windows.Forms.Padding(0, 0, 1, 0)
        Me.picErrorLongitudinal.Name = "picErrorLongitudinal"
        Me.picErrorLongitudinal.Size = New System.Drawing.Size(13, 24)
        Me.picErrorLongitudinal.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.picErrorLongitudinal.TabIndex = 10
        Me.picErrorLongitudinal.TabStop = False
        Me.picErrorLongitudinal.Visible = False
        Me.picErrorLongitudinal.WaitOnLoad = True
        '
        'pnlHorizontalLine
        '
        Me.pnlHorizontalLine.BackColor = System.Drawing.Color.Black
        Me.tblTotal.SetColumnSpan(Me.pnlHorizontalLine, 5)
        Me.pnlHorizontalLine.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlHorizontalLine.Location = New System.Drawing.Point(0, 151)
        Me.pnlHorizontalLine.Margin = New System.Windows.Forms.Padding(0)
        Me.pnlHorizontalLine.Name = "pnlHorizontalLine"
        Me.pnlHorizontalLine.Size = New System.Drawing.Size(145, 1)
        Me.pnlHorizontalLine.TabIndex = 12
        '
        'pnlVerticalLine
        '
        Me.pnlVerticalLine.BackColor = System.Drawing.Color.Black
        Me.pnlVerticalLine.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlVerticalLine.Location = New System.Drawing.Point(107, 152)
        Me.pnlVerticalLine.Margin = New System.Windows.Forms.Padding(0)
        Me.pnlVerticalLine.Name = "pnlVerticalLine"
        Me.tblTotal.SetRowSpan(Me.pnlVerticalLine, 2)
        Me.pnlVerticalLine.Size = New System.Drawing.Size(1, 48)
        Me.pnlVerticalLine.TabIndex = 13
        '
        'picMode
        '
        Me.picMode.Dock = System.Windows.Forms.DockStyle.Fill
        Me.picMode.Image = Global.Zelo.Luma.My.Resources.Resources.Disabled_runmodeManualBig
        Me.picMode.Location = New System.Drawing.Point(108, 152)
        Me.picMode.Margin = New System.Windows.Forms.Padding(0)
        Me.picMode.Name = "picMode"
        Me.tblTotal.SetRowSpan(Me.picMode, 2)
        Me.picMode.Size = New System.Drawing.Size(37, 48)
        Me.picMode.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.picMode.TabIndex = 14
        Me.picMode.TabStop = False
        Me.picMode.WaitOnLoad = True
        '
        'guiRegisterCross
        '
        Me.tblTotal.SetColumnSpan(Me.guiRegisterCross, 5)
        Me.guiRegisterCross.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiRegisterCross.Location = New System.Drawing.Point(0, 6)
        Me.guiRegisterCross.Margin = New System.Windows.Forms.Padding(0)
        Me.guiRegisterCross.Name = "guiRegisterCross"
        Me.guiRegisterCross.Size = New System.Drawing.Size(145, 145)
        Me.guiRegisterCross.TabIndex = 15
        '
        'PictureBox4
        '
        Me.PictureBox4.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox4.Image = Global.Zelo.Luma.My.Resources.Resources.iconDarkGear
        Me.PictureBox4.Location = New System.Drawing.Point(-1, 0)
        Me.PictureBox4.Margin = New System.Windows.Forms.Padding(0)
        Me.PictureBox4.Name = "PictureBox4"
        Me.PictureBox4.Size = New System.Drawing.Size(8, 8)
        Me.PictureBox4.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox4.TabIndex = 2
        Me.PictureBox4.TabStop = False
        '
        'GUIRegister
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Controls.Add(Me.tblTotal)
        Me.Cursor = System.Windows.Forms.Cursors.Hand
        Me.DoubleBuffered = True
        Me.Name = "GUIRegister"
        Me.Size = New System.Drawing.Size(145, 200)
        Me.tblTotal.ResumeLayout(False)
        CType(Me.picErrorLateral, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picErrorLongitudinal, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picMode, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox4, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents tblTotal As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents lblLongitudinal As System.Windows.Forms.Label
    Friend WithEvents lblTop As System.Windows.Forms.Label
    Friend WithEvents picErrorLateral As System.Windows.Forms.PictureBox
    Friend WithEvents picErrorLongitudinal As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox4 As System.Windows.Forms.PictureBox
    Friend WithEvents lblGroupNumber As System.Windows.Forms.Label
    Friend WithEvents lblLateral As System.Windows.Forms.Label
    Friend WithEvents pnlHorizontalLine As System.Windows.Forms.Panel
    Friend WithEvents pnlVerticalLine As System.Windows.Forms.Panel
    Friend WithEvents picMode As System.Windows.Forms.PictureBox
    Friend WithEvents guiRegisterCross As Zelo.Luma.GUIRegisterCross

End Class
