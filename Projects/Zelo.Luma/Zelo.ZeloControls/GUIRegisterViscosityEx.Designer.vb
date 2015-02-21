<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUIRegisterViscosityEx
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
        Me.guiViscosity = New Zelo.Luma.GUIViscosityTemperature
        Me.guiRegister = New Zelo.Luma.GUIRegister
        Me.SuspendLayout()
        '
        'guiViscosity
        '
        Me.guiViscosity.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.guiViscosity.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiViscosity.Dock = System.Windows.Forms.DockStyle.Left
        Me.guiViscosity.GroupColor = System.Drawing.Color.Black
        Me.guiViscosity.IsActive = True
        Me.guiViscosity.Location = New System.Drawing.Point(0, 0)
        Me.guiViscosity.Margin = New System.Windows.Forms.Padding(0)
        Me.guiViscosity.Mode = Zelo.Luma.Mode.Automatic
        Me.guiViscosity.Name = "guiViscosity"
        Me.guiViscosity.Size = New System.Drawing.Size(46, 202)
        Me.guiViscosity.TabIndex = 0
        Me.guiViscosity.TemperatureMax = 45
        Me.guiViscosity.TemperatureMin = 10
        Me.guiViscosity.TemperatureRange = 65
        Me.guiViscosity.TemperatureValue = 25
        Me.guiViscosity.ViscosityRange = 40
        '
        'guiRegister
        '
        Me.guiRegister.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.guiRegister.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiRegister.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiRegister.GroupColor = System.Drawing.Color.Black
        Me.guiRegister.GroupNumber = 1
        Me.guiRegister.IsActive = True
        Me.guiRegister.LateralMode = Zelo.Luma.Mode.Automatic
        Me.guiRegister.Location = New System.Drawing.Point(46, 0)
        Me.guiRegister.LongitudinalMode = Zelo.Luma.Mode.Automatic
        Me.guiRegister.Name = "guiRegister"
        Me.guiRegister.Size = New System.Drawing.Size(156, 202)
        Me.guiRegister.TabIndex = 1
        '
        'GUIRegisterViscosityEx
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.Controls.Add(Me.guiRegister)
        Me.Controls.Add(Me.guiViscosity)
        Me.Margin = New System.Windows.Forms.Padding(0)
        Me.Name = "GUIRegisterViscosityEx"
        Me.Size = New System.Drawing.Size(202, 202)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents guiViscosity As Zelo.Luma.GUIViscosityTemperature
    Friend WithEvents guiRegister As Zelo.Luma.GUIRegister

End Class
