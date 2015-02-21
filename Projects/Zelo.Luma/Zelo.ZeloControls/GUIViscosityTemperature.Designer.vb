<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUIViscosityTemperature
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
        Me.picMode = New System.Windows.Forms.PictureBox
        Me.guiTermometer = New Zelo.Luma.GUITermometer
        Me.pnlTop = New System.Windows.Forms.Panel
        Me.pnlHorizontalLine = New System.Windows.Forms.Panel
        Me.lblViscosity = New System.Windows.Forms.Label
        Me.lblTemperature = New System.Windows.Forms.Label
        Me.guiViscosity = New Zelo.Luma.GUIViscosity
        Me.tblMain.SuspendLayout()
        CType(Me.picMode, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'tblMain
        '
        Me.tblMain.BackColor = System.Drawing.Color.White
        Me.tblMain.ColumnCount = 2
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.tblMain.Controls.Add(Me.picMode, 0, 1)
        Me.tblMain.Controls.Add(Me.guiTermometer, 1, 4)
        Me.tblMain.Controls.Add(Me.pnlTop, 0, 0)
        Me.tblMain.Controls.Add(Me.pnlHorizontalLine, 0, 2)
        Me.tblMain.Controls.Add(Me.lblViscosity, 0, 3)
        Me.tblMain.Controls.Add(Me.lblTemperature, 0, 5)
        Me.tblMain.Controls.Add(Me.guiViscosity, 0, 4)
        Me.tblMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tblMain.Location = New System.Drawing.Point(0, 0)
        Me.tblMain.Margin = New System.Windows.Forms.Padding(0)
        Me.tblMain.Name = "tblMain"
        Me.tblMain.RowCount = 6
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 6.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 32.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 1.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 23.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 23.0!))
        Me.tblMain.Size = New System.Drawing.Size(40, 200)
        Me.tblMain.TabIndex = 0
        '
        'picMode
        '
        Me.tblMain.SetColumnSpan(Me.picMode, 2)
        Me.picMode.Dock = System.Windows.Forms.DockStyle.Fill
        Me.picMode.Image = Global.Zelo.Luma.My.Resources.Resources.Disabled_runmodeManualBig
        Me.picMode.Location = New System.Drawing.Point(0, 6)
        Me.picMode.Margin = New System.Windows.Forms.Padding(0)
        Me.picMode.Name = "picMode"
        Me.picMode.Size = New System.Drawing.Size(40, 32)
        Me.picMode.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.picMode.TabIndex = 15
        Me.picMode.TabStop = False
        '
        'guiTermometer
        '
        Me.guiTermometer.BackColor = System.Drawing.Color.White
        Me.guiTermometer.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiTermometer.Location = New System.Drawing.Point(21, 63)
        Me.guiTermometer.Margin = New System.Windows.Forms.Padding(1)
        Me.guiTermometer.Max = 45.0!
        Me.guiTermometer.Range = 65.0!
        Me.guiTermometer.MercuryColor = System.Drawing.Color.Red
        Me.guiTermometer.Min = 10.0!
        Me.guiTermometer.Name = "guiTermometer"
        Me.guiTermometer.Size = New System.Drawing.Size(18, 113)
        Me.guiTermometer.TabIndex = 1
        Me.guiTermometer.Value = 25.0!
        '
        'pnlTop
        '
        Me.pnlTop.BackColor = System.Drawing.Color.Red
        Me.tblMain.SetColumnSpan(Me.pnlTop, 2)
        Me.pnlTop.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlTop.Location = New System.Drawing.Point(0, 0)
        Me.pnlTop.Margin = New System.Windows.Forms.Padding(0)
        Me.pnlTop.Name = "pnlTop"
        Me.pnlTop.Size = New System.Drawing.Size(40, 6)
        Me.pnlTop.TabIndex = 2
        '
        'pnlHorizontalLine
        '
        Me.pnlHorizontalLine.BackColor = System.Drawing.Color.Black
        Me.tblMain.SetColumnSpan(Me.pnlHorizontalLine, 2)
        Me.pnlHorizontalLine.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlHorizontalLine.Location = New System.Drawing.Point(0, 38)
        Me.pnlHorizontalLine.Margin = New System.Windows.Forms.Padding(0)
        Me.pnlHorizontalLine.Name = "pnlHorizontalLine"
        Me.pnlHorizontalLine.Size = New System.Drawing.Size(40, 1)
        Me.pnlHorizontalLine.TabIndex = 3
        '
        'lblViscosity
        '
        Me.lblViscosity.AutoSize = True
        Me.tblMain.SetColumnSpan(Me.lblViscosity, 2)
        Me.lblViscosity.Dock = System.Windows.Forms.DockStyle.Fill
        Me.lblViscosity.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblViscosity.Location = New System.Drawing.Point(0, 39)
        Me.lblViscosity.Margin = New System.Windows.Forms.Padding(0)
        Me.lblViscosity.Name = "lblViscosity"
        Me.lblViscosity.Size = New System.Drawing.Size(40, 23)
        Me.lblViscosity.TabIndex = 4
        Me.lblViscosity.Text = "25.0s"
        Me.lblViscosity.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'lblTemperature
        '
        Me.lblTemperature.AutoSize = True
        Me.tblMain.SetColumnSpan(Me.lblTemperature, 2)
        Me.lblTemperature.Dock = System.Windows.Forms.DockStyle.Fill
        Me.lblTemperature.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblTemperature.Location = New System.Drawing.Point(0, 177)
        Me.lblTemperature.Margin = New System.Windows.Forms.Padding(0)
        Me.lblTemperature.Name = "lblTemperature"
        Me.lblTemperature.Size = New System.Drawing.Size(40, 23)
        Me.lblTemperature.TabIndex = 5
        Me.lblTemperature.Text = "25°C"
        Me.lblTemperature.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'guiViscosity
        '
        Me.guiViscosity.Dock = System.Windows.Forms.DockStyle.Fill
        Me.guiViscosity.Location = New System.Drawing.Point(3, 63)
        Me.guiViscosity.Margin = New System.Windows.Forms.Padding(3, 1, 3, 1)
        Me.guiViscosity.Name = "guiViscosity"
        Me.guiViscosity.Range = 40.0!
        Me.guiViscosity.RefValue = 20.0!
        Me.guiViscosity.Size = New System.Drawing.Size(14, 113)
        Me.guiViscosity.TabIndex = 16
        Me.guiViscosity.Value = 25.0!
        '
        'GUIViscosityTemperature
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Controls.Add(Me.tblMain)
        Me.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Margin = New System.Windows.Forms.Padding(0)
        Me.Name = "GUIViscosityTemperature"
        Me.Size = New System.Drawing.Size(40, 200)
        Me.tblMain.ResumeLayout(False)
        Me.tblMain.PerformLayout()
        CType(Me.picMode, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents tblMain As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents guiTermometer As Zelo.Luma.GUITermometer
    Friend WithEvents pnlTop As System.Windows.Forms.Panel
    Friend WithEvents pnlHorizontalLine As System.Windows.Forms.Panel
    Friend WithEvents lblViscosity As System.Windows.Forms.Label
    Friend WithEvents lblTemperature As System.Windows.Forms.Label
    Friend WithEvents picMode As System.Windows.Forms.PictureBox
    Friend WithEvents guiViscosity As Zelo.Luma.GUIViscosity

End Class
