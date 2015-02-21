<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class CurrentJobRegisterViscosityControlParameter
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
        Me.tblMain = New System.Windows.Forms.TableLayoutPanel
        Me.pnlDown = New System.Windows.Forms.Panel
        Me.tblDown = New System.Windows.Forms.TableLayoutPanel
        Me.pnlVerticalLine = New System.Windows.Forms.Panel
        Me.pnlViscosity = New System.Windows.Forms.Panel
        Me.lblViscosityActive = New Zelo.Luma.GUIButton
        Me.txtViscosityActive = New Zelo.Luma.GUIButton
        Me.lblViscosityParameter = New Zelo.Luma.GUIButton
        Me.txtTemperatureBoundMax = New Zelo.Luma.GUIButton
        Me.lblTemperatureBound = New Zelo.Luma.GUIButton
        Me.txtTemperatureBoundMin = New Zelo.Luma.GUIButton
        Me.txtViscosityBoundMax = New Zelo.Luma.GUIButton
        Me.lblViscosityBound = New Zelo.Luma.GUIButton
        Me.txtViscosityBoundMin = New Zelo.Luma.GUIButton
        Me.lblViscosityAllarms = New Zelo.Luma.GUIButton
        Me.lblTemperatureReal = New Zelo.Luma.GUIButton
        Me.txtTemperatureReal = New Zelo.Luma.GUIButton
        Me.lblViscosityReal = New Zelo.Luma.GUIButton
        Me.txtViscosityReal = New Zelo.Luma.GUIButton
        Me.lblViscosityCalibration = New Zelo.Luma.GUIButton
        Me.pnlRegister = New System.Windows.Forms.Panel
        Me.lblCylinderLength = New Zelo.Luma.GUIButton
        Me.txtCylinderLength = New Zelo.Luma.GUIButton
        Me.lblRegisterCyclic = New Zelo.Luma.GUIButton
        Me.txtRegisterCyclic = New Zelo.Luma.GUIButton
        Me.txtMarkPositionY = New Zelo.Luma.GUIButton
        Me.lblRegisterParameter = New Zelo.Luma.GUIButton
        Me.lblMarkPosition = New Zelo.Luma.GUIButton
        Me.txtMarkPositionX = New Zelo.Luma.GUIButton
        Me.lblRegisterSide = New Zelo.Luma.GUIButton
        Me.txtRegisterSide = New Zelo.Luma.GUIButton
        Me.lblMarkNumber = New Zelo.Luma.GUIButton
        Me.txtMarkNumber = New Zelo.Luma.GUIButton
        Me.lblBaseColor = New Zelo.Luma.GUIButton
        Me.txtBaseColor = New Zelo.Luma.GUIButton
        Me.lblLateralActive = New Zelo.Luma.GUIButton
        Me.txtActiveLateral = New Zelo.Luma.GUIButton
        Me.lblActiveLongitudinal = New Zelo.Luma.GUIButton
        Me.txtActiveLongitudinal = New Zelo.Luma.GUIButton
        Me.pnlHorizontalLine = New System.Windows.Forms.Panel
        Me.pnlTop = New System.Windows.Forms.Panel
        Me.lblGroupNumber = New Zelo.Luma.GUIButton
        Me.txtGroupNumber = New Zelo.Luma.GUIButton
        Me.lblGroupColor = New Zelo.Luma.GUIButton
        Me.txtGroupColor = New Zelo.Luma.GUIButton
        Me.tblMain.SuspendLayout()
        Me.pnlDown.SuspendLayout()
        Me.tblDown.SuspendLayout()
        Me.pnlViscosity.SuspendLayout()
        Me.pnlRegister.SuspendLayout()
        Me.pnlTop.SuspendLayout()
        Me.SuspendLayout()
        '
        'tblMain
        '
        Me.tblMain.ColumnCount = 1
        Me.tblMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100.0!))
        Me.tblMain.Controls.Add(Me.pnlDown, 0, 2)
        Me.tblMain.Controls.Add(Me.pnlHorizontalLine, 0, 1)
        Me.tblMain.Controls.Add(Me.pnlTop, 0, 0)
        Me.tblMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tblMain.Location = New System.Drawing.Point(0, 0)
        Me.tblMain.Name = "tblMain"
        Me.tblMain.RowCount = 3
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 8.0!))
        Me.tblMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 88.0!))
        Me.tblMain.Size = New System.Drawing.Size(840, 681)
        Me.tblMain.TabIndex = 1
        '
        'pnlDown
        '
        Me.pnlDown.Controls.Add(Me.tblDown)
        Me.pnlDown.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlDown.Location = New System.Drawing.Point(3, 91)
        Me.pnlDown.Name = "pnlDown"
        Me.pnlDown.Size = New System.Drawing.Size(834, 587)
        Me.pnlDown.TabIndex = 9
        '
        'tblDown
        '
        Me.tblDown.ColumnCount = 3
        Me.tblDown.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.tblDown.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 8.0!))
        Me.tblDown.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.tblDown.Controls.Add(Me.pnlVerticalLine, 0, 0)
        Me.tblDown.Controls.Add(Me.pnlViscosity, 0, 0)
        Me.tblDown.Controls.Add(Me.pnlRegister, 2, 0)
        Me.tblDown.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tblDown.Location = New System.Drawing.Point(0, 0)
        Me.tblDown.Name = "tblDown"
        Me.tblDown.RowCount = 1
        Me.tblDown.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100.0!))
        Me.tblDown.Size = New System.Drawing.Size(834, 587)
        Me.tblDown.TabIndex = 0
        '
        'pnlVerticalLine
        '
        Me.pnlVerticalLine.BackColor = System.Drawing.Color.Red
        Me.pnlVerticalLine.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlVerticalLine.Location = New System.Drawing.Point(413, 0)
        Me.pnlVerticalLine.Margin = New System.Windows.Forms.Padding(0)
        Me.pnlVerticalLine.Name = "pnlVerticalLine"
        Me.pnlVerticalLine.Size = New System.Drawing.Size(8, 587)
        Me.pnlVerticalLine.TabIndex = 9
        '
        'pnlViscosity
        '
        Me.pnlViscosity.Controls.Add(Me.lblViscosityActive)
        Me.pnlViscosity.Controls.Add(Me.txtViscosityActive)
        Me.pnlViscosity.Controls.Add(Me.lblViscosityParameter)
        Me.pnlViscosity.Controls.Add(Me.txtTemperatureBoundMax)
        Me.pnlViscosity.Controls.Add(Me.lblTemperatureBound)
        Me.pnlViscosity.Controls.Add(Me.txtTemperatureBoundMin)
        Me.pnlViscosity.Controls.Add(Me.txtViscosityBoundMax)
        Me.pnlViscosity.Controls.Add(Me.lblViscosityBound)
        Me.pnlViscosity.Controls.Add(Me.txtViscosityBoundMin)
        Me.pnlViscosity.Controls.Add(Me.lblViscosityAllarms)
        Me.pnlViscosity.Controls.Add(Me.lblTemperatureReal)
        Me.pnlViscosity.Controls.Add(Me.txtTemperatureReal)
        Me.pnlViscosity.Controls.Add(Me.lblViscosityReal)
        Me.pnlViscosity.Controls.Add(Me.txtViscosityReal)
        Me.pnlViscosity.Controls.Add(Me.lblViscosityCalibration)
        Me.pnlViscosity.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlViscosity.Location = New System.Drawing.Point(3, 3)
        Me.pnlViscosity.Name = "pnlViscosity"
        Me.pnlViscosity.Size = New System.Drawing.Size(407, 581)
        Me.pnlViscosity.TabIndex = 7
        '
        'lblViscosityActive
        '
        Me.lblViscosityActive.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityActive.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityActive.BorderColor = System.Drawing.Color.Black
        Me.lblViscosityActive.BorderWidth = 0
        Me.lblViscosityActive.EditMode = False
        Me.lblViscosityActive.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblViscosityActive.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblViscosityActive.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblViscosityActive.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblViscosityActive.Location = New System.Drawing.Point(23, 47)
        Me.lblViscosityActive.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblViscosityActive.Name = "lblViscosityActive"
        Me.lblViscosityActive.Radius = 55
        Me.lblViscosityActive.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblViscosityActive.ShadowColor = System.Drawing.Color.LightGray
        Me.lblViscosityActive.ShadowWidth = 2
        Me.lblViscosityActive.Size = New System.Drawing.Size(185, 66)
        Me.lblViscosityActive.TabIndex = 32
        Me.lblViscosityActive.Text = "Active"
        Me.lblViscosityActive.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblViscosityActive.TextAngle = 0
        '
        'txtViscosityActive
        '
        Me.txtViscosityActive.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtViscosityActive.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtViscosityActive.BorderColor = System.Drawing.Color.Black
        Me.txtViscosityActive.BorderWidth = 0
        Me.txtViscosityActive.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtViscosityActive.EditMode = False
        Me.txtViscosityActive.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtViscosityActive.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtViscosityActive.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtViscosityActive.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtViscosityActive.Location = New System.Drawing.Point(210, 47)
        Me.txtViscosityActive.Margin = New System.Windows.Forms.Padding(0)
        Me.txtViscosityActive.Name = "txtViscosityActive"
        Me.txtViscosityActive.Radius = 55
        Me.txtViscosityActive.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtViscosityActive.ShadowColor = System.Drawing.Color.LightGray
        Me.txtViscosityActive.ShadowWidth = 2
        Me.txtViscosityActive.Size = New System.Drawing.Size(87, 66)
        Me.txtViscosityActive.TabIndex = 33
        Me.txtViscosityActive.Text = "Yes"
        Me.txtViscosityActive.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtViscosityActive.TextAngle = 0
        '
        'lblViscosityParameter
        '
        Me.lblViscosityParameter.BackColorFaded1 = System.Drawing.Color.White
        Me.lblViscosityParameter.BackColorFaded2 = System.Drawing.Color.White
        Me.lblViscosityParameter.BorderColor = System.Drawing.Color.White
        Me.lblViscosityParameter.BorderWidth = 0
        Me.lblViscosityParameter.EditMode = False
        Me.lblViscosityParameter.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblViscosityParameter.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityParameter.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblViscosityParameter.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblViscosityParameter.Location = New System.Drawing.Point(-1, -23)
        Me.lblViscosityParameter.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblViscosityParameter.Name = "lblViscosityParameter"
        Me.lblViscosityParameter.Radius = 0
        Me.lblViscosityParameter.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblViscosityParameter.ShadowColor = System.Drawing.Color.LightGray
        Me.lblViscosityParameter.ShadowWidth = 0
        Me.lblViscosityParameter.Size = New System.Drawing.Size(405, 58)
        Me.lblViscosityParameter.TabIndex = 31
        Me.lblViscosityParameter.Text = "Viscosity Control Parameters"
        Me.lblViscosityParameter.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        Me.lblViscosityParameter.TextAngle = 0
        '
        'txtTemperatureBoundMax
        '
        Me.txtTemperatureBoundMax.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtTemperatureBoundMax.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtTemperatureBoundMax.BorderColor = System.Drawing.Color.Black
        Me.txtTemperatureBoundMax.BorderWidth = 0
        Me.txtTemperatureBoundMax.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtTemperatureBoundMax.EditMode = False
        Me.txtTemperatureBoundMax.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtTemperatureBoundMax.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtTemperatureBoundMax.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtTemperatureBoundMax.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtTemperatureBoundMax.Location = New System.Drawing.Point(301, 509)
        Me.txtTemperatureBoundMax.Margin = New System.Windows.Forms.Padding(0)
        Me.txtTemperatureBoundMax.Name = "txtTemperatureBoundMax"
        Me.txtTemperatureBoundMax.Radius = 55
        Me.txtTemperatureBoundMax.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtTemperatureBoundMax.ShadowColor = System.Drawing.Color.LightGray
        Me.txtTemperatureBoundMax.ShadowWidth = 2
        Me.txtTemperatureBoundMax.Size = New System.Drawing.Size(87, 66)
        Me.txtTemperatureBoundMax.TabIndex = 28
        Me.txtTemperatureBoundMax.Text = "20°"
        Me.txtTemperatureBoundMax.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtTemperatureBoundMax.TextAngle = 0
        '
        'lblTemperatureBound
        '
        Me.lblTemperatureBound.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblTemperatureBound.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblTemperatureBound.BorderColor = System.Drawing.Color.Black
        Me.lblTemperatureBound.BorderWidth = 0
        Me.lblTemperatureBound.EditMode = False
        Me.lblTemperatureBound.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblTemperatureBound.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblTemperatureBound.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblTemperatureBound.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblTemperatureBound.Location = New System.Drawing.Point(27, 509)
        Me.lblTemperatureBound.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblTemperatureBound.Name = "lblTemperatureBound"
        Me.lblTemperatureBound.Radius = 55
        Me.lblTemperatureBound.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblTemperatureBound.ShadowColor = System.Drawing.Color.LightGray
        Me.lblTemperatureBound.ShadowWidth = 2
        Me.lblTemperatureBound.Size = New System.Drawing.Size(185, 66)
        Me.lblTemperatureBound.TabIndex = 26
        Me.lblTemperatureBound.Text = "Temperature"
        Me.lblTemperatureBound.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblTemperatureBound.TextAngle = 0
        '
        'txtTemperatureBoundMin
        '
        Me.txtTemperatureBoundMin.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtTemperatureBoundMin.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtTemperatureBoundMin.BorderColor = System.Drawing.Color.Black
        Me.txtTemperatureBoundMin.BorderWidth = 0
        Me.txtTemperatureBoundMin.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtTemperatureBoundMin.EditMode = False
        Me.txtTemperatureBoundMin.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtTemperatureBoundMin.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtTemperatureBoundMin.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtTemperatureBoundMin.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtTemperatureBoundMin.Location = New System.Drawing.Point(214, 509)
        Me.txtTemperatureBoundMin.Margin = New System.Windows.Forms.Padding(0)
        Me.txtTemperatureBoundMin.Name = "txtTemperatureBoundMin"
        Me.txtTemperatureBoundMin.Radius = 55
        Me.txtTemperatureBoundMin.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtTemperatureBoundMin.ShadowColor = System.Drawing.Color.LightGray
        Me.txtTemperatureBoundMin.ShadowWidth = 2
        Me.txtTemperatureBoundMin.Size = New System.Drawing.Size(87, 66)
        Me.txtTemperatureBoundMin.TabIndex = 27
        Me.txtTemperatureBoundMin.Text = "12°"
        Me.txtTemperatureBoundMin.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtTemperatureBoundMin.TextAngle = 0
        '
        'txtViscosityBoundMax
        '
        Me.txtViscosityBoundMax.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtViscosityBoundMax.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtViscosityBoundMax.BorderColor = System.Drawing.Color.Black
        Me.txtViscosityBoundMax.BorderWidth = 0
        Me.txtViscosityBoundMax.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtViscosityBoundMax.EditMode = False
        Me.txtViscosityBoundMax.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtViscosityBoundMax.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtViscosityBoundMax.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtViscosityBoundMax.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtViscosityBoundMax.Location = New System.Drawing.Point(301, 443)
        Me.txtViscosityBoundMax.Margin = New System.Windows.Forms.Padding(0)
        Me.txtViscosityBoundMax.Name = "txtViscosityBoundMax"
        Me.txtViscosityBoundMax.Radius = 55
        Me.txtViscosityBoundMax.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtViscosityBoundMax.ShadowColor = System.Drawing.Color.LightGray
        Me.txtViscosityBoundMax.ShadowWidth = 2
        Me.txtViscosityBoundMax.Size = New System.Drawing.Size(87, 66)
        Me.txtViscosityBoundMax.TabIndex = 25
        Me.txtViscosityBoundMax.Text = "20.4s"
        Me.txtViscosityBoundMax.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtViscosityBoundMax.TextAngle = 0
        '
        'lblViscosityBound
        '
        Me.lblViscosityBound.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityBound.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityBound.BorderColor = System.Drawing.Color.Black
        Me.lblViscosityBound.BorderWidth = 0
        Me.lblViscosityBound.EditMode = False
        Me.lblViscosityBound.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblViscosityBound.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblViscosityBound.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblViscosityBound.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblViscosityBound.Location = New System.Drawing.Point(27, 443)
        Me.lblViscosityBound.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblViscosityBound.Name = "lblViscosityBound"
        Me.lblViscosityBound.Radius = 55
        Me.lblViscosityBound.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblViscosityBound.ShadowColor = System.Drawing.Color.LightGray
        Me.lblViscosityBound.ShadowWidth = 2
        Me.lblViscosityBound.Size = New System.Drawing.Size(185, 66)
        Me.lblViscosityBound.TabIndex = 23
        Me.lblViscosityBound.Text = "Viscosity"
        Me.lblViscosityBound.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblViscosityBound.TextAngle = 0
        '
        'txtViscosityBoundMin
        '
        Me.txtViscosityBoundMin.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtViscosityBoundMin.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtViscosityBoundMin.BorderColor = System.Drawing.Color.Black
        Me.txtViscosityBoundMin.BorderWidth = 0
        Me.txtViscosityBoundMin.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtViscosityBoundMin.EditMode = False
        Me.txtViscosityBoundMin.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtViscosityBoundMin.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtViscosityBoundMin.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtViscosityBoundMin.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtViscosityBoundMin.Location = New System.Drawing.Point(214, 443)
        Me.txtViscosityBoundMin.Margin = New System.Windows.Forms.Padding(0)
        Me.txtViscosityBoundMin.Name = "txtViscosityBoundMin"
        Me.txtViscosityBoundMin.Radius = 55
        Me.txtViscosityBoundMin.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtViscosityBoundMin.ShadowColor = System.Drawing.Color.LightGray
        Me.txtViscosityBoundMin.ShadowWidth = 2
        Me.txtViscosityBoundMin.Size = New System.Drawing.Size(87, 66)
        Me.txtViscosityBoundMin.TabIndex = 24
        Me.txtViscosityBoundMin.Text = "10.0s"
        Me.txtViscosityBoundMin.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtViscosityBoundMin.TextAngle = 0
        '
        'lblViscosityAllarms
        '
        Me.lblViscosityAllarms.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityAllarms.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityAllarms.BorderColor = System.Drawing.Color.Black
        Me.lblViscosityAllarms.BorderWidth = 0
        Me.lblViscosityAllarms.EditMode = False
        Me.lblViscosityAllarms.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblViscosityAllarms.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblViscosityAllarms.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblViscosityAllarms.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblViscosityAllarms.Location = New System.Drawing.Point(27, 377)
        Me.lblViscosityAllarms.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblViscosityAllarms.Name = "lblViscosityAllarms"
        Me.lblViscosityAllarms.Radius = 55
        Me.lblViscosityAllarms.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblViscosityAllarms.ShadowColor = System.Drawing.Color.LightGray
        Me.lblViscosityAllarms.ShadowWidth = 2
        Me.lblViscosityAllarms.Size = New System.Drawing.Size(361, 66)
        Me.lblViscosityAllarms.TabIndex = 22
        Me.lblViscosityAllarms.Text = "Allarm Bounds"
        Me.lblViscosityAllarms.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblViscosityAllarms.TextAngle = 0
        '
        'lblTemperatureReal
        '
        Me.lblTemperatureReal.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblTemperatureReal.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblTemperatureReal.BorderColor = System.Drawing.Color.Black
        Me.lblTemperatureReal.BorderWidth = 0
        Me.lblTemperatureReal.EditMode = False
        Me.lblTemperatureReal.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblTemperatureReal.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblTemperatureReal.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblTemperatureReal.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblTemperatureReal.Location = New System.Drawing.Point(23, 277)
        Me.lblTemperatureReal.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblTemperatureReal.Name = "lblTemperatureReal"
        Me.lblTemperatureReal.Radius = 55
        Me.lblTemperatureReal.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblTemperatureReal.ShadowColor = System.Drawing.Color.LightGray
        Me.lblTemperatureReal.ShadowWidth = 2
        Me.lblTemperatureReal.Size = New System.Drawing.Size(185, 66)
        Me.lblTemperatureReal.TabIndex = 19
        Me.lblTemperatureReal.Text = "Temperature"
        Me.lblTemperatureReal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblTemperatureReal.TextAngle = 0
        '
        'txtTemperatureReal
        '
        Me.txtTemperatureReal.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtTemperatureReal.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtTemperatureReal.BorderColor = System.Drawing.Color.Black
        Me.txtTemperatureReal.BorderWidth = 0
        Me.txtTemperatureReal.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtTemperatureReal.EditMode = False
        Me.txtTemperatureReal.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtTemperatureReal.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtTemperatureReal.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtTemperatureReal.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtTemperatureReal.Location = New System.Drawing.Point(210, 277)
        Me.txtTemperatureReal.Margin = New System.Windows.Forms.Padding(0)
        Me.txtTemperatureReal.Name = "txtTemperatureReal"
        Me.txtTemperatureReal.Radius = 55
        Me.txtTemperatureReal.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtTemperatureReal.ShadowColor = System.Drawing.Color.LightGray
        Me.txtTemperatureReal.ShadowWidth = 2
        Me.txtTemperatureReal.Size = New System.Drawing.Size(87, 66)
        Me.txtTemperatureReal.TabIndex = 20
        Me.txtTemperatureReal.Text = "24.2"
        Me.txtTemperatureReal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtTemperatureReal.TextAngle = 0
        '
        'lblViscosityReal
        '
        Me.lblViscosityReal.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityReal.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityReal.BorderColor = System.Drawing.Color.Black
        Me.lblViscosityReal.BorderWidth = 0
        Me.lblViscosityReal.EditMode = False
        Me.lblViscosityReal.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblViscosityReal.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblViscosityReal.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblViscosityReal.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblViscosityReal.Location = New System.Drawing.Point(23, 211)
        Me.lblViscosityReal.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblViscosityReal.Name = "lblViscosityReal"
        Me.lblViscosityReal.Radius = 55
        Me.lblViscosityReal.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblViscosityReal.ShadowColor = System.Drawing.Color.LightGray
        Me.lblViscosityReal.ShadowWidth = 2
        Me.lblViscosityReal.Size = New System.Drawing.Size(185, 66)
        Me.lblViscosityReal.TabIndex = 16
        Me.lblViscosityReal.Text = "Viscosity"
        Me.lblViscosityReal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblViscosityReal.TextAngle = 0
        '
        'txtViscosityReal
        '
        Me.txtViscosityReal.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtViscosityReal.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtViscosityReal.BorderColor = System.Drawing.Color.Black
        Me.txtViscosityReal.BorderWidth = 0
        Me.txtViscosityReal.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtViscosityReal.EditMode = False
        Me.txtViscosityReal.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtViscosityReal.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtViscosityReal.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtViscosityReal.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtViscosityReal.Location = New System.Drawing.Point(210, 211)
        Me.txtViscosityReal.Margin = New System.Windows.Forms.Padding(0)
        Me.txtViscosityReal.Name = "txtViscosityReal"
        Me.txtViscosityReal.Radius = 55
        Me.txtViscosityReal.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtViscosityReal.ShadowColor = System.Drawing.Color.LightGray
        Me.txtViscosityReal.ShadowWidth = 2
        Me.txtViscosityReal.Size = New System.Drawing.Size(87, 66)
        Me.txtViscosityReal.TabIndex = 17
        Me.txtViscosityReal.Text = "12.6s"
        Me.txtViscosityReal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtViscosityReal.TextAngle = 0
        '
        'lblViscosityCalibration
        '
        Me.lblViscosityCalibration.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityCalibration.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblViscosityCalibration.BorderColor = System.Drawing.Color.Black
        Me.lblViscosityCalibration.BorderWidth = 0
        Me.lblViscosityCalibration.EditMode = False
        Me.lblViscosityCalibration.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblViscosityCalibration.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblViscosityCalibration.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblViscosityCalibration.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblViscosityCalibration.Location = New System.Drawing.Point(23, 145)
        Me.lblViscosityCalibration.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblViscosityCalibration.Name = "lblViscosityCalibration"
        Me.lblViscosityCalibration.Radius = 55
        Me.lblViscosityCalibration.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblViscosityCalibration.ShadowColor = System.Drawing.Color.LightGray
        Me.lblViscosityCalibration.ShadowWidth = 2
        Me.lblViscosityCalibration.Size = New System.Drawing.Size(361, 66)
        Me.lblViscosityCalibration.TabIndex = 15
        Me.lblViscosityCalibration.Text = "Calibration Real Values"
        Me.lblViscosityCalibration.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblViscosityCalibration.TextAngle = 0
        '
        'pnlRegister
        '
        Me.pnlRegister.Controls.Add(Me.lblCylinderLength)
        Me.pnlRegister.Controls.Add(Me.txtCylinderLength)
        Me.pnlRegister.Controls.Add(Me.lblRegisterCyclic)
        Me.pnlRegister.Controls.Add(Me.txtRegisterCyclic)
        Me.pnlRegister.Controls.Add(Me.txtMarkPositionY)
        Me.pnlRegister.Controls.Add(Me.lblRegisterParameter)
        Me.pnlRegister.Controls.Add(Me.lblMarkPosition)
        Me.pnlRegister.Controls.Add(Me.txtMarkPositionX)
        Me.pnlRegister.Controls.Add(Me.lblRegisterSide)
        Me.pnlRegister.Controls.Add(Me.txtRegisterSide)
        Me.pnlRegister.Controls.Add(Me.lblMarkNumber)
        Me.pnlRegister.Controls.Add(Me.txtMarkNumber)
        Me.pnlRegister.Controls.Add(Me.lblBaseColor)
        Me.pnlRegister.Controls.Add(Me.txtBaseColor)
        Me.pnlRegister.Controls.Add(Me.lblLateralActive)
        Me.pnlRegister.Controls.Add(Me.txtActiveLateral)
        Me.pnlRegister.Controls.Add(Me.lblActiveLongitudinal)
        Me.pnlRegister.Controls.Add(Me.txtActiveLongitudinal)
        Me.pnlRegister.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlRegister.Location = New System.Drawing.Point(424, 3)
        Me.pnlRegister.Name = "pnlRegister"
        Me.pnlRegister.Size = New System.Drawing.Size(407, 581)
        Me.pnlRegister.TabIndex = 8
        '
        'lblCylinderLength
        '
        Me.lblCylinderLength.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblCylinderLength.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblCylinderLength.BorderColor = System.Drawing.Color.Black
        Me.lblCylinderLength.BorderWidth = 0
        Me.lblCylinderLength.EditMode = False
        Me.lblCylinderLength.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblCylinderLength.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblCylinderLength.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblCylinderLength.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblCylinderLength.Location = New System.Drawing.Point(19, 377)
        Me.lblCylinderLength.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblCylinderLength.Name = "lblCylinderLength"
        Me.lblCylinderLength.Radius = 55
        Me.lblCylinderLength.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblCylinderLength.ShadowColor = System.Drawing.Color.LightGray
        Me.lblCylinderLength.ShadowWidth = 2
        Me.lblCylinderLength.Size = New System.Drawing.Size(207, 66)
        Me.lblCylinderLength.TabIndex = 33
        Me.lblCylinderLength.Text = "Cylinder Length"
        Me.lblCylinderLength.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblCylinderLength.TextAngle = 0
        '
        'txtCylinderLength
        '
        Me.txtCylinderLength.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtCylinderLength.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtCylinderLength.BorderColor = System.Drawing.Color.Black
        Me.txtCylinderLength.BorderWidth = 0
        Me.txtCylinderLength.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtCylinderLength.EditMode = False
        Me.txtCylinderLength.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtCylinderLength.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtCylinderLength.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtCylinderLength.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtCylinderLength.Location = New System.Drawing.Point(231, 377)
        Me.txtCylinderLength.Margin = New System.Windows.Forms.Padding(0)
        Me.txtCylinderLength.Name = "txtCylinderLength"
        Me.txtCylinderLength.Radius = 55
        Me.txtCylinderLength.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtCylinderLength.ShadowColor = System.Drawing.Color.LightGray
        Me.txtCylinderLength.ShadowWidth = 2
        Me.txtCylinderLength.Size = New System.Drawing.Size(174, 66)
        Me.txtCylinderLength.TabIndex = 34
        Me.txtCylinderLength.Text = "9"""
        Me.txtCylinderLength.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtCylinderLength.TextAngle = 0
        '
        'lblRegisterCyclic
        '
        Me.lblRegisterCyclic.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblRegisterCyclic.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblRegisterCyclic.BorderColor = System.Drawing.Color.Black
        Me.lblRegisterCyclic.BorderWidth = 0
        Me.lblRegisterCyclic.EditMode = False
        Me.lblRegisterCyclic.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblRegisterCyclic.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblRegisterCyclic.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblRegisterCyclic.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblRegisterCyclic.Location = New System.Drawing.Point(19, 311)
        Me.lblRegisterCyclic.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblRegisterCyclic.Name = "lblRegisterCyclic"
        Me.lblRegisterCyclic.Radius = 55
        Me.lblRegisterCyclic.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblRegisterCyclic.ShadowColor = System.Drawing.Color.LightGray
        Me.lblRegisterCyclic.ShadowWidth = 2
        Me.lblRegisterCyclic.Size = New System.Drawing.Size(207, 66)
        Me.lblRegisterCyclic.TabIndex = 31
        Me.lblRegisterCyclic.Text = "Distance"
        Me.lblRegisterCyclic.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblRegisterCyclic.TextAngle = 0
        '
        'txtRegisterCyclic
        '
        Me.txtRegisterCyclic.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtRegisterCyclic.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtRegisterCyclic.BorderColor = System.Drawing.Color.Black
        Me.txtRegisterCyclic.BorderWidth = 0
        Me.txtRegisterCyclic.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtRegisterCyclic.EditMode = False
        Me.txtRegisterCyclic.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtRegisterCyclic.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtRegisterCyclic.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtRegisterCyclic.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtRegisterCyclic.Location = New System.Drawing.Point(231, 311)
        Me.txtRegisterCyclic.Margin = New System.Windows.Forms.Padding(0)
        Me.txtRegisterCyclic.Name = "txtRegisterCyclic"
        Me.txtRegisterCyclic.Radius = 55
        Me.txtRegisterCyclic.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtRegisterCyclic.ShadowColor = System.Drawing.Color.LightGray
        Me.txtRegisterCyclic.ShadowWidth = 2
        Me.txtRegisterCyclic.Size = New System.Drawing.Size(87, 66)
        Me.txtRegisterCyclic.TabIndex = 32
        Me.txtRegisterCyclic.Text = "5"
        Me.txtRegisterCyclic.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtRegisterCyclic.TextAngle = 0
        '
        'txtMarkPositionY
        '
        Me.txtMarkPositionY.BackColorFaded1 = System.Drawing.Color.White
        Me.txtMarkPositionY.BackColorFaded2 = System.Drawing.Color.White
        Me.txtMarkPositionY.BorderColor = System.Drawing.Color.Black
        Me.txtMarkPositionY.BorderWidth = 0
        Me.txtMarkPositionY.EditMode = False
        Me.txtMarkPositionY.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtMarkPositionY.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtMarkPositionY.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtMarkPositionY.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtMarkPositionY.Location = New System.Drawing.Point(318, 509)
        Me.txtMarkPositionY.Margin = New System.Windows.Forms.Padding(0)
        Me.txtMarkPositionY.Name = "txtMarkPositionY"
        Me.txtMarkPositionY.Radius = 55
        Me.txtMarkPositionY.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtMarkPositionY.ShadowColor = System.Drawing.Color.LightGray
        Me.txtMarkPositionY.ShadowWidth = 2
        Me.txtMarkPositionY.Size = New System.Drawing.Size(87, 66)
        Me.txtMarkPositionY.TabIndex = 23
        Me.txtMarkPositionY.Text = "200"
        Me.txtMarkPositionY.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtMarkPositionY.TextAngle = 0
        '
        'lblRegisterParameter
        '
        Me.lblRegisterParameter.BackColorFaded1 = System.Drawing.Color.White
        Me.lblRegisterParameter.BackColorFaded2 = System.Drawing.Color.White
        Me.lblRegisterParameter.BorderColor = System.Drawing.Color.White
        Me.lblRegisterParameter.BorderWidth = 0
        Me.lblRegisterParameter.EditMode = False
        Me.lblRegisterParameter.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblRegisterParameter.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblRegisterParameter.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblRegisterParameter.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblRegisterParameter.Location = New System.Drawing.Point(0, -23)
        Me.lblRegisterParameter.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblRegisterParameter.Name = "lblRegisterParameter"
        Me.lblRegisterParameter.Radius = 0
        Me.lblRegisterParameter.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblRegisterParameter.ShadowColor = System.Drawing.Color.LightGray
        Me.lblRegisterParameter.ShadowWidth = 0
        Me.lblRegisterParameter.Size = New System.Drawing.Size(405, 58)
        Me.lblRegisterParameter.TabIndex = 30
        Me.lblRegisterParameter.Text = "Register Control Parameters"
        Me.lblRegisterParameter.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        Me.lblRegisterParameter.TextAngle = 0
        '
        'lblMarkPosition
        '
        Me.lblMarkPosition.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblMarkPosition.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblMarkPosition.BorderColor = System.Drawing.Color.Black
        Me.lblMarkPosition.BorderWidth = 0
        Me.lblMarkPosition.EditMode = False
        Me.lblMarkPosition.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblMarkPosition.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblMarkPosition.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblMarkPosition.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblMarkPosition.Location = New System.Drawing.Point(19, 509)
        Me.lblMarkPosition.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblMarkPosition.Name = "lblMarkPosition"
        Me.lblMarkPosition.Radius = 55
        Me.lblMarkPosition.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblMarkPosition.ShadowColor = System.Drawing.Color.LightGray
        Me.lblMarkPosition.ShadowWidth = 2
        Me.lblMarkPosition.Size = New System.Drawing.Size(207, 66)
        Me.lblMarkPosition.TabIndex = 21
        Me.lblMarkPosition.Text = "Position"
        Me.lblMarkPosition.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblMarkPosition.TextAngle = 0
        '
        'txtMarkPositionX
        '
        Me.txtMarkPositionX.BackColorFaded1 = System.Drawing.Color.White
        Me.txtMarkPositionX.BackColorFaded2 = System.Drawing.Color.White
        Me.txtMarkPositionX.BorderColor = System.Drawing.Color.Black
        Me.txtMarkPositionX.BorderWidth = 0
        Me.txtMarkPositionX.EditMode = False
        Me.txtMarkPositionX.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtMarkPositionX.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtMarkPositionX.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtMarkPositionX.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtMarkPositionX.Location = New System.Drawing.Point(231, 509)
        Me.txtMarkPositionX.Margin = New System.Windows.Forms.Padding(0)
        Me.txtMarkPositionX.Name = "txtMarkPositionX"
        Me.txtMarkPositionX.Radius = 55
        Me.txtMarkPositionX.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtMarkPositionX.ShadowColor = System.Drawing.Color.LightGray
        Me.txtMarkPositionX.ShadowWidth = 2
        Me.txtMarkPositionX.Size = New System.Drawing.Size(87, 66)
        Me.txtMarkPositionX.TabIndex = 22
        Me.txtMarkPositionX.Text = "100"
        Me.txtMarkPositionX.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtMarkPositionX.TextAngle = 0
        '
        'lblRegisterSide
        '
        Me.lblRegisterSide.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblRegisterSide.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblRegisterSide.BorderColor = System.Drawing.Color.Black
        Me.lblRegisterSide.BorderWidth = 0
        Me.lblRegisterSide.EditMode = False
        Me.lblRegisterSide.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblRegisterSide.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblRegisterSide.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblRegisterSide.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblRegisterSide.Location = New System.Drawing.Point(19, 179)
        Me.lblRegisterSide.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblRegisterSide.Name = "lblRegisterSide"
        Me.lblRegisterSide.Radius = 55
        Me.lblRegisterSide.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblRegisterSide.ShadowColor = System.Drawing.Color.LightGray
        Me.lblRegisterSide.ShadowWidth = 2
        Me.lblRegisterSide.Size = New System.Drawing.Size(207, 66)
        Me.lblRegisterSide.TabIndex = 6
        Me.lblRegisterSide.Text = "Side"
        Me.lblRegisterSide.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblRegisterSide.TextAngle = 0
        '
        'txtRegisterSide
        '
        Me.txtRegisterSide.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtRegisterSide.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtRegisterSide.BorderColor = System.Drawing.Color.Black
        Me.txtRegisterSide.BorderWidth = 0
        Me.txtRegisterSide.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtRegisterSide.EditMode = False
        Me.txtRegisterSide.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtRegisterSide.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtRegisterSide.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtRegisterSide.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtRegisterSide.Location = New System.Drawing.Point(231, 179)
        Me.txtRegisterSide.Margin = New System.Windows.Forms.Padding(0)
        Me.txtRegisterSide.Name = "txtRegisterSide"
        Me.txtRegisterSide.Radius = 55
        Me.txtRegisterSide.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtRegisterSide.ShadowColor = System.Drawing.Color.LightGray
        Me.txtRegisterSide.ShadowWidth = 2
        Me.txtRegisterSide.Size = New System.Drawing.Size(174, 66)
        Me.txtRegisterSide.TabIndex = 7
        Me.txtRegisterSide.Text = "Front"
        Me.txtRegisterSide.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtRegisterSide.TextAngle = 0
        '
        'lblMarkNumber
        '
        Me.lblMarkNumber.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblMarkNumber.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblMarkNumber.BorderColor = System.Drawing.Color.Black
        Me.lblMarkNumber.BorderWidth = 0
        Me.lblMarkNumber.EditMode = False
        Me.lblMarkNumber.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblMarkNumber.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblMarkNumber.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblMarkNumber.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblMarkNumber.Location = New System.Drawing.Point(19, 443)
        Me.lblMarkNumber.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblMarkNumber.Name = "lblMarkNumber"
        Me.lblMarkNumber.Radius = 55
        Me.lblMarkNumber.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblMarkNumber.ShadowColor = System.Drawing.Color.LightGray
        Me.lblMarkNumber.ShadowWidth = 2
        Me.lblMarkNumber.Size = New System.Drawing.Size(207, 66)
        Me.lblMarkNumber.TabIndex = 18
        Me.lblMarkNumber.Text = "Mark Number"
        Me.lblMarkNumber.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblMarkNumber.TextAngle = 0
        '
        'txtMarkNumber
        '
        Me.txtMarkNumber.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtMarkNumber.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtMarkNumber.BorderColor = System.Drawing.Color.Black
        Me.txtMarkNumber.BorderWidth = 0
        Me.txtMarkNumber.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtMarkNumber.EditMode = False
        Me.txtMarkNumber.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtMarkNumber.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtMarkNumber.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtMarkNumber.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtMarkNumber.Location = New System.Drawing.Point(231, 443)
        Me.txtMarkNumber.Margin = New System.Windows.Forms.Padding(0)
        Me.txtMarkNumber.Name = "txtMarkNumber"
        Me.txtMarkNumber.Radius = 55
        Me.txtMarkNumber.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtMarkNumber.ShadowColor = System.Drawing.Color.LightGray
        Me.txtMarkNumber.ShadowWidth = 2
        Me.txtMarkNumber.Size = New System.Drawing.Size(87, 66)
        Me.txtMarkNumber.TabIndex = 19
        Me.txtMarkNumber.Text = "1"
        Me.txtMarkNumber.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtMarkNumber.TextAngle = 0
        '
        'lblBaseColor
        '
        Me.lblBaseColor.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblBaseColor.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblBaseColor.BorderColor = System.Drawing.Color.Black
        Me.lblBaseColor.BorderWidth = 0
        Me.lblBaseColor.EditMode = False
        Me.lblBaseColor.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblBaseColor.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblBaseColor.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblBaseColor.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblBaseColor.Location = New System.Drawing.Point(19, 245)
        Me.lblBaseColor.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblBaseColor.Name = "lblBaseColor"
        Me.lblBaseColor.Radius = 55
        Me.lblBaseColor.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblBaseColor.ShadowColor = System.Drawing.Color.LightGray
        Me.lblBaseColor.ShadowWidth = 2
        Me.lblBaseColor.Size = New System.Drawing.Size(207, 66)
        Me.lblBaseColor.TabIndex = 15
        Me.lblBaseColor.Text = "Base Color"
        Me.lblBaseColor.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblBaseColor.TextAngle = 0
        '
        'txtBaseColor
        '
        Me.txtBaseColor.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtBaseColor.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtBaseColor.BorderColor = System.Drawing.Color.Black
        Me.txtBaseColor.BorderWidth = 0
        Me.txtBaseColor.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtBaseColor.EditMode = False
        Me.txtBaseColor.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtBaseColor.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtBaseColor.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtBaseColor.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtBaseColor.Location = New System.Drawing.Point(231, 245)
        Me.txtBaseColor.Margin = New System.Windows.Forms.Padding(0)
        Me.txtBaseColor.Name = "txtBaseColor"
        Me.txtBaseColor.Radius = 55
        Me.txtBaseColor.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtBaseColor.ShadowColor = System.Drawing.Color.LightGray
        Me.txtBaseColor.ShadowWidth = 2
        Me.txtBaseColor.Size = New System.Drawing.Size(87, 66)
        Me.txtBaseColor.TabIndex = 16
        Me.txtBaseColor.Text = "No"
        Me.txtBaseColor.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtBaseColor.TextAngle = 0
        '
        'lblLateralActive
        '
        Me.lblLateralActive.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblLateralActive.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblLateralActive.BorderColor = System.Drawing.Color.Black
        Me.lblLateralActive.BorderWidth = 0
        Me.lblLateralActive.EditMode = False
        Me.lblLateralActive.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblLateralActive.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblLateralActive.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblLateralActive.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblLateralActive.Location = New System.Drawing.Point(19, 113)
        Me.lblLateralActive.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblLateralActive.Name = "lblLateralActive"
        Me.lblLateralActive.Radius = 55
        Me.lblLateralActive.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblLateralActive.ShadowColor = System.Drawing.Color.LightGray
        Me.lblLateralActive.ShadowWidth = 2
        Me.lblLateralActive.Size = New System.Drawing.Size(207, 66)
        Me.lblLateralActive.TabIndex = 12
        Me.lblLateralActive.Text = "Lateral Active"
        Me.lblLateralActive.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblLateralActive.TextAngle = 0
        '
        'txtActiveLateral
        '
        Me.txtActiveLateral.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtActiveLateral.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtActiveLateral.BorderColor = System.Drawing.Color.Black
        Me.txtActiveLateral.BorderWidth = 0
        Me.txtActiveLateral.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtActiveLateral.EditMode = False
        Me.txtActiveLateral.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtActiveLateral.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtActiveLateral.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtActiveLateral.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtActiveLateral.Location = New System.Drawing.Point(231, 113)
        Me.txtActiveLateral.Margin = New System.Windows.Forms.Padding(0)
        Me.txtActiveLateral.Name = "txtActiveLateral"
        Me.txtActiveLateral.Radius = 55
        Me.txtActiveLateral.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtActiveLateral.ShadowColor = System.Drawing.Color.LightGray
        Me.txtActiveLateral.ShadowWidth = 2
        Me.txtActiveLateral.Size = New System.Drawing.Size(87, 66)
        Me.txtActiveLateral.TabIndex = 13
        Me.txtActiveLateral.Text = "Yes"
        Me.txtActiveLateral.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtActiveLateral.TextAngle = 0
        '
        'lblActiveLongitudinal
        '
        Me.lblActiveLongitudinal.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblActiveLongitudinal.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblActiveLongitudinal.BorderColor = System.Drawing.Color.Black
        Me.lblActiveLongitudinal.BorderWidth = 0
        Me.lblActiveLongitudinal.EditMode = False
        Me.lblActiveLongitudinal.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblActiveLongitudinal.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblActiveLongitudinal.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblActiveLongitudinal.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblActiveLongitudinal.Location = New System.Drawing.Point(19, 47)
        Me.lblActiveLongitudinal.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblActiveLongitudinal.Name = "lblActiveLongitudinal"
        Me.lblActiveLongitudinal.Radius = 55
        Me.lblActiveLongitudinal.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblActiveLongitudinal.ShadowColor = System.Drawing.Color.LightGray
        Me.lblActiveLongitudinal.ShadowWidth = 2
        Me.lblActiveLongitudinal.Size = New System.Drawing.Size(207, 66)
        Me.lblActiveLongitudinal.TabIndex = 9
        Me.lblActiveLongitudinal.Text = "Longitudinal Active"
        Me.lblActiveLongitudinal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblActiveLongitudinal.TextAngle = 0
        '
        'txtActiveLongitudinal
        '
        Me.txtActiveLongitudinal.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtActiveLongitudinal.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtActiveLongitudinal.BorderColor = System.Drawing.Color.Black
        Me.txtActiveLongitudinal.BorderWidth = 0
        Me.txtActiveLongitudinal.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtActiveLongitudinal.EditMode = False
        Me.txtActiveLongitudinal.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtActiveLongitudinal.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtActiveLongitudinal.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtActiveLongitudinal.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtActiveLongitudinal.Location = New System.Drawing.Point(231, 47)
        Me.txtActiveLongitudinal.Margin = New System.Windows.Forms.Padding(0)
        Me.txtActiveLongitudinal.Name = "txtActiveLongitudinal"
        Me.txtActiveLongitudinal.Radius = 55
        Me.txtActiveLongitudinal.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtActiveLongitudinal.ShadowColor = System.Drawing.Color.LightGray
        Me.txtActiveLongitudinal.ShadowWidth = 2
        Me.txtActiveLongitudinal.Size = New System.Drawing.Size(87, 66)
        Me.txtActiveLongitudinal.TabIndex = 10
        Me.txtActiveLongitudinal.Text = "Yes"
        Me.txtActiveLongitudinal.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtActiveLongitudinal.TextAngle = 0
        '
        'pnlHorizontalLine
        '
        Me.pnlHorizontalLine.BackColor = System.Drawing.Color.Red
        Me.pnlHorizontalLine.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlHorizontalLine.Location = New System.Drawing.Point(0, 80)
        Me.pnlHorizontalLine.Margin = New System.Windows.Forms.Padding(0)
        Me.pnlHorizontalLine.Name = "pnlHorizontalLine"
        Me.pnlHorizontalLine.Size = New System.Drawing.Size(840, 8)
        Me.pnlHorizontalLine.TabIndex = 1
        '
        'pnlTop
        '
        Me.pnlTop.Controls.Add(Me.lblGroupNumber)
        Me.pnlTop.Controls.Add(Me.txtGroupNumber)
        Me.pnlTop.Controls.Add(Me.lblGroupColor)
        Me.pnlTop.Controls.Add(Me.txtGroupColor)
        Me.pnlTop.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlTop.Location = New System.Drawing.Point(0, 0)
        Me.pnlTop.Margin = New System.Windows.Forms.Padding(0)
        Me.pnlTop.Name = "pnlTop"
        Me.pnlTop.Size = New System.Drawing.Size(840, 80)
        Me.pnlTop.TabIndex = 6
        '
        'lblGroupNumber
        '
        Me.lblGroupNumber.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblGroupNumber.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblGroupNumber.BorderColor = System.Drawing.Color.Black
        Me.lblGroupNumber.BorderWidth = 0
        Me.lblGroupNumber.EditMode = False
        Me.lblGroupNumber.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblGroupNumber.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblGroupNumber.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblGroupNumber.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblGroupNumber.Location = New System.Drawing.Point(29, 6)
        Me.lblGroupNumber.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblGroupNumber.Name = "lblGroupNumber"
        Me.lblGroupNumber.Radius = 55
        Me.lblGroupNumber.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblGroupNumber.ShadowColor = System.Drawing.Color.LightGray
        Me.lblGroupNumber.ShadowWidth = 2
        Me.lblGroupNumber.Size = New System.Drawing.Size(185, 66)
        Me.lblGroupNumber.TabIndex = 11
        Me.lblGroupNumber.Text = "Group Number"
        Me.lblGroupNumber.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblGroupNumber.TextAngle = 0
        '
        'txtGroupNumber
        '
        Me.txtGroupNumber.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtGroupNumber.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.txtGroupNumber.BorderColor = System.Drawing.Color.Black
        Me.txtGroupNumber.BorderWidth = 0
        Me.txtGroupNumber.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtGroupNumber.EditMode = False
        Me.txtGroupNumber.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtGroupNumber.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtGroupNumber.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtGroupNumber.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtGroupNumber.Location = New System.Drawing.Point(216, 6)
        Me.txtGroupNumber.Margin = New System.Windows.Forms.Padding(0)
        Me.txtGroupNumber.Name = "txtGroupNumber"
        Me.txtGroupNumber.Radius = 55
        Me.txtGroupNumber.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtGroupNumber.ShadowColor = System.Drawing.Color.LightGray
        Me.txtGroupNumber.ShadowWidth = 2
        Me.txtGroupNumber.Size = New System.Drawing.Size(87, 66)
        Me.txtGroupNumber.TabIndex = 12
        Me.txtGroupNumber.Text = "1"
        Me.txtGroupNumber.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtGroupNumber.TextAngle = 0
        '
        'lblGroupColor
        '
        Me.lblGroupColor.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblGroupColor.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblGroupColor.BorderColor = System.Drawing.Color.Black
        Me.lblGroupColor.BorderWidth = 0
        Me.lblGroupColor.EditMode = False
        Me.lblGroupColor.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblGroupColor.ForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblGroupColor.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblGroupColor.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblGroupColor.Location = New System.Drawing.Point(446, 6)
        Me.lblGroupColor.Margin = New System.Windows.Forms.Padding(8, 6, 8, 6)
        Me.lblGroupColor.Name = "lblGroupColor"
        Me.lblGroupColor.Radius = 55
        Me.lblGroupColor.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblGroupColor.ShadowColor = System.Drawing.Color.LightGray
        Me.lblGroupColor.ShadowWidth = 2
        Me.lblGroupColor.Size = New System.Drawing.Size(207, 66)
        Me.lblGroupColor.TabIndex = 9
        Me.lblGroupColor.Text = "Color"
        Me.lblGroupColor.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblGroupColor.TextAngle = 0
        '
        'txtGroupColor
        '
        Me.txtGroupColor.BackColorFaded1 = System.Drawing.Color.Red
        Me.txtGroupColor.BackColorFaded2 = System.Drawing.Color.Red
        Me.txtGroupColor.BorderColor = System.Drawing.Color.Black
        Me.txtGroupColor.BorderWidth = 0
        Me.txtGroupColor.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtGroupColor.EditMode = False
        Me.txtGroupColor.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtGroupColor.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtGroupColor.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtGroupColor.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtGroupColor.Location = New System.Drawing.Point(658, 6)
        Me.txtGroupColor.Margin = New System.Windows.Forms.Padding(0)
        Me.txtGroupColor.Name = "txtGroupColor"
        Me.txtGroupColor.Radius = 55
        Me.txtGroupColor.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtGroupColor.ShadowColor = System.Drawing.Color.LightGray
        Me.txtGroupColor.ShadowWidth = 2
        Me.txtGroupColor.Size = New System.Drawing.Size(87, 66)
        Me.txtGroupColor.TabIndex = 10
        Me.txtGroupColor.Text = ""
        Me.txtGroupColor.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtGroupColor.TextAngle = 0
        '
        'CurrentJobRegisterViscosityControlParameter
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.Controls.Add(Me.tblMain)
        Me.Name = "CurrentJobRegisterViscosityControlParameter"
        Me.tblMain.ResumeLayout(False)
        Me.pnlDown.ResumeLayout(False)
        Me.tblDown.ResumeLayout(False)
        Me.pnlViscosity.ResumeLayout(False)
        Me.pnlRegister.ResumeLayout(False)
        Me.pnlTop.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents tblMain As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents pnlDown As System.Windows.Forms.Panel
    Friend WithEvents tblDown As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents pnlVerticalLine As System.Windows.Forms.Panel
    Friend WithEvents pnlViscosity As System.Windows.Forms.Panel
    Friend WithEvents lblViscosityActive As Zelo.Luma.GUIButton
    Friend WithEvents txtViscosityActive As Zelo.Luma.GUIButton
    Friend WithEvents lblViscosityParameter As Zelo.Luma.GUIButton
    Friend WithEvents txtTemperatureBoundMax As Zelo.Luma.GUIButton
    Friend WithEvents lblTemperatureBound As Zelo.Luma.GUIButton
    Friend WithEvents txtTemperatureBoundMin As Zelo.Luma.GUIButton
    Friend WithEvents txtViscosityBoundMax As Zelo.Luma.GUIButton
    Friend WithEvents lblViscosityBound As Zelo.Luma.GUIButton
    Friend WithEvents txtViscosityBoundMin As Zelo.Luma.GUIButton
    Friend WithEvents lblViscosityAllarms As Zelo.Luma.GUIButton
    Friend WithEvents lblTemperatureReal As Zelo.Luma.GUIButton
    Friend WithEvents txtTemperatureReal As Zelo.Luma.GUIButton
    Friend WithEvents lblViscosityReal As Zelo.Luma.GUIButton
    Friend WithEvents txtViscosityReal As Zelo.Luma.GUIButton
    Friend WithEvents lblViscosityCalibration As Zelo.Luma.GUIButton
    Friend WithEvents pnlRegister As System.Windows.Forms.Panel
    Friend WithEvents lblCylinderLength As Zelo.Luma.GUIButton
    Friend WithEvents txtCylinderLength As Zelo.Luma.GUIButton
    Friend WithEvents lblRegisterCyclic As Zelo.Luma.GUIButton
    Friend WithEvents txtRegisterCyclic As Zelo.Luma.GUIButton
    Friend WithEvents txtMarkPositionY As Zelo.Luma.GUIButton
    Friend WithEvents lblRegisterParameter As Zelo.Luma.GUIButton
    Friend WithEvents lblMarkPosition As Zelo.Luma.GUIButton
    Friend WithEvents txtMarkPositionX As Zelo.Luma.GUIButton
    Friend WithEvents lblRegisterSide As Zelo.Luma.GUIButton
    Friend WithEvents txtRegisterSide As Zelo.Luma.GUIButton
    Friend WithEvents lblMarkNumber As Zelo.Luma.GUIButton
    Friend WithEvents txtMarkNumber As Zelo.Luma.GUIButton
    Friend WithEvents lblBaseColor As Zelo.Luma.GUIButton
    Friend WithEvents txtBaseColor As Zelo.Luma.GUIButton
    Friend WithEvents lblLateralActive As Zelo.Luma.GUIButton
    Friend WithEvents txtActiveLateral As Zelo.Luma.GUIButton
    Friend WithEvents lblActiveLongitudinal As Zelo.Luma.GUIButton
    Friend WithEvents txtActiveLongitudinal As Zelo.Luma.GUIButton
    Friend WithEvents pnlHorizontalLine As System.Windows.Forms.Panel
    Friend WithEvents pnlTop As System.Windows.Forms.Panel
    Friend WithEvents lblGroupNumber As Zelo.Luma.GUIButton
    Friend WithEvents txtGroupNumber As Zelo.Luma.GUIButton
    Friend WithEvents lblGroupColor As Zelo.Luma.GUIButton
    Friend WithEvents txtGroupColor As Zelo.Luma.GUIButton

End Class
