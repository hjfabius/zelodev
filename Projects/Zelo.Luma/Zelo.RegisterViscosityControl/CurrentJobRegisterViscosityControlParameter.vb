Public Class CurrentJobRegisterViscosityControlParameter
    ' Fabio Cristini @ Zelo Elettronica srl
    ' http://www.zeloelettronica.it
    ' http://www.fabiocristini.com
    '

#Region "Constants"

#End Region

#Region "Variables"
    Protected WithEvents m_drGroupRow As DSJobs.GroupsRow
    Protected WithEvents m_guiCalculator As GUICalculator
    Protected WithEvents m_guiColor As GUIColourChooser
    Protected WithEvents m_guiMark As GUIMark
    Protected m_pnlValueDetail As ValuePanelDetail
    Protected m_objSelectedItem As GUIButton

#End Region

#Region "Events"

#End Region

#Region "Properties"

#End Region

#Region "Methods"

#Region "Public Methods"
    Public Overrides Sub LoadData()
        MyBase.LoadData()
        m_drGroupRow = CType(GlobalParameters.N_Tag, DSJobs.GroupsRow)
        m_guiColor = New GUIColourChooser
        m_guiColor.Parent = pnlDown.Parent
        m_guiColor.Dock = DockStyle.Fill

        m_guiMark = New GUIMark
        m_guiMark.Parent = pnlDown.Parent
        m_guiMark.GroupRow = m_drGroupRow
        m_guiMark.Dock = DockStyle.Fill

        pnlViscosity.Visible = GlobalParameters.F_ViscosityControl
        pnlRegister.Visible = GlobalParameters.F_RegisterControl

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

    Protected Sub SaveJob()
        RemoveHandlers()
        Me.JobsManager.SaveJobs()
        AddHandlers()
    End Sub
#End Region

