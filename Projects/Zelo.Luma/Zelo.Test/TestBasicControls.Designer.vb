<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class TestBasicControls
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
        Me.nudRadius = New System.Windows.Forms.NumericUpDown
        Me.Label1 = New System.Windows.Forms.Label
        Me.objColorDialog = New System.Windows.Forms.ColorDialog
        Me.Label3 = New System.Windows.Forms.Label
        Me.nudBorderWidth = New System.Windows.Forms.NumericUpDown
        Me.cmdBackColor1 = New System.Windows.Forms.Button
        Me.cmdBackColor2 = New System.Windows.Forms.Button
        Me.Label2 = New System.Windows.Forms.Label
        Me.nudShadowWidth = New System.Windows.Forms.NumericUpDown
        Me.GuiKeyboard1 = New Zelo.Luma.GUIKeyboard
        Me.GuiButton1 = New Zelo.Luma.GUIButton
        Me.GuiRectangle1 = New Zelo.Luma.GUIRectangle
        Me.objGuiRectangle = New Zelo.Luma.GUIRectangle
        CType(Me.nudRadius, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.nudBorderWidth, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.nudShadowWidth, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'nudRadius
        '
        Me.nudRadius.Location = New System.Drawing.Point(121, 20)
        Me.nudRadius.Margin = New System.Windows.Forms.Padding(4)
        Me.nudRadius.Maximum = New Decimal(New Integer() {1000, 0, 0, 0})
        Me.nudRadius.Name = "nudRadius"
        Me.nudRadius.Size = New System.Drawing.Size(179, 22)
        Me.nudRadius.TabIndex = 1
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 22)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(51, 16)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Radius"
        '
        'objColorDialog
        '
        Me.objColorDialog.AnyColor = True
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 52)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(86, 16)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "Border Width"
        '
        'nudBorderWidth
        '
        Me.nudBorderWidth.Location = New System.Drawing.Point(121, 50)
        Me.nudBorderWidth.Margin = New System.Windows.Forms.Padding(4)
        Me.nudBorderWidth.Name = "nudBorderWidth"
        Me.nudBorderWidth.Size = New System.Drawing.Size(179, 22)
        Me.nudBorderWidth.TabIndex = 5
        '
        'cmdBackColor1
        '
        Me.cmdBackColor1.Location = New System.Drawing.Point(15, 108)
        Me.cmdBackColor1.Name = "cmdBackColor1"
        Me.cmdBackColor1.Size = New System.Drawing.Size(132, 36)
        Me.cmdBackColor1.TabIndex = 8
        Me.cmdBackColor1.Text = "Back Color 1"
        Me.cmdBackColor1.UseVisualStyleBackColor = True
        '
        'cmdBackColor2
        '
        Me.cmdBackColor2.Location = New System.Drawing.Point(149, 108)
        Me.cmdBackColor2.Name = "cmdBackColor2"
        Me.cmdBackColor2.Size = New System.Drawing.Size(132, 36)
        Me.cmdBackColor2.TabIndex = 9
        Me.cmdBackColor2.Text = "Back Color 2"
        Me.cmdBackColor2.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(12, 82)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(94, 16)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "Shadow Width"
        '
        'nudShadowWidth
        '
        Me.nudShadowWidth.Location = New System.Drawing.Point(121, 80)
        Me.nudShadowWidth.Margin = New System.Windows.Forms.Padding(4)
        Me.nudShadowWidth.Name = "nudShadowWidth"
        Me.nudShadowWidth.Size = New System.Drawing.Size(179, 22)
        Me.nudShadowWidth.TabIndex = 10
        '
        'GuiKeyboard1
        '
        Me.GuiKeyboard1.Location = New System.Drawing.Point(-3, 353)
        Me.GuiKeyboard1.Name = "GuiKeyboard1"
        Me.GuiKeyboard1.Size = New System.Drawing.Size(832, 252)
        Me.GuiKeyboard1.TabIndex = 13
        '
        'GuiButton1
        '
        Me.GuiButton1.BackColorFaded1 = System.Drawing.Color.Black
        Me.GuiButton1.BackColorFaded2 = System.Drawing.Color.LightGray
        Me.GuiButton1.BorderColor = System.Drawing.Color.Black
        Me.GuiButton1.BorderWidth = 0
        Me.GuiButton1.EditMode = False
        Me.GuiButton1.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.GuiButton1.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.GuiButton1.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.GuiButton1.Location = New System.Drawing.Point(661, 13)
        Me.GuiButton1.Margin = New System.Windows.Forms.Padding(4)
        Me.GuiButton1.Name = "GuiButton1"
        Me.GuiButton1.Radius = 25
        Me.GuiButton1.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.GuiButton1.ShadowColor = System.Drawing.Color.LightGray
        Me.GuiButton1.ShadowWidth = 0
        Me.GuiButton1.Size = New System.Drawing.Size(150, 150)
        Me.GuiButton1.TabIndex = 12
        Me.GuiButton1.Text = "GuiButton1"
        Me.GuiButton1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.GuiButton1.TextAngle = 0
        '
        'GuiRectangle1
        '
        Me.GuiRectangle1.BackColor = System.Drawing.Color.Transparent
        Me.GuiRectangle1.BackColorFaded1 = System.Drawing.Color.Red
        Me.GuiRectangle1.BackColorFaded2 = System.Drawing.Color.White
        Me.GuiRectangle1.BorderColor = System.Drawing.Color.DarkOrange
        Me.GuiRectangle1.BorderWidth = 0
        Me.GuiRectangle1.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.ForwardDiagonal
        Me.GuiRectangle1.Location = New System.Drawing.Point(588, 172)
        Me.GuiRectangle1.Margin = New System.Windows.Forms.Padding(5, 5, 5, 5)
        Me.GuiRectangle1.Name = "GuiRectangle1"
        Me.GuiRectangle1.Radius = 25
        Me.GuiRectangle1.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.GuiRectangle1.ShadowColor = System.Drawing.Color.LightGray
        Me.GuiRectangle1.ShadowWidth = 0
        Me.GuiRectangle1.Size = New System.Drawing.Size(221, 103)
        Me.GuiRectangle1.TabIndex = 7
        '
        'objGuiRectangle
        '
        Me.objGuiRectangle.BackColor = System.Drawing.Color.Transparent
        Me.objGuiRectangle.BackColorFaded1 = System.Drawing.Color.Red
        Me.objGuiRectangle.BackColorFaded2 = System.Drawing.Color.White
        Me.objGuiRectangle.BorderColor = System.Drawing.Color.DarkOrange
        Me.objGuiRectangle.BorderWidth = 10
        Me.objGuiRectangle.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.ForwardDiagonal
        Me.objGuiRectangle.Location = New System.Drawing.Point(415, 25)
        Me.objGuiRectangle.Margin = New System.Windows.Forms.Padding(5, 5, 5, 5)
        Me.objGuiRectangle.Name = "objGuiRectangle"
        Me.objGuiRectangle.Radius = 25
        Me.objGuiRectangle.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.objGuiRectangle.ShadowColor = System.Drawing.Color.LightGray
        Me.objGuiRectangle.ShadowWidth = 0
        Me.objGuiRectangle.Size = New System.Drawing.Size(357, 281)
        Me.objGuiRectangle.TabIndex = 3
        '
        'TestBasicControls
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(824, 603)
        Me.Controls.Add(Me.GuiKeyboard1)
        Me.Controls.Add(Me.GuiButton1)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.nudShadowWidth)
        Me.Controls.Add(Me.cmdBackColor2)
        Me.Controls.Add(Me.cmdBackColor1)
        Me.Controls.Add(Me.GuiRectangle1)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.nudBorderWidth)
        Me.Controls.Add(Me.objGuiRectangle)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.nudRadius)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Margin = New System.Windows.Forms.Padding(4)
        Me.Name = "TestBasicControls"
        Me.Text = "TestBesicControls"
        CType(Me.nudRadius, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.nudBorderWidth, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.nudShadowWidth, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents nudRadius As System.Windows.Forms.NumericUpDown
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents objColorDialog As System.Windows.Forms.ColorDialog
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents nudBorderWidth As System.Windows.Forms.NumericUpDown
    Friend WithEvents GuiRectangle1 As Zelo.Luma.GUIRectangle
    Friend WithEvents cmdBackColor1 As System.Windows.Forms.Button
    Friend WithEvents cmdBackColor2 As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents nudShadowWidth As System.Windows.Forms.NumericUpDown
    Friend WithEvents GuiButton1 As Zelo.Luma.GUIButton
    Friend WithEvents GuiKeyboard1 As Zelo.Luma.GUIKeyboard
    Friend WithEvents objGuiRectangle As Zelo.Luma.GUIRectangle
End Class
