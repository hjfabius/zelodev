Imports System.Drawing

' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class GlobalParameters

#Region "Constants"

#End Region

#Region "Variables"
    Protected Shared m_objN_Tag As Object
#End Region

#Region "Events"

#End Region

#Region "Properties"

#Region "GUI"

    Public Shared Property GUI_ButtonRadius() As Integer
        Get
            Return My.Settings.GUI_ButtonRadius
        End Get
        Set(ByVal _intGUI_ButtonRadius As Integer)
            My.Settings.GUI_ButtonRadius = _intGUI_ButtonRadius
            My.Settings.Save()
        End Set
    End Property

    Public Shared Property GUI_ColorPrimary1() As Color
        Get
            Return My.Settings.GUI_ColorPrimary1
        End Get
        Set(ByVal _objGUI_ColorPrimary1 As Color)
            My.Settings.GUI_ColorPrimary1 = _objGUI_ColorPrimary1
            My.Settings.Save()
        End Set
    End Property

    Public Shared Property GUI_ColorPrimary2() As Color
        Get
            Return My.Settings.GUI_ColorPrimary2
        End Get
        Set(ByVal _objGUI_ColorPrimary2 As Color)
            My.Settings.GUI_ColorPrimary2 = _objGUI_ColorPrimary2
            My.Settings.Save()
        End Set
    End Property

    Public Shared Property GUI_ColorSecondary1() As Color
        Get
            Return My.Settings.GUI_ColorSecondary1
        End Get
        Set(ByVal _objGUI_ColorSecondary1 As Color)
            My.Settings.GUI_ColorSecondary1 = _objGUI_ColorSecondary1
            My.Settings.Save()
        End Set
    End Property

    Public Shared Property GUI_ColorSecondary2() As Color
        Get
            Return My.Settings.GUI_ColorSecondary2
        End Get
        Set(ByVal _objGUI_ColorSecondary2 As Color)
            My.Settings.GUI_ColorSecondary2 = _objGUI_ColorSecondary2
            My.Settings.Save()
        End Set
    End Property


    Public Shared Property GUI_ShadowColor() As Color
        Get
            Return My.Settings.GUI_ShadowColor
        End Get
        Set(ByVal _objGUI_ShadowColor As Color)
            My.Settings.GUI_ShadowColor = _objGUI_ShadowColor
            My.Settings.Save()
        End Set
    End Property


    Public Shared Property GUI_ShadowColorSelected() As Color
        Get
            Return My.Settings.GUI_ShadowColorSelected
        End Get
        Set(ByVal _objGUI_ShadowColorSelected As Color)
            My.Settings.GUI_ShadowColorSelected = _objGUI_ShadowColorSelected
            My.Settings.Save()
        End Set
    End Property


    Public Shared Property GUI_ShadowSize() As Integer
        Get
            Return My.Settings.GUI_ShadowSize
        End Get
        Set(ByVal _intGUI_ShadowSize As Integer)
            My.Settings.GUI_ShadowSize = _intGUI_ShadowSize
            My.Settings.Save()
        End Set
    End Property


    Public Shared Property GUI_PrimaryForecolor() As Color
        Get
            Return My.Settings.GUI_PrimaryForecolor
        End Get
        Set(ByVal _objGUI_PrimaryForecolor As Color)
            My.Settings.GUI_PrimaryForecolor = _objGUI_PrimaryForecolor
            My.Settings.Save()
        End Set
    End Property


    Public Shared Property GUI_PrimaryForecolorDisabled() As Color
        Get
            Return My.Settings.GUI_PrimaryForecolorDisabled
        End Get
        Set(ByVal _objGUI_PrimaryForecolorDisabled As Color)
            My.Settings.GUI_PrimaryForecolorDisabled = _objGUI_PrimaryForecolorDisabled
            My.Settings.Save()
        End Set
    End Property


    Public Shared Property GUI_ColorTextbox() As Color
        Get
            Return My.Settings.GUI_ColorTextbox
        End Get
        Set(ByVal _objGUI_ColorTextbox As Color)
            My.Settings.GUI_ColorTextbox = _objGUI_ColorTextbox
            My.Settings.Save()
        End Set
    End Property


#End Region

#Region "BLL"

    Public Shared Property BLL_JobID() As Integer
        Get
            Return My.Settings.BLL_JobID
        End Get
        Set(ByVal _intBLL_JobID As Integer)
            My.Settings.BLL_JobID = _intBLL_JobID
            My.Settings.Save()
        End Set
    End Property

    Public Shared Property BLL_LanguageID() As Integer
        Get
            Return My.Settings.BLL_LanguageID
        End Get
        Set(ByVal _intBLL_LanguageID As Integer)
            My.Settings.BLL_LanguageID = _intBLL_LanguageID
            My.Settings.Save()
        End Set
    End Property


    Public Shared ReadOnly Property BLL_DSJobFilename() As String
        Get
            Return My.Settings.BLL_DSJobFilename
        End Get
    End Property


    Public Shared ReadOnly Property BLL_DSNavigationFilename() As String
        Get
            Return My.Settings.BLL_DSNavigationFilename
        End Get
    End Property

#Region "Register Control"

#End Region

#Region "Viscosity Control"
    Public Shared Property BLL_ViscosityPause() As Integer
        Get
            Return My.Settings.BLL_ViscosityPause
        End Get
        Set(ByVal _intBLL_ViscosityPause As Integer)
            My.Settings.BLL_ViscosityPause = CType(_intBLL_ViscosityPause, Short)
            My.Settings.Save()
        End Set
    End Property
#End Region

#Region "Web Inspection"

#End Region


#End Region

#Region "Functionality"

    Public Shared Property F_Vision() As Boolean
        Get
            Return My.Settings.F_Vision
        End Get
        Set(ByVal _blnF_Vision As Boolean)
            My.Settings.F_Vision = _blnF_Vision
            My.Settings.Save()
        End Set
    End Property

    Public Shared Property F_RegisterControl() As Boolean
        Get
            Return My.Settings.F_RegisterControl
        End Get
        Set(ByVal _blnF_RegisterControl As Boolean)
            My.Settings.F_RegisterControl = _blnF_RegisterControl
            My.Settings.Save()
        End Set
    End Property

    Public Shared Property F_ViscosityControl() As Boolean
        Get
            Return My.Settings.F_ViscosityControl
        End Get
        Set(ByVal _blnF_ViscosityControl As Boolean)
            My.Settings.F_ViscosityControl = _blnF_ViscosityControl
            My.Settings.Save()
        End Set
    End Property

    Public Shared Property F_DensityControl() As Boolean
        Get
            Return My.Settings.F_DensityControl
        End Get
        Set(ByVal _blnF_DensityControl As Boolean)
            My.Settings.F_DensityControl = _blnF_DensityControl
            My.Settings.Save()
        End Set
    End Property

#End Region

#Region "Navigation & Navigation parameters"
    Public Shared Property N_Tag() As Object
        Get
            Return m_objN_Tag
        End Get
        Set(ByVal _objN_Tag As Object)
            m_objN_Tag = _objN_Tag
        End Set
    End Property

    Public Shared Property N_Debug() As Boolean
        Get
            Return My.Settings.N_Debug
        End Get
        Set(ByVal _blnN_Debug As Boolean)
            My.Settings.N_Debug = _blnN_Debug
        End Set
    End Property

#End Region


#End Region

#Region "Methods"

#Region "Public Methods"
    Public Shared Sub Reset()
        My.Settings.Reset()
        My.Settings.Save()
    End Sub
#End Region

#Region "Protected Methods"
#End Region

#Region "Events Handlers"

#End Region

#End Region






End Class
