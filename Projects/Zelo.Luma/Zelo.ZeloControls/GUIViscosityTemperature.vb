Public Class GUIViscosityTemperature

#Region "Events"
    Public Shadows Event Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
#End Region

#Region "Variables"
    Protected m_enmMode As Mode = Mode.Automatic
    Protected m_intIsActive As Boolean = True
#End Region


#Region "Properties"

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(False)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property IsActive() As Boolean
        Get
            Return m_intIsActive
        End Get
        Set(ByVal _intIsActive As Boolean)
            If m_intIsActive <> _intIsActive Then
                m_intIsActive = _intIsActive

                guiTermometer.Enabled = m_intIsActive
                guiViscosity.Enabled = m_intIsActive
                lblTemperature.Visible = m_intIsActive
                lblViscosity.Visible = m_intIsActive
                picMode.Visible = m_intIsActive
                pnlTop.Visible = m_intIsActive
            End If
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Zelo.Luma.Mode.Automatic")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Mode() As Mode
        Get
            Return m_enmMode
        End Get
        Set(ByVal _enmMode As Mode)
            m_enmMode = _enmMode
            Select Case m_enmMode
                Case Mode.Automatic
                    picMode.Image = Global.Zelo.Luma.My.Resources.Resources.Disabled_runmodeAutomaticBig
                Case Mode.Manual
                    picMode.Image = Global.Zelo.Luma.My.Resources.Resources.Disabled_runmodeManualBig
            End Select
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Color.Red")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property GroupColor() As Color
        Get
            Return pnlTop.BackColor
        End Get
        Set(ByVal _objGroupColor As Color)
            pnlTop.BackColor = _objGroupColor
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
   <System.ComponentModel.DefaultValue(20.0)> _
   Public Property ViscosityRefValue() As Double
        Get
            Return guiViscosity.RefValue
        End Get
        Set(ByVal _dblRefValue As Double)
            guiViscosity.RefValue = _dblRefValue
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(25.0)> _
    Public Property ViscosityValue() As Double
        Get
            Return guiViscosity.Value
        End Get
        Set(ByVal _dblValue As Double)
            guiViscosity.Value = _dblValue
            lblViscosity.Text = _dblValue.ToString("#,##0.0") & "s"
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(10.0)> _
    Public Property ViscosityRange() As Double
        Get
            Return guiViscosity.Range
        End Get
        Set(ByVal _dblViscosityRange As Double)
            guiViscosity.Range = _dblViscosityRange
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(65)> _
    Public Property TemperatureRange() As Double
        Get
            Return guiTermometer.Range
        End Get
        Set(ByVal _dblTemperatureRange As Double)
            guiTermometer.Range = _dblTemperatureRange
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(25)> _
    Public Property TemperatureValue() As Double
        Get
            Return guiTermometer.Value
        End Get
        Set(ByVal DoubleValue As Double)
            guiTermometer.Value = DoubleValue
            lblTemperature.Text = DoubleValue.ToString("#,##0") & "°C"
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(10)> _
    Public Property TemperatureMin() As Double
        Get
            Return guiTermometer.Min
        End Get
        Set(ByVal DoubleMin As Double)
            guiTermometer.Min = DoubleMin
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(45)> _
    Public Property TemperatureMax() As Double
        Get
            Return guiTermometer.Max
        End Get
        Set(ByVal DoubleMax As Double)
            guiTermometer.Max = DoubleMax
        End Set
    End Property
#End Region

#Region "Methods"

    Private Sub picMode_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picMode.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub lblViscosity_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lblViscosity.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub tblMain_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lblViscosity.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub guiViscosity_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles guiViscosity.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub guiTermometer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles guiTermometer.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub lblTemperature_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lblTemperature.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub pnlTop_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles pnlTop.Click
        RaiseEvent Click(sender, e)
    End Sub

#End Region

End Class
