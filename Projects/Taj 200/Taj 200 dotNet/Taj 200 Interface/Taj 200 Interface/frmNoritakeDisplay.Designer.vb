<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmNoritakeDisplay
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
        Me.Label1 = New System.Windows.Forms.Label
        Me.cmbComPort = New System.Windows.Forms.ComboBox
        Me.cmdTest = New System.Windows.Forms.Button
        Me.objStatusStrip = New System.Windows.Forms.StatusStrip
        Me.objToolStripStatusLabel = New System.Windows.Forms.ToolStripStatusLabel
        Me.picOff = New System.Windows.Forms.PictureBox
        Me.picOn = New System.Windows.Forms.PictureBox
        Me.objNoritakeDisplay = New Taj_200_Interface.NoritakeDisplay(Me.components)
        Me.cmdTestRegister = New System.Windows.Forms.Button
        Me.cmdTestOscilloscope = New System.Windows.Forms.Button
        Me.cmdTestFunctions = New System.Windows.Forms.Button
        Me.cmdTestTest = New System.Windows.Forms.Button
        Me.cmdTestParameters = New System.Windows.Forms.Button
        Me.cmdTestSetUp = New System.Windows.Forms.Button
        Me.cmdTestOther = New System.Windows.Forms.Button
        Me.objStatusStrip.SuspendLayout()
        CType(Me.picOff, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picOn, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(15, 18)
        Me.Label1.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(26, 13)
        Me.Label1.TabIndex = 7
        Me.Label1.Text = "Port"
        '
        'cmbComPort
        '
        Me.cmbComPort.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbComPort.FormattingEnabled = True
        Me.cmbComPort.Items.AddRange(New Object() {"COM1", "COM2", "COM3", "COM4", "COM5", "COM6", "COM7", "COM8", "COM9"})
        Me.cmbComPort.Location = New System.Drawing.Point(49, 15)
        Me.cmbComPort.Margin = New System.Windows.Forms.Padding(4)
        Me.cmbComPort.Name = "cmbComPort"
        Me.cmbComPort.Size = New System.Drawing.Size(98, 21)
        Me.cmbComPort.TabIndex = 5
        '
        'cmdTest
        '
        Me.cmdTest.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdTest.Location = New System.Drawing.Point(155, 13)
        Me.cmdTest.Margin = New System.Windows.Forms.Padding(4)
        Me.cmdTest.Name = "cmdTest"
        Me.cmdTest.Size = New System.Drawing.Size(92, 25)
        Me.cmdTest.TabIndex = 51
        Me.cmdTest.Text = "Test"
        Me.cmdTest.UseVisualStyleBackColor = True
        '
        'objStatusStrip
        '
        Me.objStatusStrip.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.objToolStripStatusLabel})
        Me.objStatusStrip.Location = New System.Drawing.Point(0, 481)
        Me.objStatusStrip.Name = "objStatusStrip"
        Me.objStatusStrip.Size = New System.Drawing.Size(873, 22)
        Me.objStatusStrip.TabIndex = 52
        '
        'objToolStripStatusLabel
        '
        Me.objToolStripStatusLabel.Name = "objToolStripStatusLabel"
        Me.objToolStripStatusLabel.Size = New System.Drawing.Size(84, 17)
        Me.objToolStripStatusLabel.Text = "Noritake Display"
        '
        'picOff
        '
        Me.picOff.Image = Global.Taj_200_Interface.My.Resources.Resources.connectionInactive
        Me.picOff.Location = New System.Drawing.Point(254, 11)
        Me.picOff.Name = "picOff"
        Me.picOff.Size = New System.Drawing.Size(31, 30)
        Me.picOff.TabIndex = 53
        Me.picOff.TabStop = False
        '
        'picOn
        '
        Me.picOn.Image = Global.Taj_200_Interface.My.Resources.Resources.connectionActive
        Me.picOn.Location = New System.Drawing.Point(254, 11)
        Me.picOn.Name = "picOn"
        Me.picOn.Size = New System.Drawing.Size(31, 30)
        Me.picOn.TabIndex = 54
        Me.picOn.TabStop = False
        Me.picOn.Visible = False
        '
        'cmdTestRegister
        '
        Me.cmdTestRegister.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdTestRegister.Location = New System.Drawing.Point(155, 85)
        Me.cmdTestRegister.Margin = New System.Windows.Forms.Padding(4)
        Me.cmdTestRegister.Name = "cmdTestRegister"
        Me.cmdTestRegister.Size = New System.Drawing.Size(92, 25)
        Me.cmdTestRegister.TabIndex = 55
        Me.cmdTestRegister.Text = "Registro"
        Me.cmdTestRegister.UseVisualStyleBackColor = True
        '
        'cmdTestOscilloscope
        '
        Me.cmdTestOscilloscope.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdTestOscilloscope.Location = New System.Drawing.Point(155, 118)
        Me.cmdTestOscilloscope.Margin = New System.Windows.Forms.Padding(4)
        Me.cmdTestOscilloscope.Name = "cmdTestOscilloscope"
        Me.cmdTestOscilloscope.Size = New System.Drawing.Size(92, 25)
        Me.cmdTestOscilloscope.TabIndex = 56
        Me.cmdTestOscilloscope.Text = "Oscilloscopio"
        Me.cmdTestOscilloscope.UseVisualStyleBackColor = True
        '
        'cmdTestFunctions
        '
        Me.cmdTestFunctions.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdTestFunctions.Location = New System.Drawing.Point(155, 151)
        Me.cmdTestFunctions.Margin = New System.Windows.Forms.Padding(4)
        Me.cmdTestFunctions.Name = "cmdTestFunctions"
        Me.cmdTestFunctions.Size = New System.Drawing.Size(92, 25)
        Me.cmdTestFunctions.TabIndex = 57
        Me.cmdTestFunctions.Text = "Funzioni"
        Me.cmdTestFunctions.UseVisualStyleBackColor = True
        '
        'cmdTestTest
        '
        Me.cmdTestTest.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdTestTest.Location = New System.Drawing.Point(155, 184)
        Me.cmdTestTest.Margin = New System.Windows.Forms.Padding(4)
        Me.cmdTestTest.Name = "cmdTestTest"
        Me.cmdTestTest.Size = New System.Drawing.Size(92, 25)
        Me.cmdTestTest.TabIndex = 58
        Me.cmdTestTest.Text = "Test"
        Me.cmdTestTest.UseVisualStyleBackColor = True
        '
        'cmdTestParameters
        '
        Me.cmdTestParameters.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdTestParameters.Location = New System.Drawing.Point(155, 217)
        Me.cmdTestParameters.Margin = New System.Windows.Forms.Padding(4)
        Me.cmdTestParameters.Name = "cmdTestParameters"
        Me.cmdTestParameters.Size = New System.Drawing.Size(92, 25)
        Me.cmdTestParameters.TabIndex = 59
        Me.cmdTestParameters.Text = "Parametri"
        Me.cmdTestParameters.UseVisualStyleBackColor = True
        '
        'cmdTestSetUp
        '
        Me.cmdTestSetUp.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdTestSetUp.Location = New System.Drawing.Point(155, 250)
        Me.cmdTestSetUp.Margin = New System.Windows.Forms.Padding(4)
        Me.cmdTestSetUp.Name = "cmdTestSetUp"
        Me.cmdTestSetUp.Size = New System.Drawing.Size(92, 25)
        Me.cmdTestSetUp.TabIndex = 60
        Me.cmdTestSetUp.Text = "Set-up"
        Me.cmdTestSetUp.UseVisualStyleBackColor = True
        '
        'cmdTestOther
        '
        Me.cmdTestOther.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdTestOther.Location = New System.Drawing.Point(155, 283)
        Me.cmdTestOther.Margin = New System.Windows.Forms.Padding(4)
        Me.cmdTestOther.Name = "cmdTestOther"
        Me.cmdTestOther.Size = New System.Drawing.Size(92, 25)
        Me.cmdTestOther.TabIndex = 61
        Me.cmdTestOther.Text = "Altro"
        Me.cmdTestOther.UseVisualStyleBackColor = True
        '
        'frmNoritakeDisplay
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(873, 503)
        Me.Controls.Add(Me.cmdTestOther)
        Me.Controls.Add(Me.cmdTestSetUp)
        Me.Controls.Add(Me.cmdTestParameters)
        Me.Controls.Add(Me.cmdTestTest)
        Me.Controls.Add(Me.cmdTestFunctions)
        Me.Controls.Add(Me.cmdTestOscilloscope)
        Me.Controls.Add(Me.cmdTestRegister)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.picOn)
        Me.Controls.Add(Me.cmbComPort)
        Me.Controls.Add(Me.picOff)
        Me.Controls.Add(Me.objStatusStrip)
        Me.Controls.Add(Me.cmdTest)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Margin = New System.Windows.Forms.Padding(4)
        Me.Name = "frmNoritakeDisplay"
        Me.Text = "Noritake Display"
        Me.objStatusStrip.ResumeLayout(False)
        Me.objStatusStrip.PerformLayout()
        CType(Me.picOff, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picOn, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents cmbComPort As System.Windows.Forms.ComboBox
    Friend WithEvents cmdTest As System.Windows.Forms.Button
    Friend WithEvents objNoritakeDisplay As Taj_200_Interface.NoritakeDisplay
    Friend WithEvents objStatusStrip As System.Windows.Forms.StatusStrip
    Friend WithEvents picOff As System.Windows.Forms.PictureBox
    Friend WithEvents picOn As System.Windows.Forms.PictureBox
    Friend WithEvents objToolStripStatusLabel As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents cmdTestRegister As System.Windows.Forms.Button
    Friend WithEvents cmdTestOscilloscope As System.Windows.Forms.Button
    Friend WithEvents cmdTestFunctions As System.Windows.Forms.Button
    Friend WithEvents cmdTestTest As System.Windows.Forms.Button
    Friend WithEvents cmdTestParameters As System.Windows.Forms.Button
    Friend WithEvents cmdTestSetUp As System.Windows.Forms.Button
    Friend WithEvents cmdTestOther As System.Windows.Forms.Button
End Class
