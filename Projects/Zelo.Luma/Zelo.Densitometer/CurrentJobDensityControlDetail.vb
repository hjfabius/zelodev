' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Imports System.Windows.Forms
Imports System.Drawing

Public Class CurrentJobDensityControlDetail

#Region "Constants"

#End Region

#Region "Variables"
    Protected WithEvents m_drGroupRow As DSJobs.GroupsRow
    Protected WithEvents m_guiCalculator As GUICalculator
    Protected m_pnlValueDetail As ValuePanelDetail
    Protected m_objSelectedItem As GUIButton

    Protected m_intDensityAction As Integer
    Protected m_intRegisterLongitudinalAction As Integer
    Protected m_intRegisterLateralAction As Integer
#End Region

#Region "Events"

#End Region

#Region "Properties"

#End Region

#Region "Methods"

#Region "Public Methods"
    Public Overrides Sub LoadData()
        Dim I As Integer
        MyBase.LoadData()

        picRegisterTop.Image = Global.Zelo.Luma.My.Resources.iconDarkGearBig
        picRegisterRight.Image = Global.Zelo.Luma.My.Resources.iconDarkPlusBig
        picRegisterLeft.Image = Global.Zelo.Luma.My.Resources.iconDarkMinusBig
        picRegisterBottom.Image = Global.Zelo.Luma.My.Resources.iconDarkManBig
        picRegisterLateralAction.Image = Global.Zelo.Luma.My.Resources.red_led
        picRegisterLongitudinalAction.Image = Global.Zelo.Luma.My.Resources.red_led

        m_drGroupRow = CType(GlobalParameters.N_Tag, DSJobs.GroupsRow)

        For I = 1 To 12
            If m_drGroupRow Is Nothing Then
                guiDensiMultibarEx.GroupRow = Nothing
            Else
                guiDensiMultibarEx.GroupRow = m_drGroupRow
            End If
        Next

        AddHandlers()
        ParameterChanged()
    End Sub

#End Region

