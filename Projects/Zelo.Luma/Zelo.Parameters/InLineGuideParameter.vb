' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class InLineGuideParameter
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Private m_blnDisposedValue As Boolean = False        ' To detect redundant calls

#End Region

#Region "Events"

#End Region

#Region "Properties"
    Public Shared ReadOnly Property Speed() As Integer
        Get
            Return 800
        End Get
    End Property

    Public Shared ReadOnly Property MaxSpeed() As Integer
        Get
            Return 4000
        End Get
    End Property

    Public Shared ReadOnly Property GuideLength() As Integer
        Get
            Return 11000
        End Get
    End Property

#End Region

#Region "Methods"

#Region "Public Methods"

#Region " IDisposable Support "
    ' This code added by Visual Basic to correctly implement the disposable pattern.
    Public Sub Dispose() Implements IDisposable.Dispose
        ' Do not change this code.  Put cleanup code in Dispose(ByVal disposing As Boolean) above.
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub
#End Region

#End Region

#Region "Protected Methods"
    ' IDisposable
    Protected Overridable Sub Dispose(ByVal disposing As Boolean)
        If Not Me.m_blnDisposedValue Then
            If disposing Then
                ' TODO: free unmanaged resources when explicitly called
            End If

            ' TODO: free shared unmanaged resources
        End If
        Me.m_blnDisposedValue = True
    End Sub
#End Region

#Region "Events Handlers"

#End Region

#End Region






End Class
