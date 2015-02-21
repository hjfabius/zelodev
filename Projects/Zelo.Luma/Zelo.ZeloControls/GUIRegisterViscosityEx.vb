' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class GUIRegisterViscosityEx
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Protected WithEvents m_drGroupRow As Zelo.Luma.DSJobs.GroupsRow
    Protected m_blnRegisterVisible As Boolean = True
    Protected m_blnViscosityVisible As Boolean = True

#End Region

#Region "Events"
    Public Shadows Event Click(ByVal sender As Object, ByVal e As System.EventArgs)
#End Region

#Region "Properties"

    Public Property RegisterVisible() As Boolean
        Get
            Return m_blnRegisterVisible
        End Get
        Set(ByVal _blnRegisterVisible As Boolean)
            m_blnRegisterVisible = _blnRegisterVisible
            ParameterChanged()
        End Set
    End Property



    Public Property ViscosityVisible() As Boolean
        Get
            Return m_blnViscosityVisible
        End Get
        Set(ByVal _blnViscosityVisible As Boolean)
            m_blnViscosityVisible = _blnViscosityVisible
            ParameterChanged()
        End Set
    End Property




    Public Property GroupRow() As Zelo.Luma.DSJobs.GroupsRow
        Get
            Return m_drGroupRow
        End Get
        Set(ByVal _drGroupRow As Zelo.Luma.DSJobs.GroupsRow)
            If Not m_drGroupRow Is _drGroupRow Then
                If Not m_drGroupRow Is Nothing Then
                    RemoveHandlers()
                End If
                m_drGroupRow = _drGroupRow
                If Not m_drGroupRow Is Nothing Then
                    AddHandlers()
                End If
                ParameterChanged()
            End If
        End Set
    End Property


    Public ReadOnly Property RegistersRow() As Zelo.Luma.DSJobs.RegistersRow
        Get
            If Me.GroupRow Is Nothing Then
                Return Nothing
            Else
                Return Me.GroupRow.RegistersRow
            End If
        End Get
    End Property

    Public ReadOnly Property ViscosityRow() As Zelo.Luma.DSJobs.ViscositiesRow
        Get
            If Me.GroupRow Is Nothing Then
                Return Nothing
            Else
                Return Me.GroupRow.ViscositiesRow
            End If
        End Get
    End Property

#End Region

#Region "Methods"

#Region "Public Methods"
    Public Sub ParameterChanged()
        ViscositiesChangedEventHandler(Nothing, Nothing)
        RegistersChangedEventHandler(Nothing, Nothing)
        GroupsChangedEventHandler(Nothing, Nothing)
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

#End Region

#Region "Events Handlers"

    Protected Sub RegistersChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        guiRegister.Visible = (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not Me.RegistersRow Is Nothing) AndAlso (Me.RegistersRow.IsInstalled) AndAlso Me.RegisterVisible
        If guiRegister.Visible Then
            guiRegister.LateralMode = CType(Me.RegistersRow.LateralMode, Mode)
            guiRegister.LongitudinalMode = CType(Me.RegistersRow.LongitudinalMode, Mode)
            guiRegister.IsBaseColor = Me.RegistersRow.IsBaseColor
            guiRegister.Range = Me.RegistersRow.Range
            guiRegister.Lateral = CInt((Me.RegistersRow.LateralValue - Me.RegistersRow.LateralRefValue) * Me.RegistersRow.LateralFactor)
            guiRegister.Longitudinal = CInt((Me.RegistersRow.LongitudinalValue - Me.RegistersRow.LongitudinalRefValue) * Me.RegistersRow.LongitudinalFactor)
            guiRegister.Invalidate()
        End If
    End Sub

    Protected Sub ViscositiesChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        guiViscosity.Visible = (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not Me.ViscosityRow Is Nothing) AndAlso (Me.ViscosityRow.IsInstalled) AndAlso Me.ViscosityVisible
        If guiViscosity.Visible Then
            guiViscosity.Mode = CType(Me.ViscosityRow.ViscosityMode, Mode)
            guiViscosity.TemperatureMax = Me.ViscosityRow.TemperatureMax
            guiViscosity.TemperatureMin = Me.ViscosityRow.TemperatureMin
            guiViscosity.TemperatureValue = Me.ViscosityRow.TemperatureValue * Me.ViscosityRow.TemperatureFactor
            guiViscosity.TemperatureRange = Me.ViscosityRow.TemperatureRange
            guiViscosity.ViscosityRange = Me.ViscosityRow.ViscosityRange
            guiViscosity.ViscosityRefValue = Me.ViscosityRow.ViscosityRefValue
            guiViscosity.ViscosityValue = Me.ViscosityRow.ViscosityValue * Me.ViscosityRow.ViscosityFactor
            guiViscosity.Invalidate()
        End If
    End Sub

    Protected Sub GroupsChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        guiRegister.Visible = (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not Me.RegistersRow Is Nothing) AndAlso (Me.RegistersRow.IsInstalled) AndAlso Me.RegisterVisible
        guiViscosity.Visible = (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not Me.ViscosityRow Is Nothing) AndAlso (Me.ViscosityRow.IsInstalled) AndAlso Me.ViscosityVisible

        If guiRegister.Visible Then
            guiRegister.GroupNumber = Me.GroupRow.GroupNumber
            guiRegister.GroupColor = Color.FromArgb(Me.GroupRow.GroupColor)
            guiRegister.Invalidate()
        End If
        If guiViscosity.Visible Then
            guiViscosity.GroupColor = Color.FromArgb(Me.GroupRow.GroupColor)
            guiViscosity.Invalidate()
        End If
    End Sub

    Private Sub guiViscosity_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles guiViscosity.Click
        RaiseEvent Click(Me, e)
    End Sub

    Private Sub guiRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles guiRegister.Click
        RaiseEvent Click(Me, e)
    End Sub

#End Region

#End Region



End Class