#Region "Protected Methods"

    Protected Sub AddHandlers()
        Dim drDensity As Zelo.Luma.DSJobs.DensitiesRow
        AddHandler CType(m_drGroupRow.Table, Zelo.Luma.DSJobs.GroupsDataTable).GroupsChangedEvent, AddressOf GroupsChangedEventHandler
        AddHandler CType(m_drGroupRow.RegistersRow.Table, Zelo.Luma.DSJobs.RegistersDataTable).RegistersChangedEvent, AddressOf RegistersChangedEventHandler
        For Each drDensity In m_drGroupRow.GetDensitiesRows
            AddHandler CType(drDensity.Table, Zelo.Luma.DSJobs.DensitiesDataTable).DensitiesChangedEvent, AddressOf DensitiesChangedEventHandler
        Next
    End Sub

    Protected Sub RemoveHandlers()
        Dim drDensity As Zelo.Luma.DSJobs.DensitiesRow
        RemoveHandler CType(m_drGroupRow.Table, Zelo.Luma.DSJobs.GroupsDataTable).GroupsChangedEvent, AddressOf GroupsChangedEventHandler
        RemoveHandler CType(m_drGroupRow.RegistersRow.Table, Zelo.Luma.DSJobs.RegistersDataTable).RegistersChangedEvent, AddressOf RegistersChangedEventHandler
        For Each drDensity In m_drGroupRow.GetDensitiesRows
            RemoveHandler CType(drDensity.Table, Zelo.Luma.DSJobs.DensitiesDataTable).DensitiesChangedEvent, AddressOf DensitiesChangedEventHandler
        Next
    End Sub


    Protected Sub ParameterChanged()
        DensitiesChangedEventHandler(Nothing, Nothing)
        RegistersChangedEventHandler(Nothing, Nothing)
        GroupsChangedEventHandler(Nothing, Nothing)
    End Sub

    Protected Sub SelectItemValue(ByVal _objSelectedItem As GUIButton, ByVal _strLabel As String, ByVal _sngValue As Single, ByVal _blnDecimal As Boolean)
        m_objSelectedItem = _objSelectedItem

        m_objSelectedItem.ShadowColor = GlobalParameters.GUI_ShadowColorSelected
        cmdParameters.Enabled = False

        m_pnlValueDetail = New ValuePanelDetail

        If m_objSelectedItem.Parent Is pnlDensity Then
            pnlDensity.Enabled = False
            pnlRegister.Visible = False
            m_pnlValueDetail.Parent = pnlRegister.Parent
        ElseIf m_objSelectedItem.Parent Is pnlRegister Then
            pnlRegister.Enabled = False
            pnlDensity.Visible = False
            m_pnlValueDetail.Parent = pnlDensity.Parent
        End If


        m_pnlValueDetail.Dock = System.Windows.Forms.DockStyle.Fill
        m_guiCalculator = m_pnlValueDetail.guiCalculator
        m_guiCalculator.AcceptDecimal = _blnDecimal
        m_guiCalculator.Value = _sngValue
        m_guiCalculator.Label = _strLabel

        m_pnlValueDetail.Visible = True
    End Sub

    Protected Sub DeselectItem1()
        m_objSelectedItem.ShadowColor = GlobalParameters.GUI_ShadowColor
        pnlDensity.Enabled = GlobalParameters.F_DensityControl
        pnlRegister.Enabled = GlobalParameters.F_RegisterControl
        pnlRegister.Visible = GlobalParameters.F_RegisterControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.RegistersRow Is Nothing) AndAlso (m_drGroupRow.RegistersRow.IsInstalled)
        pnlDensity.Visible = GlobalParameters.F_DensityControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.GetDensitiesRows Is Nothing) AndAlso (m_drGroupRow.GetDensitiesRows.Length > 0)
        cmdParameters.Enabled = True
    End Sub

    Protected Sub DeselectItem2()
        m_pnlValueDetail.Visible = False
        m_guiCalculator = Nothing
        m_pnlValueDetail.Dispose()

        'm_objSelectedItem = Nothing
    End Sub

#End Region

