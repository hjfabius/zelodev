Public Class CurrentJobViscosityControlDetail

    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        pnlRegister.Visible = False
    End Sub

    Public Overrides Sub LoadData()
        MyBase.LoadData()
        pnlRegister.Visible = False
        'cmdParameters.NavigationID = NavigationPages.ViscosityControlParameter
    End Sub

End Class
