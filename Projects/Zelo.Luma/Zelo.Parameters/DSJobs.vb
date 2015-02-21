Partial Class DSJobs

    Partial Class DensitiesDataTable

        Public Event DensitiesChangedEvent(ByVal sender As Object, ByVal e As EventArgs)

        Private Sub DensitiesDataTable_DensitiesRowChanged(ByVal sender As Object, ByVal e As DensitiesRowChangeEvent) Handles Me.DensitiesRowChanged
            RaiseEvent DensitiesChangedEvent(sender, e)
        End Sub

    End Class

    Partial Class JobsDataTable
        Public Event JobRowChangedEvent(ByVal sender As Object, ByVal e As JobsRowChangeEvent)

        Private Sub JobsDataTable_JobsRowChanged(ByVal sender As Object, ByVal e As JobsRowChangeEvent) Handles Me.JobsRowChanged
            RaiseEvent JobRowChangedEvent(sender, e)
        End Sub
    End Class

    Partial Class RegistersDataTable
        Public Event RegistersChangedEvent(ByVal sender As Object, ByVal e As EventArgs)

        Private Sub RegistersDataTable_RegistersRowChanged(ByVal sender As Object, ByVal e As RegistersRowChangeEvent) Handles Me.RegistersRowChanged
            RaiseEvent RegistersChangedEvent(sender, e)
        End Sub

    End Class

    Partial Class ViscositiesDataTable
        Public Event ViscositiesChangedEvent(ByVal sender As Object, ByVal e As EventArgs)

        Private Sub ViscositiesDataTable_ViscositiesRowChanged(ByVal sender As Object, ByVal e As ViscositiesRowChangeEvent) Handles Me.ViscositiesRowChanged
            RaiseEvent ViscositiesChangedEvent(sender, e)
        End Sub
    End Class

    Partial Class GroupsDataTable
        Public Event GroupsChangedEvent(ByVal sender As Object, ByVal e As EventArgs)

        Private Sub GroupsDataTable_GroupsRowChanged(ByVal sender As Object, ByVal e As GroupsRowChangeEvent) Handles Me.GroupsRowChanged
            RaiseEvent GroupsChangedEvent(sender, e)
        End Sub

    End Class


End Class
