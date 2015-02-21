Imports System.Drawing

Public Class GUIRegister

#Region "Event"
    Public Shadows Event Click(ByVal sender As Object, ByVal e As System.EventArgs)
#End Region

#Region "Variables"
    Protected m_objVisibleGroupColor As Color = Color.Red
    Protected m_enmLongitudinalMode As Mode = Mode.Automatic
    Protected m_intGroupNumber As Integer = 1
    Protected m_objGroupColor As Color = Color.Red
    Protected m_enmLateralMode As Mode = Mode.Automatic
    Protected m_blnIsBaseColor As Boolean = False
    Protected m_intRange As Integer = 100
    Protected m_intLateral As Integer = 0
    Protected m_intLongitudinal As Integer = 0
    Protected m_intIsActive As Boolean = True
#End Region

#Region "Properties"

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Zelo.Luma.Mode.Automatic")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property LongitudinalMode() As Mode
        Get
            Return m_enmLongitudinalMode
        End Get
        Set(ByVal _enmLongitudinalMode As Mode)
            If m_enmLongitudinalMode <> _enmLongitudinalMode Then
                m_enmLongitudinalMode = _enmLongitudinalMode
                Me.InvalidateEx()
            End If
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Zelo.Luma.Mode.Automatic")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property LateralMode() As Mode
        Get
            Return m_enmLateralMode
        End Get
        Set(ByVal _enmLateralMode As Mode)
            If m_enmLateralMode <> _enmLateralMode Then
                m_enmLateralMode = _enmLateralMode
                Me.InvalidateEx()
            End If
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(False)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property IsBaseColor() As Boolean
        Get
            Return m_blnIsBaseColor
        End Get
        Set(ByVal _blnIsBaseColor As Boolean)
            If m_blnIsBaseColor <> _blnIsBaseColor Then
                m_blnIsBaseColor = _blnIsBaseColor
                Me.InvalidateEx()
            End If
        End Set
    End Property

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
                Me.InvalidateEx()
            End If
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(100)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Range() As Integer
        Get
            Return m_intRange
        End Get
        Set(ByVal _intRange As Integer)
            If m_intRange <> _intRange Then
                m_intRange = _intRange
                Me.InvalidateEx()
            End If
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(0)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Lateral() As Integer
        Get
            Return m_intLateral
        End Get
        Set(ByVal _intLateral As Integer)
            If m_intLateral <> _intLateral Then
                m_intLateral = _intLateral
                Me.InvalidateEx()
            End If
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(0)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Longitudinal() As Integer
        Get
            Return m_intLongitudinal
        End Get
        Set(ByVal _intLongitudinal As Integer)
            If m_intLongitudinal <> _intLongitudinal Then
                m_intLongitudinal = _intLongitudinal
                Me.InvalidateEx()
            End If
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Color.Red")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property GroupColor() As Color
        Get
            Return m_objGroupColor
        End Get
        Set(ByVal _objGroupColor As Color)
            If m_objGroupColor <> _objGroupColor Then
                m_objGroupColor = _objGroupColor
                Me.InvalidateEx()
            End If
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(0)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property GroupNumber() As Integer
        Get
            Return m_intGroupNumber
        End Get
        Set(ByVal _intGroupNumber As Integer)
            If m_intGroupNumber <> _intGroupNumber Then
                m_intGroupNumber = _intGroupNumber
                Me.InvalidateEx()
            End If
        End Set
    End Property

#End Region

#Region "Methods"

    Private Sub guiRegisterCross_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles guiRegisterCross.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub lblGroupNumber_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lblGroupNumber.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub lblTop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lblTop.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub lblLongitudinal_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lblLongitudinal.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub lblLateral_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lblLateral.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub picErrorLongitudinal_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picErrorLongitudinal.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub picErrorLateral_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picErrorLateral.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub picMode_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picMode.Click
        RaiseEvent Click(sender, e)
    End Sub


    Protected Sub InvalidateEx()
        Select Case Me.LongitudinalMode
            Case Mode.Automatic
                picMode.Image = Global.Zelo.Luma.My.Resources.Resources.Disabled_runmodeAutomaticBig
            Case Mode.Manual
                picMode.Image = Global.Zelo.Luma.My.Resources.Resources.Disabled_runmodeManualBig
        End Select

        Select Case Me.LateralMode
            Case Mode.Automatic
                picMode.Image = Global.Zelo.Luma.My.Resources.Resources.Disabled_runmodeAutomaticBig
            Case Mode.Manual
                picMode.Image = Global.Zelo.Luma.My.Resources.Resources.Disabled_runmodeManualBig
        End Select

        If Me.IsActive Then
            m_objVisibleGroupColor = Me.GroupColor
            If Me.IsBaseColor Then
                lblLateral.Visible = False
                Me.tblTotal.SetRowSpan(Me.lblLongitudinal, 2)
                lblLongitudinal.Text = "BASE"
            Else
                lblLateral.Visible = True
                Me.tblTotal.SetRowSpan(Me.lblLongitudinal, 1)
                lblLateral.Text = Math.Abs(Me.Lateral).ToString
                lblLongitudinal.Text = Math.Abs(Me.Longitudinal).ToString
            End If
        Else
            m_objVisibleGroupColor = Color.White
            lblLateral.Visible = False
            Me.tblTotal.SetRowSpan(Me.lblLongitudinal, 2)
            lblLongitudinal.Text = "OFF"
        End If

        lblGroupNumber.Text = Me.GroupNumber.ToString
        lblTop.BackColor = m_objVisibleGroupColor
        lblGroupNumber.BackColor = m_objVisibleGroupColor
        If (CInt(m_objVisibleGroupColor.R) + CInt(m_objVisibleGroupColor.G) + CInt(m_objVisibleGroupColor.B)) > 500 Then
            lblGroupNumber.ForeColor = Color.Black
        Else
            lblGroupNumber.ForeColor = Color.White
        End If

        guiRegisterCross.IsBaseColor = Me.IsBaseColor
        guiRegisterCross.Range = Me.Range
        guiRegisterCross.Lateral = Me.Lateral
        guiRegisterCross.Longitudinal = Me.Longitudinal

        guiRegisterCross.Enabled = Me.Visible

        Me.PaintEx()
    End Sub

    Protected Sub PaintEx()

        picErrorLongitudinal.Visible = Me.IsActive And Not Me.IsBaseColor
        picErrorLateral.Visible = Me.IsActive And Not Me.IsBaseColor
        picMode.Visible = Me.IsActive And Not Me.IsBaseColor

        If Me.Longitudinal > 0 Then
            picErrorLongitudinal.Image = Global.Zelo.Luma.My.Resources.Resources.iconDarkPlusMiddle
            picErrorLongitudinal.Visible = True
        ElseIf Me.Longitudinal < 0 Then
            picErrorLongitudinal.Image = Global.Zelo.Luma.My.Resources.Resources.iconDarkMinusMiddle
            picErrorLongitudinal.Visible = True
        Else
            picErrorLongitudinal.Visible = False
        End If

        If Me.Lateral > 0 Then
            picErrorLateral.Image = Global.Zelo.Luma.My.Resources.Resources.iconDarkManMiddle
            picErrorLateral.Visible = True
        ElseIf Me.Lateral < 0 Then
            picErrorLateral.Image = Global.Zelo.Luma.My.Resources.Resources.iconDarkGearMiddle
            picErrorLateral.Visible = True
        Else
            picErrorLateral.Visible = False
        End If
    End Sub

#End Region

End Class
