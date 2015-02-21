<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Communication
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
        Me.cmdConnect = New System.Windows.Forms.Button
        Me.cmdFlash = New System.Windows.Forms.Button
        Me.cmdClose = New System.Windows.Forms.Button
        Me.cmdAll = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'cmdConnect
        '
        Me.cmdConnect.Location = New System.Drawing.Point(25, 46)
        Me.cmdConnect.Name = "cmdConnect"
        Me.cmdConnect.Size = New System.Drawing.Size(75, 23)
        Me.cmdConnect.TabIndex = 0
        Me.cmdConnect.Text = "connect"
        Me.cmdConnect.UseVisualStyleBackColor = True
        '
        'cmdFlash
        '
        Me.cmdFlash.Location = New System.Drawing.Point(25, 75)
        Me.cmdFlash.Name = "cmdFlash"
        Me.cmdFlash.Size = New System.Drawing.Size(75, 23)
        Me.cmdFlash.TabIndex = 1
        Me.cmdFlash.Text = "flash"
        Me.cmdFlash.UseVisualStyleBackColor = True
        '
        'cmdClose
        '
        Me.cmdClose.Location = New System.Drawing.Point(25, 105)
        Me.cmdClose.Name = "cmdClose"
        Me.cmdClose.Size = New System.Drawing.Size(75, 23)
        Me.cmdClose.TabIndex = 2
        Me.cmdClose.Text = "close"
        Me.cmdClose.UseVisualStyleBackColor = True
        '
        'cmdAll
        '
        Me.cmdAll.Location = New System.Drawing.Point(25, 156)
        Me.cmdAll.Name = "cmdAll"
        Me.cmdAll.Size = New System.Drawing.Size(75, 23)
        Me.cmdAll.TabIndex = 3
        Me.cmdAll.Text = "All in one"
        Me.cmdAll.UseVisualStyleBackColor = True
        '
        'Communication
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(397, 357)
        Me.Controls.Add(Me.cmdAll)
        Me.Controls.Add(Me.cmdClose)
        Me.Controls.Add(Me.cmdFlash)
        Me.Controls.Add(Me.cmdConnect)
        Me.Name = "Communication"
        Me.Text = "Communication"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents cmdConnect As System.Windows.Forms.Button
    Friend WithEvents cmdFlash As System.Windows.Forms.Button
    Friend WithEvents cmdClose As System.Windows.Forms.Button
    Friend WithEvents cmdAll As System.Windows.Forms.Button
End Class
