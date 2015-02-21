<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class CurrentJobBaseSettingsLoadPage
    Inherits Zelo.Luma.MainPage

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
        Me.pnlMain = New System.Windows.Forms.Panel
        Me.cmdLoadJob = New Zelo.Luma.GUINavigation
        Me.txtDateModified = New Zelo.Luma.GUINavigation
        Me.txtDateCreated = New Zelo.Luma.GUINavigation
        Me.txtProject = New Zelo.Luma.GUINavigation
        Me.txtClient = New Zelo.Luma.GUINavigation
        Me.cmdDateModified = New Zelo.Luma.GUINavigation
        Me.cmdDataCreated = New Zelo.Luma.GUINavigation
        Me.cmdProject = New Zelo.Luma.GUINavigation
        Me.cmdClient = New Zelo.Luma.GUINavigation
        Me.pnlMain.SuspendLayout()
        Me.SuspendLayout()
        '
        'pnlMain
        '
        Me.pnlMain.Controls.Add(Me.cmdLoadJob)
        Me.pnlMain.Controls.Add(Me.txtDateModified)
        Me.pnlMain.Controls.Add(Me.txtDateCreated)
        Me.pnlMain.Controls.Add(Me.txtProject)
        Me.pnlMain.Controls.Add(Me.txtClient)
        Me.pnlMain.Controls.Add(Me.cmdDateModified)
        Me.pnlMain.Controls.Add(Me.cmdDataCreated)
        Me.pnlMain.Controls.Add(Me.cmdProject)
        Me.pnlMain.Controls.Add(Me.cmdClient)
        Me.pnlMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlMain.Location = New System.Drawing.Point(0, 0)
        Me.pnlMain.Name = "pnlMain"
        Me.pnlMain.Size = New System.Drawing.Size(840, 681)
        Me.pnlMain.TabIndex = 64
        '
        'cmdLoadJob
        '
        Me.cmdLoadJob.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdLoadJob.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdLoadJob.BorderColor = System.Drawing.Color.Black
        Me.cmdLoadJob.BorderWidth = 0
        Me.cmdLoadJob.EditMode = False
        Me.cmdLoadJob.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdLoadJob.ForeColor = System.Drawing.Color.Black
        Me.cmdLoadJob.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdLoadJob.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdLoadJob.Location = New System.Drawing.Point(633, 314)
        Me.cmdLoadJob.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdLoadJob.Name = "cmdLoadJob"
        Me.cmdLoadJob.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdLoadJob.Radius = 55
        Me.cmdLoadJob.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdLoadJob.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdLoadJob.ShadowWidth = 2
        Me.cmdLoadJob.Size = New System.Drawing.Size(192, 66)
        Me.cmdLoadJob.TabIndex = 72
        Me.cmdLoadJob.Text = "Load Job"
        Me.cmdLoadJob.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdLoadJob.TextAngle = 0
        '
        'txtDateModified
        '
        Me.txtDateModified.BackColorFaded1 = System.Drawing.Color.White
        Me.txtDateModified.BackColorFaded2 = System.Drawing.Color.White
        Me.txtDateModified.BorderColor = System.Drawing.Color.Black
        Me.txtDateModified.BorderWidth = 0
        Me.txtDateModified.EditMode = False
        Me.txtDateModified.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtDateModified.ForeColor = System.Drawing.Color.Black
        Me.txtDateModified.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtDateModified.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtDateModified.Location = New System.Drawing.Point(321, 236)
        Me.txtDateModified.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtDateModified.Name = "txtDateModified"
        Me.txtDateModified.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtDateModified.Radius = 55
        Me.txtDateModified.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtDateModified.ShadowColor = System.Drawing.Color.LightGray
        Me.txtDateModified.ShadowWidth = 2
        Me.txtDateModified.Size = New System.Drawing.Size(504, 66)
        Me.txtDateModified.TabIndex = 71
        Me.txtDateModified.Text = "Date Modified"
        Me.txtDateModified.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtDateModified.TextAngle = 0
        '
        'txtDateCreated
        '
        Me.txtDateCreated.BackColorFaded1 = System.Drawing.Color.White
        Me.txtDateCreated.BackColorFaded2 = System.Drawing.Color.White
        Me.txtDateCreated.BorderColor = System.Drawing.Color.Black
        Me.txtDateCreated.BorderWidth = 0
        Me.txtDateCreated.EditMode = False
        Me.txtDateCreated.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtDateCreated.ForeColor = System.Drawing.Color.Black
        Me.txtDateCreated.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtDateCreated.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtDateCreated.Location = New System.Drawing.Point(321, 158)
        Me.txtDateCreated.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtDateCreated.Name = "txtDateCreated"
        Me.txtDateCreated.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtDateCreated.Radius = 55
        Me.txtDateCreated.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtDateCreated.ShadowColor = System.Drawing.Color.LightGray
        Me.txtDateCreated.ShadowWidth = 2
        Me.txtDateCreated.Size = New System.Drawing.Size(504, 66)
        Me.txtDateCreated.TabIndex = 70
        Me.txtDateCreated.Text = "Date Created"
        Me.txtDateCreated.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtDateCreated.TextAngle = 0
        '
        'txtProject
        '
        Me.txtProject.BackColorFaded1 = System.Drawing.Color.White
        Me.txtProject.BackColorFaded2 = System.Drawing.Color.White
        Me.txtProject.BorderColor = System.Drawing.Color.Black
        Me.txtProject.BorderWidth = 0
        Me.txtProject.EditMode = False
        Me.txtProject.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtProject.ForeColor = System.Drawing.Color.Black
        Me.txtProject.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtProject.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtProject.Location = New System.Drawing.Point(321, 80)
        Me.txtProject.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtProject.Name = "txtProject"
        Me.txtProject.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtProject.Radius = 55
        Me.txtProject.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtProject.ShadowColor = System.Drawing.Color.LightGray
        Me.txtProject.ShadowWidth = 2
        Me.txtProject.Size = New System.Drawing.Size(504, 66)
        Me.txtProject.TabIndex = 69
        Me.txtProject.Text = "Project"
        Me.txtProject.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtProject.TextAngle = 0
        '
        'txtClient
        '
        Me.txtClient.BackColorFaded1 = System.Drawing.Color.White
        Me.txtClient.BackColorFaded2 = System.Drawing.Color.White
        Me.txtClient.BorderColor = System.Drawing.Color.Black
        Me.txtClient.BorderWidth = 0
        Me.txtClient.EditMode = False
        Me.txtClient.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtClient.ForeColor = System.Drawing.Color.Black
        Me.txtClient.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtClient.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtClient.Location = New System.Drawing.Point(321, 2)
        Me.txtClient.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtClient.Name = "txtClient"
        Me.txtClient.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtClient.Radius = 55
        Me.txtClient.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtClient.ShadowColor = System.Drawing.Color.LightGray
        Me.txtClient.ShadowWidth = 2
        Me.txtClient.Size = New System.Drawing.Size(504, 66)
        Me.txtClient.TabIndex = 68
        Me.txtClient.Text = "Client"
        Me.txtClient.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtClient.TextAngle = 0
        '
        'cmdDateModified
        '
        Me.cmdDateModified.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdDateModified.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdDateModified.BorderColor = System.Drawing.Color.Black
        Me.cmdDateModified.BorderWidth = 0
        Me.cmdDateModified.EditMode = False
        Me.cmdDateModified.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdDateModified.ForeColor = System.Drawing.Color.Black
        Me.cmdDateModified.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdDateModified.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdDateModified.Location = New System.Drawing.Point(1, 236)
        Me.cmdDateModified.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdDateModified.Name = "cmdDateModified"
        Me.cmdDateModified.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdDateModified.Radius = 55
        Me.cmdDateModified.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdDateModified.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdDateModified.ShadowWidth = 2
        Me.cmdDateModified.Size = New System.Drawing.Size(304, 66)
        Me.cmdDateModified.TabIndex = 67
        Me.cmdDateModified.Text = "Date Modified"
        Me.cmdDateModified.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdDateModified.TextAngle = 0
        '
        'cmdDataCreated
        '
        Me.cmdDataCreated.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdDataCreated.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdDataCreated.BorderColor = System.Drawing.Color.Black
        Me.cmdDataCreated.BorderWidth = 0
        Me.cmdDataCreated.EditMode = False
        Me.cmdDataCreated.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdDataCreated.ForeColor = System.Drawing.Color.Black
        Me.cmdDataCreated.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdDataCreated.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdDataCreated.Location = New System.Drawing.Point(1, 158)
        Me.cmdDataCreated.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdDataCreated.Name = "cmdDataCreated"
        Me.cmdDataCreated.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdDataCreated.Radius = 55
        Me.cmdDataCreated.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdDataCreated.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdDataCreated.ShadowWidth = 2
        Me.cmdDataCreated.Size = New System.Drawing.Size(304, 66)
        Me.cmdDataCreated.TabIndex = 66
        Me.cmdDataCreated.Text = "Date Created"
        Me.cmdDataCreated.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdDataCreated.TextAngle = 0
        '
        'cmdProject
        '
        Me.cmdProject.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdProject.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdProject.BorderColor = System.Drawing.Color.Black
        Me.cmdProject.BorderWidth = 0
        Me.cmdProject.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdProject.EditMode = False
        Me.cmdProject.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdProject.ForeColor = System.Drawing.Color.Black
        Me.cmdProject.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdProject.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdProject.Location = New System.Drawing.Point(1, 80)
        Me.cmdProject.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdProject.Name = "cmdProject"
        Me.cmdProject.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdProject.Radius = 55
        Me.cmdProject.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdProject.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdProject.ShadowWidth = 2
        Me.cmdProject.Size = New System.Drawing.Size(304, 66)
        Me.cmdProject.TabIndex = 65
        Me.cmdProject.Text = "Project"
        Me.cmdProject.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdProject.TextAngle = 0
        '
        'cmdClient
        '
        Me.cmdClient.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdClient.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdClient.BorderColor = System.Drawing.Color.Black
        Me.cmdClient.BorderWidth = 0
        Me.cmdClient.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdClient.EditMode = False
        Me.cmdClient.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdClient.ForeColor = System.Drawing.Color.Black
        Me.cmdClient.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdClient.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdClient.Location = New System.Drawing.Point(1, 2)
        Me.cmdClient.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdClient.Name = "cmdClient"
        Me.cmdClient.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdClient.Radius = 55
        Me.cmdClient.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdClient.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdClient.ShadowWidth = 2
        Me.cmdClient.Size = New System.Drawing.Size(304, 66)
        Me.cmdClient.TabIndex = 64
        Me.cmdClient.Text = "Client"
        Me.cmdClient.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdClient.TextAngle = 0
        '
        'CurrentJobBaseSettingsLoadPage
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.Controls.Add(Me.pnlMain)
        Me.Name = "CurrentJobBaseSettingsLoadPage"
        Me.pnlMain.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents pnlMain As System.Windows.Forms.Panel
    Friend WithEvents cmdLoadJob As Zelo.Luma.GUINavigation
    Friend WithEvents txtDateModified As Zelo.Luma.GUINavigation
    Friend WithEvents txtDateCreated As Zelo.Luma.GUINavigation
    Friend WithEvents txtProject As Zelo.Luma.GUINavigation
    Friend WithEvents txtClient As Zelo.Luma.GUINavigation
    Friend WithEvents cmdDateModified As Zelo.Luma.GUINavigation
    Friend WithEvents cmdDataCreated As Zelo.Luma.GUINavigation
    Friend WithEvents cmdProject As Zelo.Luma.GUINavigation
    Friend WithEvents cmdClient As Zelo.Luma.GUINavigation

End Class
