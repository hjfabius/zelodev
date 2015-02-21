Public Class GUIMark

    Protected m_drGroup As DSJobs.GroupsRow

    Event KeyOkPressed(ByRef sender As Object, ByVal e As EventArgs)
    Event KeyCancelPressed(ByRef sender As Object, ByVal e As EventArgs)

    Public Property GroupRow() As DSJobs.GroupsRow
        Get
            Return m_drGroup
        End Get
        Set(ByVal _drGroup As DSJobs.GroupsRow)
            m_drGroup = _drGroup
            LoadMark()
        End Set
    End Property


    Protected Sub LoadMark()
        Dim objMark As Mark
        Dim arobjMark As List(Of Mark)
        Dim I As Integer
        Dim ardrGroups As DSJobs.GroupsRow()
        Dim drGroup As DSJobs.GroupsRow

        If Not m_drGroup Is Nothing Then
            ardrGroups = CType(m_drGroup.Table.Select("JobID=" & m_drGroup.JobID), DSJobs.GroupsRow())
            arobjMark = New List(Of Mark)
            For I = 0 To 11
                objMark = New Mark
                'ardrRegisters = CType(m_drGroup.Table.DataSet.Tables("Registers").Select(String.Format("(JobID={0}) AND (MarkID = {1})", m_drGroup.JobID, I)), DSJobs.RegistersRow())
                If Not ardrGroups Is Nothing Then
                    For Each drGroup In ardrGroups
                        If Not drGroup.RegistersRow Is Nothing AndAlso _
                            drGroup.RegistersRow.IsInstalled AndAlso _
                            drGroup.RegistersRow.MarkID = I Then

                            objMark.Color = Color.FromArgb(drGroup.GroupColor)
                            objMark.Active = True
                            Exit For
                        Else
                            objMark.Color = Color.Transparent
                            objMark.Active = False
                        End If
                    Next
                Else
                    objMark.Color = Color.Transparent
                    objMark.Active = False
                End If
                arobjMark.Add(objMark)
            Next

            objMarkPanel.Marks = arobjMark
            objMarkPanel.MarkColor = Color.FromArgb(m_drGroup.GroupColor)
            objMarkPanel.SelectedMark = m_drGroup.RegistersRow.MarkID + 1
        Else
            objMarkPanel.Visible = False
        End If
    End Sub

    Protected Sub SaveMark()
        If Not m_drGroup Is Nothing Then
            m_drGroup.RegistersRow.MarkID = objMarkPanel.SelectedMark - 1
        End If
    End Sub

    Private Sub objMarkPanel_KeyCancelClick_Event(ByRef sender As Object) Handles objMarkPanel.KeyCancelClick_Event
        RaiseEvent KeyCancelPressed(Me, New EventArgs)
    End Sub

    Private Sub objMarkPanel_KeyOkClick_Event(ByRef sender As Object) Handles objMarkPanel.KeyOkClick_Event
        RaiseEvent KeyOkPressed(Me, New EventArgs)
        SaveMark()
    End Sub
End Class
