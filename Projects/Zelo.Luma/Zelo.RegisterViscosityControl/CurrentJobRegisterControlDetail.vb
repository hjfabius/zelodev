' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class CurrentJobRegisterControlDetail

    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        pnlViscosity.Visible = False
    End Sub

    Public Overrides Sub LoadData()
        MyBase.LoadData()
        pnlViscosity.Visible = False
        'cmdParameters.NavigationID = NavigationPages.RegisterControlParameter
    End Sub

End Class
