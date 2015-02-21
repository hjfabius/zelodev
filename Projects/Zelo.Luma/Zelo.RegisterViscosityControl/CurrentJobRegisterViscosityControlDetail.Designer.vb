<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class CurrentJobRegisterViscosityControlDetail
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
        Me.components = New System.ComponentModel.Container
        Me.tblTotal = New System.Windows.Forms.TableLayoutPanel
        Me.pnlHorizontalLine = New System.Windows.Forms.Panel
        Me.pnlVerticalLine = New System.Windows.Forms.Panel
        Me.pnlViscosity = New System.Windows.Forms.Panel
        Me.picViscosityAction = New System.Windows.Forms.PictureBox
        Me.guiTermometer = New Zelo.Luma.GUITermometer
        Me.guiViscosity = New Zelo.Luma.GUIViscosity
        Me.lblVerticalTemperature = New Zelo.Luma.GUIButton
        Me.lblVerticalViscosity = New Zelo.Luma.GUIButton
        Me.pnlBackgroundTemperature = New Zelo.Luma.GUINavigation
        Me.pnlBackgroundViscosity = New Zelo.Luma.GUINavigation
        Me.txtViscosityMode = New Zelo.Luma.GUINavigation
        Me.txtActualTemperature = New Zelo.Luma.GUINavigation
        Me.txtActualViscosity = New Zelo.Luma.GUINavigation
        Me.txtRefViscosity = New Zelo.Luma.GUINavigation
        Me.cmdReference = New Zelo.Luma.GUINavigation
        Me.cmdActual = New Zelo.Luma.GUINavigation
        Me.cmdClean = New Zelo.Luma.GUINavigation
        Me.cmdSolvent = New Zelo.Luma.GUINavigation
        Me.cmdInk = New Zelo.Luma.GUINavigation
        Me.cmdViscosityMode = New Zelo.Luma.GUINavigation
        Me.pnlRegister = New System.Windows.Forms.Panel
        Me.cmdMoveNext = New Zelo.Luma.GUIButton
        Me.picRegisterLateral = New System.Windows.Forms.PictureBox
        Me.txtRegisterLateral = New Zelo.Luma.GUINavigation
        Me.txtRegisterLongitudinal = New Zelo.Luma.GUINavigation
        Me.picRegisterLongitudinalAction = New System.Windows.Forms.PictureBox
        Me.picRegisterLateralAction = New System.Windows.Forms.PictureBox
        Me.cmdRegisterMode = New Zelo.Luma.GUINavigation
        Me.picRegisterLongitudinal = New System.Windows.Forms.PictureBox
        Me.picRegisterRight = New System.Windows.Forms.PictureBox
        Me.picRegisterLeft = New System.Windows.Forms.PictureBox
        Me.picRegisterTop = New System.Windows.Forms.PictureBox
        Me.picRegisterBottom = New System.Windows.Forms.PictureBox
        Me.cmdRegisterRight = New Zelo.Luma.GUINavigation
        Me.cmdRegisterLeft = New Zelo.Luma.GUINavigation
        Me.cmdRegisterBottom = New Zelo.Luma.GUINavigation
        Me.cmdRegisterTop = New Zelo.Luma.GUINavigation
        Me.pnlRegisterDirections = New Zelo.Luma.GUINavigation
        Me.pnlRegisterLongitudinal = New Zelo.Luma.GUINavigation
        Me.pnlRegisterLateral = New Zelo.Luma.GUINavigation
        Me.guiRegisterCross = New Zelo.Luma.GUIRegisterCross
        Me.txtRegisterMode = New Zelo.Luma.GUINavigation
        Me.cmdParameters = New Zelo.Luma.GUINavigation
        Me.lblGroupNumber = New Zelo.Luma.GUINavigation
        Me.objTimerViscosityAction = New System.Windows.Forms.Timer(Me.components)
        Me.objTimerRegisterLateralAction = New System.Windows.Forms.Timer(Me.components)
        Me.objTimerRegisterLongitudinalAction = New System.Windows.Forms.Timer(Me.components)
        Me.cmdMovePrevious = New Zelo.Luma.GUIButton
        Me.tblTotal.SuspendLayout()
        Me.pnlViscosity.SuspendLayout()
        CType(Me.picViscosityAction, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.pnlRegister.SuspendLayout()
        CType(Me.picRegisterLateral, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picRegisterLongitudinalAction, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picRegisterLateralAction, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picRegisterLongitudinal, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picRegisterRight, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picRegisterLeft, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picRegisterTop, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picRegisterBottom, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'tblTotal
        '
        Me.tblTotal.ColumnCount = 3
        Me.tblTotal.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.tblTotal.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 8.0!))
        Me.tblTotal.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.tblTotal.Controls.Add(Me.pnlHorizontalLine, 0, 0)
        Me.tblTotal.Controls.Add(Me.pnlVerticalLine, 1, 1)
        Me.tblTotal.Controls.Add(Me.pnlViscosity, 0, 1)
        Me.tblTotal.Controls.Add(Me.pnlRegister, 2, 1)
        Me.tblTotal.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tblTotal.Location = New System.Drawing.Point(0, 0)
        Me.tblTotal.Name = "tblTotal"
        Me.tblTotal.RowCount = 2
        Me.tblTotal.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 8.0!))
        Me.tblTotal.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100.0!))
        Me.tblTotal.Size = New System.Drawing.Size(840, 681)
        Me.tblTotal.TabIndex = 0
        '
        'pnlHorizontalLine
        '
        Me.pnlHorizontalLine.BackColor = System.Drawing.Color.Red
        Me.tblTotal.SetColumnSpan(Me.pnlHorizontalLine, 3)
        Me.pnlHorizontalLine.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlHorizontalLine.Location = New System.Drawing.Point(0, 0)
        Me.pnlHorizontalLine.Margin = New System.Windows.Forms.Padding(0)
        Me.pnlHorizontalLine.Name = "pnlHorizontalLine"
        Me.pnlHorizontalLine.Size = New System.Drawing.Size(840, 8)
        Me.pnlHorizontalLine.TabIndex = 0
        '
        'pnlVerticalLine
        '
        Me.pnlVerticalLine.BackColor = System.Drawing.Color.Red
        Me.pnlVerticalLine.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlVerticalLine.Location = New System.Drawing.Point(416, 8)
        Me.pnlVerticalLine.Margin = New System.Windows.Forms.Padding(0)
        Me.pnlVerticalLine.Name = "pnlVerticalLine"
        Me.pnlVerticalLine.Size = New System.Drawing.Size(8, 673)
        Me.pnlVerticalLine.TabIndex = 1
        '
        'pnlViscosity
        '
        Me.pnlViscosity.Controls.Add(Me.picViscosityAction)
        Me.pnlViscosity.Controls.Add(Me.guiTermometer)
        Me.pnlViscosity.Controls.Add(Me.guiViscosity)
        Me.pnlViscosity.Controls.Add(Me.lblVerticalTemperature)
        Me.pnlViscosity.Controls.Add(Me.lblVerticalViscosity)
        Me.pnlViscosity.Controls.Add(Me.pnlBackgroundTemperature)
        Me.pnlViscosity.Controls.Add(Me.pnlBackgroundViscosity)
        Me.pnlViscosity.Controls.Add(Me.txtViscosityMode)
        Me.pnlViscosity.Controls.Add(Me.txtActualTemperature)
        Me.pnlViscosity.Controls.Add(Me.txtActualViscosity)
        Me.pnlViscosity.Controls.Add(Me.txtRefViscosity)
        Me.pnlViscosity.Controls.Add(Me.cmdReference)
        Me.pnlViscosity.Controls.Add(Me.cmdActual)
        Me.pnlViscosity.Controls.Add(Me.cmdClean)
        Me.pnlViscosity.Controls.Add(Me.cmdSolvent)
        Me.pnlViscosity.Controls.Add(Me.cmdInk)
        Me.pnlViscosity.Controls.Add(Me.cmdViscosityMode)
        Me.pnlViscosity.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlViscosity.Location = New System.Drawing.Point(3, 11)
        Me.pnlViscosity.Name = "pnlViscosity"
        Me.pnlViscosity.Size = New System.Drawing.Size(410, 667)
        Me.pnlViscosity.TabIndex = 2
        '
        'picViscosityAction
        '
        Me.picViscosityAction.BackColor = System.Drawing.Color.White
        Me.picViscosityAction.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.picViscosityAction.Location = New System.Drawing.Point(212, 318)
        Me.picViscosityAction.Name = "picViscosityAction"
        Me.picViscosityAction.Size = New System.Drawing.Size(15, 15)
        Me.picViscosityAction.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picViscosityAction.TabIndex = 85
        Me.picViscosityAction.TabStop = False
        Me.picViscosityAction.Visible = False
        '
        'guiTermometer
        '
        Me.guiTermometer.BackColor = System.Drawing.Color.White
        Me.guiTermometer.Location = New System.Drawing.Point(341, 146)
        Me.guiTermometer.Max = 45
        Me.guiTermometer.MercuryColor = System.Drawing.Color.Red
        Me.guiTermometer.Min = 10
        Me.guiTermometer.Name = "guiTermometer"
        Me.guiTermometer.Range = 65
        Me.guiTermometer.Size = New System.Drawing.Size(32, 238)
        Me.guiTermometer.TabIndex = 62
        Me.guiTermometer.Value = 25
        '
        'guiViscosity
        '
        Me.guiViscosity.Location = New System.Drawing.Point(242, 146)
        Me.guiViscosity.Name = "guiViscosity"
        Me.guiViscosity.Range = 40
        Me.guiViscosity.RefValue = 0
        Me.guiViscosity.Size = New System.Drawing.Size(25, 238)
        Me.guiViscosity.TabIndex = 61
        Me.guiViscosity.Value = 0
        '
        'lblVerticalTemperature
        '
        Me.lblVerticalTemperature.BackColorFaded1 = System.Drawing.Color.White
        Me.lblVerticalTemperature.BackColorFaded2 = System.Drawing.Color.White
        Me.lblVerticalTemperature.BorderColor = System.Drawing.Color.Black
        Me.lblVerticalTemperature.BorderWidth = 0
        Me.lblVerticalTemperature.EditMode = False
        Me.lblVerticalTemperature.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblVerticalTemperature.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblVerticalTemperature.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblVerticalTemperature.Location = New System.Drawing.Point(298, 188)
        Me.lblVerticalTemperature.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblVerticalTemperature.Name = "lblVerticalTemperature"
        Me.lblVerticalTemperature.Radius = 0
        Me.lblVerticalTemperature.RectangleStyle = Zelo.Luma.RectangleStyle.Squared
        Me.lblVerticalTemperature.ShadowColor = System.Drawing.Color.LightGray
        Me.lblVerticalTemperature.ShadowWidth = 0
        Me.lblVerticalTemperature.Size = New System.Drawing.Size(50, 197)
        Me.lblVerticalTemperature.TabIndex = 65
        Me.lblVerticalTemperature.Text = "Temperature"
        Me.lblVerticalTemperature.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.lblVerticalTemperature.TextAngle = -90
        '
        'lblVerticalViscosity
        '
        Me.lblVerticalViscosity.BackColorFaded1 = System.Drawing.Color.White
        Me.lblVerticalViscosity.BackColorFaded2 = System.Drawing.Color.White
        Me.lblVerticalViscosity.BorderColor = System.Drawing.Color.Black
        Me.lblVerticalViscosity.BorderWidth = 0
        Me.lblVerticalViscosity.EditMode = False
        Me.lblVerticalViscosity.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblVerticalViscosity.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblVerticalViscosity.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblVerticalViscosity.Location = New System.Drawing.Point(187, 187)
        Me.lblVerticalViscosity.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblVerticalViscosity.Name = "lblVerticalViscosity"
        Me.lblVerticalViscosity.Radius = 0
        Me.lblVerticalViscosity.RectangleStyle = Zelo.Luma.RectangleStyle.Squared
        Me.lblVerticalViscosity.ShadowColor = System.Drawing.Color.LightGray
        Me.lblVerticalViscosity.ShadowWidth = 0
        Me.lblVerticalViscosity.Size = New System.Drawing.Size(50, 157)
        Me.lblVerticalViscosity.TabIndex = 64
        Me.lblVerticalViscosity.Text = "Viscosity"
        Me.lblVerticalViscosity.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.lblVerticalViscosity.TextAngle = -90
        '
        'pnlBackgroundTemperature
        '
        Me.pnlBackgroundTemperature.BackColorFaded1 = System.Drawing.Color.White
        Me.pnlBackgroundTemperature.BackColorFaded2 = System.Drawing.Color.White
        Me.pnlBackgroundTemperature.BorderColor = System.Drawing.Color.Black
        Me.pnlBackgroundTemperature.BorderWidth = 0
        Me.pnlBackgroundTemperature.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.pnlBackgroundTemperature.EditMode = False
        Me.pnlBackgroundTemperature.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.pnlBackgroundTemperature.ForeColor = System.Drawing.Color.Black
        Me.pnlBackgroundTemperature.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.pnlBackgroundTemperature.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.pnlBackgroundTemperature.Location = New System.Drawing.Point(299, 130)
        Me.pnlBackgroundTemperature.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.pnlBackgroundTemperature.Name = "pnlBackgroundTemperature"
        Me.pnlBackgroundTemperature.NavigationID = Zelo.Luma.NavigationPages.None
        Me.pnlBackgroundTemperature.Radius = 55
        Me.pnlBackgroundTemperature.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.pnlBackgroundTemperature.ShadowColor = System.Drawing.Color.LightGray
        Me.pnlBackgroundTemperature.ShadowWidth = 2
        Me.pnlBackgroundTemperature.Size = New System.Drawing.Size(90, 270)
        Me.pnlBackgroundTemperature.TabIndex = 60
        Me.pnlBackgroundTemperature.Text = ""
        Me.pnlBackgroundTemperature.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.pnlBackgroundTemperature.TextAngle = 0
        '
        'pnlBackgroundViscosity
        '
        Me.pnlBackgroundViscosity.BackColorFaded1 = System.Drawing.Color.White
        Me.pnlBackgroundViscosity.BackColorFaded2 = System.Drawing.Color.White
        Me.pnlBackgroundViscosity.BorderColor = System.Drawing.Color.Black
        Me.pnlBackgroundViscosity.BorderWidth = 0
        Me.pnlBackgroundViscosity.Cursor = System.Windows.Forms.Cursors.Default
        Me.pnlBackgroundViscosity.EditMode = False
        Me.pnlBackgroundViscosity.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.pnlBackgroundViscosity.ForeColor = System.Drawing.Color.Black
        Me.pnlBackgroundViscosity.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.pnlBackgroundViscosity.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.pnlBackgroundViscosity.Location = New System.Drawing.Point(196, 130)
        Me.pnlBackgroundViscosity.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.pnlBackgroundViscosity.Name = "pnlBackgroundViscosity"
        Me.pnlBackgroundViscosity.NavigationID = Zelo.Luma.NavigationPages.None
        Me.pnlBackgroundViscosity.Radius = 55
        Me.pnlBackgroundViscosity.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.pnlBackgroundViscosity.ShadowColor = System.Drawing.Color.LightGray
        Me.pnlBackgroundViscosity.ShadowWidth = 2
        Me.pnlBackgroundViscosity.Size = New System.Drawing.Size(90, 270)
        Me.pnlBackgroundViscosity.TabIndex = 59
        Me.pnlBackgroundViscosity.Text = ""
        Me.pnlBackgroundViscosity.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.pnlBackgroundViscosity.TextAngle = 0
        '
        'txtViscosityMode
        '
        Me.txtViscosityMode.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtViscosityMode.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtViscosityMode.BorderColor = System.Drawing.Color.Black
        Me.txtViscosityMode.BorderWidth = 0
        Me.txtViscosityMode.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtViscosityMode.EditMode = False
        Me.txtViscosityMode.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtViscosityMode.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtViscosityMode.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtViscosityMode.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtViscosityMode.Location = New System.Drawing.Point(196, 28)
        Me.txtViscosityMode.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtViscosityMode.Name = "txtViscosityMode"
        Me.txtViscosityMode.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtViscosityMode.Radius = 55
        Me.txtViscosityMode.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtViscosityMode.ShadowColor = System.Drawing.Color.LightGray
        Me.txtViscosityMode.ShadowWidth = 2
        Me.txtViscosityMode.Size = New System.Drawing.Size(193, 66)
        Me.txtViscosityMode.TabIndex = 57
        Me.txtViscosityMode.Text = "Auto"
        Me.txtViscosityMode.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtViscosityMode.TextAngle = 0
        '
        'txtActualTemperature
        '
        Me.txtActualTemperature.BackColorFaded1 = System.Drawing.Color.White
        Me.txtActualTemperature.BackColorFaded2 = System.Drawing.Color.White
        Me.txtActualTemperature.BorderColor = System.Drawing.Color.Black
        Me.txtActualTemperature.BorderWidth = 0
        Me.txtActualTemperature.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.txtActualTemperature.EditMode = False
        Me.txtActualTemperature.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtActualTemperature.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtActualTemperature.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtActualTemperature.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtActualTemperature.Location = New System.Drawing.Point(299, 436)
        Me.txtActualTemperature.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtActualTemperature.Name = "txtActualTemperature"
        Me.txtActualTemperature.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtActualTemperature.Radius = 55
        Me.txtActualTemperature.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtActualTemperature.ShadowColor = System.Drawing.Color.LightGray
        Me.txtActualTemperature.ShadowWidth = 2
        Me.txtActualTemperature.Size = New System.Drawing.Size(90, 66)
        Me.txtActualTemperature.TabIndex = 56
        Me.txtActualTemperature.Text = "20°C"
        Me.txtActualTemperature.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtActualTemperature.TextAngle = 0
        '
        'txtActualViscosity
        '
        Me.txtActualViscosity.BackColorFaded1 = System.Drawing.Color.White
        Me.txtActualViscosity.BackColorFaded2 = System.Drawing.Color.White
        Me.txtActualViscosity.BorderColor = System.Drawing.Color.Black
        Me.txtActualViscosity.BorderWidth = 0
        Me.txtActualViscosity.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.txtActualViscosity.EditMode = False
        Me.txtActualViscosity.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtActualViscosity.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtActualViscosity.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtActualViscosity.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtActualViscosity.Location = New System.Drawing.Point(196, 436)
        Me.txtActualViscosity.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtActualViscosity.Name = "txtActualViscosity"
        Me.txtActualViscosity.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtActualViscosity.Radius = 55
        Me.txtActualViscosity.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtActualViscosity.ShadowColor = System.Drawing.Color.LightGray
        Me.txtActualViscosity.ShadowWidth = 2
        Me.txtActualViscosity.Size = New System.Drawing.Size(90, 66)
        Me.txtActualViscosity.TabIndex = 55
        Me.txtActualViscosity.Text = "25.5s"
        Me.txtActualViscosity.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtActualViscosity.TextAngle = 0
        '
        'txtRefViscosity
        '
        Me.txtRefViscosity.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtRefViscosity.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtRefViscosity.BorderColor = System.Drawing.Color.Black
        Me.txtRefViscosity.BorderWidth = 0
        Me.txtRefViscosity.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtRefViscosity.EditMode = False
        Me.txtRefViscosity.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtRefViscosity.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtRefViscosity.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtRefViscosity.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtRefViscosity.Location = New System.Drawing.Point(196, 538)
        Me.txtRefViscosity.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtRefViscosity.Name = "txtRefViscosity"
        Me.txtRefViscosity.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtRefViscosity.Radius = 55
        Me.txtRefViscosity.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtRefViscosity.ShadowColor = System.Drawing.Color.LightGray
        Me.txtRefViscosity.ShadowWidth = 2
        Me.txtRefViscosity.Size = New System.Drawing.Size(90, 66)
        Me.txtRefViscosity.TabIndex = 53
        Me.txtRefViscosity.Text = "20.0s"
        Me.txtRefViscosity.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtRefViscosity.TextAngle = 0
        '
        'cmdReference
        '
        Me.cmdReference.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdReference.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdReference.BorderColor = System.Drawing.Color.Black
        Me.cmdReference.BorderWidth = 0
        Me.cmdReference.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.cmdReference.EditMode = False
        Me.cmdReference.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdReference.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdReference.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdReference.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdReference.Location = New System.Drawing.Point(10, 538)
        Me.cmdReference.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdReference.Name = "cmdReference"
        Me.cmdReference.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdReference.Radius = 55
        Me.cmdReference.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdReference.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdReference.ShadowWidth = 2
        Me.cmdReference.Size = New System.Drawing.Size(170, 66)
        Me.cmdReference.TabIndex = 52
        Me.cmdReference.Text = "Reference"
        Me.cmdReference.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdReference.TextAngle = 0
        '
        'cmdActual
        '
        Me.cmdActual.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdActual.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdActual.BorderColor = System.Drawing.Color.Black
        Me.cmdActual.BorderWidth = 0
        Me.cmdActual.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.cmdActual.EditMode = False
        Me.cmdActual.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdActual.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdActual.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdActual.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdActual.Location = New System.Drawing.Point(10, 436)
        Me.cmdActual.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdActual.Name = "cmdActual"
        Me.cmdActual.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdActual.Radius = 55
        Me.cmdActual.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdActual.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdActual.ShadowWidth = 2
        Me.cmdActual.Size = New System.Drawing.Size(170, 66)
        Me.cmdActual.TabIndex = 51
        Me.cmdActual.Text = "Actual"
        Me.cmdActual.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdActual.TextAngle = 0
        '
        'cmdClean
        '
        Me.cmdClean.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdClean.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdClean.BorderColor = System.Drawing.Color.Black
        Me.cmdClean.BorderWidth = 0
        Me.cmdClean.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdClean.EditMode = False
        Me.cmdClean.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdClean.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdClean.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdClean.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdClean.Location = New System.Drawing.Point(10, 334)
        Me.cmdClean.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdClean.Name = "cmdClean"
        Me.cmdClean.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdClean.Radius = 55
        Me.cmdClean.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdClean.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdClean.ShadowWidth = 2
        Me.cmdClean.Size = New System.Drawing.Size(170, 66)
        Me.cmdClean.TabIndex = 50
        Me.cmdClean.Text = "Wash"
        Me.cmdClean.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdClean.TextAngle = 0
        '
        'cmdSolvent
        '
        Me.cmdSolvent.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdSolvent.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdSolvent.BorderColor = System.Drawing.Color.Black
        Me.cmdSolvent.BorderWidth = 0
        Me.cmdSolvent.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdSolvent.EditMode = False
        Me.cmdSolvent.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdSolvent.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdSolvent.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdSolvent.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdSolvent.Location = New System.Drawing.Point(10, 232)
        Me.cmdSolvent.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdSolvent.Name = "cmdSolvent"
        Me.cmdSolvent.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdSolvent.Radius = 55
        Me.cmdSolvent.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdSolvent.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdSolvent.ShadowWidth = 2
        Me.cmdSolvent.Size = New System.Drawing.Size(170, 66)
        Me.cmdSolvent.TabIndex = 49
        Me.cmdSolvent.Text = "Solvent"
        Me.cmdSolvent.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdSolvent.TextAngle = 0
        '
        'cmdInk
        '
        Me.cmdInk.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdInk.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdInk.BorderColor = System.Drawing.Color.Black
        Me.cmdInk.BorderWidth = 0
        Me.cmdInk.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdInk.EditMode = False
        Me.cmdInk.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdInk.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdInk.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdInk.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdInk.Location = New System.Drawing.Point(10, 130)
        Me.cmdInk.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdInk.Name = "cmdInk"
        Me.cmdInk.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdInk.Radius = 55
        Me.cmdInk.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdInk.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdInk.ShadowWidth = 2
        Me.cmdInk.Size = New System.Drawing.Size(170, 66)
        Me.cmdInk.TabIndex = 48
        Me.cmdInk.Text = "Ink"
        Me.cmdInk.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdInk.TextAngle = 0
        '
        'cmdViscosityMode
        '
        Me.cmdViscosityMode.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdViscosityMode.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdViscosityMode.BorderColor = System.Drawing.Color.Black
        Me.cmdViscosityMode.BorderWidth = 0
        Me.cmdViscosityMode.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.cmdViscosityMode.EditMode = False
        Me.cmdViscosityMode.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdViscosityMode.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdViscosityMode.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdViscosityMode.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdViscosityMode.Location = New System.Drawing.Point(10, 28)
        Me.cmdViscosityMode.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdViscosityMode.Name = "cmdViscosityMode"
        Me.cmdViscosityMode.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdViscosityMode.Radius = 55
        Me.cmdViscosityMode.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdViscosityMode.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdViscosityMode.ShadowWidth = 2
        Me.cmdViscosityMode.Size = New System.Drawing.Size(170, 66)
        Me.cmdViscosityMode.TabIndex = 47
        Me.cmdViscosityMode.Text = "Mode"
        Me.cmdViscosityMode.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdViscosityMode.TextAngle = 0
        '
        'pnlRegister
        '
        Me.pnlRegister.Controls.Add(Me.cmdMoveNext)
        Me.pnlRegister.Controls.Add(Me.picRegisterLateral)
        Me.pnlRegister.Controls.Add(Me.txtRegisterLateral)
        Me.pnlRegister.Controls.Add(Me.txtRegisterLongitudinal)
        Me.pnlRegister.Controls.Add(Me.picRegisterLongitudinalAction)
        Me.pnlRegister.Controls.Add(Me.picRegisterLateralAction)
        Me.pnlRegister.Controls.Add(Me.cmdRegisterMode)
        Me.pnlRegister.Controls.Add(Me.picRegisterLongitudinal)
        Me.pnlRegister.Controls.Add(Me.picRegisterRight)
        Me.pnlRegister.Controls.Add(Me.picRegisterLeft)
        Me.pnlRegister.Controls.Add(Me.picRegisterTop)
        Me.pnlRegister.Controls.Add(Me.picRegisterBottom)
        Me.pnlRegister.Controls.Add(Me.cmdRegisterRight)
        Me.pnlRegister.Controls.Add(Me.cmdRegisterLeft)
        Me.pnlRegister.Controls.Add(Me.cmdRegisterBottom)
        Me.pnlRegister.Controls.Add(Me.cmdRegisterTop)
        Me.pnlRegister.Controls.Add(Me.pnlRegisterDirections)
        Me.pnlRegister.Controls.Add(Me.pnlRegisterLongitudinal)
        Me.pnlRegister.Controls.Add(Me.pnlRegisterLateral)
        Me.pnlRegister.Controls.Add(Me.guiRegisterCross)
        Me.pnlRegister.Controls.Add(Me.txtRegisterMode)
        Me.pnlRegister.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlRegister.Location = New System.Drawing.Point(427, 11)
        Me.pnlRegister.Name = "pnlRegister"
        Me.pnlRegister.Size = New System.Drawing.Size(410, 667)
        Me.pnlRegister.TabIndex = 3
        '
        'cmdMoveNext
        '
        Me.cmdMoveNext.BackColorFaded1 = System.Drawing.Color.Red
        Me.cmdMoveNext.BackColorFaded2 = System.Drawing.Color.Red
        Me.cmdMoveNext.BorderColor = System.Drawing.Color.Black
        Me.cmdMoveNext.BorderWidth = 0
        Me.cmdMoveNext.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveNext.EditMode = False
        Me.cmdMoveNext.Font = New System.Drawing.Font("Wingdings 3", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdMoveNext.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMoveNext.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMoveNext.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMoveNext.Location = New System.Drawing.Point(84, 605)
        Me.cmdMoveNext.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdMoveNext.Name = "cmdMoveNext"
        Me.cmdMoveNext.Radius = 55
        Me.cmdMoveNext.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMoveNext.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMoveNext.ShadowWidth = 2
        Me.cmdMoveNext.Size = New System.Drawing.Size(64, 64)
        Me.cmdMoveNext.TabIndex = 78
        Me.cmdMoveNext.Text = "Æ"
        Me.cmdMoveNext.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMoveNext.TextAngle = 0
        '
        'picRegisterLateral
        '
        Me.picRegisterLateral.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.picRegisterLateral.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.picRegisterLateral.Location = New System.Drawing.Point(331, 149)
        Me.picRegisterLateral.Name = "picRegisterLateral"
        Me.picRegisterLateral.Size = New System.Drawing.Size(29, 29)
        Me.picRegisterLateral.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRegisterLateral.TabIndex = 89
        Me.picRegisterLateral.TabStop = False
        '
        'txtRegisterLateral
        '
        Me.txtRegisterLateral.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtRegisterLateral.BackColorFaded1 = System.Drawing.Color.White
        Me.txtRegisterLateral.BackColorFaded2 = System.Drawing.Color.White
        Me.txtRegisterLateral.BorderColor = System.Drawing.Color.Black
        Me.txtRegisterLateral.BorderWidth = 0
        Me.txtRegisterLateral.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.txtRegisterLateral.EditMode = False
        Me.txtRegisterLateral.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtRegisterLateral.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtRegisterLateral.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtRegisterLateral.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtRegisterLateral.Location = New System.Drawing.Point(300, 187)
        Me.txtRegisterLateral.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtRegisterLateral.Name = "txtRegisterLateral"
        Me.txtRegisterLateral.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtRegisterLateral.Radius = 55
        Me.txtRegisterLateral.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtRegisterLateral.ShadowColor = System.Drawing.Color.LightGray
        Me.txtRegisterLateral.ShadowWidth = 2
        Me.txtRegisterLateral.Size = New System.Drawing.Size(90, 66)
        Me.txtRegisterLateral.TabIndex = 88
        Me.txtRegisterLateral.Text = "25.5s"
        Me.txtRegisterLateral.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtRegisterLateral.TextAngle = 0
        '
        'txtRegisterLongitudinal
        '
        Me.txtRegisterLongitudinal.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtRegisterLongitudinal.BackColorFaded1 = System.Drawing.Color.White
        Me.txtRegisterLongitudinal.BackColorFaded2 = System.Drawing.Color.White
        Me.txtRegisterLongitudinal.BorderColor = System.Drawing.Color.Black
        Me.txtRegisterLongitudinal.BorderWidth = 0
        Me.txtRegisterLongitudinal.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.txtRegisterLongitudinal.EditMode = False
        Me.txtRegisterLongitudinal.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtRegisterLongitudinal.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtRegisterLongitudinal.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtRegisterLongitudinal.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtRegisterLongitudinal.Location = New System.Drawing.Point(300, 318)
        Me.txtRegisterLongitudinal.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtRegisterLongitudinal.Name = "txtRegisterLongitudinal"
        Me.txtRegisterLongitudinal.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtRegisterLongitudinal.Radius = 55
        Me.txtRegisterLongitudinal.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtRegisterLongitudinal.ShadowColor = System.Drawing.Color.LightGray
        Me.txtRegisterLongitudinal.ShadowWidth = 2
        Me.txtRegisterLongitudinal.Size = New System.Drawing.Size(90, 66)
        Me.txtRegisterLongitudinal.TabIndex = 66
        Me.txtRegisterLongitudinal.Text = "25.5s"
        Me.txtRegisterLongitudinal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtRegisterLongitudinal.TextAngle = 0
        '
        'picRegisterLongitudinalAction
        '
        Me.picRegisterLongitudinalAction.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.picRegisterLongitudinalAction.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.picRegisterLongitudinalAction.Location = New System.Drawing.Point(310, 288)
        Me.picRegisterLongitudinalAction.Name = "picRegisterLongitudinalAction"
        Me.picRegisterLongitudinalAction.Size = New System.Drawing.Size(15, 15)
        Me.picRegisterLongitudinalAction.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRegisterLongitudinalAction.TabIndex = 85
        Me.picRegisterLongitudinalAction.TabStop = False
        Me.picRegisterLongitudinalAction.Visible = False
        '
        'picRegisterLateralAction
        '
        Me.picRegisterLateralAction.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.picRegisterLateralAction.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.picRegisterLateralAction.Location = New System.Drawing.Point(310, 157)
        Me.picRegisterLateralAction.Name = "picRegisterLateralAction"
        Me.picRegisterLateralAction.Size = New System.Drawing.Size(15, 15)
        Me.picRegisterLateralAction.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRegisterLateralAction.TabIndex = 84
        Me.picRegisterLateralAction.TabStop = False
        Me.picRegisterLateralAction.Visible = False
        '
        'cmdRegisterMode
        '
        Me.cmdRegisterMode.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRegisterMode.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRegisterMode.BorderColor = System.Drawing.Color.Black
        Me.cmdRegisterMode.BorderWidth = 0
        Me.cmdRegisterMode.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.cmdRegisterMode.EditMode = False
        Me.cmdRegisterMode.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdRegisterMode.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterMode.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdRegisterMode.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdRegisterMode.Location = New System.Drawing.Point(23, 28)
        Me.cmdRegisterMode.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdRegisterMode.Name = "cmdRegisterMode"
        Me.cmdRegisterMode.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdRegisterMode.Radius = 55
        Me.cmdRegisterMode.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdRegisterMode.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdRegisterMode.ShadowWidth = 2
        Me.cmdRegisterMode.Size = New System.Drawing.Size(195, 66)
        Me.cmdRegisterMode.TabIndex = 66
        Me.cmdRegisterMode.Text = "Mode"
        Me.cmdRegisterMode.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdRegisterMode.TextAngle = 0
        '
        'picRegisterLongitudinal
        '
        Me.picRegisterLongitudinal.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.picRegisterLongitudinal.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.picRegisterLongitudinal.Location = New System.Drawing.Point(331, 280)
        Me.picRegisterLongitudinal.Name = "picRegisterLongitudinal"
        Me.picRegisterLongitudinal.Size = New System.Drawing.Size(29, 29)
        Me.picRegisterLongitudinal.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRegisterLongitudinal.TabIndex = 82
        Me.picRegisterLongitudinal.TabStop = False
        '
        'picRegisterRight
        '
        Me.picRegisterRight.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.picRegisterRight.Location = New System.Drawing.Point(189, 490)
        Me.picRegisterRight.Name = "picRegisterRight"
        Me.picRegisterRight.Size = New System.Drawing.Size(29, 29)
        Me.picRegisterRight.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRegisterRight.TabIndex = 81
        Me.picRegisterRight.TabStop = False
        '
        'picRegisterLeft
        '
        Me.picRegisterLeft.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.picRegisterLeft.Location = New System.Drawing.Point(77, 490)
        Me.picRegisterLeft.Name = "picRegisterLeft"
        Me.picRegisterLeft.Size = New System.Drawing.Size(29, 29)
        Me.picRegisterLeft.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRegisterLeft.TabIndex = 80
        Me.picRegisterLeft.TabStop = False
        '
        'picRegisterTop
        '
        Me.picRegisterTop.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.picRegisterTop.Location = New System.Drawing.Point(134, 434)
        Me.picRegisterTop.Name = "picRegisterTop"
        Me.picRegisterTop.Size = New System.Drawing.Size(29, 29)
        Me.picRegisterTop.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRegisterTop.TabIndex = 79
        Me.picRegisterTop.TabStop = False
        '
        'picRegisterBottom
        '
        Me.picRegisterBottom.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.picRegisterBottom.Location = New System.Drawing.Point(134, 544)
        Me.picRegisterBottom.Name = "picRegisterBottom"
        Me.picRegisterBottom.Size = New System.Drawing.Size(29, 29)
        Me.picRegisterBottom.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRegisterBottom.TabIndex = 78
        Me.picRegisterBottom.TabStop = False
        '
        'cmdRegisterRight
        '
        Me.cmdRegisterRight.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRegisterRight.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterRight.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterRight.BorderColor = System.Drawing.Color.Black
        Me.cmdRegisterRight.BorderWidth = 0
        Me.cmdRegisterRight.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdRegisterRight.EditMode = False
        Me.cmdRegisterRight.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdRegisterRight.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRegisterRight.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdRegisterRight.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdRegisterRight.Location = New System.Drawing.Point(171, 472)
        Me.cmdRegisterRight.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdRegisterRight.Name = "cmdRegisterRight"
        Me.cmdRegisterRight.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdRegisterRight.Radius = 55
        Me.cmdRegisterRight.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdRegisterRight.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdRegisterRight.ShadowWidth = 2
        Me.cmdRegisterRight.Size = New System.Drawing.Size(66, 66)
        Me.cmdRegisterRight.TabIndex = 77
        Me.cmdRegisterRight.Text = ""
        Me.cmdRegisterRight.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdRegisterRight.TextAngle = 0
        '
        'cmdRegisterLeft
        '
        Me.cmdRegisterLeft.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRegisterLeft.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterLeft.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterLeft.BorderColor = System.Drawing.Color.Black
        Me.cmdRegisterLeft.BorderWidth = 0
        Me.cmdRegisterLeft.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdRegisterLeft.EditMode = False
        Me.cmdRegisterLeft.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdRegisterLeft.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRegisterLeft.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdRegisterLeft.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdRegisterLeft.Location = New System.Drawing.Point(59, 472)
        Me.cmdRegisterLeft.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdRegisterLeft.Name = "cmdRegisterLeft"
        Me.cmdRegisterLeft.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdRegisterLeft.Radius = 55
        Me.cmdRegisterLeft.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdRegisterLeft.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdRegisterLeft.ShadowWidth = 2
        Me.cmdRegisterLeft.Size = New System.Drawing.Size(66, 66)
        Me.cmdRegisterLeft.TabIndex = 76
        Me.cmdRegisterLeft.Text = ""
        Me.cmdRegisterLeft.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdRegisterLeft.TextAngle = 0
        '
        'cmdRegisterBottom
        '
        Me.cmdRegisterBottom.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRegisterBottom.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterBottom.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterBottom.BorderColor = System.Drawing.Color.Black
        Me.cmdRegisterBottom.BorderWidth = 0
        Me.cmdRegisterBottom.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdRegisterBottom.EditMode = False
        Me.cmdRegisterBottom.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdRegisterBottom.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRegisterBottom.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdRegisterBottom.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdRegisterBottom.Location = New System.Drawing.Point(116, 527)
        Me.cmdRegisterBottom.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdRegisterBottom.Name = "cmdRegisterBottom"
        Me.cmdRegisterBottom.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdRegisterBottom.Radius = 55
        Me.cmdRegisterBottom.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdRegisterBottom.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdRegisterBottom.ShadowWidth = 2
        Me.cmdRegisterBottom.Size = New System.Drawing.Size(66, 66)
        Me.cmdRegisterBottom.TabIndex = 75
        Me.cmdRegisterBottom.Text = ""
        Me.cmdRegisterBottom.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdRegisterBottom.TextAngle = 0
        '
        'cmdRegisterTop
        '
        Me.cmdRegisterTop.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRegisterTop.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterTop.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdRegisterTop.BorderColor = System.Drawing.Color.Black
        Me.cmdRegisterTop.BorderWidth = 0
        Me.cmdRegisterTop.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdRegisterTop.EditMode = False
        Me.cmdRegisterTop.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdRegisterTop.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdRegisterTop.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdRegisterTop.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdRegisterTop.Location = New System.Drawing.Point(116, 417)
        Me.cmdRegisterTop.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdRegisterTop.Name = "cmdRegisterTop"
        Me.cmdRegisterTop.NavigationID = Zelo.Luma.NavigationPages.None
        Me.cmdRegisterTop.Radius = 55
        Me.cmdRegisterTop.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdRegisterTop.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdRegisterTop.ShadowWidth = 2
        Me.cmdRegisterTop.Size = New System.Drawing.Size(66, 66)
        Me.cmdRegisterTop.TabIndex = 74
        Me.cmdRegisterTop.Text = ""
        Me.cmdRegisterTop.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdRegisterTop.TextAngle = 0
        '
        'pnlRegisterDirections
        '
        Me.pnlRegisterDirections.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.pnlRegisterDirections.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.pnlRegisterDirections.BorderColor = System.Drawing.Color.Black
        Me.pnlRegisterDirections.BorderWidth = 0
        Me.pnlRegisterDirections.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.pnlRegisterDirections.EditMode = False
        Me.pnlRegisterDirections.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.pnlRegisterDirections.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.pnlRegisterDirections.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.pnlRegisterDirections.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.pnlRegisterDirections.Location = New System.Drawing.Point(49, 406)
        Me.pnlRegisterDirections.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.pnlRegisterDirections.Name = "pnlRegisterDirections"
        Me.pnlRegisterDirections.NavigationID = Zelo.Luma.NavigationPages.None
        Me.pnlRegisterDirections.Radius = 55
        Me.pnlRegisterDirections.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.pnlRegisterDirections.ShadowColor = System.Drawing.Color.LightGray
        Me.pnlRegisterDirections.ShadowWidth = 2
        Me.pnlRegisterDirections.Size = New System.Drawing.Size(200, 200)
        Me.pnlRegisterDirections.TabIndex = 73
        Me.pnlRegisterDirections.Text = ""
        Me.pnlRegisterDirections.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.pnlRegisterDirections.TextAngle = 0
        '
        'pnlRegisterLongitudinal
        '
        Me.pnlRegisterLongitudinal.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.pnlRegisterLongitudinal.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.pnlRegisterLongitudinal.BorderColor = System.Drawing.Color.Black
        Me.pnlRegisterLongitudinal.BorderWidth = 0
        Me.pnlRegisterLongitudinal.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.pnlRegisterLongitudinal.EditMode = False
        Me.pnlRegisterLongitudinal.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.pnlRegisterLongitudinal.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.pnlRegisterLongitudinal.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.pnlRegisterLongitudinal.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.pnlRegisterLongitudinal.Location = New System.Drawing.Point(287, 266)
        Me.pnlRegisterLongitudinal.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.pnlRegisterLongitudinal.Name = "pnlRegisterLongitudinal"
        Me.pnlRegisterLongitudinal.NavigationID = Zelo.Luma.NavigationPages.None
        Me.pnlRegisterLongitudinal.Radius = 55
        Me.pnlRegisterLongitudinal.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.pnlRegisterLongitudinal.ShadowColor = System.Drawing.Color.LightGray
        Me.pnlRegisterLongitudinal.ShadowWidth = 2
        Me.pnlRegisterLongitudinal.Size = New System.Drawing.Size(124, 134)
        Me.pnlRegisterLongitudinal.TabIndex = 72
        Me.pnlRegisterLongitudinal.Text = ""
        Me.pnlRegisterLongitudinal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.pnlRegisterLongitudinal.TextAngle = 0
        '
        'pnlRegisterLateral
        '
        Me.pnlRegisterLateral.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.pnlRegisterLateral.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.pnlRegisterLateral.BorderColor = System.Drawing.Color.Black
        Me.pnlRegisterLateral.BorderWidth = 0
        Me.pnlRegisterLateral.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.pnlRegisterLateral.EditMode = False
        Me.pnlRegisterLateral.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.pnlRegisterLateral.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.pnlRegisterLateral.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.pnlRegisterLateral.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.pnlRegisterLateral.Location = New System.Drawing.Point(287, 130)
        Me.pnlRegisterLateral.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.pnlRegisterLateral.Name = "pnlRegisterLateral"
        Me.pnlRegisterLateral.NavigationID = Zelo.Luma.NavigationPages.None
        Me.pnlRegisterLateral.Radius = 55
        Me.pnlRegisterLateral.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.pnlRegisterLateral.ShadowColor = System.Drawing.Color.LightGray
        Me.pnlRegisterLateral.ShadowWidth = 2
        Me.pnlRegisterLateral.Size = New System.Drawing.Size(124, 134)
        Me.pnlRegisterLateral.TabIndex = 70
        Me.pnlRegisterLateral.Text = ""
        Me.pnlRegisterLateral.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.pnlRegisterLateral.TextAngle = 0
        '
        'guiRegisterCross
        '
        Me.guiRegisterCross.Location = New System.Drawing.Point(10, 130)
        Me.guiRegisterCross.Margin = New System.Windows.Forms.Padding(0)
        Me.guiRegisterCross.Name = "guiRegisterCross"
        Me.guiRegisterCross.Size = New System.Drawing.Size(282, 270)
        Me.guiRegisterCross.TabIndex = 69
        '
        'txtRegisterMode
        '
        Me.txtRegisterMode.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtRegisterMode.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtRegisterMode.BorderColor = System.Drawing.Color.Black
        Me.txtRegisterMode.BorderWidth = 0
        Me.txtRegisterMode.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtRegisterMode.EditMode = False
        Me.txtRegisterMode.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtRegisterMode.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtRegisterMode.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtRegisterMode.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtRegisterMode.Location = New System.Drawing.Point(220, 28)
        Me.txtRegisterMode.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.txtRegisterMode.Name = "txtRegisterMode"
        Me.txtRegisterMode.NavigationID = Zelo.Luma.NavigationPages.None
        Me.txtRegisterMode.Radius = 55
        Me.txtRegisterMode.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtRegisterMode.ShadowColor = System.Drawing.Color.LightGray
        Me.txtRegisterMode.ShadowWidth = 2
        Me.txtRegisterMode.Size = New System.Drawing.Size(189, 66)
        Me.txtRegisterMode.TabIndex = 67
        Me.txtRegisterMode.Text = "Auto"
        Me.txtRegisterMode.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtRegisterMode.TextAngle = 0
        '
        'cmdParameters
        '
        Me.cmdParameters.BackColorFaded1 = System.Drawing.Color.Red
        Me.cmdParameters.BackColorFaded2 = System.Drawing.Color.Red
        Me.cmdParameters.BorderColor = System.Drawing.Color.Black
        Me.cmdParameters.BorderWidth = 0
        Me.cmdParameters.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdParameters.EditMode = False
        Me.cmdParameters.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdParameters.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdParameters.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdParameters.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdParameters.Location = New System.Drawing.Point(330, 615)
        Me.cmdParameters.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.cmdParameters.Name = "cmdParameters"
        Me.cmdParameters.NavigationID = Zelo.Luma.NavigationPages.RegisterViscosityControlParameter
        Me.cmdParameters.Radius = 55
        Me.cmdParameters.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdParameters.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdParameters.ShadowWidth = 2
        Me.cmdParameters.Size = New System.Drawing.Size(180, 66)
        Me.cmdParameters.TabIndex = 76
        Me.cmdParameters.Text = "Parameters"
        Me.cmdParameters.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdParameters.TextAngle = 0
        '
        'lblGroupNumber
        '
        Me.lblGroupNumber.BackColorFaded1 = System.Drawing.Color.Red
        Me.lblGroupNumber.BackColorFaded2 = System.Drawing.Color.Red
        Me.lblGroupNumber.BorderColor = System.Drawing.Color.Black
        Me.lblGroupNumber.BorderWidth = 0
        Me.lblGroupNumber.Cursor = System.Windows.Forms.Cursors.Default
        Me.lblGroupNumber.EditMode = False
        Me.lblGroupNumber.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblGroupNumber.ForeColor = System.Drawing.Color.White
        Me.lblGroupNumber.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblGroupNumber.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblGroupNumber.Location = New System.Drawing.Point(387, -2)
        Me.lblGroupNumber.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblGroupNumber.Name = "lblGroupNumber"
        Me.lblGroupNumber.NavigationID = Zelo.Luma.NavigationPages.None
        Me.lblGroupNumber.Radius = 55
        Me.lblGroupNumber.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblGroupNumber.ShadowColor = System.Drawing.Color.LightGray
        Me.lblGroupNumber.ShadowWidth = 2
        Me.lblGroupNumber.Size = New System.Drawing.Size(66, 66)
        Me.lblGroupNumber.TabIndex = 77
        Me.lblGroupNumber.Text = "2"
        Me.lblGroupNumber.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblGroupNumber.TextAngle = 0
        '
        'objTimerViscosityAction
        '
        Me.objTimerViscosityAction.Enabled = True
        Me.objTimerViscosityAction.Interval = 500
        '
        'objTimerRegisterLateralAction
        '
        Me.objTimerRegisterLateralAction.Enabled = True
        Me.objTimerRegisterLateralAction.Interval = 500
        '
        'objTimerRegisterLongitudinalAction
        '
        Me.objTimerRegisterLongitudinalAction.Enabled = True
        Me.objTimerRegisterLongitudinalAction.Interval = 500
        '
        'cmdMovePrevious
        '
        Me.cmdMovePrevious.BackColorFaded1 = System.Drawing.Color.Red
        Me.cmdMovePrevious.BackColorFaded2 = System.Drawing.Color.Red
        Me.cmdMovePrevious.BorderColor = System.Drawing.Color.Black
        Me.cmdMovePrevious.BorderWidth = 0
        Me.cmdMovePrevious.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMovePrevious.EditMode = False
        Me.cmdMovePrevious.Font = New System.Drawing.Font("Wingdings 3", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdMovePrevious.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdMovePrevious.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdMovePrevious.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdMovePrevious.Location = New System.Drawing.Point(266, 616)
        Me.cmdMovePrevious.Margin = New System.Windows.Forms.Padding(0)
        Me.cmdMovePrevious.Name = "cmdMovePrevious"
        Me.cmdMovePrevious.Radius = 55
        Me.cmdMovePrevious.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdMovePrevious.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdMovePrevious.ShadowWidth = 2
        Me.cmdMovePrevious.Size = New System.Drawing.Size(64, 64)
        Me.cmdMovePrevious.TabIndex = 79
        Me.cmdMovePrevious.Text = "Å"
        Me.cmdMovePrevious.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdMovePrevious.TextAngle = 0
        '
        'CurrentJobRegisterViscosityControlDetail
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.Controls.Add(Me.cmdMovePrevious)
        Me.Controls.Add(Me.lblGroupNumber)
        Me.Controls.Add(Me.cmdParameters)
        Me.Controls.Add(Me.tblTotal)
        Me.Name = "CurrentJobRegisterViscosityControlDetail"
        Me.Controls.SetChildIndex(Me.tblTotal, 0)
        Me.Controls.SetChildIndex(Me.cmdParameters, 0)
        Me.Controls.SetChildIndex(Me.lblGroupNumber, 0)
        Me.Controls.SetChildIndex(Me.cmdMovePrevious, 0)
        Me.tblTotal.ResumeLayout(False)
        Me.pnlViscosity.ResumeLayout(False)
        Me.pnlViscosity.PerformLayout()
        CType(Me.picViscosityAction, System.ComponentModel.ISupportInitialize).EndInit()
        Me.pnlRegister.ResumeLayout(False)
        Me.pnlRegister.PerformLayout()
        CType(Me.picRegisterLateral, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picRegisterLongitudinalAction, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picRegisterLateralAction, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picRegisterLongitudinal, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picRegisterRight, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picRegisterLeft, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picRegisterTop, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picRegisterBottom, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents tblTotal As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents pnlHorizontalLine As System.Windows.Forms.Panel
    Friend WithEvents pnlVerticalLine As System.Windows.Forms.Panel
    Friend WithEvents pnlViscosity As System.Windows.Forms.Panel
    Friend WithEvents pnlRegister As System.Windows.Forms.Panel
    Friend WithEvents txtViscosityMode As Zelo.Luma.GUINavigation
    Friend WithEvents txtActualTemperature As Zelo.Luma.GUINavigation
    Friend WithEvents txtActualViscosity As Zelo.Luma.GUINavigation
    Friend WithEvents txtRefViscosity As Zelo.Luma.GUINavigation
    Friend WithEvents cmdReference As Zelo.Luma.GUINavigation
    Friend WithEvents cmdActual As Zelo.Luma.GUINavigation
    Friend WithEvents cmdClean As Zelo.Luma.GUINavigation
    Friend WithEvents cmdSolvent As Zelo.Luma.GUINavigation
    Friend WithEvents cmdInk As Zelo.Luma.GUINavigation
    Friend WithEvents cmdViscosityMode As Zelo.Luma.GUINavigation
    Friend WithEvents pnlBackgroundTemperature As Zelo.Luma.GUINavigation
    Friend WithEvents pnlBackgroundViscosity As Zelo.Luma.GUINavigation
    Friend WithEvents guiTermometer As Zelo.Luma.GUITermometer
    Friend WithEvents guiViscosity As Zelo.Luma.GUIViscosity
    Friend WithEvents lblVerticalViscosity As Zelo.Luma.GUIButton
    Friend WithEvents lblVerticalTemperature As Zelo.Luma.GUIButton
    Friend WithEvents cmdRegisterMode As Zelo.Luma.GUINavigation
    Friend WithEvents txtRegisterMode As Zelo.Luma.GUINavigation
    Friend WithEvents pnlRegisterLongitudinal As Zelo.Luma.GUINavigation
    Friend WithEvents txtRegisterLongitudinal As Zelo.Luma.GUINavigation
    Friend WithEvents pnlRegisterLateral As Zelo.Luma.GUINavigation
    Friend WithEvents guiRegisterCross As Zelo.Luma.GUIRegisterCross
    Friend WithEvents pnlRegisterDirections As Zelo.Luma.GUINavigation
    Friend WithEvents cmdParameters As Zelo.Luma.GUINavigation
    Friend WithEvents cmdRegisterRight As Zelo.Luma.GUINavigation
    Friend WithEvents cmdRegisterLeft As Zelo.Luma.GUINavigation
    Friend WithEvents cmdRegisterBottom As Zelo.Luma.GUINavigation
    Friend WithEvents cmdRegisterTop As Zelo.Luma.GUINavigation
    Friend WithEvents picRegisterRight As System.Windows.Forms.PictureBox
    Friend WithEvents picRegisterLeft As System.Windows.Forms.PictureBox
    Friend WithEvents picRegisterTop As System.Windows.Forms.PictureBox
    Friend WithEvents picRegisterBottom As System.Windows.Forms.PictureBox
    Friend WithEvents picRegisterLongitudinal As System.Windows.Forms.PictureBox
    Friend WithEvents lblGroupNumber As Zelo.Luma.GUINavigation
    Friend WithEvents picRegisterLateralAction As System.Windows.Forms.PictureBox
    Friend WithEvents picRegisterLongitudinalAction As System.Windows.Forms.PictureBox
    Friend WithEvents picViscosityAction As System.Windows.Forms.PictureBox
    Friend WithEvents picRegisterLateral As System.Windows.Forms.PictureBox
    Friend WithEvents txtRegisterLateral As Zelo.Luma.GUINavigation
    Protected WithEvents objTimerRegisterLateralAction As System.Windows.Forms.Timer
    Protected WithEvents objTimerRegisterLongitudinalAction As System.Windows.Forms.Timer
    Protected WithEvents objTimerViscosityAction As System.Windows.Forms.Timer
    Friend WithEvents cmdMoveNext As Zelo.Luma.GUIButton
    Friend WithEvents cmdMovePrevious As Zelo.Luma.GUIButton

End Class