#Region "Events Handlers"

    Protected Sub RegistersChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        pnlRegister.Visible = GlobalParameters.F_RegisterControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.RegistersRow Is Nothing) AndAlso (m_drGroupRow.RegistersRow.IsInstalled)
        If pnlRegister.Visible Then
            guiRegisterCross.IsBaseColor = m_drGroupRow.RegistersRow.IsBaseColor
            guiRegisterCross.Range = m_drGroupRow.RegistersRow.Range

            If CType(m_drGroupRow.RegistersRow.LateralMode, Mode) <> Mode.Off Then
                guiRegisterCross.Lateral = CInt((m_drGroupRow.RegistersRow.LateralValue - m_drGroupRow.RegistersRow.LateralRefValue) * m_drGroupRow.RegistersRow.LateralFactor)
                guiRegisterCross.Longitudinal = CInt((m_drGroupRow.RegistersRow.LongitudinalValue - m_drGroupRow.RegistersRow.LongitudinalRefValue) * m_drGroupRow.RegistersRow.LongitudinalFactor)

                If m_drGroupRow.RegistersRow.IsBaseColor Then
                    txtRegisterLateral.Text = "BASE"
                    txtRegisterLongitudinal.Text = "BASE"
                    picRegisterLateral.Visible = False
                    picRegisterLongitudinal.Visible = False

                    txtRegisterMode.Text = "Base"
                    txtRegisterMode.Cursor = Cursors.Arrow
                Else
                    txtRegisterLateral.Text = Math.Abs(guiRegisterCross.Lateral).ToString("#0")
                    txtRegisterLongitudinal.Text = Math.Abs(guiRegisterCross.Longitudinal).ToString("#0")
                    picRegisterLateral.Visible = True
                    picRegisterLongitudinal.Visible = True

                    If guiRegisterCross.Longitudinal < 0 Then
                        picRegisterLongitudinal.Image = Global.Zelo.Luma.My.Resources.iconDarkMinusBigSec
                    ElseIf guiRegisterCross.Longitudinal > 0 Then
                        picRegisterLongitudinal.Image = Global.Zelo.Luma.My.Resources.iconDarkPlusBigSec
                    Else
                        picRegisterLongitudinal.Visible = False
                    End If

                    If guiRegisterCross.Lateral < 0 Then
                        picRegisterLateral.Image = Global.Zelo.Luma.My.Resources.iconDarkGearBigSec
                    ElseIf guiRegisterCross.Lateral > 0 Then
                        picRegisterLateral.Image = Global.Zelo.Luma.My.Resources.iconDarkManBigSec
                    Else
                        picRegisterLateral.Visible = False
                    End If

                    Select Case CType(m_drGroupRow.RegistersRow.LateralMode, Mode)
                        Case Mode.Automatic
                            txtRegisterMode.Text = "Auto"
                            txtRegisterMode.Cursor = Cursors.Hand
                        Case Mode.Manual
                            txtRegisterMode.Text = "Manual"
                            txtRegisterMode.Cursor = Cursors.Hand
                    End Select
                End If
            Else
                guiRegisterCross.Lateral = 0
                guiRegisterCross.Longitudinal = 0

                txtRegisterLateral.Text = ""
                txtRegisterLongitudinal.Text = ""

                txtRegisterMode.Text = "Off"
                txtRegisterMode.Cursor = Cursors.Arrow

                picRegisterLateral.Visible = False
                picRegisterLongitudinal.Visible = False

            End If
            pnlRegister.Invalidate()
        End If
    End Sub

    Protected Sub DensitiesChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        pnlDensity.Visible = GlobalParameters.F_DensityControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.GetDensitiesRows Is Nothing) AndAlso (m_drGroupRow.GetDensitiesRows.Length > 0)
        If pnlDensity.Visible Then



            pnlDensity.Invalidate()
        End If

    End Sub

    Protected Sub GroupsChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        Dim objGroupColor As Color
        pnlRegister.Visible = GlobalParameters.F_RegisterControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.RegistersRow Is Nothing) AndAlso (m_drGroupRow.RegistersRow.IsInstalled)
        pnlDensity.Visible = GlobalParameters.F_DensityControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.GetDensitiesRows Is Nothing) AndAlso (m_drGroupRow.GetDensitiesRows.Length > 0)


        'Group Color
        If (pnlRegister.Visible AndAlso CType(m_drGroupRow.RegistersRow.LateralMode, Mode) <> Mode.Off) Then
            objGroupColor = Color.FromArgb(m_drGroupRow.GroupColor)
        Else
            objGroupColor = Color.White
        End If
        lblGroupNumber.BackColorFaded1 = objGroupColor
        lblGroupNumber.BackColorFaded2 = objGroupColor
        If (CInt(objGroupColor.R) + CInt(objGroupColor.G) + CInt(objGroupColor.B)) > 500 Then
            lblGroupNumber.ForeColor = Color.Black
        Else
            lblGroupNumber.ForeColor = Color.White
        End If
        pnlVerticalLine.BackColor = objGroupColor
        pnlHorizontalLine.BackColor = objGroupColor

        'Group Number
        lblGroupNumber.Text = m_drGroupRow.GroupNumber.ToString

        If pnlRegister.Visible Then
            pnlRegister.Invalidate()
        End If
        If pnlDensity.Visible Then
            guiDensiMultibarEx.Invalidate()
        End If
    End Sub


    Private Sub txtDensityMode_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDensityMode.Click
        'Select Case CType(m_drGroupRow.DensitiesRow.DensityMode, Mode)
        '    Case Mode.Automatic
        '        m_drGroupRow.DensitiesRow.DensityMode = Mode.Manual
        '    Case Mode.Manual
        '        m_drGroupRow.DensitiesRow.DensityMode = Mode.Automatic
        '    Case Mode.Pause
        '        m_drGroupRow.DensitiesRow.DensityMode = Mode.Manual
        '    Case Mode.Off
        '        m_drGroupRow.DensitiesRow.DensityMode = Mode.Manual
        'End Select

        'm_intDensityAction = 0
        'picDensityAction.Visible = False
        DensitiesChangedEventHandler(Nothing, Nothing)
    End Sub

    Private Sub txtRegisterMode_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtRegisterMode.Click
        Select Case CType(m_drGroupRow.RegistersRow.LateralMode, Mode)
            Case Mode.Automatic
                m_drGroupRow.RegistersRow.LateralMode = Mode.Manual
                m_drGroupRow.RegistersRow.LongitudinalMode = Mode.Manual
            Case Mode.Manual
                m_drGroupRow.RegistersRow.LateralMode = Mode.Automatic
                m_drGroupRow.RegistersRow.LongitudinalMode = Mode.Automatic
            Case Mode.Pause
                m_drGroupRow.RegistersRow.LateralMode = Mode.Manual
                m_drGroupRow.RegistersRow.LongitudinalMode = Mode.Manual
            Case Mode.Off
                m_drGroupRow.RegistersRow.LateralMode = Mode.Manual
                m_drGroupRow.RegistersRow.LongitudinalMode = Mode.Manual
        End Select

        m_intRegisterLateralAction = 0
        m_intRegisterLongitudinalAction = 0
        picRegisterLateralAction.Visible = False
        picRegisterLongitudinalAction.Visible = False

        RegistersChangedEventHandler(Nothing, Nothing)
    End Sub


    Private Sub m_guiCalculator_KeyEnter(ByRef _objSender As Object) Handles m_guiCalculator.KeyEnter
        DeselectItem1()


        Select Case m_objSelectedItem.Name
            Case txtRegisterLateral.Name
                picRegisterLateralAction.Visible = False
                Select Case CType(m_drGroupRow.RegistersRow.LateralMode, Mode)
                    Case Mode.Automatic
                        If Not Single.IsInfinity(m_guiCalculator.Value) Then
                            m_drGroupRow.RegistersRow.LateralRefValue += m_guiCalculator.Value
                        End If
                        m_intRegisterLateralAction = 0
                    Case Mode.Manual
                        m_intRegisterLateralAction = 2
                End Select
            Case txtRegisterLongitudinal.Name
                picRegisterLongitudinalAction.Visible = False
                Select Case CType(m_drGroupRow.RegistersRow.LongitudinalMode, Mode)
                    Case Mode.Automatic
                        If Not Single.IsInfinity(m_guiCalculator.Value) Then
                            m_drGroupRow.RegistersRow.LongitudinalRefValue += m_guiCalculator.Value
                        End If
                        m_intRegisterLongitudinalAction = 0
                    Case Mode.Manual
                        m_intRegisterLongitudinalAction = 2
                End Select
        End Select
        DeselectItem2()

    End Sub

    Private Sub m_guiCalculator_KeyEsc(ByRef _objSender As Object) Handles m_guiCalculator.KeyEsc
        DeselectItem1()
        DeselectItem2()
    End Sub

    Private Sub cmdRegisterTop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdRegisterTop.Click
        SelectItemValue(txtRegisterLateral, "Register -transmission-", Single.NegativeInfinity, False)
    End Sub

    Private Sub cmdRegisterBottom_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdRegisterBottom.Click
        SelectItemValue(txtRegisterLateral, "Register -operator-", Single.PositiveInfinity, False)
    End Sub

    Private Sub cmdRegisterRight_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdRegisterRight.Click
        SelectItemValue(txtRegisterLongitudinal, "Register -advance-", Single.PositiveInfinity, False)
    End Sub

    Private Sub cmdRegisterLeft_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdRegisterLeft.Click
        SelectItemValue(txtRegisterLongitudinal, "Register -retard-", Single.NegativeInfinity, False)
    End Sub


    Private Sub objTimerRegisterLateralAction_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles objTimerRegisterLateralAction.Tick
        objTimerRegisterLateralAction.Enabled = False

        If pnlRegister.Enabled Then
            If CType(m_drGroupRow.RegistersRow.LateralMode, Mode) = Mode.Automatic Then

                If m_intRegisterLateralAction = 0 Then
                    If m_drGroupRow.RegistersRow.LateralRefValue <> m_drGroupRow.RegistersRow.LateralValue Then
                        picRegisterLateralAction.Visible = Not picRegisterLateralAction.Visible
                    Else
                        picRegisterLateralAction.Visible = False
                    End If
                Else
                    picRegisterLateralAction.Visible = False
                End If


                If picRegisterLateralAction.Visible And m_intRegisterLateralAction = 0 Then
                    m_intRegisterLateralAction = 10
                Else
                    m_intRegisterLateralAction -= 1
                End If

            ElseIf CType(m_drGroupRow.RegistersRow.LateralMode, Mode) = Mode.Manual Then
                If m_intRegisterLateralAction > 0 Then
                    picRegisterLateralAction.Visible = Not picRegisterLateralAction.Visible
                    m_intRegisterLateralAction -= 1
                Else
                    picRegisterLateralAction.Visible = False
                End If
            End If
        Else
            picRegisterLateralAction.Visible = False
        End If

        objTimerRegisterLateralAction.Enabled = True
    End Sub

    Private Sub objTimerRegisterLongitudinalAction_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles objTimerRegisterLongitudinalAction.Tick
        objTimerRegisterLongitudinalAction.Enabled = False

        If pnlRegister.Enabled Then
            If CType(m_drGroupRow.RegistersRow.LongitudinalMode, Mode) = Mode.Automatic Then

                If m_intRegisterLongitudinalAction = 0 Then
                    If m_drGroupRow.RegistersRow.LongitudinalRefValue <> m_drGroupRow.RegistersRow.LongitudinalValue Then
                        picRegisterLongitudinalAction.Visible = Not picRegisterLongitudinalAction.Visible
                    Else
                        picRegisterLongitudinalAction.Visible = False
                    End If
                Else
                    picRegisterLongitudinalAction.Visible = False
                End If


                If picRegisterLongitudinalAction.Visible And m_intRegisterLongitudinalAction = 0 Then
                    m_intRegisterLongitudinalAction = 10
                Else
                    m_intRegisterLongitudinalAction -= 1
                End If

            ElseIf CType(m_drGroupRow.RegistersRow.LongitudinalMode, Mode) = Mode.Manual Then
                If m_intRegisterLongitudinalAction > 0 Then
                    picRegisterLongitudinalAction.Visible = Not picRegisterLongitudinalAction.Visible
                    m_intRegisterLongitudinalAction -= 1
                Else
                    picRegisterLongitudinalAction.Visible = False
                End If
            End If
        Else
            picRegisterLongitudinalAction.Visible = False
        End If

        objTimerRegisterLongitudinalAction.Enabled = True
    End Sub
    Private Sub cmdParameters_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdParameters.Click
        Me.NavigationManager.SetMainPage(cmdParameters.NavigationID)
    End Sub


    Private Sub CurrentJobRegisterDensityControlDetail_Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Disposed
        RemoveHandlers()
    End Sub

    Private Sub picRegisterTop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picRegisterTop.Click
        SelectItemValue(txtRegisterLateral, "Register -transmission-", Single.NegativeInfinity, False)
    End Sub

    Private Sub picRegisterLeft_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picRegisterLeft.Click
        SelectItemValue(txtRegisterLongitudinal, "Register -retard-", Single.NegativeInfinity, False)
    End Sub

    Private Sub picRegisterBottom_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picRegisterBottom.Click
        SelectItemValue(txtRegisterLateral, "Register -operator-", Single.PositiveInfinity, False)
    End Sub

    Private Sub picRegisterRight_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picRegisterRight.Click
        SelectItemValue(txtRegisterLongitudinal, "Register -advance-", Single.PositiveInfinity, False)
    End Sub
#End Region

#End Region

End Class
