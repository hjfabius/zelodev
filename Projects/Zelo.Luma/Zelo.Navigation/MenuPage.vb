Public Class MenuPage

    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        AddHandlers()
        InitGUI()
    End Sub

    Protected Sub AddHandlers()
        AddHandler cmdBaseSettings.Click, AddressOf commandClickEventHandler
        AddHandler cmdRegisterControl.Click, AddressOf commandClickEventHandler
        AddHandler cmdRegisterViscosityControl.Click, AddressOf commandClickEventHandler
        AddHandler cmdViscosityControl.Click, AddressOf commandClickEventHandler
        AddHandler cmdRegisterDensityControl.Click, AddressOf commandClickEventHandler
        AddHandler cmdDensityControl.Click, AddressOf commandClickEventHandler
        AddHandler cmdVision.Click, AddressOf commandClickEventHandler
        AddHandler cmdSystemSettings.Click, AddressOf commandClickEventHandler
        AddHandler cmdCopy.Click, AddressOf commandClickEventHandler
        AddHandler cmdLoad.Click, AddressOf commandClickEventHandler
        AddHandler cmdNew.Click, AddressOf commandClickEventHandler
        AddHandler cmdHiddenSystemSettings.DoubleClick, AddressOf commandClickEventHandler
    End Sub

    Protected Sub InitGUI()

        cmdNew.BackColor = GlobalParameters.GUI_ColorSecondary1
        cmdNew.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdNew.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdNew.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdNew.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdCopy.BackColor = GlobalParameters.GUI_ColorSecondary1
        cmdCopy.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdCopy.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdCopy.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdCopy.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdLoad.BackColor = GlobalParameters.GUI_ColorSecondary1
        cmdLoad.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdLoad.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdLoad.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdLoad.ShadowWidth = GlobalParameters.GUI_ShadowSize

        lblCurrentJob.BackColorFaded1 = GlobalParameters.GUI_ColorSecondary1
        lblCurrentJob.BackColorFaded2 = GlobalParameters.GUI_ColorSecondary1
        lblCurrentJob.ShadowColor = GlobalParameters.GUI_ShadowColor
        lblCurrentJob.ShadowWidth = GlobalParameters.GUI_ShadowSize

        lblSystem.BackColorFaded1 = GlobalParameters.GUI_ColorSecondary1
        lblSystem.BackColorFaded2 = GlobalParameters.GUI_ColorSecondary1
        lblSystem.ShadowColor = GlobalParameters.GUI_ShadowColor
        lblSystem.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdBaseSettings.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdBaseSettings.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdBaseSettings.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdBaseSettings.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdRegisterViscosityControl.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdRegisterViscosityControl.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdRegisterViscosityControl.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdRegisterViscosityControl.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdRegisterDensityControl.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdRegisterDensityControl.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdRegisterDensityControl.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdRegisterDensityControl.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdRegisterControl.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdRegisterControl.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdRegisterControl.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdRegisterControl.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdViscosityControl.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdViscosityControl.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdViscosityControl.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdViscosityControl.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdDensityControl.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdDensityControl.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdDensityControl.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdDensityControl.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdVision.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdVision.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdVision.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdVision.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdSystemSettings.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdSystemSettings.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdSystemSettings.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdSystemSettings.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdRegisterViscosityControl.Visible = GlobalParameters.F_RegisterControl And GlobalParameters.F_ViscosityControl
        picCrossCup.Visible = GlobalParameters.F_RegisterControl And GlobalParameters.F_ViscosityControl
        cmdRegisterDensityControl.Visible = GlobalParameters.F_RegisterControl And GlobalParameters.F_DensityControl
        picCrossSquare.Visible = GlobalParameters.F_RegisterControl And GlobalParameters.F_DensityControl

        cmdRegisterControl.Visible = GlobalParameters.F_RegisterControl
        picCross.Visible = GlobalParameters.F_RegisterControl

        cmdViscosityControl.Visible = GlobalParameters.F_ViscosityControl
        cmdDensityControl.Visible = GlobalParameters.F_DensityControl
        picCup.Visible = GlobalParameters.F_ViscosityControl
        picSquare.Visible = GlobalParameters.F_DensityControl
        cmdVision.Visible = GlobalParameters.F_Vision
        picVision.Visible = GlobalParameters.F_Vision

    End Sub

    Private Sub commandClickEventHandler(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If sender Is cmdCopy Then
            Me.JobsManager.CopyJob()
            Me.NavigationManager.SetMainPage(CType(sender, GUINavigation).NavigationID)
        ElseIf sender Is cmdNew Then
            Me.JobsManager.NewJob()
            Me.NavigationManager.SetMainPage(CType(sender, GUINavigation).NavigationID)
        ElseIf sender Is cmdLoad Then
            Me.NavigationManager.SetMainPage(CType(sender, GUINavigation).NavigationID)
        Else
            Me.NavigationManager.SetMainPage(CType(sender, GUINavigation).NavigationID)
        End If
    End Sub

    Private Sub pnlHiddenQuit_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles pnlHiddenQuit.DoubleClick
        If GUIMessageBox.QuestionYesNo("Do you want to exit?") = Windows.Forms.DialogResult.Yes Then
            If Not Me.InLineGuide Is Nothing Then
                If Not Me.Demo Is Nothing Then
                    Me.Demo.DemoWebInspection = False
                End If
                Me.InLineGuide.MoveTo(500)
            End If

            If Not Me.CameraConnector Is Nothing Then
                Me.CameraConnector.Close()
                Me.CameraConnector = Nothing
            End If
            Me.ParentForm.Close()
        End If
    End Sub

    Private Sub cmdSystemRemoteAssistance_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSystemRemoteAssistance.Click
        Threading.Thread.Sleep(500)
        GUIMessageBox.ShowOkOnly("Error: No dial tone detected", "Remote Assistance")
    End Sub

End Class
