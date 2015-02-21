Imports system.Drawing

' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class GUIMain
    Implements IDisposable

#Region "Constants"
#End Region

#Region "Variables"
    Protected m_strClientName As String
    Protected m_strProjectName As String
    Protected m_blnSecondaryVisible As Boolean
    Protected m_blnEnableHome As Boolean
    Protected m_blnEnableBack As Boolean
    Protected m_strTitle As String
    Protected m_objMainPage As MainPage
    Protected m_objNavigationManager As NavigationManager
    Protected m_objJobManager As JobsManager
    Protected m_blnClientVisible As Boolean
    Protected m_blnProjectVisible As Boolean
    Protected m_enmStatus As Integer
    Protected m_dblSpeed As Double
    Protected m_objCameraConnector As CameraConnector

#End Region

#Region "Events"

#End Region

#Region "Properties"


    Public Property SecondaryVisible() As Boolean
        Get
            Return m_blnSecondaryVisible
        End Get
        Set(ByVal _blnSecondaryVisible As Boolean)
            m_blnSecondaryVisible = _blnSecondaryVisible
            If Not m_blnSecondaryVisible OrElse _
                    Me.ClientName Is Nothing OrElse _
                    Me.ClientName.Length = 0 OrElse _
                    Not m_blnClientVisible Then
                lblClient.Visible = False
                lblClientName.Visible = False
            Else
                lblClient.Visible = True
                lblClientName.Visible = True
            End If
            If Not m_blnSecondaryVisible OrElse _
                    Me.ProjectName Is Nothing OrElse _
                    Me.ProjectName.Length = 0 OrElse _
                    m_blnProjectVisible = False Then
                lblProject.Visible = False
                lblProjectName.Visible = False
            Else
                lblProject.Visible = True
                lblProjectName.Visible = True
            End If

            lblSpeedValue.Visible = m_blnSecondaryVisible And (GlobalParameters.F_RegisterControl Or GlobalParameters.F_DensityControl Or GlobalParameters.F_Vision)
            lblSpeed.Visible = m_blnSecondaryVisible And (GlobalParameters.F_RegisterControl Or GlobalParameters.F_DensityControl Or GlobalParameters.F_Vision)

            lblStatusValue.Visible = m_blnSecondaryVisible
            lblStatus.Visible = m_blnSecondaryVisible

        End Set
    End Property

    Public Property ClientName() As String
        Get
            Return m_strClientName
        End Get
        Set(ByVal _strClientName As String)
            m_strClientName = _strClientName
            If m_strClientName Is Nothing Then
                lblClientName.Text = ""
            Else
                lblClientName.Text = m_strClientName
            End If
            Me.SecondaryVisible = Me.SecondaryVisible
        End Set
    End Property

    Public Property ProjectName() As String
        Get
            Return m_strProjectName
        End Get
        Set(ByVal _strProjectName As String)
            m_strProjectName = _strProjectName
            If m_strProjectName Is Nothing Then
                lblProjectName.Text = ""
            Else
                lblProjectName.Text = m_strProjectName
            End If
            Me.SecondaryVisible = Me.SecondaryVisible
        End Set
    End Property

    Public Property Speed() As Double
        Get
            Return m_dblSpeed
        End Get
        Set(ByVal _dblSpeed As Double)
            m_dblSpeed = _dblSpeed
            If m_dblSpeed = 0 Then
                lblSpeedValue.Text = "STOP"
            Else
                lblSpeedValue.Text = m_dblSpeed.ToString("0.0") & " mt/min"
            End If
        End Set
    End Property

    Public Property Title() As String
        Get
            Return m_strTitle
        End Get
        Set(ByVal _strTitle As String)
            m_strTitle = _strTitle
            If m_strTitle Is Nothing Then
                lblTitle.Text = ""
            Else
                lblTitle.Text = m_strTitle
            End If
        End Set
    End Property

    Public Property Status() As Integer
        Get
            Return m_enmStatus
        End Get
        Set(ByVal _enmStatus As Integer)
            m_enmStatus = _enmStatus
            Select Case m_enmStatus
                Case 1
                    lblStatusValue.Text = "Error"
                Case Else
                    lblStatusValue.Text = "Ok"
            End Select
        End Set
    End Property

    Public Property EnableHome() As Boolean
        Get
            Return m_blnEnableHome
        End Get
        Set(ByVal _blnEnableHome As Boolean)
            m_blnEnableHome = _blnEnableHome
            picHome.Enabled = m_blnEnableHome
        End Set
    End Property

    Public Property EnableBack() As Boolean
        Get
            Return m_blnEnableBack
        End Get
        Set(ByVal _blnEnableBack As Boolean)
            m_blnEnableBack = _blnEnableBack
            picBack.Enabled = m_blnEnableBack
        End Set
    End Property

    Public Property MainPage() As MainPage
        Get
            Return m_objMainPage
        End Get
        Set(ByVal _objMainPage As MainPage)
            _objMainPage.NavigationManager = m_objNavigationManager
            _objMainPage.JobsManager = m_objJobManager
            _objMainPage.Parent = pnlMain
            _objMainPage.Size = pnlMain.Size
            _objMainPage.Location = New Point(0, 0)
            _objMainPage.LoadData()

            Me.Title = _objMainPage.Title
            m_blnClientVisible = _objMainPage.ClientVisible
            m_blnProjectVisible = _objMainPage.ProjectVisible
            Me.SecondaryVisible = m_blnClientVisible And m_blnProjectVisible

            _objMainPage.Visible = True

            If Not m_objMainPage Is _objMainPage Then
                If Not m_objMainPage Is Nothing Then
                    m_objMainPage.NavigationManager = Nothing
                    m_objMainPage.JobsManager = Nothing
                    m_objMainPage.Dispose()
                    m_objMainPage = Nothing
                End If
            End If

            m_objMainPage = _objMainPage

        End Set
    End Property

