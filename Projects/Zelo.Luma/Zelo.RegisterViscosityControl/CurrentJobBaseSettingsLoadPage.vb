' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class CurrentJobBaseSettingsLoadPage

#Region "Constants"

#End Region

#Region "Variables"
    Protected WithEvents m_objGuiSelector As GUISelector
    Protected WithEvents m_objGuiDateTimePicker As GUIDateTimePicker
    Protected m_intJobID As Integer
    Protected m_dtJobs As DSJobs.JobsDataTable
    Protected m_objSelectedItem As GUIButton
    Protected m_intDateCreatedMonth As Integer
    Protected m_intDateCreatedYear As Integer
    Protected m_intDateModifiedMonth As Integer
    Protected m_intDateModifiedYear As Integer
#End Region

#Region "Events"

#End Region

#Region "Properties"
    Public Property JobID() As Integer
        Get
            Return m_intJobID
        End Get
        Set(ByVal _intJobID As Integer)
            m_intJobID = _intJobID
            cmdLoadJob.Enabled = (m_intJobID > -1)
        End Set
    End Property
#End Region

#Region "Methods"

#Region "Public Methods"
    Public Overrides Sub LoadData()
        InitGui()
        txtClient.Text = ""
        txtProject.Text = ""
        txtDateCreated.Text = ""
        txtDateModified.Text = ""
        m_dtJobs = New DSJobs.JobsDataTable
        Me.JobID = -1

        m_intDateCreatedMonth = -1
        m_intDateCreatedYear = -1
        m_intDateModifiedMonth = -1
        m_intDateModifiedYear = -1

        m_objGuiSelector = New GUISelector
        m_objGuiSelector.Visible = False
        m_objGuiSelector.Parent = Me
        m_objGuiSelector.Dock = DockStyle.Fill

        m_objGuiDateTimePicker = New GUIDateTimePicker
        m_objGuiDateTimePicker.Visible = False
        m_objGuiDateTimePicker.Parent = Me
        m_objGuiDateTimePicker.Dock = DockStyle.Fill

        UpdateFilter()
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

    Protected Sub UpdateFilter()
        Dim drJob As DSJobs.JobsRow
        Dim ardrJob() As DSJobs.JobsRow
        m_dtJobs.Clear()
        m_dtJobs.BeginLoadData()

        ardrJob = Me.JobsManager.GetFilteredJobTable(txtClient.Text, txtProject.Text, m_intDateCreatedMonth, m_intDateCreatedYear, m_intDateModifiedMonth, m_intDateModifiedYear)
        For Each drJob In ardrJob
            m_dtJobs.Rows.Add(drJob.ItemArray)
        Next
        m_dtJobs.EndLoadData()
        m_dtJobs.AcceptChanges()

        If Not ardrJob Is Nothing AndAlso _
            ardrJob.Length = 1 Then
            Me.JobID = ardrJob(0).JobID
            txtClient.Text = ardrJob(0).ClientName
            txtProject.Text = ardrJob(0).ProjectName
            txtDateCreated.Text = ardrJob(0).DateCreated.ToString("MMMM yyyy")
            txtDateModified.Text = ardrJob(0).DateModified.ToString("MMMM yyyy")

        End If
    End Sub

#End Region

