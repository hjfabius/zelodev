<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUIRegisterViscosity
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
        Me.guiViscosityTemperature = New Zelo.Luma.GUIViscosityTemperature
        Me.guiRegister = New Zelo.Luma.GUIRegister
        Me.tblMain.SuspendLayout()
        Me.SuspendLayout()
        '
        'tblMain
        '
        Me.tblMain.ColumnCount = 2
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23.0!))
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 77.0!))
        Me.tblMain.Controls.Add(Me.guiViscosityTemperature, 0, 0)
        Me.tblMain.Controls.Add(Me.guiRegister, 1, 0)
        Me.tblMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tblMain.Location = New System.Drawing.Point(0, 0)
        Me.tblMain.Margin = New System.Windows.Forms.Padding(0)
        Me.tblMain.Name = "tblMain"
        Me.tblMain.RowCount = 1
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100.0!))
        Me.tblMain.Size = New System.Drawing.Size(202, 202)
        Me.tblMain.TabIndex = 0
        '
        'guiViscosityTemperature
        '
        Me.guiViscosityTemperature.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.guiViscosityTemperature.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiViscosityTemperature.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiViscosityTemperature.GroupColor = System.Drawing.Color.Red
        Me.guiViscosityTemperature.Location = New System.Drawing.Point(0, 0)
        Me.guiViscosityTemperature.Margin = New System.Windows.Forms.Padding(0)
        Me.guiViscosityTemperature.Mode = Zelo.Luma.Mode.Automatic
        Me.guiViscosityTemperature.Name = "guiViscosityTemperature"
        Me.guiViscosityTemperature.Size = New System.Drawing.Size(46, 202)
        Me.guiViscosityTemperature.TabIndex = 0
        Me.guiViscosityTemperature.TemperatureMax = 45
        Me.guiViscosityTemperature.TemperatureMin = 10
        Me.guiViscosityTemperature.TemperatureValue = 25
        Me.guiViscosityTemperature.ViscosityRange = 40
        '
        'guiRegister
        '
        Me.guiRegister.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.guiRegister.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiRegister.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiRegister.GroupColor = System.Drawing.Color.Red
        Me.guiRegister.GroupNumber = 1
        Me.guiRegister.LateralMode = Zelo.Luma.Mode.Automatic
        Me.guiRegister.Location = New System.Drawing.Point(46, 0)
        Me.guiRegister.LongitudinalMode = Zelo.Luma.Mode.Automatic
        Me.guiRegister.Margin = New System.Windows.Forms.Padding(0)
        Me.guiRegister.Name = "guiRegister"
        Me.guiRegister.Size = New System.Drawing.Size(156, 202)
        Me.guiRegister.TabIndex = 1
        '
        'GUIRegisterViscosity
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.tblMain)
        Me.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Margin = New System.Windows.Forms.Padding(0)
        Me.Name = "GUIRegisterViscosity"
        Me.Size = New System.Drawing.Size(202, 202)
        Me.tblMain.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents tblMain As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents guiViscosityTemperature As Zelo.Luma.GUIViscosityTemperature
    Friend WithEvents guiRegister As Zelo.Luma.GUIRegister

End Class
