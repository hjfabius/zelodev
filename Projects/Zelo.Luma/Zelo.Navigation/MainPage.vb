' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class MainPage
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Protected m_objNavigationManager As NavigationManager
    Protected m_objJobsManager As JobsManager
    Protected m_intMainPageID As Integer
    Protected m_blnClientVisible As Boolean
    Protected m_blnProjectVisible As Boolean
    Protected m_strTitle As String
    Protected m_blnCancelNavigation As Boolean
    Protected m_objInLineGuide As InLineGuide
    Protected m_objCameraConnector As CameraConnector
    Protected WithEvents m_objDemo As Demo
#End Region

#Region "Events"

#End Region

#Region "Properties"

    Public Property Demo() As Demo
        Get
            Return m_objDemo
        End Get
        Set(ByVal _objDemo As Demo)
            m_objDemo = _objDemo
        End Set
    End Property

    Public Property CameraConnector() As CameraConnector
        Get
            Return m_objCameraConnector
        End Get
        Set(ByVal _objCameraConnector As CameraConnector)
            m_objCameraConnector = _objCameraConnector
        End Set
    End Property

    Public Property InLineGuide() As InLineGuide
        Get
            Return m_objInLineGuide
        End Get
        Set(ByVal _objInLineGuide As InLineGuide)
            m_objInLineGuide = _objInLineGuide
        End Set
    End Property

    Public Property CancelNavigation() As Boolean
        Get
            Return m_blnCancelNavigation
        End Get
        Set(ByVal _blnCancelNavigation As Boolean)
            m_blnCancelNavigation = _blnCancelNavigation
        End Set
    End Property


    Public Property MainPageID() As Integer
        Get
            Return m_intMainPageID
        End Get
        Set(ByVal _intMainPageID As Integer)
            m_intMainPageID = _intMainPageID
        End Set
    End Property

    Public Property NavigationManager() As NavigationManager
        Get
            Return m_objNavigationManager
        End Get
        Set(ByVal _objNavigationManager As NavigationManager)
            m_objNavigationManager = _objNavigationManager
        End Set
    End Property

    Public Property JobsManager() As JobsManager
        Get
            Return m_objJobsManager
        End Get
        Set(ByVal _objJobsManager As JobsManager)
            m_objJobsManager = _objJobsManager
        End Set
    End Property



    Public Property ClientVisible() As Boolean
        Get
            Return m_blnClientVisible
        End Get
        Set(ByVal _blnClientVisible As Boolean)
            m_blnClientVisible = _blnClientVisible
        End Set
    End Property

    Public Property ProjectVisible() As Boolean
        Get
            Return m_blnProjectVisible
        End Get
        Set(ByVal _blnProjectVisible As Boolean)
            m_blnProjectVisible = _blnProjectVisible
        End Set
    End Property

    Public Property Title() As String
        Get
            Return m_strTitle
        End Get
        Set(ByVal _strTitle As String)
            m_strTitle = _strTitle
        End Set
    End Property

    Public Property DebugInfo() As String
        Get
            Return lblDebug.Text
        End Get
        Set(ByVal _strDebugInfo As String)
            lblDebug.Text = _strDebugInfo
        End Set
    End Property

#End Region

#Region "Methods"

#Region "Public Methods"
    Public Overridable Sub LoadData()
    End Sub
#End Region

#Region "Protected Methods"

#End Region

#Region "Events Handlers"
    Private Sub MainPage_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblDebug.Visible = GlobalParameters.N_Debug
    End Sub
#End Region

#End Region

End Class
