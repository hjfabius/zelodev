' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class CurrentJobRegisterViscosityControlDetail

#Region "Constants"

#End Region

#Region "Variables"
    Protected WithEvents m_drGroupRow As DSJobs.GroupsRow
    Protected WithEvents m_guiCalculator As GUICalculator
    Protected m_pnlValueDetail As ValuePanelDetail
    Protected m_objSelectedItem As GUIButton

    Protected m_intViscosityAction As Integer
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

        MyBase.LoadData()

        picRegisterTop.Image = Global.Zelo.Luma.My.Resources.iconDarkGearBig
        picRegisterRight.Image = Global.Zelo.Luma.My.Resources.iconDarkPlusBig
        picRegisterLeft.Image = Global.Zelo.Luma.My.Resources.iconDarkMinusBig
        picRegisterBottom.Image = Global.Zelo.Luma.My.Resources.iconDarkManBig
        picRegisterLateralAction.Image = Global.Zelo.Luma.My.Resources.red_led
        picRegisterLongitudinalAction.Image = Global.Zelo.Luma.My.Resources.red_led
        picViscosityAction.Image = Global.Zelo.Luma.My.Resources.red_led
        objTimerViscosityAction.Interval = 500

        m_drGroupRow = CType(GlobalParameters.N_Tag, DSJobs.GroupsRow)
        AddHandlers()
        ParameterChanged()
    End Sub

#End Region

