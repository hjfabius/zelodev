Public Class CurrentJobViscosityControl

    Public Overrides Sub LoadData()
        Dim I As Integer

        Dim drGroup As DSJobs.GroupsRow
        Dim txtActualTerm As GUIButton
        Dim txtActualVisc As GUIButton
        Dim guiGroup As GUINavigation
        Dim guiTerm As GUITermometer
        Dim guiVisc As GUIViscosity

        For I = 1 To 12
            drGroup = MyBase.JobsManager.GroupByNumber(I)
            guiTerm = CType(Me.Controls("guiTerm" & I), GUITermometer)
            guiVisc = CType(Me.Controls("guiVisc" & I), GUIViscosity)
            guiGroup = CType(Me.Controls("guiGroup" & I), GUINavigation)
            txtActualTerm = CType(Me.Controls("txtActualTemperature" & I), GUIButton)
            txtActualVisc = CType(Me.Controls("txtActualViscosity" & I), GUIButton)

            If drGroup Is Nothing Then
                guiTerm.Enabled = False
                guiVisc.Enabled = False
                txtActualTerm.Enabled = False
                txtActualVisc.Enabled = False
                guiGroup.Enabled = False

                guiTerm.Max = 60
                guiTerm.Min = 0
                guiTerm.Value = 0
                guiTerm.Range = 60

                guiVisc.Range = 100
                guiVisc.RefValue = 0
                guiVisc.Value = 0

                txtActualTerm.Text = ""
                txtActualVisc.Text = ""

                guiGroup.BackColorFaded1 = Color.White
                guiGroup.BackColorFaded2 = Color.White


            Else
                guiTerm.Enabled = True
                guiVisc.Enabled = True
                txtActualTerm.Enabled = True
                txtActualVisc.Enabled = True
                guiGroup.Enabled = True

                guiTerm.Tag = drGroup
                guiVisc.Tag = drGroup
                txtActualTerm.Tag = drGroup
                txtActualVisc.Tag = drGroup
                guiGroup.Tag = drGroup

                'AddHandler objGUIRegisterViscosity.Click, AddressOf GuiRegisterViscosity_ClickEventHandler
                guiGroup.BackColorFaded1 = Color.FromArgb(drGroup.GroupColor)
                guiGroup.BackColorFaded2 = Color.FromArgb(drGroup.GroupColor)

                guiTerm.Max = drGroup.ViscositiesRow.TemperatureMax
                guiTerm.Min = drGroup.ViscositiesRow.TemperatureMin
                guiTerm.Value = drGroup.ViscositiesRow.TemperatureValue * drGroup.ViscositiesRow.TemperatureFactor
                guiTerm.Range = drGroup.ViscositiesRow.TemperatureRange

                guiVisc.Range = drGroup.ViscositiesRow.ViscosityRange
                guiVisc.RefValue = drGroup.ViscositiesRow.ViscosityRefValue
                guiVisc.Value = drGroup.ViscositiesRow.ViscosityValue * drGroup.ViscositiesRow.ViscosityFactor

                txtActualTerm.Text = Math.Round(drGroup.ViscositiesRow.TemperatureValue * drGroup.ViscositiesRow.TemperatureFactor, 2).ToString
                txtActualVisc.Text = Math.Round(drGroup.ViscositiesRow.ViscosityValue * drGroup.ViscositiesRow.ViscosityFactor, 2).ToString

                AddHandler guiGroup.Click, AddressOf guiGroup_Click
                AddHandler guiVisc.Click, AddressOf guiGroup_Click
                AddHandler guiTerm.Click, AddressOf guiGroup_Click
                AddHandler txtActualTerm.Click, AddressOf guiGroup_Click
                AddHandler txtActualVisc.Click, AddressOf guiGroup_Click
            End If

        Next


    End Sub

    Private Sub guiGroup_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        GlobalParameters.N_Tag = CType(sender, UserControl).Tag
        Me.NavigationManager.SetMainPage(NavigationPages.ViscosityControlPageDetail)
    End Sub
End Class
