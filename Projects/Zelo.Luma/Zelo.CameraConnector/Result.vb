' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'

Imports System.Globalization

Public Class Result
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Private disposedValue As Boolean = False        ' To detect redundant calls
    Public m_intLongError As Integer = Nothing
    Public m_intLatError As Integer = Nothing
    Public m_intCobID As Integer = Nothing
#End Region

#Region "Events"

#End Region

#Region "Properties"

    Public Property LatError() As Integer
        Get
            Return m_intLatError
        End Get
        Set(ByVal _intLatError As Integer)
            m_intLatError = _intLatError
        End Set
    End Property

    Public Property LongError() As Integer
        Get
            Return m_intLongError
        End Get
        Set(ByVal _intLongError As Integer)
            m_intLongError = _intLongError
        End Set
    End Property

    Public Property CobID() As Integer
        Get
            Return m_intCobID
        End Get
        Set(ByVal _intCobID As Integer)
            m_intCobID = _intCobID
        End Set
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

    Public Overrides Function ToString() As String
        Dim strValue As String
        Dim objNumberFormatInfo As NumberFormatInfo
        objNumberFormatInfo = CultureInfo.CurrentCulture.NumberFormat

        strValue = String.Format("COB_ID = 0x1{0}       Long:", Hex(Me.CobID))
        If Not Me.LongError = Nothing Then
            strValue &= CDbl(CDbl(Me.LongError) / 1000).ToString("##0.000").PadLeft(8)
        Else
            strValue &= "0.000".PadLeft(8)
        End If

        strValue &= "       Side:"

        If Not Me.LatError = Nothing Then
            strValue &= CDbl(CDbl(Me.LatError) / 1000).ToString("##0.000").PadLeft(8)
        Else
            strValue &= "0.000".PadLeft(8)
        End If

        Return strValue

    End Function

    Public Function Updated() As Boolean
        Return (Me.LongError <> Nothing) And (Me.LatError <> Nothing)
    End Function

    Public Sub Clear()
        Me.LongError = Nothing
        Me.LatError = Nothing
    End Sub

#End Region

#Region "Protected Methods"
    ' IDisposable
    Protected Overridable Sub Dispose(ByVal disposing As Boolean)
        If Not Me.disposedValue Then
            If disposing Then
                ' TODO: free unmanaged resources when explicitly called
            End If

            ' TODO: free shared unmanaged resources
        End If
        Me.disposedValue = True
    End Sub
#End Region

#Region "Events Handlers"

#End Region

#End Region

End Class