#Region "Protected Methods"

    Protected Sub AddHandlers()
        AddHandler CType(m_drGroupRow.Table, Zelo.Luma.DSJobs.GroupsDataTable).GroupsChangedEvent, AddressOf GroupsChangedEventHandler
        AddHandler CType(m_drGroupRow.RegistersRow.Table, Zelo.Luma.DSJobs.RegistersDataTable).RegistersChangedEvent, AddressOf RegistersChangedEventHandler
        AddHandler CType(m_drGroupRow.ViscositiesRow.Table, Zelo.Luma.DSJobs.ViscositiesDataTable).ViscositiesChangedEvent, AddressOf ViscositiesChangedEventHandler
    End Sub

    Protected Sub RemoveHandlers()
        RemoveHandler CType(m_drGroupRow.Table, Zelo.Luma.DSJobs.GroupsDataTable).GroupsChangedEvent, AddressOf GroupsChangedEventHandler
        RemoveHandler CType(m_drGroupRow.RegistersRow.Table, Zelo.Luma.DSJobs.RegistersDataTable).RegistersChangedEvent, AddressOf RegistersChangedEventHandler
        RemoveHandler CType(m_drGroupRow.ViscositiesRow.Table, Zelo.Luma.DSJobs.ViscositiesDataTable).ViscositiesChangedEvent, AddressOf ViscositiesChangedEventHandler
    End Sub

    Protected Sub ParameterChanged()
        ViscositiesChangedEventHandler(Nothing, Nothing)
        RegistersChangedEventHandler(Nothing, Nothing)
        GroupsChangedEventHandler(Nothing, Nothing)
    End Sub

    Protected Sub SelectItemValue(ByVal _objSelectedItem As GUIButton, ByVal _strLabel As String, ByVal _sngValue As Single, ByVal _blnDecimal As Boolean)
        m_objSelectedItem = _objSelectedItem

        m_objSelectedItem.ShadowColor = GlobalParameters.GUI_ShadowColorSelected
        cmdParameters.Enabled = False

        m_pnlValueDetail = New ValuePanelDetail

        If m_objSelectedItem.Parent Is pnlViscosity Then
            pnlViscosity.Enabled = False
            pnlRegister.Visible = False
            m_pnlValueDetail.Parent = pnlRegister.Parent
        ElseIf m_objSelectedItem.Parent Is pnlRegister Then
            pnlRegister.Enabled = False
            pnlViscosity.Visible = False
            m_pnlValueDetail.Parent = pnlViscosity.Parent
        End If


        m_pnlValueDetail.Dock = DockStyle.Fill
        m_guiCalculator = m_pnlValueDetail.guiCalculator
        m_guiCalculator.AcceptDecimal = _blnDecimal
        m_guiCalculator.Value = _sngValue
        m_guiCalculator.Label = _strLabel

        m_pnlValueDetail.Visible = True
    End Sub

    Protected Sub DeselectItem1()
        m_objSelectedItem.ShadowColor = GlobalParameters.GUI_ShadowColor
        pnlViscosity.Enabled = GlobalParameters.F_ViscosityControl
        pnlRegister.Enabled = GlobalParameters.F_RegisterControl
        pnlRegister.Visible = GlobalParameters.F_RegisterControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.RegistersRow Is Nothing) AndAlso (m_drGroupRow.RegistersRow.IsInstalled)
        pnlViscosity.Visible = GlobalParameters.F_ViscosityControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.ViscositiesRow Is Nothing) AndAlso (m_drGroupRow.ViscositiesRow.IsInstalled)
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

    Protected Sub ViscositiesChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        pnlViscosity.Visible = GlobalParameters.F_ViscosityControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.ViscositiesRow Is Nothing) AndAlso (m_drGroupRow.ViscositiesRow.IsInstalled)
        If pnlViscosity.Visible Then

            Select Case CType(m_drGroupRow.ViscositiesRow.Fluid, Zelo.Luma.Fluid)
                Case Fluid.Glue
                    cmdInk.Text = "Glue"
                Case Fluid.Varnish
                    cmdInk.Text = "Vernish"
                Case Else 'Fluid.Ink
                    cmdInk.Text = "Ink"
            End Select

            guiTermometer.Min = m_drGroupRow.ViscositiesRow.TemperatureMin
            guiTermometer.Max = m_drGroupRow.ViscositiesRow.TemperatureMax
            guiTermometer.Range = m_drGroupRow.ViscositiesRow.TemperatureRange
            guiViscosity.RefValue = m_drGroupRow.ViscositiesRow.ViscosityRefValue



            If CType(m_drGroupRow.ViscositiesRow.ViscosityMode, Mode) <> Mode.Off Then
                txtActualTemperature.Text = (m_drGroupRow.ViscositiesRow.TemperatureValue * m_drGroupRow.ViscositiesRow.TemperatureFactor).ToString("#0") & "°C"
                guiTermometer.Value = m_drGroupRow.ViscositiesRow.TemperatureValue * m_drGroupRow.ViscositiesRow.TemperatureFactor

                txtActualViscosity.Text = (m_drGroupRow.ViscositiesRow.ViscosityValue * m_drGroupRow.ViscositiesRow.ViscosityFactor).ToString("#0.0") & "s"
                guiViscosity.Value = m_drGroupRow.ViscositiesRow.ViscosityValue * m_drGroupRow.ViscositiesRow.ViscosityFactor

                cmdSolvent.Enabled = True
                cmdClean.Enabled = True

                Select Case CType(m_drGroupRow.ViscositiesRow.ViscosityMode, Mode)
                    Case Mode.Automatic
                        txtViscosityMode.Text = "Auto"
                        cmdInk.Enabled = True
                    Case Mode.Manual
                        txtViscosityMode.Text = "Manual"
                        cmdInk.Enabled = False
                    Case Mode.Pause
                        txtViscosityMode.Text = "Pause"
                        cmdInk.Enabled = True
                End Select

                txtRefViscosity.Text = m_drGroupRow.ViscositiesRow.ViscosityRefValue.ToString("#0.0") & "s"
                txtRefViscosity.Enabled = True

            Else
                txtActualTemperature.Text = ""
                guiTermometer.Value = 0

                txtActualViscosity.Text = ""
                guiViscosity.Value = guiViscosity.RefValue

                cmdSolvent.Enabled = False
                cmdClean.Enabled = False

                txtViscosityMode.Text = "Off"
                cmdInk.Enabled = False

                txtRefViscosity.Text = ""
                txtRefViscosity.Enabled = False

            End If

            pnlViscosity.Invalidate()
        End If

    End Sub

    Protected Sub GroupsChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        Dim objGroupColor As Color
        Dim ardrGroupRows As DSJobs.GroupsRow()

        pnlRegister.Visible = GlobalParameters.F_RegisterControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.RegistersRow Is Nothing) AndAlso (m_drGroupRow.RegistersRow.IsInstalled)
        pnlViscosity.Visible = GlobalParameters.F_ViscosityControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.ViscositiesRow Is Nothing) AndAlso (m_drGroupRow.ViscositiesRow.IsInstalled)

        ardrGroupRows = CType(m_drGroupRow.Table.Select(String.Format("(JobID={0}) AND (GroupNumber<{1}) AND (IsInstalled=True)", m_drGroupRow.JobID, m_drGroupRow.GroupNumber), "GroupNumber DESC"), DSJobs.GroupsRow())
        cmdMovePrevious.Visible = (Not ardrGroupRows Is Nothing AndAlso ardrGroupRows.Length > 0)

        ardrGroupRows = CType(m_drGroupRow.Table.Select(String.Format("(JobID={0}) AND (GroupNumber>{1}) AND (IsInstalled=True)", m_drGroupRow.JobID, m_drGroupRow.GroupNumber), "GroupNumber ASC"), DSJobs.GroupsRow())
        cmdMoveNext.Visible = (Not ardrGroupRows Is Nothing AndAlso ardrGroupRows.Length > 0)


        'Group Color
        If (pnlRegister.Visible AndAlso CType(m_drGroupRow.RegistersRow.LateralMode, Mode) <> Mode.Off) Or _
            (pnlViscosity.Visible AndAlso CType(m_drGroupRow.ViscositiesRow.ViscosityMode, Mode) <> Mode.Off) Then
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
        If pnlViscosity.Visible Then
            guiViscosity.Invalidate()
        End If
    End Sub


    Private Sub txtViscosityMode_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtViscosityMode.Click
        Select Case CType(m_drGroupRow.ViscositiesRow.ViscosityMode, Mode)
            Case Mode.Automatic
                m_drGroupRow.ViscositiesRow.ViscosityMode = Mode.Manual
            Case Mode.Manual
                m_drGroupRow.ViscositiesRow.ViscosityMode = Mode.Automatic
            Case Mode.Pause
                m_drGroupRow.ViscositiesRow.ViscosityMode = Mode.Manual
            Case Mode.Off
                m_drGroupRow.ViscositiesRow.ViscosityMode = Mode.Manual
        End Select

        m_intViscosityAction = 0
        picViscosityAction.Visible = False
        ViscositiesChangedEventHandler(Nothing, Nothing)
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


    Private Sub cmdInk_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdInk.Click
        Dim strFluid As String
        Select Case CType(m_drGroupRow.ViscositiesRow.Fluid, Zelo.Luma.Fluid)
            Case Fluid.Glue
                strFluid = "glue"
            Case Fluid.Varnish
                strFluid = "varnish"
            Case Else 'Fluid.Ink
                strFluid = "ink"
        End Select
        If GUIMessageBox.QuestionYesNo(String.Format("Have you added {0} into the tank?", strFluid), "Viscosity Control") = DialogResult.Yes Then
            m_drGroupRow.ViscositiesRow.Pause = GlobalParameters.BLL_ViscosityPause
            m_drGroupRow.ViscositiesRow.ViscosityMode = Mode.Pause
            GUIMessageBox.ShowOkOnly("Measurement and control is temporarily suspended", "Viscosity Control")
        End If


    End Sub

    Private Sub cmdSolvent_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSolvent.Click
        If GUIMessageBox.QuestionYesNo("Do you want to add solvent?", "Viscosity Control") = DialogResult.Yes Then
            GUIMessageBox.ShowStop("Press ""Stop"" button to terminate", "Viscosity Control -solvent addition-")
        End If
    End Sub

    Private Sub cmdClean_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdClean.Click
        If GUIMessageBox.QuestionYesNo("Do you want to wash the viscometer?", "Viscosity Control") = DialogResult.Yes Then
            If GUIMessageBox.QuestionContinueCancel("Please check if input valve is closed before continue", "Viscosity Control") = DialogResult.OK Then
                GUIMessageBox.ShowStop("Press ""Stop"" button to terminate", "Viscosity Control -washing-")
                m_drGroupRow.ViscositiesRow.ViscosityMode = Mode.Off
            End If
        End If
    End Sub



    Private Sub txtRefViscosity_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtRefViscosity.Click
        SelectItemValue(txtRefViscosity, cmdReference.Text, CSng(m_drGroupRow.ViscositiesRow.ViscosityRefValue), True)
    End Sub

    Private Sub m_guiCalculator_KeyEnter(ByRef _objSender As Object) Handles m_guiCalculator.KeyEnter
        DeselectItem1()


        Select Case m_objSelectedItem.Name
            Case txtRefViscosity.Name
                picViscosityAction.Visible = False
                If Not Single.IsInfinity(m_guiCalculator.Value) Then
                    m_drGroupRow.ViscositiesRow.ViscosityRefValue = m_guiCalculator.Value
                End If
                m_intViscosityAction = 0

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

    Private Sub objTimerViscosityAction_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles objTimerViscosityAction.Tick
        objTimerViscosityAction.Enabled = False

        If pnlViscosity.Enabled Then
            If CType(m_drGroupRow.ViscositiesRow.ViscosityMode, Mode) = Mode.Automatic Then
                If m_drGroupRow.ViscositiesRow.ViscosityRefValue <> m_drGroupRow.ViscositiesRow.ViscosityValue Then
                    picViscosityAction.Visible = Not picViscosityAction.Visible
                Else
                    picViscosityAction.Visible = False
                End If
            End If
        Else
            picViscosityAction.Visible = False
        End If
        objTimerViscosityAction.Enabled = True

    End Sub


    Private Sub cmdParameters_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdParameters.Click
        Me.NavigationManager.SetMainPage(cmdParameters.NavigationID)
    End Sub

    Private Sub cmdMovePrevious_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMovePrevious.Click
        Dim ardrGroupRows As DSJobs.GroupsRow()
        ardrGroupRows = CType(m_drGroupRow.Table.Select(String.Format("(JobID={0}) AND (GroupNumber<{1}) AND (IsInstalled=True)", m_drGroupRow.JobID, m_drGroupRow.GroupNumber), "GroupNumber DESC"), DSJobs.GroupsRow())
        If Not ardrGroupRows Is Nothing AndAlso _
            ardrGroupRows.Length > 0 Then
            m_drGroupRow = ardrGroupRows(0)
            GlobalParameters.N_Tag = ardrGroupRows(0)
            ParameterChanged()
        End If

    End Sub

    Private Sub cmdMoveNext_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveNext.Click
        Dim ardrGroupRows As DSJobs.GroupsRow()

        ardrGroupRows = CType(m_drGroupRow.Table.Select(String.Format("(JobID={0}) AND (GroupNumber>{1}) AND (IsInstalled=True)", m_drGroupRow.JobID, m_drGroupRow.GroupNumber), "GroupNumber ASC"), DSJobs.GroupsRow())
        If Not ardrGroupRows Is Nothing AndAlso _
            ardrGroupRows.Length > 0 Then
            m_drGroupRow = ardrGroupRows(0)
            GlobalParameters.N_Tag = ardrGroupRows(0)
            ParameterChanged()
        End If

    End Sub

    Private Sub CurrentJobRegisterViscosityControlDetail_Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Disposed
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
