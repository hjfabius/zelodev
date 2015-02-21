<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class TestSelector
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
        Me.GuiSelector1 = New Zelo.Luma.GUISelector
        Me.SuspendLayout()
        '
        'GuiSelector1
        '
        Me.GuiSelector1.BackColor = System.Drawing.Color.White
        Me.GuiSelector1.DataFilter = ""
        Me.GuiSelector1.DataTable = Nothing
        Me.GuiSelector1.DisplayMemberID = Nothing
        Me.GuiSelector1.DisplayMemberValue = Nothing
        Me.GuiSelector1.Location = New System.Drawing.Point(2, 2)
        Me.GuiSelector1.Name = "GuiSelector1"
        Me.GuiSelector1.SelectID = 0
        Me.GuiSelector1.Size = New System.Drawing.Size(832, 572)
        Me.GuiSelector1.TabIndex = 0
        '
        'TestSelector
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(968, 636)
        Me.Controls.Add(Me.GuiSelector1)
        Me.Name = "TestSelector"
        Me.Text = "TestSelector"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GuiSelector1 As Zelo.Luma.GUISelector
End Class
