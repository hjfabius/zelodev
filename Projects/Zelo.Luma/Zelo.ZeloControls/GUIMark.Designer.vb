<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUIMark
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
        Me.objMarkPanel = New Zelo.Luma.MarkPanel
        Me.Panel1 = New System.Windows.Forms.Panel
        Me.SuspendLayout()
        '
        'objMarkPanel
        '
        Me.objMarkPanel.BackColor = System.Drawing.Color.White
        Me.objMarkPanel.Dock = System.Windows.Forms.DockStyle.Fill
        Me.objMarkPanel.Location = New System.Drawing.Point(0, 0)
        Me.objMarkPanel.MarkColor = System.Drawing.Color.Red
        Me.objMarkPanel.Marks = Nothing
        Me.objMarkPanel.MarkType = Zelo.Luma.MarkType.InLineRotoMark
        Me.objMarkPanel.Name = "objMarkPanel"
        Me.objMarkPanel.SelectedMark = -2147483648
        Me.objMarkPanel.Size = New System.Drawing.Size(670, 583)
        Me.objMarkPanel.TabIndex = 0
        '
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Panel1.Location = New System.Drawing.Point(0, 285)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(77, 214)
        Me.Panel1.TabIndex = 1
        '
        'GUIMark
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.objMarkPanel)
        Me.Name = "GUIMark"
        Me.Size = New System.Drawing.Size(670, 583)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents objMarkPanel As Zelo.Luma.MarkPanel
    Friend WithEvents Panel1 As System.Windows.Forms.Panel

End Class
