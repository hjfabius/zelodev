' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class Results
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Private disposedValue As Boolean = False        ' To detect redundant calls
    Protected m_htResult As Hashtable
    Protected m_intSpeed As Integer
    Protected m_intCylinderSize As Integer
    Protected m_arintSpeed As ArrayList
#End Region

#Region "Events"

#End Region

#Region "Properties"

    Public Property CylinderSize() As Integer
        Get
            Return m_intCylinderSize
        End Get
        Set(ByVal _intCylinderSize As Integer)
            m_intCylinderSize = _intCylinderSize
        End Set
    End Property

    Public ReadOnly Property Values() As System.Collections.ICollection
        Get
            Return m_htResult.Values
        End Get
    End Property


    Public Property Speed() As Integer
        Get

            Return m_intSpeed
        End Get
        Set(ByVal _intSpeed As Integer)
            'Dim lngValue As Long
            'Dim lngAvgValue As Long

            'If Math.Abs(_intSpeed - m_intSpeed) > 10000 Then
            '    m_arintSpeed.Clear()
            'End If

            'm_arintSpeed.Add(_intSpeed)
            'If m_arintSpeed.Count > 8 Then
            '    m_arintSpeed.RemoveAt(0)
            'End If

            'lngAvgValue = 0
            'For Each lngValue In m_arintSpeed
            '    lngAvgValue += lngValue
            'Next

            'm_intSpeed = CInt(lngAvgValue / m_arintSpeed.Count)
            'If m_intSpeed > 105000 Then
            '    m_intSpeed = m_intSpeed
            'End If
            m_intSpeed = _intSpeed
        End Set
    End Property
#End Region

#Region "Methods"

#Region "Public Methods"

    Public Sub New()
        MyBase.New()
        m_htResult = New Hashtable
        m_arintSpeed = New ArrayList
    End Sub

    Public Sub Clear()
        m_htResult.Clear()
    End Sub

    Public Function Count() As Integer
        Return m_htResult.Count
    End Function

    Public Function GetSpeed() As String
        Return CDbl(60.0 * CDbl(Me.CylinderSize) / CDbl(Me.Speed)).ToString("#0.00").PadLeft(8)
    End Function

    Public Sub SetLongValue(ByVal _intCobId As Integer, ByVal _intLongValue As Integer)
        Dim objResult As Result

        If m_htResult.ContainsKey(_intCobId) Then
            objResult = CType(m_htResult.Item(_intCobId), Result)
            If objResult.LongError = Nothing Then
                objResult.LongError = _intLongValue
            End If
        Else
            objResult = New Result
            objResult.CobID = _intCobId
            objResult.LongError = _intLongValue
            'objResult.LatError = Int32.MaxValue
            m_htResult.Add(_intCobId, objResult)
        End If
        objResult = Nothing
    End Sub

    Public Sub SetLatValue(ByVal _intCobId As Integer, ByVal _intLatValue As Integer)
        Dim objResult As Result

        If m_htResult.ContainsKey(_intCobId) Then
            objResult = CType(m_htResult.Item(_intCobId), Result)
            If objResult.LatError = Nothing Then
                objResult.LatError = _intLatValue
            End If

        Else
            objResult = New Result
            objResult.CobID = _intCobId
            objResult.LatError = _intLatValue
            'objResult.LongError = Int32.MaxValue
            m_htResult.Add(_intCobId, objResult)
        End If
        objResult = Nothing
    End Sub

    Public Overrides Function ToString() As String
        Dim objResult As Result
        Dim strResult As String = ""

        For Each objResult In m_htResult.Values
            strResult &= objResult.ToString & vbCrLf
        Next

        strResult &= String.Format("Speed = {0} mt/min" & vbCrLf, Me.GetSpeed)

        Return strResult
    End Function

    Public Function Updated(ByVal _intCobId As Integer) As Boolean
        If m_htResult.ContainsKey(_intCobId) Then
            Return CType(m_htResult.Item(_intCobId), Result).Updated
        Else
            Return False
        End If

    End Function


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
        If Not Me.disposedValue Then
            If disposing Then
                ' TODO: free unmanaged resources when explicitly called
            End If

            ' TODO: free shared unmanaged resources
            m_htResult = Nothing
        End If
        Me.disposedValue = True
    End Sub
#End Region

#Region "Events Handlers"

#End Region

#End Region

End Class
