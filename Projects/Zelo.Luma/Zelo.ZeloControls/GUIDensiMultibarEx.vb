' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class GUIDensiMultibarEx
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Protected WithEvents m_drGroupRow As Zelo.Luma.DSJobs.GroupsRow

#End Region

#Region "Events"
    Public Shadows Event Click(ByVal sender As Object, ByVal e As System.EventArgs)
#End Region

#Region "Properties"

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

    Public ReadOnly Property DensitiesRows() As Zelo.Luma.DSJobs.DensitiesRow()
        Get
            If Me.GroupRow Is Nothing Then
                Return Nothing
            Else
                Return Me.GroupRow.GetDensitiesRows
            End If
        End Get

    End Property



#End Region

#Region "Methods"

#Region "Public Methods"
    Public Sub ParameterChanged()
        DensitiesChangedEventHandler(Nothing, Nothing)
        GroupsChangedEventHandler(Nothing, Nothing)
    End Sub

#End Region

#Region "Protected Methods"

    Protected Sub AddHandlers()
        Dim drDensity As Zelo.Luma.DSJobs.DensitiesRow
        AddHandler CType(m_drGroupRow.Table, Zelo.Luma.DSJobs.GroupsDataTable).GroupsChangedEvent, AddressOf GroupsChangedEventHandler
        For Each drDensity In Me.DensitiesRows
            AddHandler CType(drDensity.Table, Zelo.Luma.DSJobs.DensitiesDataTable).DensitiesChangedEvent, AddressOf DensitiesChangedEventHandler
        Next
    End Sub

    Protected Sub RemoveHandlers()
        Dim drDensity As Zelo.Luma.DSJobs.DensitiesRow
        RemoveHandler CType(m_drGroupRow.Table, Zelo.Luma.DSJobs.GroupsDataTable).GroupsChangedEvent, AddressOf GroupsChangedEventHandler
        For Each drDensity In Me.DensitiesRows
            RemoveHandler CType(drDensity.Table, Zelo.Luma.DSJobs.DensitiesDataTable).DensitiesChangedEvent, AddressOf DensitiesChangedEventHandler
        Next
    End Sub

#End Region

#Region "Events Handlers"

    Protected Sub DensitiesChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        Dim drDensity As DSJobs.DensitiesRow
        Dim I As Integer
        I = 0
        guiDensiMultibar.Visible = (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not Me.DensitiesRows Is Nothing) AndAlso (Me.DensitiesRows.Length > 0)
        If guiDensiMultibar.Visible Then
            For Each drDensity In m_drGroupRow.GetDensitiesRows

                If drDensity.IsInstalled Then
                    If guiDensiMultibar.Values.Count <= I Then
                        guiDensiMultibar.Values.Add(drDensity.DensityValue)
                    End If
                    If guiDensiMultibar.RefValues.Count <= I Then
                        guiDensiMultibar.RefValues.Add(drDensity.DensityRefValue)
                    End If
                    guiDensiMultibar.Value(I) = drDensity.DensityValue
                    guiDensiMultibar.RefValue(I) = drDensity.DensityRefValue
                Else
                    guiDensiMultibar.Value(I) = 0
                    guiDensiMultibar.RefValue(I) = 0
                End If
                I += 1
            Next drDensity
        End If
        guiDensiMultibar.Invalidate()
    End Sub

    Protected Sub GroupsChangedEventHandler(ByVal sender As Object, ByVal e As EventArgs)
        guiDensiMultibar.Visible = (Not m_drGroupRow Is Nothing) AndAlso m_drGroupRow.IsInstalled AndAlso (Not Me.DensitiesRows Is Nothing) AndAlso (Me.DensitiesRows.Length > 0)
        If guiDensiMultibar.Visible Then
            guiDensiMultibar.GroupNumber = Me.GroupRow.GroupNumber
            guiDensiMultibar.GroupColor = Color.FromArgb(Me.GroupRow.GroupColor)
            guiDensiMultibar.Invalidate()
        End If
    End Sub

    Private Sub guiDensiMultibar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles guiDensiMultibar.Click
        RaiseEvent Click(Me, e)
    End Sub

#End Region

#End Region


End Class