#Region "Events Handlers"

    Private Sub cmdClient_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdClient.Click
        Dim dtClient As DSJobs.JobsDataTable
        Dim drJob As DSJobs.JobsRow
        Dim strValue As String
        strValue = ""
        dtClient = New DSJobs.JobsDataTable

        For Each drJob In m_dtJobs.Select("", "ClientName")
            If drJob.ClientName <> strValue And drJob.ClientName <> "" Then
                dtClient.Rows.Add(drJob.ItemArray)
                strValue = drJob.ClientName
            End If
        Next

        m_objSelectedItem = cmdClient
        m_objGuiSelector.DisplayMemberValue = "ClientName"
        m_objGuiSelector.DisplayMemberID = "JobID"
        m_objGuiSelector.DataTable = dtClient
        m_objGuiSelector.Visible = True
        pnlMain.Visible = False


    End Sub

    Private Sub cmdProject_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdProject.Click
        Dim dtProject As DSJobs.JobsDataTable
        Dim drJob As DSJobs.JobsRow
        Dim strValue As String
        strValue = ""
        dtProject = New DSJobs.JobsDataTable

        For Each drJob In m_dtJobs.Select("", "ProjectName")
            If drJob.ProjectName <> strValue And drJob.ProjectName <> "" Then
                dtProject.Rows.Add(drJob.ItemArray)
                strValue = drJob.ProjectName
            End If
        Next

        m_objSelectedItem = cmdProject
        m_objGuiSelector.DisplayMemberValue = "ProjectName"
        m_objGuiSelector.DisplayMemberID = "JobID"
        m_objGuiSelector.DataTable = dtProject
        m_objGuiSelector.Visible = True
        pnlMain.Visible = False
    End Sub

    Private Sub cmdDataCreated_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDataCreated.Click
        m_objSelectedItem = cmdDataCreated
        m_objGuiDateTimePicker.Visible = True
        pnlMain.Visible = False
    End Sub

    Private Sub cmdDateModified_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDateModified.Click
        m_objSelectedItem = cmdDateModified
        m_objGuiDateTimePicker.Visible = True
        pnlMain.Visible = False
    End Sub

    Private Sub cmdLoadJob_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdLoadJob.Click
        Me.JobsManager.SetJobByID(Me.JobID)
        Me.NavigationManager.Home()
    End Sub

    Private Sub m_objGuiSelector_KeyEnter(ByRef _objSender As Object) Handles m_objGuiSelector.KeyEnter
        Dim ardrJob() As DSJobs.JobsRow
        ardrJob = CType(m_dtJobs.Select("JobID = " & Me.m_objGuiSelector.SelectID), DSJobs.JobsRow())

        If Not ardrJob Is Nothing AndAlso _
            ardrJob.Length = 1 Then
            If m_objSelectedItem Is cmdClient Then
                txtClient.Text = ardrJob(0).ClientName
                UpdateFilter()
            ElseIf m_objSelectedItem Is cmdProject Then
                txtProject.Text = ardrJob(0).ProjectName
                UpdateFilter()
            End If
        End If
        pnlMain.Visible = True
        m_objGuiSelector.Visible = False
    End Sub

    Private Sub m_objGuiSelector_KeyEsc(ByRef _objSender As Object) Handles m_objGuiSelector.KeyEsc
        pnlMain.Visible = True
        m_objGuiSelector.Visible = False
    End Sub


    Private Sub m_objGuiDateTimePicker_KeyEnter(ByRef _objSender As Object, ByVal _intMonth As Integer, ByVal _intYear As Integer) Handles m_objGuiDateTimePicker.KeyEnter
        Dim objDate As Date
        If m_objSelectedItem Is cmdDataCreated Then
            m_intDateCreatedMonth = _intMonth
            m_intDateCreatedYear = _intYear
            objDate = New Date(_intYear, _intMonth, 1)
            txtDateCreated.Text = objDate.ToString("MMMM yyyy")
            UpdateFilter()
        ElseIf m_objSelectedItem Is cmdDateModified Then
            m_intDateModifiedMonth = _intMonth
            m_intDateModifiedYear = _intYear
            objDate = New Date(_intYear, _intMonth, 1)
            txtDateModified.Text = objDate.ToString("MMMM yyyy")
            UpdateFilter()
        End If

        pnlMain.Visible = True
        m_objGuiSelector.Visible = False
    End Sub

    Private Sub m_objGuiDateTimePicker_KeyEsc(ByRef _objSender As Object) Handles m_objGuiDateTimePicker.KeyEsc
        pnlMain.Visible = True
        m_objGuiSelector.Visible = False
    End Sub

#End Region

#End Region


End Class
