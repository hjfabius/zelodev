' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class GUINavigation
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Protected m_enmNavigationID As NavigationPages
#End Region

#Region "Events"

#End Region

#Region "Properties"

    <System.ComponentModel.Category("Action")> _
    Public Property NavigationID() As NavigationPages
        Get
            Return m_enmNavigationID
        End Get
        Set(ByVal _enmNavigationID As NavigationPages)
            m_enmNavigationID = _enmNavigationID
        End Set
    End Property

#End Region

#Region "Methods"

#Region "Public Methods"

#End Region

#Region "Protected Methods"

#End Region

#Region "Events Handlers"

#End Region

#End Region






End Class
