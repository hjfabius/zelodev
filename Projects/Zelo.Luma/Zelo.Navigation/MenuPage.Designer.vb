<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MenuPage
    Inherits Luma.MainPage

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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(MenuPage))
        Me.cmdSystemSettings = New Zelo.Luma.GUINavigation
        Me.cmdVision = New Zelo.Luma.GUINavigation
        Me.cmdViscosityControl = New Zelo.Luma.GUINavigation
        Me.cmdRegisterControl = New Zelo.Luma.GUINavigation
        Me.cmdRegisterViscosityControl = New Zelo.Luma.GUINavigation
        Me.cmdBaseSettings = New Zelo.Luma.GUINavigation
        Me.lblSystem = New Zelo.Luma.GUIButton
        Me.lblCurrentJob = New Zelo.Luma.GUIButton
        Me.cmdNew = New Zelo.Luma.GUINavigation
        Me.cmdCopy = New Zelo.Luma.GUINavigation
        Me.cmdLoad = New Zelo.Luma.GUINavigation
        Me.pnlHiddenQuit = New System.Windows.Forms.Panel
        Me.cmdSystemRemoteAssistance = New Zelo.Luma.GUINavigation
        Me.cmdDensityControl = New Zelo.Luma.GUINavigation
        Me.cmdRegisterDensityControl = New Zelo.Luma.GUINavigation
        Me.picCrossSquare = New System.Windows.Forms.PictureBox
        Me.picSquare = New System.Windows.Forms.PictureBox
        Me.picExit = New System.Windows.Forms.PictureBox
        Me.picCurrentJob = New System.Windows.Forms.PictureBox
        Me.picSystem = New System.Windows.Forms.PictureBox
        Me.picSystemSettings = New System.Windows.Forms.PictureBox
        Me.picVision = New System.Windows.Forms.PictureBox
        Me.picCup = New System.Windows.Forms.PictureBox
        Me.picCross = New System.Windows.Forms.PictureBox
        Me.picCrossCup = New System.Windows.Forms.PictureBox
        Me.picUsers = New System.Windows.Forms.PictureBox
        Me.cmdHiddenSystemSettings = New Zelo.Luma.GUINavigation
        CType(Me.picCrossSquare, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picSquare, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picExit, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picCurrentJob, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picSystem, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picSystemSettings, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picVision, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picCup, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picCross, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picCrossCup, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picUsers, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'cmdSystemSettings
        '
        Me.cmdSystemSettings.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdSystemSettings.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdSystemSettings.BorderColor = System.Drawing.Color.Black
        Me.cmdSystemSettings.BorderWidth = 0
        Me.cmdSystemSettings.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdSystemSettings.EditMode = False
        Me.cmdSystemSettings.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdSystemSettings.ForeColor = System.Drawing.Color.Black
        Me.cmdSystemSettings.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdSystemSettings.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdSystemSettings.Location = New System.Drawing.Point(380, 542)
        Me.cmdSystemSettings.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdSystemSettings.Name = "cmdSystemSettings"
        Me.cmdSystemSettings.NavigationID = Zelo.Luma.NavigationPages.SystemSettingsPage
        Me.cmdSystemSettings.Radius = 55
        Me.cmdSystemSettings.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdSystemSettings.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdSystemSettings.ShadowWidth = 2
        Me.cmdSystemSettings.Size = New System.Drawing.Size(426, 66)
        Me.cmdSystemSettings.TabIndex = 50
        Me.cmdSystemSettings.Text = "System Settings"
        Me.cmdSystemSettings.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdSystemSettings.TextAngle = 0
        '
        'cmdVision
        '
        Me.cmdVision.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdVision.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdVision.BorderColor = System.Drawing.Color.Black
        Me.cmdVision.BorderWidth = 0
        Me.cmdVision.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdVision.EditMode = False
        Me.cmdVision.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdVision.ForeColor = System.Drawing.Color.Black
        Me.cmdVision.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdVision.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdVision.Location = New System.Drawing.Point(380, 383)
        Me.cmdVision.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdVision.Name = "cmdVision"
        Me.cmdVision.NavigationID = Zelo.Luma.NavigationPages.VisionPage
        Me.cmdVision.Radius = 55
        Me.cmdVision.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdVision.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdVision.ShadowWidth = 2
        Me.cmdVision.Size = New System.Drawing.Size(426, 66)
        Me.cmdVision.TabIndex = 49
        Me.cmdVision.Text = "Web inspection"
        Me.cmdVision.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdVision.TextAngle = 0
        '
        'cmdViscosityControl
        '
        Me.cmdViscosityControl.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdViscosityControl.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdViscosityControl.BorderColor = System.Drawing.Color.Black
        Me.cmdViscosityControl.BorderWidth = 0
        Me.cmdViscosityControl.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdViscosityControl.EditMode = False
        Me.cmdViscosityControl.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdViscosityControl.ForeColor = System.Drawing.Color.Black
        Me.cmdViscosityControl.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdViscosityControl.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdViscosityControl.Location = New System.Drawing.Point(380, 310)
        Me.cmdViscosityControl.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdViscosityControl.Name = "cmdViscosityControl"
        Me.cmdViscosityControl.NavigationID = Zelo.Luma.NavigationPages.ViscosityControlPage
        Me.cmdViscosityControl.Radius = 55
        Me.cmdViscosityControl.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdViscosityControl.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdViscosityControl.ShadowWidth = 2
        Me.cmdViscosityControl.Size = New System.Drawing.Size(426, 66)
        Me.cmdViscosityControl.TabIndex = 48
        Me.cmdViscosityControl.Text = "Viscosity Control"
        Me.cmdViscosityControl.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdViscosityControl.TextAngle = 0
        '
        'cmdRegisterControl
        '
        Me.cmdRegisterControl.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterControl.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterControl.BorderColor = System.Drawing.Color.Black
        Me.cmdRegisterControl.BorderWidth = 0
        Me.cmdRegisterControl.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdRegisterControl.EditMode = False
        Me.cmdRegisterControl.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdRegisterControl.ForeColor = System.Drawing.Color.Black
        Me.cmdRegisterControl.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdRegisterControl.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdRegisterControl.Location = New System.Drawing.Point(380, 238)
        Me.cmdRegisterControl.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdRegisterControl.Name = "cmdRegisterControl"
        Me.cmdRegisterControl.NavigationID = Zelo.Luma.NavigationPages.RegisterControlPage
        Me.cmdRegisterControl.Radius = 55
        Me.cmdRegisterControl.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdRegisterControl.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdRegisterControl.ShadowWidth = 2
        Me.cmdRegisterControl.Size = New System.Drawing.Size(426, 66)
        Me.cmdRegisterControl.TabIndex = 47
        Me.cmdRegisterControl.Text = "Register Control"
        Me.cmdRegisterControl.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdRegisterControl.TextAngle = 0
        '
        'cmdRegisterViscosityControl
        '
        Me.cmdRegisterViscosityControl.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterViscosityControl.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterViscosityControl.BorderColor = System.Drawing.Color.Black
        Me.cmdRegisterViscosityControl.BorderWidth = 0
        Me.cmdRegisterViscosityControl.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdRegisterViscosityControl.EditMode = False
        Me.cmdRegisterViscosityControl.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdRegisterViscosityControl.ForeColor = System.Drawing.Color.Black
        Me.cmdRegisterViscosityControl.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdRegisterViscosityControl.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdRegisterViscosityControl.Location = New System.Drawing.Point(380, 166)
        Me.cmdRegisterViscosityControl.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdRegisterViscosityControl.Name = "cmdRegisterViscosityControl"
        Me.cmdRegisterViscosityControl.NavigationID = Zelo.Luma.NavigationPages.RegisterViscosityControlPage
        Me.cmdRegisterViscosityControl.Radius = 55
        Me.cmdRegisterViscosityControl.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdRegisterViscosityControl.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdRegisterViscosityControl.ShadowWidth = 2
        Me.cmdRegisterViscosityControl.Size = New System.Drawing.Size(426, 66)
        Me.cmdRegisterViscosityControl.TabIndex = 46
        Me.cmdRegisterViscosityControl.Text = "Register and Viscosity Control "
        Me.cmdRegisterViscosityControl.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdRegisterViscosityControl.TextAngle = 0
        '
        'cmdBaseSettings
        '
        Me.cmdBaseSettings.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdBaseSettings.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdBaseSettings.BorderColor = System.Drawing.Color.Black
        Me.cmdBaseSettings.BorderWidth = 0
        Me.cmdBaseSettings.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdBaseSettings.EditMode = False
        Me.cmdBaseSettings.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdBaseSettings.ForeColor = System.Drawing.Color.Black
        Me.cmdBaseSettings.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdBaseSettings.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdBaseSettings.Location = New System.Drawing.Point(380, 93)
        Me.cmdBaseSettings.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdBaseSettings.Name = "cmdBaseSettings"
        Me.cmdBaseSettings.NavigationID = Zelo.Luma.NavigationPages.BaseSettingsPage
        Me.cmdBaseSettings.Radius = 55
        Me.cmdBaseSettings.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdBaseSettings.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdBaseSettings.ShadowWidth = 2
        Me.cmdBaseSettings.Size = New System.Drawing.Size(426, 66)
        Me.cmdBaseSettings.TabIndex = 45
        Me.cmdBaseSettings.Text = "Current Job Settings"
        Me.cmdBaseSettings.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdBaseSettings.TextAngle = 0
        '
        'lblSystem
        '
        Me.lblSystem.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblSystem.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblSystem.BorderColor = System.Drawing.Color.Black
        Me.lblSystem.BorderWidth = 0
        Me.lblSystem.EditMode = False
        Me.lblSystem.Font = New System.Drawing.Font("Arial", 18.0!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Italic), System.Drawing.FontStyle))
        Me.lblSystem.ForeColor = System.Drawing.Color.White
        Me.lblSystem.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblSystem.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblSystem.Location = New System.Drawing.Point(66, 466)
        Me.lblSystem.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblSystem.Name = "lblSystem"
        Me.lblSystem.Radius = 55
        Me.lblSystem.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblSystem.ShadowColor = System.Drawing.Color.LightGray
        Me.lblSystem.ShadowWidth = 2
        Me.lblSystem.Size = New System.Drawing.Size(770, 64)
        Me.lblSystem.TabIndex = 44
        Me.lblSystem.Text = "System"
        Me.lblSystem.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.lblSystem.TextAngle = 0
        '
        'lblCurrentJob
        '
        Me.lblCurrentJob.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblCurrentJob.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblCurrentJob.BorderColor = System.Drawing.Color.Black
        Me.lblCurrentJob.BorderWidth = 0
        Me.lblCurrentJob.EditMode = False
        Me.lblCurrentJob.Font = New System.Drawing.Font("Arial", 18.0!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Italic), System.Drawing.FontStyle))
        Me.lblCurrentJob.ForeColor = System.Drawing.Color.White
        Me.lblCurrentJob.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblCurrentJob.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblCurrentJob.Location = New System.Drawing.Point(66, 18)
        Me.lblCurrentJob.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblCurrentJob.Name = "lblCurrentJob"
        Me.lblCurrentJob.Radius = 55
        Me.lblCurrentJob.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblCurrentJob.ShadowColor = System.Drawing.Color.LightGray
        Me.lblCurrentJob.ShadowWidth = 2
        Me.lblCurrentJob.Size = New System.Drawing.Size(770, 64)
        Me.lblCurrentJob.TabIndex = 43
        Me.lblCurrentJob.Text = "Current Job"
        Me.lblCurrentJob.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.lblCurrentJob.TextAngle = 0
        '
        'cmdNew
        '
        Me.cmdNew.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdNew.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdNew.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdNew.BorderColor = System.Drawing.Color.Black
        Me.cmdNew.BorderWidth = 0
        Me.cmdNew.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdNew.EditMode = False
        Me.cmdNew.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.cmdNew.ForeColor = System.Drawing.Color.Black
        Me.cmdNew.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdNew.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdNew.Location = New System.Drawing.Point(461, 33)
        Me.cmdNew.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdNew.Name = "cmdNew"
        Me.cmdNew.NavigationID = Zelo.Luma.NavigationPages.BaseSettingsPageNew
        Me.cmdNew.Radius = 25
        Me.cmdNew.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdNew.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdNew.ShadowWidth = 2
        Me.cmdNew.Size = New System.Drawing.Size(112, 34)
        Me.cmdNew.TabIndex = 59
        Me.cmdNew.Text = "New"
        Me.cmdNew.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdNew.TextAngle = 0
        '
        'cmdCopy
        '
        Me.cmdCopy.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdCopy.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdCopy.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdCopy.BorderColor = System.Drawing.Color.Black
        Me.cmdCopy.BorderWidth = 0
        Me.cmdCopy.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdCopy.EditMode = False
        Me.cmdCopy.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.cmdCopy.ForeColor = System.Drawing.Color.Black
        Me.cmdCopy.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdCopy.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdCopy.Location = New System.Drawing.Point(577, 33)
        Me.cmdCopy.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdCopy.Name = "cmdCopy"
        Me.cmdCopy.NavigationID = Zelo.Luma.NavigationPages.BaseSettingsPageCopy
        Me.cmdCopy.Radius = 25
        Me.cmdCopy.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdCopy.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdCopy.ShadowWidth = 2
        Me.cmdCopy.Size = New System.Drawing.Size(112, 34)
        Me.cmdCopy.TabIndex = 60
        Me.cmdCopy.Text = "Copy"
        Me.cmdCopy.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdCopy.TextAngle = 0
        '
        'cmdLoad
        '
        Me.cmdLoad.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdLoad.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdLoad.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdLoad.BorderColor = System.Drawing.Color.Black
        Me.cmdLoad.BorderWidth = 0
        Me.cmdLoad.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdLoad.EditMode = False
        Me.cmdLoad.Font = New System.Drawing.Font("Arial", 15.75!, System.Drawing.FontStyle.Bold)
        Me.cmdLoad.ForeColor = System.Drawing.Color.Black
        Me.cmdLoad.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdLoad.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdLoad.Location = New System.Drawing.Point(692, 33)
        Me.cmdLoad.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdLoad.Name = "cmdLoad"
        Me.cmdLoad.NavigationID = Zelo.Luma.NavigationPages.BaseSettingsPageLoad
        Me.cmdLoad.Radius = 25
        Me.cmdLoad.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdLoad.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdLoad.ShadowWidth = 2
        Me.cmdLoad.Size = New System.Drawing.Size(112, 34)
        Me.cmdLoad.TabIndex = 61
        Me.cmdLoad.Text = "Load"
        Me.cmdLoad.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdLoad.TextAngle = 0
        '
        'pnlHiddenQuit
        '
        Me.pnlHiddenQuit.Location = New System.Drawing.Point(8, 526)
        Me.pnlHiddenQuit.Name = "pnlHiddenQuit"
        Me.pnlHiddenQuit.Size = New System.Drawing.Size(83, 76)
        Me.pnlHiddenQuit.TabIndex = 62
        '
        'cmdSystemRemoteAssistance
        '
        Me.cmdSystemRemoteAssistance.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdSystemRemoteAssistance.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdSystemRemoteAssistance.BorderColor = System.Drawing.Color.Black
        Me.cmdSystemRemoteAssistance.BorderWidth = 0
        Me.cmdSystemRemoteAssistance.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdSystemRemoteAssistance.EditMode = False
        Me.cmdSystemRemoteAssistance.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdSystemRemoteAssistance.ForeColor = System.Drawing.Color.Black
        Me.cmdSystemRemoteAssistance.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdSystemRemoteAssistance.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdSystemRemoteAssistance.Location = New System.Drawing.Point(380, 615)
        Me.cmdSystemRemoteAssistance.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdSystemRemoteAssistance.Name = "cmdSystemRemoteAssistance"
        Me.cmdSystemRemoteAssistance.NavigationID = Zelo.Luma.NavigationPages.VisionPage
        Me.cmdSystemRemoteAssistance.Radius = 55
        Me.cmdSystemRemoteAssistance.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdSystemRemoteAssistance.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdSystemRemoteAssistance.ShadowWidth = 2
        Me.cmdSystemRemoteAssistance.Size = New System.Drawing.Size(426, 66)
        Me.cmdSystemRemoteAssistance.TabIndex = 63
        Me.cmdSystemRemoteAssistance.Text = "Remote Assistance"
        Me.cmdSystemRemoteAssistance.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdSystemRemoteAssistance.TextAngle = 0
        '
        'cmdDensityControl
        '
        Me.cmdDensityControl.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdDensityControl.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdDensityControl.BorderColor = System.Drawing.Color.Black
        Me.cmdDensityControl.BorderWidth = 0
        Me.cmdDensityControl.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdDensityControl.EditMode = False
        Me.cmdDensityControl.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdDensityControl.ForeColor = System.Drawing.Color.Black
        Me.cmdDensityControl.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdDensityControl.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdDensityControl.Location = New System.Drawing.Point(378, 310)
        Me.cmdDensityControl.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdDensityControl.Name = "cmdDensityControl"
        Me.cmdDensityControl.NavigationID = Zelo.Luma.NavigationPages.DensityControlPage
        Me.cmdDensityControl.Radius = 55
        Me.cmdDensityControl.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdDensityControl.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdDensityControl.ShadowWidth = 2
        Me.cmdDensityControl.Size = New System.Drawing.Size(426, 66)
        Me.cmdDensityControl.TabIndex = 66
        Me.cmdDensityControl.Text = "Density Control"
        Me.cmdDensityControl.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdDensityControl.TextAngle = 0
        '
        'cmdRegisterDensityControl
        '
        Me.cmdRegisterDensityControl.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterDensityControl.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterDensityControl.BorderColor = System.Drawing.Color.Black
        Me.cmdRegisterDensityControl.BorderWidth = 0
        Me.cmdRegisterDensityControl.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdRegisterDensityControl.EditMode = False
        Me.cmdRegisterDensityControl.Enabled = False
        Me.cmdRegisterDensityControl.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdRegisterDensityControl.ForeColor = System.Drawing.Color.Black
        Me.cmdRegisterDensityControl.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdRegisterDensityControl.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdRegisterDensityControl.Location = New System.Drawing.Point(378, 166)
        Me.cmdRegisterDensityControl.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdRegisterDensityControl.Name = "cmdRegisterDensityControl"
        Me.cmdRegisterDensityControl.NavigationID = Zelo.Luma.NavigationPages.RegisterDensityControlPage
        Me.cmdRegisterDensityControl.Radius = 55
        Me.cmdRegisterDensityControl.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdRegisterDensityControl.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdRegisterDensityControl.ShadowWidth = 2
        Me.cmdRegisterDensityControl.Size = New System.Drawing.Size(426, 66)
        Me.cmdRegisterDensityControl.TabIndex = 67
        Me.cmdRegisterDensityControl.Text = "Register and Density Control "
        Me.cmdRegisterDensityControl.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdRegisterDensityControl.TextAngle = 0
        '
        'picCrossSquare
        '
        Me.picCrossSquare.Image = Global.Zelo.Luma.My.Resources.Resources.crossSquare
        Me.picCrossSquare.Location = New System.Drawing.Point(283, 159)
        Me.picCrossSquare.Name = "picCrossSquare"
        Me.picCrossSquare.Size = New System.Drawing.Size(90, 82)
        Me.picCrossSquare.TabIndex = 68
        Me.picCrossSquare.TabStop = False
        '
        'picSquare
        '
        Me.picSquare.Image = CType(resources.GetObject("picSquare.Image"), System.Drawing.Image)
        Me.picSquare.Location = New System.Drawing.Point(297, 310)
        Me.picSquare.Name = "picSquare"
        Me.picSquare.Size = New System.Drawing.Size(72, 60)
        Me.picSquare.TabIndex = 65
        Me.picSquare.TabStop = False
        '
        'picExit
        '
        Me.picExit.Image = Global.Zelo.Luma.My.Resources.Resources.modem
        Me.picExit.Location = New System.Drawing.Point(308, 622)
        Me.picExit.Name = "picExit"
        Me.picExit.Size = New System.Drawing.Size(55, 50)
        Me.picExit.TabIndex = 64
        Me.picExit.TabStop = False
        '
        'picCurrentJob
        '
        Me.picCurrentJob.Image = Global.Zelo.Luma.My.Resources.Resources.currentJob
        Me.picCurrentJob.Location = New System.Drawing.Point(5, 18)
        Me.picCurrentJob.Name = "picCurrentJob"
        Me.picCurrentJob.Size = New System.Drawing.Size(62, 64)
        Me.picCurrentJob.TabIndex = 58
        Me.picCurrentJob.TabStop = False
        '
        'picSystem
        '
        Me.picSystem.Image = Global.Zelo.Luma.My.Resources.Resources.system
        Me.picSystem.Location = New System.Drawing.Point(8, 470)
        Me.picSystem.Name = "picSystem"
        Me.picSystem.Size = New System.Drawing.Size(55, 50)
        Me.picSystem.TabIndex = 57
        Me.picSystem.TabStop = False
        '
        'picSystemSettings
        '
        Me.picSystemSettings.Image = Global.Zelo.Luma.My.Resources.Resources.tools
        Me.picSystemSettings.Location = New System.Drawing.Point(309, 552)
        Me.picSystemSettings.Name = "picSystemSettings"
        Me.picSystemSettings.Size = New System.Drawing.Size(55, 50)
        Me.picSystemSettings.TabIndex = 56
        Me.picSystemSettings.TabStop = False
        '
        'picVision
        '
        Me.picVision.Image = Global.Zelo.Luma.My.Resources.Resources.camera
        Me.picVision.Location = New System.Drawing.Point(292, 388)
        Me.picVision.Name = "picVision"
        Me.picVision.Size = New System.Drawing.Size(80, 55)
        Me.picVision.TabIndex = 55
        Me.picVision.TabStop = False
        '
        'picCup
        '
        Me.picCup.Image = Global.Zelo.Luma.My.Resources.Resources.cup
        Me.picCup.Location = New System.Drawing.Point(315, 310)
        Me.picCup.Name = "picCup"
        Me.picCup.Size = New System.Drawing.Size(38, 77)
        Me.picCup.TabIndex = 54
        Me.picCup.TabStop = False
        '
        'picCross
        '
        Me.picCross.Image = Global.Zelo.Luma.My.Resources.Resources.cross
        Me.picCross.Location = New System.Drawing.Point(293, 238)
        Me.picCross.Name = "picCross"
        Me.picCross.Size = New System.Drawing.Size(80, 66)
        Me.picCross.TabIndex = 53
        Me.picCross.TabStop = False
        '
        'picCrossCup
        '
        Me.picCrossCup.Image = Global.Zelo.Luma.My.Resources.Resources.crossCup
        Me.picCrossCup.Location = New System.Drawing.Point(272, 150)
        Me.picCrossCup.Name = "picCrossCup"
        Me.picCrossCup.Size = New System.Drawing.Size(101, 82)
        Me.picCrossCup.TabIndex = 52
        Me.picCrossCup.TabStop = False
        '
        'picUsers
        '
        Me.picUsers.Image = Global.Zelo.Luma.My.Resources.Resources.users
        Me.picUsers.Location = New System.Drawing.Point(308, 103)
        Me.picUsers.Name = "picUsers"
        Me.picUsers.Size = New System.Drawing.Size(55, 50)
        Me.picUsers.TabIndex = 51
        Me.picUsers.TabStop = False
        '
        'cmdHiddenSystemSettings
        '
        Me.cmdHiddenSystemSettings.BackColorFaded1 = System.Drawing.Color.White
        Me.cmdHiddenSystemSettings.BackColorFaded2 = System.Drawing.Color.White
        Me.cmdHiddenSystemSettings.BorderColor = System.Drawing.Color.Black
        Me.cmdHiddenSystemSettings.BorderWidth = 0
        Me.cmdHiddenSystemSettings.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdHiddenSystemSettings.EditMode = False
        Me.cmdHiddenSystemSettings.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdHiddenSystemSettings.ForeColor = System.Drawing.Color.Black
        Me.cmdHiddenSystemSettings.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdHiddenSystemSettings.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdHiddenSystemSettings.Location = New System.Drawing.Point(5, 87)
        Me.cmdHiddenSystemSettings.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdHiddenSystemSettings.Name = "cmdHiddenSystemSettings"
        Me.cmdHiddenSystemSettings.NavigationID = Zelo.Luma.NavigationPages.HiddenSystemSettings
        Me.cmdHiddenSystemSettings.Radius = 55
        Me.cmdHiddenSystemSettings.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdHiddenSystemSettings.ShadowColor = System.Drawing.Color.White
        Me.cmdHiddenSystemSettings.ShadowWidth = 2
        Me.cmdHiddenSystemSettings.Size = New System.Drawing.Size(62, 66)
        Me.cmdHiddenSystemSettings.TabIndex = 69
        Me.cmdHiddenSystemSettings.Text = ""
        Me.cmdHiddenSystemSettings.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdHiddenSystemSettings.TextAngle = 0
        '
        'MenuPage
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.Controls.Add(Me.cmdHiddenSystemSettings)
        Me.Controls.Add(Me.picCrossSquare)
        Me.Controls.Add(Me.cmdRegisterDensityControl)
        Me.Controls.Add(Me.cmdDensityControl)
        Me.Controls.Add(Me.picSquare)
        Me.Controls.Add(Me.picExit)
        Me.Controls.Add(Me.cmdSystemRemoteAssistance)
        Me.Controls.Add(Me.pnlHiddenQuit)
        Me.Controls.Add(Me.cmdLoad)
        Me.Controls.Add(Me.cmdCopy)
        Me.Controls.Add(Me.cmdNew)
        Me.Controls.Add(Me.picCurrentJob)
        Me.Controls.Add(Me.picSystem)
        Me.Controls.Add(Me.picSystemSettings)
        Me.Controls.Add(Me.picVision)
        Me.Controls.Add(Me.picCup)
        Me.Controls.Add(Me.picCross)
        Me.Controls.Add(Me.picCrossCup)
        Me.Controls.Add(Me.picUsers)
        Me.Controls.Add(Me.cmdSystemSettings)
        Me.Controls.Add(Me.cmdVision)
        Me.Controls.Add(Me.cmdViscosityControl)
        Me.Controls.Add(Me.cmdRegisterControl)
        Me.Controls.Add(Me.cmdRegisterViscosityControl)
        Me.Controls.Add(Me.cmdBaseSettings)
        Me.Controls.Add(Me.lblSystem)
        Me.Controls.Add(Me.lblCurrentJob)
        Me.Name = "MenuPage"
        Me.Controls.SetChildIndex(Me.lblCurrentJob, 0)
        Me.Controls.SetChildIndex(Me.lblSystem, 0)
        Me.Controls.SetChildIndex(Me.cmdBaseSettings, 0)
        Me.Controls.SetChildIndex(Me.cmdRegisterViscosityControl, 0)
        Me.Controls.SetChildIndex(Me.cmdRegisterControl, 0)
        Me.Controls.SetChildIndex(Me.cmdViscosityControl, 0)
        Me.Controls.SetChildIndex(Me.cmdVision, 0)
        Me.Controls.SetChildIndex(Me.cmdSystemSettings, 0)
        Me.Controls.SetChildIndex(Me.picUsers, 0)
        Me.Controls.SetChildIndex(Me.picCrossCup, 0)
        Me.Controls.SetChildIndex(Me.picCross, 0)
        Me.Controls.SetChildIndex(Me.picCup, 0)
        Me.Controls.SetChildIndex(Me.picVision, 0)
        Me.Controls.SetChildIndex(Me.picSystemSettings, 0)
        Me.Controls.SetChildIndex(Me.picSystem, 0)
        Me.Controls.SetChildIndex(Me.picCurrentJob, 0)
        Me.Controls.SetChildIndex(Me.cmdNew, 0)
        Me.Controls.SetChildIndex(Me.cmdCopy, 0)
        Me.Controls.SetChildIndex(Me.cmdLoad, 0)
        Me.Controls.SetChildIndex(Me.pnlHiddenQuit, 0)
        Me.Controls.SetChildIndex(Me.cmdSystemRemoteAssistance, 0)
        Me.Controls.SetChildIndex(Me.picExit, 0)
        Me.Controls.SetChildIndex(Me.picSquare, 0)
        Me.Controls.SetChildIndex(Me.cmdDensityControl, 0)
        Me.Controls.SetChildIndex(Me.cmdRegisterDensityControl, 0)
        Me.Controls.SetChildIndex(Me.picCrossSquare, 0)
        Me.Controls.SetChildIndex(Me.cmdHiddenSystemSettings, 0)
        CType(Me.picCrossSquare, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picSquare, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picExit, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picCurrentJob, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picSystem, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picSystemSettings, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picVision, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picCup, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picCross, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picCrossCup, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picUsers, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents picCurrentJob As System.Windows.Forms.PictureBox
    Friend WithEvents picSystem As System.Windows.Forms.PictureBox
    Friend WithEvents picSystemSettings As System.Windows.Forms.PictureBox
    Friend WithEvents picVision As System.Windows.Forms.PictureBox
    Friend WithEvents picCup As System.Windows.Forms.PictureBox
    Friend WithEvents picCross As System.Windows.Forms.PictureBox
    Friend WithEvents picCrossCup As System.Windows.Forms.PictureBox
    Friend WithEvents picUsers As System.Windows.Forms.PictureBox
    Friend WithEvents cmdSystemSettings As Zelo.Luma.GUINavigation
    Friend WithEvents cmdVision As Zelo.Luma.GUINavigation
    Friend WithEvents cmdViscosityControl As Zelo.Luma.GUINavigation
    Friend WithEvents cmdRegisterControl As Zelo.Luma.GUINavigation
    Friend WithEvents cmdRegisterViscosityControl As Zelo.Luma.GUINavigation
    Friend WithEvents cmdBaseSettings As Zelo.Luma.GUINavigation
    Friend WithEvents lblSystem As Zelo.Luma.GUIButton
    Friend WithEvents lblCurrentJob As Zelo.Luma.GUIButton
    Friend WithEvents cmdNew As Zelo.Luma.GUINavigation
    Friend WithEvents cmdCopy As Zelo.Luma.GUINavigation
    Friend WithEvents cmdLoad As Zelo.Luma.GUINavigation
    Friend WithEvents pnlHiddenQuit As System.Windows.Forms.Panel
    Friend WithEvents cmdSystemRemoteAssistance As Zelo.Luma.GUINavigation
    Friend WithEvents picExit As System.Windows.Forms.PictureBox
    Friend WithEvents picSquare As System.Windows.Forms.PictureBox
    Friend WithEvents cmdDensityControl As Zelo.Luma.GUINavigation
    Friend WithEvents cmdRegisterDensityControl As Zelo.Luma.GUINavigation
    Friend WithEvents picCrossSquare As System.Windows.Forms.PictureBox
    Friend WithEvents cmdHiddenSystemSettings As Zelo.Luma.GUINavigation

End Class
