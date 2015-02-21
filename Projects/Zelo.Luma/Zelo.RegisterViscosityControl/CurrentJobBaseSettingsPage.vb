Public Class CurrentJobBaseSettingsPage

#Region "Variables"
    Protected m_txtSelectedItem As GUINavigation
#End Region

#Region "Property"
    Protected Property SelectedItem() As GUINavigation
        Get
            Return m_txtSelectedItem
        End Get
        Set(ByVal _txtSelectedItem As GUINavigation)
            If _txtSelectedItem Is Nothing And Not m_txtSelectedItem Is Nothing Then
                txtProject.ShadowColor = GlobalParameters.GUI_ShadowColor
                txtClient.ShadowColor = GlobalParameters.GUI_ShadowColor
                txtClient.EditMode = False
                txtProject.EditMode = False
                pnlKeyboard.Visible = False
                Me.CancelNavigation = False
            End If
            m_txtSelectedItem = _txtSelectedItem
            If Not m_txtSelectedItem Is Nothing Then
                m_txtSelectedItem.ShadowColor = GlobalParameters.GUI_ShadowColorSelected
                m_txtSelectedItem.EditMode = True
                pnlKeyboard.Visible = True
                Me.CancelNavigation = True
            End If
        End Set
    End Property
#End Region


#Region "Methods"

#Region "Public Methods"
    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        InitGui()

    End Sub

    Public Overrides Sub LoadData()
        txtClient.Text = Me.JobsManager.ClientName
        txtProject.Text = Me.JobsManager.ProjectName
        txtDateCreated.Text = Me.JobsManager.DateCreated
        txtDateModified.Text = Me.JobsManager.DateModified
    End Sub

#End Region

#Region "Protected Methods"


    Protected Sub InitGui()
        cmdClient.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdClient.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdClient.ForeColor = GlobalParameters.GUI_PrimaryForecolor
        cmdClient.ForeColorDisabled = GlobalParameters.GUI_PrimaryForecolorDisabled
        cmdClient.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdClient.ShadowWidth = GlobalParameters.GUI_ShadowSize


        cmdProject.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdProject.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdProject.ForeColor = GlobalParameters.GUI_PrimaryForecolor
        cmdProject.ForeColorDisabled = GlobalParameters.GUI_PrimaryForecolorDisabled
        cmdProject.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdProject.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdDataCreated.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdDataCreated.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdDataCreated.ForeColor = GlobalParameters.GUI_PrimaryForecolor
        cmdDataCreated.ForeColorDisabled = GlobalParameters.GUI_PrimaryForecolorDisabled
        cmdDataCreated.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdDataCreated.ShadowWidth = GlobalParameters.GUI_ShadowSize

        cmdDateModified.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
        cmdDateModified.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        cmdDateModified.ForeColor = GlobalParameters.GUI_PrimaryForecolor
        cmdDateModified.ForeColorDisabled = GlobalParameters.GUI_PrimaryForecolorDisabled
        cmdDateModified.ShadowColor = GlobalParameters.GUI_ShadowColor
        cmdDateModified.ShadowWidth = GlobalParameters.GUI_ShadowSize

        txtClient.BackColorFaded1 = GlobalParameters.GUI_ColorTextbox
        txtClient.BackColorFaded2 = GlobalParameters.GUI_ColorTextbox
        txtClient.ForeColor = GlobalParameters.GUI_PrimaryForecolor
        txtClient.ForeColorDisabled = GlobalParameters.GUI_PrimaryForecolorDisabled
        txtClient.ShadowColor = GlobalParameters.GUI_ShadowColor
        txtClient.ShadowWidth = GlobalParameters.GUI_ShadowSize

        txtProject.BackColorFaded1 = GlobalParameters.GUI_ColorTextbox
        txtProject.BackColorFaded2 = GlobalParameters.GUI_ColorTextbox
        txtProject.ForeColor = GlobalParameters.GUI_PrimaryForecolor
        txtProject.ForeColorDisabled = GlobalParameters.GUI_PrimaryForecolorDisabled
        txtProject.ShadowColor = GlobalParameters.GUI_ShadowColor
        txtProject.ShadowWidth = GlobalParameters.GUI_ShadowSize

        txtDateCreated.BackColorFaded1 = GlobalParameters.GUI_ColorTextbox
        txtDateCreated.BackColorFaded2 = GlobalParameters.GUI_ColorTextbox
        txtDateCreated.ForeColor = GlobalParameters.GUI_PrimaryForecolor
        txtDateCreated.ForeColorDisabled = GlobalParameters.GUI_PrimaryForecolorDisabled
        txtDateCreated.ShadowColor = GlobalParameters.GUI_ShadowColor
        txtDateCreated.ShadowWidth = GlobalParameters.GUI_ShadowSize

        txtDateModified.BackColorFaded1 = GlobalParameters.GUI_ColorTextbox
        txtDateModified.BackColorFaded2 = GlobalParameters.GUI_ColorTextbox
        txtDateModified.ForeColor = GlobalParameters.GUI_PrimaryForecolor
        txtDateModified.ForeColorDisabled = GlobalParameters.GUI_PrimaryForecolorDisabled
        txtDateModified.ShadowColor = GlobalParameters.GUI_ShadowColor
        txtDateModified.ShadowWidth = GlobalParameters.GUI_ShadowSize
    End Sub

#End Region

#Region "Event Handlers"
    Private Sub cmdClient_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdClient.Click
        If Me.SelectedItem Is Nothing Then
            Me.SelectedItem = txtClient
        End If
    End Sub

    Private Sub cmdProject_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdProject.Click
        If Me.SelectedItem Is Nothing Then
            Me.SelectedItem = txtProject
        End If
    End Sub

    Private Sub pnlKeyboard_KeyAnyKey(ByRef _objSender As Object, ByVal _objChar As Char) Handles pnlKeyboard.KeyAnyKey
        Me.SelectedItem.Text &= _objChar
    End Sub

    Private Sub pnlKeyboard_KeyBackspace(ByRef _objSender As Object) Handles pnlKeyboard.KeyBackspace
        If Me.SelectedItem.Text.Length > 0 Then
            Me.SelectedItem.Text = Me.SelectedItem.Text.Substring(0, Me.SelectedItem.Text.Length - 1)
        End If
    End Sub

    Private Sub pnlKeyboard_KeyEnter(ByRef _objSender As Object) Handles pnlKeyboard.KeyEnter
        If Me.SelectedItem Is txtClient Then
            Me.JobsManager.ClientName = Me.SelectedItem.Text
        ElseIf Me.SelectedItem Is txtProject Then
            Me.JobsManager.ProjectName = Me.SelectedItem.Text
        End If
        Me.SelectedItem = Nothing
    End Sub

    Private Sub pnlKeyboard_KeyEsc(ByRef _objSender As Object) Handles pnlKeyboard.KeyEsc
        If Me.SelectedItem Is txtClient Then
            Me.SelectedItem.Text = Me.JobsManager.ClientName()
        ElseIf Me.SelectedItem Is txtProject Then
            Me.SelectedItem.Text = Me.JobsManager.ProjectName
        End If
        Me.SelectedItem = Nothing
    End Sub
#End Region

#End Region
End Class
