Public Class GUIRegisterViscosity

#Region "Events"
    Public Shadows Event Click(ByVal sender As Object, ByVal e As System.EventArgs)
#End Region

#Region "Variables"
    Protected m_enmElementsVisibility As Zelo.Luma.GUIElementsVisibility
#End Region

#Region "Enums"

#End Region

#Region "Properties"

#Region "Common"


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("GUIElementsVisibility.RegisterViscosity")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property ElementsVisibility() As Zelo.Luma.GUIElementsVisibility
        Get
            Return m_enmElementsVisibility
        End Get
        Set(ByVal _enmElementsVisibility As Zelo.Luma.GUIElementsVisibility)
            m_enmElementsVisibility = _enmElementsVisibility

            Me.guiRegister.Visible = (m_enmElementsVisibility = GUIElementsVisibility.Register) Or (m_enmElementsVisibility = GUIElementsVisibility.RegisterViscosity)
            Me.guiViscosityTemperature.Visible = (m_enmElementsVisibility = GUIElementsVisibility.Viscosity) Or (m_enmElementsVisibility = GUIElementsVisibility.RegisterViscosity)
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Color.Red")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Groupcolor() As Color
        Get
            Return guiRegister.GroupColor
        End Get
        Set(ByVal _objGroupColor As Color)
            guiRegister.GroupColor = _objGroupColor
            guiViscosityTemperature.GroupColor = _objGroupColor
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(0)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property GroupNumber() As Integer
        Get
            Return guiRegister.GroupNumber
        End Get
        Set(ByVal _intGroupNumber As Integer)
            guiRegister.GroupNumber = _intGroupNumber
        End Set
    End Property
#End Region

#Region "Register"


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Zelo.Luma.Mode.Automatic")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property RegisterLongitudinalMode() As Mode
        Get
            Return guiRegister.LongitudinalMode
        End Get
        Set(ByVal _enmLongitudinalMode As Mode)
            guiRegister.LongitudinalMode = _enmLongitudinalMode
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Zelo.Luma.Mode.Automatic")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property RegisterLateralMode() As Mode
        Get
            Return guiRegister.LateralMode
        End Get
        Set(ByVal _enmLateralMode As Mode)
            guiRegister.LateralMode = _enmLateralMode
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(False)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property IsBaseColor() As Boolean
        Get
            Return guiRegister.IsBaseColor
        End Get
        Set(ByVal _blnIsBaseColor As Boolean)
            guiRegister.IsBaseColor = _blnIsBaseColor
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(0)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property RegisterLateral() As Integer
        Get
            Return guiRegister.Lateral
        End Get
        Set(ByVal _intLateral As Integer)
            guiRegister.Lateral = _intLateral
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(0)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property RegisterLongitudinal() As Integer
        Get
            Return guiRegister.Longitudinal
        End Get
        Set(ByVal _intLongitudinal As Integer)
            guiRegister.Longitudinal = _intLongitudinal
        End Set
    End Property

#End Region

#Region "Viscosity & Temperature"

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Zelo.Luma.Mode.Automatic")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property ViscosityMode() As Mode
        Get
            Return guiViscosityTemperature.Mode
        End Get
        Set(ByVal _enmLateralMode As Mode)
            guiViscosityTemperature.Mode = _enmLateralMode
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
   <System.ComponentModel.DefaultValue(20.0)> _
   Public Property ViscosityRefValue() As Double
        Get
            Return guiViscosityTemperature.ViscosityRefValue
        End Get
        Set(ByVal DoubleRefValue As Double)
            guiViscosityTemperature.ViscosityRefValue = DoubleRefValue
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(25.0)> _
    Public Property ViscosityValue() As Double
        Get
            Return guiViscosityTemperature.ViscosityValue
        End Get
        Set(ByVal DoubleValue As Double)
            guiViscosityTemperature.ViscosityValue = DoubleValue
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(10.0)> _
    Public Property ViscosityRange() As Double
        Get
            Return guiViscosityTemperature.ViscosityRange
        End Get
        Set(ByVal DoubleRange As Double)
            guiViscosityTemperature.ViscosityRange = DoubleRange
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(25)> _
    Public Property TemperatureValue() As Double
        Get
            Return guiViscosityTemperature.TemperatureValue
        End Get
        Set(ByVal DoubleValue As Double)
            guiViscosityTemperature.TemperatureValue = DoubleValue
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(10)> _
    Public Property TemperatureMin() As Double
        Get
            Return guiViscosityTemperature.TemperatureMin
        End Get
        Set(ByVal DoubleMin As Double)
            guiViscosityTemperature.TemperatureMin = DoubleMin
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(45)> _
    Public Property TemperatureMax() As Double
        Get
            Return guiViscosityTemperature.TemperatureMax
        End Get
        Set(ByVal DoubleMax As Double)
            guiViscosityTemperature.TemperatureMax = DoubleMax
        End Set
    End Property
#End Region

#End Region

#Region "Methods"
    Private Sub GUIRegisterViscosity_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Me.Paint
        guiRegister.Enabled = Me.Enabled
        guiViscosityTemperature.Enabled = Me.Enabled
    End Sub

    Private Sub guiRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles guiRegister.Click
        RaiseEvent Click(Me, e)
    End Sub

    Private Sub guiViscosityTemperature_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles guiViscosityTemperature.Click
        RaiseEvent Click(Me, e)
    End Sub

#End Region
End Class
