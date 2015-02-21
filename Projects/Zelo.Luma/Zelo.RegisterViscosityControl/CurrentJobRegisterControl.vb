Public Class CurrentJobRegisterControl

    Public Overrides Sub LoadData()
        Dim I As Integer

        Dim drGroup As DSJobs.GroupsRow
        Dim objGUIRegisterViscosity As GUIRegisterViscosityEx

        For I = 1 To 12
            drGroup = MyBase.JobsManager.GroupByNumber(I)
            objGUIRegisterViscosity = CType(Me.Controls("GuiRegisterViscosityEx" & I), GUIRegisterViscosityEx)
            If drGroup Is Nothing Then
                objGUIRegisterViscosity.GroupRow = Nothing
            Else
                objGUIRegisterViscosity.ViscosityVisible = False
                objGUIRegisterViscosity.GroupRow = drGroup
                AddHandler objGUIRegisterViscosity.Click, AddressOf GuiRegisterViscosity_ClickEventHandler
            End If
        Next


    End Sub

    Private Sub GuiRegisterViscosity_ClickEventHandler(ByVal sender As Object, ByVal e As System.EventArgs)
        GlobalParameters.N_Tag = CType(sender, GUIRegisterViscosityEx).GroupRow
        Me.NavigationManager.SetMainPage(NavigationPages.RegisterControlPageDetail)
    End Sub


End Class