#End Region

#Region "Methods"

#Region "Public Methods"
    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        InitGUI()

        m_objJobManager = New JobsManager
        AddHandler m_objJobManager.ClientNameChangedEvent, AddressOf ClientNameChangedEventHandler
        AddHandler m_objJobManager.ProjectNameChangedEvent, AddressOf ProjectNameChangedEventHandler
        AddHandler m_objJobManager.CylinderLengthChangedEvent, AddressOf CylinderLengthChangedEventHandler

        m_objJobManager.SetJobByID(GlobalParameters.BLL_JobID)

        m_objCameraConnector = New CameraConnector()
        AddHandler m_objCameraConnector.CameraSpeedUpdated, AddressOf CameraSpeedUpdatedEventHandler
        AddHandler m_objCameraConnector.CameraPositionUpdated, AddressOf CameraPositionUpdatedEventHandler

        m_objNavigationManager = New NavigationManager
        m_objNavigationManager.CameraConnector = m_objCameraConnector

        AddHandler m_objNavigationManager.MainPageChanged, AddressOf MainPageChangedEventHandler

        m_objNavigationManager.SetMainPage(NavigationPages.MenuPage)

    End Sub
#End Region

#Region "Protected Methods"

    Protected Sub SetBackColor(ByRef _objGUIButton As GUIButton)
        Dim dblPercentage As Double

        dblPercentage = 1.0 - ((CDbl(_objGUIButton.Top + _objGUIButton.Height) / 2.0) / CDbl(guiRectangleLeft.Height))
        _objGUIButton.BackColor = Color.FromArgb(CInt(dblPercentage * CDbl(GlobalParameters.GUI_ColorSecondary1.R) + (1.0 - dblPercentage) * CDbl(GlobalParameters.GUI_ColorSecondary2.R)), _
                                             CInt(dblPercentage * CDbl(GlobalParameters.GUI_ColorSecondary1.G) + (1.0 - dblPercentage) * CDbl(GlobalParameters.GUI_ColorSecondary2.G)), _
                                             CInt(dblPercentage * CDbl(GlobalParameters.GUI_ColorSecondary1.B) + (1.0 - dblPercentage) * CDbl(GlobalParameters.GUI_ColorSecondary2.B)))

    End Sub


    Protected Sub InitGUI()
        guiRectangleTop.BackColorFaded1 = GlobalParameters.GUI_ColorSecondary1
        guiRectangleTop.BackColorFaded2 = GlobalParameters.GUI_ColorSecondary1
        guiRectangleLeft.BackColorFaded1 = GlobalParameters.GUI_ColorSecondary1
        guiRectangleLeft.BackColorFaded2 = GlobalParameters.GUI_ColorSecondary2
        guiRoundedAngleTopLeft.BackColor = GlobalParameters.GUI_ColorSecondary1

        SetBackColor(lblClient)
        SetBackColor(lblClientName)
        SetBackColor(lblProject)
        SetBackColor(lblProjectName)
        SetBackColor(lblStatus)
        SetBackColor(lblStatusValue)
        SetBackColor(lblSpeed)
        SetBackColor(lblSpeedValue)

        lblClient.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary1
        lblClient.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        lblClientName.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary1
        lblClientName.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary1
        lblClient.ForeColor = GlobalParameters.GUI_ColorSecondary1
        lblClientName.ForeColor = GlobalParameters.GUI_ColorSecondary1
        lblClient.ShadowColor = GlobalParameters.GUI_ShadowColor
        lblClient.ShadowWidth = GlobalParameters.GUI_ShadowSize
        lblClientName.ShadowColor = GlobalParameters.GUI_ShadowColor
        lblClientName.ShadowWidth = GlobalParameters.GUI_ShadowSize


        lblProject.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary1
        lblProject.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        lblProjectName.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary1
        lblProjectName.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary1
        lblProject.ForeColor = GlobalParameters.GUI_ColorSecondary1
        lblProjectName.ForeColor = GlobalParameters.GUI_ColorSecondary1
        lblProject.ShadowColor = GlobalParameters.GUI_ShadowColor
        lblProject.ShadowWidth = GlobalParameters.GUI_ShadowSize
        lblProjectName.ShadowColor = GlobalParameters.GUI_ShadowColor
        lblProjectName.ShadowWidth = GlobalParameters.GUI_ShadowSize


        lblStatus.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary1
        lblStatus.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        lblStatusValue.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary1
        lblStatusValue.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary1
        lblStatus.ForeColor = GlobalParameters.GUI_ColorSecondary1
        lblStatusValue.ForeColor = GlobalParameters.GUI_ColorSecondary1
        lblStatus.ShadowColor = GlobalParameters.GUI_ShadowColor
        lblStatus.ShadowWidth = GlobalParameters.GUI_ShadowSize
        lblStatusValue.ShadowColor = GlobalParameters.GUI_ShadowColor
        lblStatusValue.ShadowWidth = GlobalParameters.GUI_ShadowSize


        lblSpeed.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary1
        lblSpeed.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
        lblSpeedValue.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary1
        lblSpeedValue.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary1
        lblSpeed.ForeColor = GlobalParameters.GUI_ColorSecondary1
        lblSpeedValue.ForeColor = GlobalParameters.GUI_ColorSecondary1
        lblSpeed.ShadowColor = GlobalParameters.GUI_ShadowColor
        lblSpeed.ShadowWidth = GlobalParameters.GUI_ShadowSize
        lblSpeedValue.ShadowColor = GlobalParameters.GUI_ShadowColor
        lblSpeedValue.ShadowWidth = GlobalParameters.GUI_ShadowSize


        picHome.BackColor = GlobalParameters.GUI_ColorSecondary1
        picBack.BackColor = GlobalParameters.GUI_ColorSecondary1
    End Sub