#Region "Events Handlers"

    Protected Sub SelectItemValue(ByVal _objSelectedItem As GUIButton, ByVal _strLabel As String, ByVal _sngValue As Single, ByVal _blnDecimal As Boolean)
        m_objSelectedItem = _objSelectedItem

        m_objSelectedItem.ShadowColor = GlobalParameters.GUI_ShadowColorSelected

        m_pnlValueDetail = New ValuePanelDetail

        If m_objSelectedItem.Parent Is pnlViscosity Then
            m_pnlValueDetail.Parent = pnlRegister.Parent
            tblDown.SetCellPosition(m_pnlValueDetail, New TableLayoutPanelCellPosition(2, 0))
            pnlViscosity.Enabled = False
            pnlRegister.Visible = False
        ElseIf m_objSelectedItem.Parent Is pnlRegister Then
            m_pnlValueDetail.Parent = pnlViscosity.Parent
            tblDown.SetCellPosition(m_pnlValueDetail, New TableLayoutPanelCellPosition(0, 0))
            pnlRegister.Enabled = False
            pnlViscosity.Visible = False
        Else
            m_pnlValueDetail.Parent = pnlViscosity.Parent
            tblDown.SetCellPosition(m_pnlValueDetail, New TableLayoutPanelCellPosition(0, 0))
            pnlRegister.Enabled = False
            pnlViscosity.Visible = False
        End If

        pnlTop.Enabled = False

        m_pnlValueDetail.Dock = DockStyle.Fill

        m_guiCalculator = m_pnlValueDetail.guiCalculator
        m_guiCalculator.AcceptDecimal = _blnDecimal
        m_guiCalculator.Value = _sngValue
        m_guiCalculator.Label = _strLabel

        m_pnlValueDetail.Visible = True
    End Sub


    Protected Sub DeselectItem1()
        m_objSelectedItem.ShadowColor = GlobalParameters.GUI_ShadowColor
        pnlViscosity.Enabled = True
        pnlRegister.Enabled = True
        pnlRegister.Visible = GlobalParameters.F_RegisterControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.RegistersRow Is Nothing) AndAlso (m_drGroupRow.RegistersRow.IsInstalled)
        pnlViscosity.Visible = GlobalParameters.F_ViscosityControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.ViscositiesRow Is Nothing) AndAlso (m_drGroupRow.ViscositiesRow.IsInstalled)
        pnlTop.Enabled = True
    End Sub

    Protected Sub DeselectItem2()
        m_pnlValueDetail.Visible = False
        m_guiCalculator = Nothing
        m_pnlValueDetail.Dispose()
    End Sub

    Protected Sub RegistersChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        pnlRegister.Visible = GlobalParameters.F_RegisterControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.RegistersRow Is Nothing) AndAlso (m_drGroupRow.RegistersRow.IsInstalled)
        If pnlRegister.Visible Then
            If m_drGroupRow.RegistersRow.IsBaseColor Then
                txtBaseColor.Text = "Yes"
            Else
                txtBaseColor.Text = "No"
            End If

            If CType(m_drGroupRow.RegistersRow.LateralMode, Mode) = Mode.Off Then
                txtActiveLateral.Text = "No"
            Else
                txtActiveLateral.Text = "Yes"
            End If

            If CType(m_drGroupRow.RegistersRow.LongitudinalMode, Mode) = Mode.Off Then
                txtActiveLongitudinal.Text = "No"
            Else
                txtActiveLongitudinal.Text = "Yes"
            End If

            txtMarkNumber.Text = (m_drGroupRow.RegistersRow.MarkID + 1).ToString


            If CType(m_drGroupRow.RegistersRow.Side, Side) = Side.BackSide Then
                txtRegisterSide.Text = "Backside"
            Else
                txtRegisterSide.Text = "Frontside"
            End If

            txtMarkPositionX.Text = ""
            txtMarkPositionY.Text = ""

            txtRegisterCyclic.Text = m_drGroupRow.RegistersRow.Cyclic.ToString
            txtCylinderLength.Text = m_drGroupRow.RegistersRow.CylinderLength.ToString

            pnlRegister.Invalidate()
        Else
            txtBaseColor.Enabled = False
            txtBaseColor.Text = ""
            txtActiveLateral.Enabled = False
            txtActiveLateral.Text = ""
            txtActiveLongitudinal.Enabled = False
            txtActiveLongitudinal.Text = ""
            txtMarkNumber.Enabled = False
            txtMarkNumber.Text = ""
            txtMarkPositionX.Enabled = False
            txtMarkPositionX.Text = ""
            txtMarkPositionY.Enabled = False
            txtMarkPositionY.Text = ""
            txtRegisterSide.Text = ""
            txtRegisterCyclic.Text = ""
            txtCylinderLength.Text = ""
        End If

        If Not sender Is Nothing Then
            Me.SaveJob()
        End If

    End Sub

    Protected Sub ViscositiesChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        pnlViscosity.Visible = GlobalParameters.F_ViscosityControl AndAlso (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.ViscositiesRow Is Nothing) AndAlso (m_drGroupRow.ViscositiesRow.IsInstalled)
        If pnlViscosity.Visible Then

            If CType(m_drGroupRow.ViscositiesRow.ViscosityMode, Mode) = Mode.Off Then
                txtViscosityActive.Text = "No"
            Else
                txtViscosityActive.Text = "Yes"
            End If
            txtViscosityReal.Text = Math.Round(m_drGroupRow.ViscositiesRow.ViscosityValue * m_drGroupRow.ViscositiesRow.ViscosityFactor, 1) & "s"
            txtViscosityBoundMax.Text = m_drGroupRow.ViscositiesRow.ViscosityMax & "s"
            txtViscosityBoundMin.Text = m_drGroupRow.ViscositiesRow.ViscosityMin & "s"

            txtTemperatureReal.Text = Math.Round(m_drGroupRow.ViscositiesRow.TemperatureValue * m_drGroupRow.ViscositiesRow.TemperatureFactor, 1) & "°"
            txtTemperatureBoundMax.Text = m_drGroupRow.ViscositiesRow.TemperatureMax & "°"
            txtTemperatureBoundMin.Text = m_drGroupRow.ViscositiesRow.TemperatureMin & "°"
            pnlViscosity.Invalidate()
        Else
            txtViscosityActive.Text = "No"
            txtViscosityReal.Text = ""
            txtViscosityBoundMax.Text = ""
            txtViscosityBoundMin.Text = ""

            txtTemperatureReal.Text = ""
            txtTemperatureBoundMax.Text = ""
            txtTemperatureBoundMin.Text = ""
        End If

        If Not sender Is Nothing Then
            Me.SaveJob()
        End If

    End Sub

    Protected Sub GroupsChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        Dim objGroupColor As Color
        pnlRegister.Visible = (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.RegistersRow Is Nothing) AndAlso (m_drGroupRow.RegistersRow.IsInstalled)
        pnlViscosity.Visible = (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not m_drGroupRow.ViscositiesRow Is Nothing) AndAlso (m_drGroupRow.ViscositiesRow.IsInstalled)


        'Group Color
        If (pnlRegister.Visible AndAlso CType(m_drGroupRow.RegistersRow.LateralMode, Mode) <> Mode.Off) Or _
            (pnlViscosity.Visible AndAlso CType(m_drGroupRow.ViscositiesRow.ViscosityMode, Mode) <> Mode.Off) Then
            objGroupColor = Color.FromArgb(m_drGroupRow.GroupColor)
        Else
            objGroupColor = Color.White
        End If

        txtGroupColor.BackColorFaded1 = objGroupColor
        txtGroupColor.BackColorFaded2 = objGroupColor
        m_guiColor.PreviousColor = objGroupColor
        m_guiColor.CurrentColor = objGroupColor


        pnlVerticalLine.BackColor = objGroupColor
        pnlHorizontalLine.BackColor = objGroupColor

        txtGroupNumber.Text = m_drGroupRow.GroupNumber.ToString

        If pnlRegister.Visible Then
            pnlRegister.Invalidate()
        End If
        If pnlViscosity.Visible Then
            pnlViscosity.Invalidate()
        End If

        If Not sender Is Nothing Then
            Me.SaveJob()
        End If


    End Sub


    Private Sub txtRegisterSide_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtRegisterSide.Click
        If CType(m_drGroupRow.RegistersRow.Side, Side) = Side.FrontSide Then
            m_drGroupRow.RegistersRow.Side = Side.BackSide
        Else
            m_drGroupRow.RegistersRow.Side = Side.FrontSide
        End If
    End Sub


    Private Sub txtGroupNumber_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtGroupNumber.Click
        SelectItemValue(txtGroupNumber, "Group Number", m_drGroupRow.GroupNumber, False)
    End Sub

    Private Sub txtViscosityReal_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtViscosityReal.Click
        SelectItemValue(txtViscosityReal, "Calibration Real Viscosity", CSng(m_drGroupRow.ViscositiesRow.ViscosityValue * m_drGroupRow.ViscositiesRow.ViscosityFactor), True)
    End Sub

    Private Sub txtTemperatureReal_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtTemperatureReal.Click
        SelectItemValue(txtTemperatureReal, "Calibration Real Temperature", CSng(m_drGroupRow.ViscositiesRow.TemperatureValue * m_drGroupRow.ViscositiesRow.TemperatureFactor), True)
    End Sub

    Private Sub txtViscosityBoundMin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtViscosityBoundMin.Click
        SelectItemValue(txtViscosityBoundMin, "Min Viscosity", CSng(m_drGroupRow.ViscositiesRow.ViscosityMin), True)
    End Sub

    Private Sub txtViscosityBoundMax_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtViscosityBoundMax.Click
        SelectItemValue(txtViscosityBoundMax, "Max Viscosity", CSng(m_drGroupRow.ViscositiesRow.ViscosityMax), True)
    End Sub

    Private Sub txtTemperatureBoundMin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtTemperatureBoundMin.Click
        SelectItemValue(txtTemperatureBoundMin, "Min Temperature", CSng(m_drGroupRow.ViscositiesRow.TemperatureMin), True)
    End Sub

    Private Sub txtTemperatureBoundMax_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtTemperatureBoundMax.Click
        SelectItemValue(txtTemperatureBoundMax, "Max Temperature", CSng(m_drGroupRow.ViscositiesRow.TemperatureMax), True)
    End Sub

    Private Sub txtActiveLongitudinal_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtActiveLongitudinal.Click
        If CType(m_drGroupRow.RegistersRow.LongitudinalMode, Mode) = Mode.Off Then
            m_drGroupRow.RegistersRow.LongitudinalMode = Mode.Manual
        Else
            m_drGroupRow.RegistersRow.LongitudinalMode = Mode.Off
        End If
    End Sub

    Private Sub txtActiveLateral_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtActiveLateral.Click
        If CType(m_drGroupRow.RegistersRow.LateralMode, Mode) = Mode.Off Then
            m_drGroupRow.RegistersRow.LateralMode = Mode.Manual
        Else
            m_drGroupRow.RegistersRow.LateralMode = Mode.Off
        End If
    End Sub

    Private Sub txtBaseColor_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtBaseColor.Click
        m_drGroupRow.RegistersRow.IsBaseColor = Not m_drGroupRow.RegistersRow.IsBaseColor
    End Sub

    Private Sub txtMarkNumber_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtMarkNumber.Click
        m_guiMark.Visible = True
        m_guiColor.Visible = False
        pnlDown.Visible = False
    End Sub

    Private Sub txtGroupColor_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtGroupColor.Click
        m_guiColor.Visible = True
        m_guiMark.Visible = False
        pnlDown.Visible = False
    End Sub


    Private Sub CurrentJobRegisterViscosityControlParameter_Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Disposed
        RemoveHandlers()
    End Sub

    Private Sub txtViscosityActive_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtViscosityActive.Click
        If CType(m_drGroupRow.ViscositiesRow.ViscosityMode, Mode) = Mode.Off Then
            m_drGroupRow.ViscositiesRow.ViscosityMode = Mode.Manual
        Else
            m_drGroupRow.ViscositiesRow.ViscosityMode = Mode.Off
        End If
    End Sub

    Private Sub txtRegisterCyclic_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtRegisterCyclic.Click
        SelectItemValue(txtRegisterCyclic, "Distance", CSng(m_drGroupRow.RegistersRow.Cyclic), False)
    End Sub

    Private Sub txtCylinderLength_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtCylinderLength.Click
        SelectItemValue(txtCylinderLength, "Cylinder Lenght", CSng(m_drGroupRow.RegistersRow.CylinderLength), False)
    End Sub

    Private Sub m_guiCalculator_KeyEnter(ByRef _objSender As Object) Handles m_guiCalculator.KeyEnter
        DeselectItem1()

        Select Case m_objSelectedItem.Name
            Case txtGroupNumber.Name
                m_drGroupRow.GroupNumber = CInt(m_guiCalculator.Value)
            Case txtTemperatureReal.Name
                '(m_drGroupRow.ViscositiesRow.TemperatureValue * m_drGroupRow.ViscositiesRow.TemperatureFactor)
                m_drGroupRow.ViscositiesRow.TemperatureFactor = Math.Round(m_guiCalculator.Value / m_drGroupRow.ViscositiesRow.TemperatureValue, 3)
            Case txtViscosityReal.Name
                m_drGroupRow.ViscositiesRow.ViscosityFactor = Math.Round(m_guiCalculator.Value / m_drGroupRow.ViscositiesRow.ViscosityValue, 3)
            Case txtViscosityBoundMin.Name
                m_drGroupRow.ViscositiesRow.ViscosityMin = Math.Round(m_guiCalculator.Value, 3)
            Case txtViscosityBoundMax.Name
                m_drGroupRow.ViscositiesRow.ViscosityMax = Math.Round(m_guiCalculator.Value, 3)
            Case txtTemperatureBoundMin.Name
                m_drGroupRow.ViscositiesRow.TemperatureMin = Math.Round(m_guiCalculator.Value, 3)
            Case txtTemperatureBoundMax.Name
                m_drGroupRow.ViscositiesRow.TemperatureMax = Math.Round(m_guiCalculator.Value, 3)
            Case txtCylinderLength.Name
                'm_drGroupRow.RegistersRow.CylinderLength = CInt(m_guiCalculator.Value)
                Me.JobsManager.CylidnerLength = CInt(m_guiCalculator.Value)
            Case txtRegisterCyclic.Name
                m_drGroupRow.RegistersRow.Cyclic = CInt(m_guiCalculator.Value)
        End Select
        DeselectItem2()

    End Sub

    Private Sub m_guiCalculator_KeyEsc(ByRef _objSender As Object) Handles m_guiCalculator.KeyEsc
        DeselectItem1()
        DeselectItem2()
    End Sub

    Private Sub m_guiColor_OnClosing(ByRef sender As Object, ByVal _objSelectedColor As System.Drawing.Color) Handles m_guiColor.OnClosing
        pnlDown.Visible = True
        m_guiColor.Visible = False
        pnlDown.Refresh()
        m_drGroupRow.GroupColor = _objSelectedColor.ToArgb
        m_guiMark.GroupRow = m_drGroupRow
        pnlDown.Refresh()
    End Sub

    Private Sub m_guiMark_KeyCancelPressed(ByRef sender As Object, ByVal e As System.EventArgs) Handles m_guiMark.KeyCancelPressed
        m_guiMark.Visible = False
        m_guiColor.Visible = False
        pnlDown.Visible = True
    End Sub

    Private Sub m_guiMark_KeyOkPressed(ByRef sender As Object, ByVal e As System.EventArgs) Handles m_guiMark.KeyOkPressed
        m_guiMark.Visible = False
        m_guiColor.Visible = False
        pnlDown.Visible = True
    End Sub

#End Region

#End Region

End Class

