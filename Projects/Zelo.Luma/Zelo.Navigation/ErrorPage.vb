' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class ErrorPage
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"

#End Region

#Region "Events"

#End Region

#Region "Properties"

    Protected m_objException As Exception

    Public Property Exception() As Exception
        Get
            Return m_objException
        End Get
        Set(ByVal _objException As Exception)
            m_objException = _objException
            lblMessage.Text = "Error Description: " & _objException.Message & Environment.NewLine & Environment.NewLine & _
                              "Error Stack: " & _objException.Source & Environment.NewLine & _objException.StackTrace
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