#End Region

#Region "Events Handlers"

    Protected Sub CameraPositionUpdatedEventHandler(ByVal _objSender As Object, ByVal _intCobID As Integer, ByVal _intLongValue As Integer, ByVal _intLatValue As Integer)
        Dim objGroupsRow As DSJobs.GroupsRow
        objGroupsRow = Me.m_objJobManager.GroupByNumber((_intCobID - &H80) Mod 10)
        If Not objGroupsRow Is Nothing AndAlso Not objGroupsRow.RegistersRow Is Nothing Then
            objGroupsRow.RegistersRow.BeginEdit()
            objGroupsRow.RegistersRow.LongitudinalValue = CDbl(_intLongValue / 10) 'expressed in mm/100
            objGroupsRow.RegistersRow.LateralValue = CDbl(_intLatValue / 10) 'expressed in mm/100
            objGroupsRow.RegistersRow.EndEdit()
            Debug.WriteLine(String.Format("CobID ={0} RowNumber={1}  RowID={2} Long={3}  Lat={4}", _intCobID, objGroupsRow.RegistersRow.RegisterID, objGroupsRow.GroupNumber, _intLongValue, _intLatValue))
        End If
    End Sub


    Protected Sub CameraSpeedUpdatedEventHandler(ByVal _objSender As Object, ByVal _intSpeedTime As Integer)
        Me.m_objJobManager.SetSpeedByTime(_intSpeedTime)
        Me.Speed = Me.m_objJobManager.Speed
    End Sub


    Protected Sub MainPageChangedEventHandler(ByRef _objSender As Object, ByRef _objMainPage As MainPage, ByRef _blnCanceled As Boolean)
        If Not Me.MainPage Is Nothing AndAlso Me.MainPage.CancelNavigation Then
            _blnCanceled = True
        Else
            Me.MainPage = _objMainPage
        End If
    End Sub

    Private Sub picHome_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picHome.Click
        m_objNavigationManager.Home()
    End Sub

    Private Sub picBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picBack.Click
        m_objNavigationManager.Back()
    End Sub

    Private Sub ClientNameChangedEventHandler(ByRef _objSender As Object, ByVal _strNewName As String)
        Me.ClientName = _strNewName
    End Sub

    Private Sub ProjectNameChangedEventHandler(ByRef _objSender As Object, ByVal _strNewName As String)
        Me.ProjectName = _strNewName
    End Sub

    Private Sub CylinderLengthChangedEventHandler(ByRef _objSender As Object, ByVal _intRegistersRowID As Integer, ByVal _dblCylinderLength As Double)
        If Not m_objMainPage Is Nothing AndAlso _
            Not m_objMainPage.CameraConnector Is Nothing Then
            m_objMainPage.CameraConnector.SendCylinderLength(_dblCylinderLength)
        End If
    End Sub

    Private Sub GUIMain_Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Disposed

        If Not m_objMainPage Is Nothing Then
            m_objMainPage.Dispose()
            m_objMainPage = Nothing
        End If

        If Not m_objJobManager Is Nothing Then
            m_objJobManager.SaveJobs()
            m_objJobManager.Dispose()
            m_objJobManager = Nothing
        End If

        If Not m_objNavigationManager Is Nothing Then
            m_objNavigationManager.Dispose()
            m_objNavigationManager = Nothing
        End If
    End Sub



    Private Sub GUIMain_KeyUp(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles Me.KeyUp
        Select Case e.KeyCode
            Case Windows.Forms.Keys.Escape
                If picBack.Enabled Then
                    picBack_Click(Nothing, Nothing)
                End If
            Case Windows.Forms.Keys.Home
                If picHome.Enabled Then
                    picHome_Click(Nothing, Nothing)
                End If
        End Select
    End Sub

#End Region

#End Region

End Class