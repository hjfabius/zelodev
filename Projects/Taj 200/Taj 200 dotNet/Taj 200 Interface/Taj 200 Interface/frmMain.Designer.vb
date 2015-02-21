<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMain
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
        Me.components = New System.ComponentModel.Container
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmMain))
        Me.objSerialPort = New System.IO.Ports.SerialPort(Me.components)
        Me.ImageList = New System.Windows.Forms.ImageList(Me.components)
        Me.grCommunication = New System.Windows.Forms.GroupBox
        Me.cmbB7 = New System.Windows.Forms.ComboBox
        Me.cmbB6 = New System.Windows.Forms.ComboBox
        Me.cmbB5 = New System.Windows.Forms.ComboBox
        Me.cmbB4 = New System.Windows.Forms.ComboBox
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label8 = New System.Windows.Forms.Label
        Me.Label9 = New System.Windows.Forms.Label
        Me.Label10 = New System.Windows.Forms.Label
        Me.cmbB3 = New System.Windows.Forms.ComboBox
        Me.cmbB2 = New System.Windows.Forms.ComboBox
        Me.cmbB1 = New System.Windows.Forms.ComboBox
        Me.cmbB0 = New System.Windows.Forms.ComboBox
        Me.Label11 = New System.Windows.Forms.Label
        Me.Label12 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.grParameter = New System.Windows.Forms.GroupBox
        Me.Label15 = New System.Windows.Forms.Label
        Me.cmbParmDirection = New System.Windows.Forms.ComboBox
        Me.Label13 = New System.Windows.Forms.Label
        Me.Label14 = New System.Windows.Forms.Label
        Me.cmbParameterValue = New System.Windows.Forms.NumericUpDown
        Me.cmbParameterName = New System.Windows.Forms.ComboBox
        Me.grComParam = New System.Windows.Forms.GroupBox
        Me.cmdConnect = New System.Windows.Forms.Button
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.cmbComSpeed = New System.Windows.Forms.ComboBox
        Me.cmbComPort = New System.Windows.Forms.ComboBox
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.radFunzione13 = New System.Windows.Forms.RadioButton
        Me.radFunzione12 = New System.Windows.Forms.RadioButton
        Me.radFunzione11 = New System.Windows.Forms.RadioButton
        Me.radFunzione10 = New System.Windows.Forms.RadioButton
        Me.radFunzione09 = New System.Windows.Forms.RadioButton
        Me.radFunzione08 = New System.Windows.Forms.RadioButton
        Me.radFunzione07 = New System.Windows.Forms.RadioButton
        Me.radFunzione06 = New System.Windows.Forms.RadioButton
        Me.radFunzione05 = New System.Windows.Forms.RadioButton
        Me.radFunzione04 = New System.Windows.Forms.RadioButton
        Me.radFunzione03 = New System.Windows.Forms.RadioButton
        Me.radFunzione02 = New System.Windows.Forms.RadioButton
        Me.radFunzione01 = New System.Windows.Forms.RadioButton
        Me.radFunzione00 = New System.Windows.Forms.RadioButton
        Me.cmdTranslateFunction = New System.Windows.Forms.Button
        Me.cmdLoadData = New System.Windows.Forms.Button
        Me.picRxWarning = New System.Windows.Forms.PictureBox
        Me.picRxOn = New System.Windows.Forms.PictureBox
        Me.picRxOff = New System.Windows.Forms.PictureBox
        Me.picTxOn = New System.Windows.Forms.PictureBox
        Me.picTxOff = New System.Windows.Forms.PictureBox
        Me.cmdSend = New System.Windows.Forms.Button
        Me.grCommunication.SuspendLayout()
        Me.grParameter.SuspendLayout()
        CType(Me.cmbParameterValue, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.grComParam.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        CType(Me.picRxWarning, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picRxOn, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picRxOff, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picTxOn, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picTxOff, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'objSerialPort
        '
        Me.objSerialPort.BaudRate = 4800
        '
        'ImageList
        '
        Me.ImageList.ImageStream = CType(resources.GetObject("ImageList.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ImageList.TransparentColor = System.Drawing.Color.Transparent
        Me.ImageList.Images.SetKeyName(0, "green-on.gif")
        Me.ImageList.Images.SetKeyName(1, "connectionActive.gif")
        Me.ImageList.Images.SetKeyName(2, "connectionInactive.gif")
        Me.ImageList.Images.SetKeyName(3, "green-off.gif")
        '
        'grCommunication
        '
        Me.grCommunication.Controls.Add(Me.picRxWarning)
        Me.grCommunication.Controls.Add(Me.picRxOn)
        Me.grCommunication.Controls.Add(Me.picRxOff)
        Me.grCommunication.Controls.Add(Me.picTxOn)
        Me.grCommunication.Controls.Add(Me.picTxOff)
        Me.grCommunication.Controls.Add(Me.cmbB7)
        Me.grCommunication.Controls.Add(Me.cmbB6)
        Me.grCommunication.Controls.Add(Me.cmbB5)
        Me.grCommunication.Controls.Add(Me.cmbB4)
        Me.grCommunication.Controls.Add(Me.Label7)
        Me.grCommunication.Controls.Add(Me.Label8)
        Me.grCommunication.Controls.Add(Me.Label9)
        Me.grCommunication.Controls.Add(Me.Label10)
        Me.grCommunication.Controls.Add(Me.cmbB3)
        Me.grCommunication.Controls.Add(Me.cmbB2)
        Me.grCommunication.Controls.Add(Me.cmbB1)
        Me.grCommunication.Controls.Add(Me.cmbB0)
        Me.grCommunication.Controls.Add(Me.Label11)
        Me.grCommunication.Controls.Add(Me.Label12)
        Me.grCommunication.Controls.Add(Me.cmdSend)
        Me.grCommunication.Controls.Add(Me.Label6)
        Me.grCommunication.Controls.Add(Me.Label5)
        Me.grCommunication.Controls.Add(Me.Label4)
        Me.grCommunication.Controls.Add(Me.Label3)
        Me.grCommunication.Location = New System.Drawing.Point(12, 151)
        Me.grCommunication.Name = "grCommunication"
        Me.grCommunication.Size = New System.Drawing.Size(350, 173)
        Me.grCommunication.TabIndex = 47
        Me.grCommunication.TabStop = False
        '
        'cmbB7
        '
        Me.cmbB7.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append
        Me.cmbB7.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbB7.Enabled = False
        Me.cmbB7.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbB7.FormattingEnabled = True
        Me.cmbB7.Location = New System.Drawing.Point(206, 95)
        Me.cmbB7.Name = "cmbB7"
        Me.cmbB7.Size = New System.Drawing.Size(49, 28)
        Me.cmbB7.TabIndex = 60
        '
        'cmbB6
        '
        Me.cmbB6.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append
        Me.cmbB6.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbB6.Enabled = False
        Me.cmbB6.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbB6.FormattingEnabled = True
        Me.cmbB6.Location = New System.Drawing.Point(150, 95)
        Me.cmbB6.Name = "cmbB6"
        Me.cmbB6.Size = New System.Drawing.Size(49, 28)
        Me.cmbB6.TabIndex = 59
        '
        'cmbB5
        '
        Me.cmbB5.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append
        Me.cmbB5.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbB5.Enabled = False
        Me.cmbB5.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbB5.FormattingEnabled = True
        Me.cmbB5.Location = New System.Drawing.Point(95, 95)
        Me.cmbB5.Name = "cmbB5"
        Me.cmbB5.Size = New System.Drawing.Size(49, 28)
        Me.cmbB5.TabIndex = 58
        '
        'cmbB4
        '
        Me.cmbB4.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append
        Me.cmbB4.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbB4.Enabled = False
        Me.cmbB4.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbB4.FormattingEnabled = True
        Me.cmbB4.Location = New System.Drawing.Point(40, 95)
        Me.cmbB4.Name = "cmbB4"
        Me.cmbB4.Size = New System.Drawing.Size(49, 28)
        Me.cmbB4.TabIndex = 57
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label7.Location = New System.Drawing.Point(210, 76)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(29, 20)
        Me.Label7.TabIndex = 56
        Me.Label7.Text = "B7"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label8.Location = New System.Drawing.Point(154, 76)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(29, 20)
        Me.Label8.TabIndex = 55
        Me.Label8.Text = "B6"
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label9.Location = New System.Drawing.Point(99, 76)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(29, 20)
        Me.Label9.TabIndex = 54
        Me.Label9.Text = "B5"
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label10.Location = New System.Drawing.Point(42, 76)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(29, 20)
        Me.Label10.TabIndex = 53
        Me.Label10.Text = "B4"
        '
        'cmbB3
        '
        Me.cmbB3.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append
        Me.cmbB3.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbB3.Enabled = False
        Me.cmbB3.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbB3.FormattingEnabled = True
        Me.cmbB3.Location = New System.Drawing.Point(205, 30)
        Me.cmbB3.Name = "cmbB3"
        Me.cmbB3.Size = New System.Drawing.Size(49, 28)
        Me.cmbB3.TabIndex = 52
        '
        'cmbB2
        '
        Me.cmbB2.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append
        Me.cmbB2.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbB2.Enabled = False
        Me.cmbB2.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbB2.FormattingEnabled = True
        Me.cmbB2.Location = New System.Drawing.Point(149, 30)
        Me.cmbB2.Name = "cmbB2"
        Me.cmbB2.Size = New System.Drawing.Size(49, 28)
        Me.cmbB2.TabIndex = 51
        '
        'cmbB1
        '
        Me.cmbB1.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append
        Me.cmbB1.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbB1.Enabled = False
        Me.cmbB1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbB1.FormattingEnabled = True
        Me.cmbB1.Location = New System.Drawing.Point(94, 30)
        Me.cmbB1.Name = "cmbB1"
        Me.cmbB1.Size = New System.Drawing.Size(49, 28)
        Me.cmbB1.TabIndex = 50
        '
        'cmbB0
        '
        Me.cmbB0.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append
        Me.cmbB0.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbB0.Enabled = False
        Me.cmbB0.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbB0.FormattingEnabled = True
        Me.cmbB0.Location = New System.Drawing.Point(39, 30)
        Me.cmbB0.Name = "cmbB0"
        Me.cmbB0.Size = New System.Drawing.Size(49, 28)
        Me.cmbB0.TabIndex = 49
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label11.Location = New System.Drawing.Point(2, 98)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(25, 20)
        Me.Label11.TabIndex = 48
        Me.Label11.Text = "Tx"
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label12.Location = New System.Drawing.Point(2, 33)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(28, 20)
        Me.Label12.TabIndex = 47
        Me.Label12.Text = "Rx"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label6.Location = New System.Drawing.Point(209, 12)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(29, 20)
        Me.Label6.TabIndex = 45
        Me.Label6.Text = "B3"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(153, 12)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(29, 20)
        Me.Label5.TabIndex = 44
        Me.Label5.Text = "B2"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(98, 12)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(29, 20)
        Me.Label4.TabIndex = 43
        Me.Label4.Text = "B1"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(41, 12)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(29, 20)
        Me.Label3.TabIndex = 42
        Me.Label3.Text = "B0"
        '
        'grParameter
        '
        Me.grParameter.Controls.Add(Me.Label15)
        Me.grParameter.Controls.Add(Me.cmbParmDirection)
        Me.grParameter.Controls.Add(Me.Label13)
        Me.grParameter.Controls.Add(Me.Label14)
        Me.grParameter.Controls.Add(Me.cmdLoadData)
        Me.grParameter.Controls.Add(Me.cmbParameterValue)
        Me.grParameter.Controls.Add(Me.cmbParameterName)
        Me.grParameter.Location = New System.Drawing.Point(12, 330)
        Me.grParameter.Name = "grParameter"
        Me.grParameter.Size = New System.Drawing.Size(350, 194)
        Me.grParameter.TabIndex = 48
        Me.grParameter.TabStop = False
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label15.Location = New System.Drawing.Point(6, 71)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(72, 20)
        Me.Label15.TabIndex = 53
        Me.Label15.Text = "Direction"
        '
        'cmbParmDirection
        '
        Me.cmbParmDirection.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append
        Me.cmbParmDirection.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbParmDirection.DataBindings.Add(New System.Windows.Forms.Binding("Text", Global.Taj_200_Interface.My.MySettings.Default, "ParamDirection", True, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged))
        Me.cmbParmDirection.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbParmDirection.FormattingEnabled = True
        Me.cmbParmDirection.Items.AddRange(New Object() {"Taj 200 --> CPU", "CPU --> Taj 200"})
        Me.cmbParmDirection.Location = New System.Drawing.Point(10, 94)
        Me.cmbParmDirection.Name = "cmbParmDirection"
        Me.cmbParmDirection.Size = New System.Drawing.Size(317, 28)
        Me.cmbParmDirection.TabIndex = 52
        Me.cmbParmDirection.Text = Global.Taj_200_Interface.My.MySettings.Default.ParamDirection
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label13.Location = New System.Drawing.Point(6, 131)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(50, 20)
        Me.Label13.TabIndex = 51
        Me.Label13.Text = "Value"
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label14.Location = New System.Drawing.Point(6, 16)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(83, 20)
        Me.Label14.TabIndex = 50
        Me.Label14.Text = "Parameter"
        '
        'cmbParameterValue
        '
        Me.cmbParameterValue.DataBindings.Add(New System.Windows.Forms.Binding("Value", Global.Taj_200_Interface.My.MySettings.Default, "ParameterValue", True, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged))
        Me.cmbParameterValue.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbParameterValue.Location = New System.Drawing.Point(10, 156)
        Me.cmbParameterValue.Maximum = New Decimal(New Integer() {65535, 0, 0, 0})
        Me.cmbParameterValue.Name = "cmbParameterValue"
        Me.cmbParameterValue.Size = New System.Drawing.Size(152, 26)
        Me.cmbParameterValue.TabIndex = 48
        Me.cmbParameterValue.Value = Global.Taj_200_Interface.My.MySettings.Default.ParameterValue
        '
        'cmbParameterName
        '
        Me.cmbParameterName.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append
        Me.cmbParameterName.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbParameterName.DataBindings.Add(New System.Windows.Forms.Binding("Text", Global.Taj_200_Interface.My.MySettings.Default, "ParameterName", True, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged))
        Me.cmbParameterName.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbParameterName.FormattingEnabled = True
        Me.cmbParameterName.Location = New System.Drawing.Point(10, 39)
        Me.cmbParameterName.Name = "cmbParameterName"
        Me.cmbParameterName.Size = New System.Drawing.Size(317, 28)
        Me.cmbParameterName.TabIndex = 47
        Me.cmbParameterName.Text = Global.Taj_200_Interface.My.MySettings.Default.ParameterName
        '
        'grComParam
        '
        Me.grComParam.BackColor = System.Drawing.SystemColors.Control
        Me.grComParam.Controls.Add(Me.cmdConnect)
        Me.grComParam.Controls.Add(Me.Label2)
        Me.grComParam.Controls.Add(Me.Label1)
        Me.grComParam.Controls.Add(Me.cmbComSpeed)
        Me.grComParam.Controls.Add(Me.cmbComPort)
        Me.grComParam.Location = New System.Drawing.Point(12, 12)
        Me.grComParam.Name = "grComParam"
        Me.grComParam.Size = New System.Drawing.Size(350, 137)
        Me.grComParam.TabIndex = 49
        Me.grComParam.TabStop = False
        '
        'cmdConnect
        '
        Me.cmdConnect.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdConnect.Location = New System.Drawing.Point(168, 37)
        Me.cmdConnect.Name = "cmdConnect"
        Me.cmdConnect.Size = New System.Drawing.Size(152, 28)
        Me.cmdConnect.TabIndex = 9
        Me.cmdConnect.Text = "Connect"
        Me.cmdConnect.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(15, 70)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(56, 20)
        Me.Label2.TabIndex = 8
        Me.Label2.Text = "Speed"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(15, 14)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(38, 20)
        Me.Label1.TabIndex = 7
        Me.Label1.Text = "Port"
        '
        'cmbComSpeed
        '
        Me.cmbComSpeed.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbComSpeed.FormattingEnabled = True
        Me.cmbComSpeed.Items.AddRange(New Object() {"600", "1200", "2400", "4800", "9600", "14400", "19200", "38400", "57600", "115200"})
        Me.cmbComSpeed.Location = New System.Drawing.Point(19, 93)
        Me.cmbComSpeed.Name = "cmbComSpeed"
        Me.cmbComSpeed.Size = New System.Drawing.Size(129, 28)
        Me.cmbComSpeed.TabIndex = 6
        '
        'cmbComPort
        '
        Me.cmbComPort.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbComPort.FormattingEnabled = True
        Me.cmbComPort.Items.AddRange(New Object() {"COM1", "COM2", "COM3", "COM4", "COM5", "COM6", "COM7", "COM8", "COM9"})
        Me.cmbComPort.Location = New System.Drawing.Point(19, 37)
        Me.cmbComPort.Name = "cmbComPort"
        Me.cmbComPort.Size = New System.Drawing.Size(129, 28)
        Me.cmbComPort.TabIndex = 5
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.radFunzione13)
        Me.GroupBox1.Controls.Add(Me.radFunzione12)
        Me.GroupBox1.Controls.Add(Me.radFunzione11)
        Me.GroupBox1.Controls.Add(Me.radFunzione10)
        Me.GroupBox1.Controls.Add(Me.radFunzione09)
        Me.GroupBox1.Controls.Add(Me.cmdTranslateFunction)
        Me.GroupBox1.Controls.Add(Me.radFunzione08)
        Me.GroupBox1.Controls.Add(Me.radFunzione07)
        Me.GroupBox1.Controls.Add(Me.radFunzione06)
        Me.GroupBox1.Controls.Add(Me.radFunzione05)
        Me.GroupBox1.Controls.Add(Me.radFunzione04)
        Me.GroupBox1.Controls.Add(Me.radFunzione03)
        Me.GroupBox1.Controls.Add(Me.radFunzione02)
        Me.GroupBox1.Controls.Add(Me.radFunzione01)
        Me.GroupBox1.Controls.Add(Me.radFunzione00)
        Me.GroupBox1.Location = New System.Drawing.Point(368, 12)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(350, 512)
        Me.GroupBox1.TabIndex = 50
        Me.GroupBox1.TabStop = False
        '
        'radFunzione13
        '
        Me.radFunzione13.AutoSize = True
        Me.radFunzione13.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione13.Location = New System.Drawing.Point(36, 415)
        Me.radFunzione13.Name = "radFunzione13"
        Me.radFunzione13.Size = New System.Drawing.Size(115, 24)
        Me.radFunzione13.TabIndex = 61
        Me.radFunzione13.TabStop = True
        Me.radFunzione13.Text = "Funzione 13"
        Me.radFunzione13.UseVisualStyleBackColor = True
        '
        'radFunzione12
        '
        Me.radFunzione12.AutoSize = True
        Me.radFunzione12.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione12.Location = New System.Drawing.Point(36, 385)
        Me.radFunzione12.Name = "radFunzione12"
        Me.radFunzione12.Size = New System.Drawing.Size(115, 24)
        Me.radFunzione12.TabIndex = 60
        Me.radFunzione12.TabStop = True
        Me.radFunzione12.Text = "Funzione 12"
        Me.radFunzione12.UseVisualStyleBackColor = True
        '
        'radFunzione11
        '
        Me.radFunzione11.AutoSize = True
        Me.radFunzione11.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione11.Location = New System.Drawing.Point(36, 355)
        Me.radFunzione11.Name = "radFunzione11"
        Me.radFunzione11.Size = New System.Drawing.Size(115, 24)
        Me.radFunzione11.TabIndex = 59
        Me.radFunzione11.TabStop = True
        Me.radFunzione11.Text = "Funzione 11"
        Me.radFunzione11.UseVisualStyleBackColor = True
        '
        'radFunzione10
        '
        Me.radFunzione10.AutoSize = True
        Me.radFunzione10.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione10.Location = New System.Drawing.Point(36, 325)
        Me.radFunzione10.Name = "radFunzione10"
        Me.radFunzione10.Size = New System.Drawing.Size(115, 24)
        Me.radFunzione10.TabIndex = 58
        Me.radFunzione10.TabStop = True
        Me.radFunzione10.Text = "Funzione 10"
        Me.radFunzione10.UseVisualStyleBackColor = True
        '
        'radFunzione09
        '
        Me.radFunzione09.AutoSize = True
        Me.radFunzione09.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione09.Location = New System.Drawing.Point(36, 295)
        Me.radFunzione09.Name = "radFunzione09"
        Me.radFunzione09.Size = New System.Drawing.Size(115, 24)
        Me.radFunzione09.TabIndex = 57
        Me.radFunzione09.TabStop = True
        Me.radFunzione09.Text = "Funzione 09"
        Me.radFunzione09.UseVisualStyleBackColor = True
        '
        'radFunzione08
        '
        Me.radFunzione08.AutoSize = True
        Me.radFunzione08.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione08.Location = New System.Drawing.Point(36, 265)
        Me.radFunzione08.Name = "radFunzione08"
        Me.radFunzione08.Size = New System.Drawing.Size(115, 24)
        Me.radFunzione08.TabIndex = 55
        Me.radFunzione08.TabStop = True
        Me.radFunzione08.Text = "Funzione 08"
        Me.radFunzione08.UseVisualStyleBackColor = True
        '
        'radFunzione07
        '
        Me.radFunzione07.AutoSize = True
        Me.radFunzione07.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione07.Location = New System.Drawing.Point(40, 235)
        Me.radFunzione07.Name = "radFunzione07"
        Me.radFunzione07.Size = New System.Drawing.Size(182, 24)
        Me.radFunzione07.TabIndex = 54
        Me.radFunzione07.TabStop = True
        Me.radFunzione07.Text = "Stop Movimento Gate"
        Me.radFunzione07.UseVisualStyleBackColor = True
        '
        'radFunzione06
        '
        Me.radFunzione06.AutoSize = True
        Me.radFunzione06.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione06.Location = New System.Drawing.Point(40, 205)
        Me.radFunzione06.Name = "radFunzione06"
        Me.radFunzione06.Size = New System.Drawing.Size(119, 24)
        Me.radFunzione06.TabIndex = 53
        Me.radFunzione06.TabStop = True
        Me.radFunzione06.Text = "Ritarda Gate"
        Me.radFunzione06.UseVisualStyleBackColor = True
        '
        'radFunzione05
        '
        Me.radFunzione05.AutoSize = True
        Me.radFunzione05.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione05.Location = New System.Drawing.Point(40, 175)
        Me.radFunzione05.Name = "radFunzione05"
        Me.radFunzione05.Size = New System.Drawing.Size(124, 24)
        Me.radFunzione05.TabIndex = 52
        Me.radFunzione05.TabStop = True
        Me.radFunzione05.Text = "Anticipa Gate"
        Me.radFunzione05.UseVisualStyleBackColor = True
        '
        'radFunzione04
        '
        Me.radFunzione04.AutoSize = True
        Me.radFunzione04.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione04.Location = New System.Drawing.Point(40, 145)
        Me.radFunzione04.Name = "radFunzione04"
        Me.radFunzione04.Size = New System.Drawing.Size(246, 24)
        Me.radFunzione04.TabIndex = 51
        Me.radFunzione04.TabStop = True
        Me.radFunzione04.Text = "Test Intervalli correzione Offset"
        Me.radFunzione04.UseVisualStyleBackColor = True
        '
        'radFunzione03
        '
        Me.radFunzione03.AutoSize = True
        Me.radFunzione03.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione03.Location = New System.Drawing.Point(40, 116)
        Me.radFunzione03.Name = "radFunzione03"
        Me.radFunzione03.Size = New System.Drawing.Size(122, 24)
        Me.radFunzione03.TabIndex = 50
        Me.radFunzione03.TabStop = True
        Me.radFunzione03.Text = "Test Encoder"
        Me.radFunzione03.UseVisualStyleBackColor = True
        '
        'radFunzione02
        '
        Me.radFunzione02.AutoSize = True
        Me.radFunzione02.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione02.Location = New System.Drawing.Point(40, 86)
        Me.radFunzione02.Name = "radFunzione02"
        Me.radFunzione02.Size = New System.Drawing.Size(114, 24)
        Me.radFunzione02.TabIndex = 49
        Me.radFunzione02.TabStop = True
        Me.radFunzione02.Text = "Test Testina"
        Me.radFunzione02.UseVisualStyleBackColor = True
        '
        'radFunzione01
        '
        Me.radFunzione01.AutoSize = True
        Me.radFunzione01.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione01.Location = New System.Drawing.Point(40, 56)
        Me.radFunzione01.Name = "radFunzione01"
        Me.radFunzione01.Size = New System.Drawing.Size(214, 24)
        Me.radFunzione01.TabIndex = 48
        Me.radFunzione01.TabStop = True
        Me.radFunzione01.Text = "Fasatura con oscilloscopio"
        Me.radFunzione01.UseVisualStyleBackColor = True
        '
        'radFunzione00
        '
        Me.radFunzione00.AutoSize = True
        Me.radFunzione00.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.radFunzione00.Location = New System.Drawing.Point(40, 26)
        Me.radFunzione00.Name = "radFunzione00"
        Me.radFunzione00.Size = New System.Drawing.Size(176, 24)
        Me.radFunzione00.TabIndex = 47
        Me.radFunzione00.TabStop = True
        Me.radFunzione00.Text = "Fasatura Automatica"
        Me.radFunzione00.UseVisualStyleBackColor = True
        '
        'cmdTranslateFunction
        '
        Me.cmdTranslateFunction.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdTranslateFunction.Image = Global.Taj_200_Interface.My.Resources.Resources.IconEject16
        Me.cmdTranslateFunction.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.cmdTranslateFunction.Location = New System.Drawing.Point(192, 466)
        Me.cmdTranslateFunction.Name = "cmdTranslateFunction"
        Me.cmdTranslateFunction.Size = New System.Drawing.Size(152, 41)
        Me.cmdTranslateFunction.TabIndex = 56
        Me.cmdTranslateFunction.Text = "Translate"
        Me.cmdTranslateFunction.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.cmdTranslateFunction.UseVisualStyleBackColor = True
        '
        'cmdLoadData
        '
        Me.cmdLoadData.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdLoadData.Image = Global.Taj_200_Interface.My.Resources.Resources.IconEject16
        Me.cmdLoadData.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.cmdLoadData.Location = New System.Drawing.Point(175, 147)
        Me.cmdLoadData.Name = "cmdLoadData"
        Me.cmdLoadData.Size = New System.Drawing.Size(152, 41)
        Me.cmdLoadData.TabIndex = 49
        Me.cmdLoadData.Text = "Translate"
        Me.cmdLoadData.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.cmdLoadData.UseVisualStyleBackColor = True
        '
        'picRxWarning
        '
        Me.picRxWarning.Image = Global.Taj_200_Interface.My.Resources.Resources.yellow_on
        Me.picRxWarning.Location = New System.Drawing.Point(258, 30)
        Me.picRxWarning.Name = "picRxWarning"
        Me.picRxWarning.Size = New System.Drawing.Size(28, 28)
        Me.picRxWarning.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRxWarning.TabIndex = 65
        Me.picRxWarning.TabStop = False
        Me.picRxWarning.Visible = False
        '
        'picRxOn
        '
        Me.picRxOn.Image = Global.Taj_200_Interface.My.Resources.Resources.connectionActive
        Me.picRxOn.Location = New System.Drawing.Point(258, 30)
        Me.picRxOn.Name = "picRxOn"
        Me.picRxOn.Size = New System.Drawing.Size(28, 28)
        Me.picRxOn.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRxOn.TabIndex = 64
        Me.picRxOn.TabStop = False
        Me.picRxOn.Visible = False
        '
        'picRxOff
        '
        Me.picRxOff.Image = Global.Taj_200_Interface.My.Resources.Resources.red_off
        Me.picRxOff.Location = New System.Drawing.Point(258, 30)
        Me.picRxOff.Name = "picRxOff"
        Me.picRxOff.Size = New System.Drawing.Size(28, 28)
        Me.picRxOff.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picRxOff.TabIndex = 63
        Me.picRxOff.TabStop = False
        '
        'picTxOn
        '
        Me.picTxOn.Image = Global.Taj_200_Interface.My.Resources.Resources.green_on
        Me.picTxOn.Location = New System.Drawing.Point(259, 94)
        Me.picTxOn.Name = "picTxOn"
        Me.picTxOn.Size = New System.Drawing.Size(28, 28)
        Me.picTxOn.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picTxOn.TabIndex = 62
        Me.picTxOn.TabStop = False
        Me.picTxOn.Visible = False
        '
        'picTxOff
        '
        Me.picTxOff.Image = Global.Taj_200_Interface.My.Resources.Resources.green_off
        Me.picTxOff.Location = New System.Drawing.Point(259, 94)
        Me.picTxOff.Name = "picTxOff"
        Me.picTxOff.Size = New System.Drawing.Size(28, 28)
        Me.picTxOff.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.picTxOff.TabIndex = 61
        Me.picTxOff.TabStop = False
        '
        'cmdSend
        '
        Me.cmdSend.Enabled = False
        Me.cmdSend.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdSend.Image = CType(resources.GetObject("cmdSend.Image"), System.Drawing.Image)
        Me.cmdSend.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.cmdSend.Location = New System.Drawing.Point(175, 128)
        Me.cmdSend.Name = "cmdSend"
        Me.cmdSend.Size = New System.Drawing.Size(152, 41)
        Me.cmdSend.TabIndex = 46
        Me.cmdSend.Text = "Send"
        Me.cmdSend.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.cmdSend.UseVisualStyleBackColor = True
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.Control
        Me.ClientSize = New System.Drawing.Size(730, 536)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.grComParam)
        Me.Controls.Add(Me.grParameter)
        Me.Controls.Add(Me.grCommunication)
        Me.Name = "frmMain"
        Me.Text = "Main"
        Me.grCommunication.ResumeLayout(False)
        Me.grCommunication.PerformLayout()
        Me.grParameter.ResumeLayout(False)
        Me.grParameter.PerformLayout()
        CType(Me.cmbParameterValue, System.ComponentModel.ISupportInitialize).EndInit()
        Me.grComParam.ResumeLayout(False)
        Me.grComParam.PerformLayout()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        CType(Me.picRxWarning, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picRxOn, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picRxOff, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picTxOn, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picTxOff, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents objSerialPort As System.IO.Ports.SerialPort
    Friend WithEvents ImageList As System.Windows.Forms.ImageList
    Friend WithEvents grCommunication As System.Windows.Forms.GroupBox
    Friend WithEvents picRxWarning As System.Windows.Forms.PictureBox
    Friend WithEvents picRxOn As System.Windows.Forms.PictureBox
    Friend WithEvents picRxOff As System.Windows.Forms.PictureBox
    Friend WithEvents picTxOn As System.Windows.Forms.PictureBox
    Friend WithEvents picTxOff As System.Windows.Forms.PictureBox
    Friend WithEvents cmbB7 As System.Windows.Forms.ComboBox
    Friend WithEvents cmbB6 As System.Windows.Forms.ComboBox
    Friend WithEvents cmbB5 As System.Windows.Forms.ComboBox
    Friend WithEvents cmbB4 As System.Windows.Forms.ComboBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents cmbB3 As System.Windows.Forms.ComboBox
    Friend WithEvents cmbB2 As System.Windows.Forms.ComboBox
    Friend WithEvents cmbB1 As System.Windows.Forms.ComboBox
    Friend WithEvents cmbB0 As System.Windows.Forms.ComboBox
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents cmdSend As System.Windows.Forms.Button
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents grParameter As System.Windows.Forms.GroupBox
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents cmdLoadData As System.Windows.Forms.Button
    Friend WithEvents cmbParameterValue As System.Windows.Forms.NumericUpDown
    Friend WithEvents cmbParameterName As System.Windows.Forms.ComboBox
    Friend WithEvents grComParam As System.Windows.Forms.GroupBox
    Friend WithEvents cmdConnect As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents cmbComSpeed As System.Windows.Forms.ComboBox
    Friend WithEvents cmbComPort As System.Windows.Forms.ComboBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents cmdTranslateFunction As System.Windows.Forms.Button
    Friend WithEvents radFunzione08 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione07 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione06 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione05 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione04 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione03 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione02 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione01 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione00 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione13 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione12 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione11 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione10 As System.Windows.Forms.RadioButton
    Friend WithEvents radFunzione09 As System.Windows.Forms.RadioButton
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents cmbParmDirection As System.Windows.Forms.ComboBox

End Class
