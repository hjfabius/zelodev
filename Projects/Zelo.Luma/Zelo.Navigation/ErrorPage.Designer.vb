<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ErrorPage
    Inherits Luma.MainPage

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
        Me.lblMessage = New System.Windows.Forms.Label
        Me.GuiButton1 = New Zelo.Luma.GUIButton
        Me.PictureBox1 = New System.Windows.Forms.PictureBox
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'lblMessage
        '
        Me.lblMessage.Font = New System.Drawing.Font("Arial", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblMessage.Location = New System.Drawing.Point(108, 114)
        Me.lblMessage.Name = "lblMessage"
        Me.lblMessage.Size = New System.Drawing.Size(650, 411)
        Me.lblMessage.TabIndex = 2
        Me.lblMessage.Text = "lblMessage"
        '
        'GuiButton1
        '
        Me.GuiButton1.BackColorFaded1 = System.Drawing.Color.Red
        Me.GuiButton1.BackColorFaded2 = System.Drawing.Color.WhiteSmoke
        Me.GuiButton1.BorderColor = System.Drawing.Color.Black
        Me.GuiButton1.BorderWidth = 0
        Me.GuiButton1.Font = New System.Drawing.Font("Arial", 21.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GuiButton1.ForeColor = System.Drawing.Color.White
        Me.GuiButton1.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.GuiButton1.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.GuiButton1.Location = New System.Drawing.Point(258, 35)
        Me.GuiButton1.Margin = New System.Windows.Forms.Padding(5, 4, 5, 4)
        Me.GuiButton1.Name = "GuiButton1"
        Me.GuiButton1.Radius = 25
        Me.GuiButton1.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.GuiButton1.ShadowColor = System.Drawing.Color.LightGray
        Me.GuiButton1.ShadowWidth = 2
        Me.GuiButton1.Size = New System.Drawing.Size(411, 53)
        Me.GuiButton1.TabIndex = 3
        Me.GuiButton1.Text = "Lumà: Error"
        Me.GuiButton1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'PictureBox1
        '
        Me.PictureBox1.Image = Global.Zelo.Luma.My.Resources.Resources.roundError
        Me.PictureBox1.Location = New System.Drawing.Point(191, 38)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(59, 50)
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'ErrorPage
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.Controls.Add(Me.GuiButton1)
        Me.Controls.Add(Me.lblMessage)
        Me.Controls.Add(Me.PictureBox1)
        Me.Name = "ErrorPage"
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents lblMessage As System.Windows.Forms.Label
    Friend WithEvents GuiButton1 As Zelo.Luma.GUIButton

End Class
