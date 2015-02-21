<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MainPage
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
        Me.lblDebug = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'lblDebug
        '
        Me.lblDebug.Dock = System.Windows.Forms.DockStyle.Top
        Me.lblDebug.Location = New System.Drawing.Point(0, 0)
        Me.lblDebug.Name = "lblDebug"
        Me.lblDebug.Size = New System.Drawing.Size(840, 13)
        Me.lblDebug.TabIndex = 0
        Me.lblDebug.Text = "Debug"
        Me.lblDebug.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.lblDebug.Visible = False
        '
        'MainPage
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.Controls.Add(Me.lblDebug)
        Me.Name = "MainPage"
        Me.Size = New System.Drawing.Size(840, 681)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents lblDebug As System.Windows.Forms.Label

End Class
