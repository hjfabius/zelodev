<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUIColourChooser
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
        Me.pnlColorTable = New System.Windows.Forms.Panel
        Me.pnlGradient = New System.Windows.Forms.Panel
        Me.cmdCancel = New Zelo.Luma.GUIButton
        Me.cmdOk = New Zelo.Luma.GUIButton
        Me.txtCurrentColor = New Zelo.Luma.GUIButton
        Me.txtPreviousColor = New Zelo.Luma.GUIButton
        Me.SuspendLayout()
        '
        'pnlColorTable
        '
        Me.pnlColorTable.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.pnlColorTable.Location = New System.Drawing.Point(3, 3)
        Me.pnlColorTable.Name = "pnlColorTable"
        Me.pnlColorTable.Size = New System.Drawing.Size(496, 527)
        Me.pnlColorTable.TabIndex = 0
        '
        'pnlGradient
        '
        Me.pnlGradient.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.pnlGradient.BackColor = System.Drawing.Color.DimGray
        Me.pnlGradient.Location = New System.Drawing.Point(505, 147)
        Me.pnlGradient.Name = "pnlGradient"
        Me.pnlGradient.Size = New System.Drawing.Size(80, 233)
        Me.pnlGradient.TabIndex = 3
        '
        'cmdCancel
        '
        Me.cmdCancel.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.cmdCancel.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdCancel.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdCancel.BorderColor = System.Drawing.Color.Black
        Me.cmdCancel.BorderWidth = 0
        Me.cmdCancel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdCancel.EditMode = False
        Me.cmdCancel.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdCancel.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdCancel.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdCancel.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdCancel.Location = New System.Drawing.Point(505, 461)
        Me.cmdCancel.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdCancel.Name = "cmdCancel"
        Me.cmdCancel.Radius = 55
        Me.cmdCancel.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdCancel.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdCancel.ShadowWidth = 2
        Me.cmdCancel.Size = New System.Drawing.Size(87, 66)
        Me.cmdCancel.TabIndex = 15
        Me.cmdCancel.Text = "Esc"
        Me.cmdCancel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdCancel.TextAngle = 0
        '
        'cmdOk
        '
        Me.cmdOk.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.cmdOk.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdOk.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdOk.BorderColor = System.Drawing.Color.Black
        Me.cmdOk.BorderWidth = 0
        Me.cmdOk.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdOk.EditMode = False
        Me.cmdOk.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdOk.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdOk.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdOk.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdOk.Location = New System.Drawing.Point(505, 395)
        Me.cmdOk.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdOk.Name = "cmdOk"
        Me.cmdOk.Radius = 55
        Me.cmdOk.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdOk.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdOk.ShadowWidth = 2
        Me.cmdOk.Size = New System.Drawing.Size(87, 66)
        Me.cmdOk.TabIndex = 14
        Me.cmdOk.Text = "Ok"
        Me.cmdOk.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdOk.TextAngle = 0
        '
        'txtCurrentColor
        '
        Me.txtCurrentColor.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtCurrentColor.BackColorFaded1 = System.Drawing.Color.Blue
        Me.txtCurrentColor.BackColorFaded2 = System.Drawing.Color.Blue
        Me.txtCurrentColor.BorderColor = System.Drawing.Color.Black
        Me.txtCurrentColor.BorderWidth = 0
        Me.txtCurrentColor.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtCurrentColor.EditMode = False
        Me.txtCurrentColor.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtCurrentColor.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtCurrentColor.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtCurrentColor.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtCurrentColor.Location = New System.Drawing.Point(505, 70)
        Me.txtCurrentColor.Margin = New System.Windows.Forms.Padding(0)
        Me.txtCurrentColor.Name = "txtCurrentColor"
        Me.txtCurrentColor.Radius = 55
        Me.txtCurrentColor.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtCurrentColor.ShadowColor = System.Drawing.Color.LightGray
        Me.txtCurrentColor.ShadowWidth = 2
        Me.txtCurrentColor.Size = New System.Drawing.Size(87, 66)
        Me.txtCurrentColor.TabIndex = 17
        Me.txtCurrentColor.Text = ""
        Me.txtCurrentColor.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtCurrentColor.TextAngle = 0
        '
        'txtPreviousColor
        '
        Me.txtPreviousColor.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtPreviousColor.BackColorFaded1 = System.Drawing.Color.Red
        Me.txtPreviousColor.BackColorFaded2 = System.Drawing.Color.Red
        Me.txtPreviousColor.BorderColor = System.Drawing.Color.Black
        Me.txtPreviousColor.BorderWidth = 0
        Me.txtPreviousColor.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtPreviousColor.EditMode = False
        Me.txtPreviousColor.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtPreviousColor.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtPreviousColor.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtPreviousColor.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtPreviousColor.Location = New System.Drawing.Point(505, 4)
        Me.txtPreviousColor.Margin = New System.Windows.Forms.Padding(0)
        Me.txtPreviousColor.Name = "txtPreviousColor"
        Me.txtPreviousColor.Radius = 55
        Me.txtPreviousColor.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtPreviousColor.ShadowColor = System.Drawing.Color.LightGray
        Me.txtPreviousColor.ShadowWidth = 2
        Me.txtPreviousColor.Size = New System.Drawing.Size(87, 66)
        Me.txtPreviousColor.TabIndex = 16
        Me.txtPreviousColor.Text = ""
        Me.txtPreviousColor.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtPreviousColor.TextAngle = 0
        '
        'GUIColourChooser
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.Controls.Add(Me.txtCurrentColor)
        Me.Controls.Add(Me.txtPreviousColor)
        Me.Controls.Add(Me.cmdCancel)
        Me.Controls.Add(Me.cmdOk)
        Me.Controls.Add(Me.pnlGradient)
        Me.Controls.Add(Me.pnlColorTable)
        Me.Name = "GUIColourChooser"
        Me.Size = New System.Drawing.Size(602, 533)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents pnlColorTable As System.Windows.Forms.Panel
    Friend WithEvents pnlGradient As System.Windows.Forms.Panel
    Friend WithEvents cmdCancel As Zelo.Luma.GUIButton
    Friend WithEvents cmdOk As Zelo.Luma.GUIButton
    Friend WithEvents txtCurrentColor As Zelo.Luma.GUIButton
    Friend WithEvents txtPreviousColor As Zelo.Luma.GUIButton

End Class
