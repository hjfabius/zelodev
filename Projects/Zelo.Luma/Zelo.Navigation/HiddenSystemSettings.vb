Public Class HiddenSystemSettings
    ' Fabio Cristini @ Zelo Elettronica srl
    ' http://www.zeloelettronica.it
    ' http://www.fabiocristini.com

#Region "Methods"

#Region "Public Methods"

    Public Overrides Sub LoadData()

        Me.txtVersion.Text = System.Windows.Forms.Application.ProductVersion
        Me.txtVersion.Enabled = False

        Me.txtDemo.Text = CStr(IIf(Not Me.Demo Is Nothing AndAlso Not Me.Demo.InLineGuide Is Nothing, "Available", "Not Available"))
        If Not Not Me.Demo Is Nothing AndAlso _
            Not Me.Demo.InLineGuide Is Nothing Then
            Me.txtCamera.Text = "COM" & Me.Demo.InLineGuide.SerialPort.ToString
        Else
            Me.txtCamera.Text = ""
            Me.txtCamera.Enabled = False
            Me.txtDemo.Enabled = False
        End If

        Me.txtDebug.Text = CStr(IIf(GlobalParameters.N_Debug, "Active", "Not Active"))
        Me.txtRegister.Text = CStr(IIf(GlobalParameters.F_RegisterControl, "Active", "Not Active"))
        Me.txtViscosity.Text = CStr(IIf(GlobalParameters.F_ViscosityControl, "Active", "Not Active"))
        Me.txtDensity.Text = CStr(IIf(GlobalParameters.F_DensityControl, "Active", "Not Active"))
        Me.txtVision.Text = CStr(IIf(GlobalParameters.F_Vision, "Active", "Not Active"))

        If Me.Demo Is Nothing Then
            Me.txtDemoRegister.Text = CStr(IIf(GlobalParameters.F_RegisterControl And Me.Demo.DemoRegister, "Active", "Not Active"))
            Me.txtDemoVision.Text = CStr(IIf(GlobalParameters.F_Vision And Me.Demo.DemoWebInspection, "Active", "Not Active"))
            Me.txtDemoDensity.Text = CStr(IIf(GlobalParameters.F_DensityControl And Me.Demo.DemoDensitometer, "Active", "Not Active"))
            Me.txtDemoFlash.Text = CStr(IIf(Me.Demo.CameraFlash, "Active", "Not Active"))
        Else
            Me.txtDemoRegister.Text = "Not Available"
            Me.txtDemoVision.Text = "Not Available"
            Me.txtDemoDensity.Text = "Not Available"
            Me.txtDemoFlash.Text = "Not Available"
            Me.txtDemoRegister.Enabled = False
            Me.txtDemoVision.Enabled = False
            Me.txtDemoDensity.Enabled = False
            Me.txtDemoFlash.Enabled = False
        End If
    End Sub

#End Region

#Region "Protected Methods"

#End Region

#Region "Events Handlers"


    Private Sub txtRegister_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtRegister.Click
        GlobalParameters.F_RegisterControl = Not GlobalParameters.F_RegisterControl
        Me.LoadData()
    End Sub

    Private Sub txtViscosity_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtViscosity.Click
        GlobalParameters.F_ViscosityControl = Not GlobalParameters.F_ViscosityControl
        If GlobalParameters.F_ViscosityControl Then
            GlobalParameters.F_DensityControl = False
        End If
        Me.LoadData()
    End Sub

    Private Sub txtDensity_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDensity.Click
        GlobalParameters.F_DensityControl = Not GlobalParameters.F_DensityControl
        If GlobalParameters.F_DensityControl Then
            GlobalParameters.F_ViscosityControl = False
        End If
        Me.LoadData()
    End Sub

    Private Sub txtVision_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtVision.Click
        GlobalParameters.F_Vision = Not GlobalParameters.F_Vision
        Me.LoadData()
    End Sub

    Private Sub txtDemoRegister_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDemoRegister.Click
        If Not Me.Demo Is Nothing Then
            Me.Demo.DemoRegister = Not Me.Demo.DemoRegister
            Me.LoadData()
        End If
    End Sub

    Private Sub txtDemoDensity_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDemoDensity.Click
        If Not Me.Demo Is Nothing Then
            Me.Demo.DemoDensitometer = Not Me.Demo.DemoDensitometer
            Me.LoadData()
        End If
    End Sub

    Private Sub txtDemoVision_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDemoVision.Click
        If Not Me.Demo Is Nothing Then
            Me.Demo.DemoWebInspection = Not Me.Demo.DemoWebInspection
            Me.LoadData()
        End If
    End Sub

    Private Sub txtDemoFlash_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDemoFlash.Click
        If Not Me.Demo Is Nothing Then
            Me.Demo.CameraFlash = Not Me.Demo.CameraFlash
            Me.LoadData()
        End If
    End Sub

    Private Sub txtDebug_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDebug.Click
        GlobalParameters.N_Debug = Not GlobalParameters.N_Debug
        Me.LoadData()
    End Sub


#End Region

#End Region

End Class

