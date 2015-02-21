' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class Demo
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Private disposedValue As Boolean = False        ' To detect redundant calls
    Protected m_arintInLineGuidePosition As ArrayList
    Protected WithEvents m_objInLineGuideTimer As Timers.Timer
    Protected m_objInLineGuide As InLineGuide
    Protected m_blnDemoWebInspection As Boolean = False
    Protected m_blnDemoDensitometer As Boolean = False
    Protected m_blnDemoRegister As Boolean = True
    Protected m_intCurrentIndexGuidePosition As Integer
    Protected m_objRandom As Random
    Protected m_blnCameraFlash As Boolean = True
    Protected m_objCameraConnector As CameraConnector

#End Region

#Region "Events"
    Public Event InLineGuideMoved(ByRef _objSender As Object, ByVal _intNewPosition As Integer, ByVal _intNewIndex As Integer)
#End Region

#Region "Properties"

    Public Property DemoRegister() As Boolean
        Get
            Return m_blnDemoRegister
        End Get
        Set(ByVal _blnDemoRegister As Boolean)
            If m_blnDemoRegister <> _blnDemoRegister Then
                m_blnDemoRegister = _blnDemoRegister
                m_objInLineGuideTimer.Enabled = Me.DemoDensitometer Or Me.DemoRegister Or Me.DemoWebInspection
                UpdateDemoValues()
            End If
        End Set
    End Property

    Public Property DemoDensitometer() As Boolean
        Get
            Return m_blnDemoDensitometer
        End Get
        Set(ByVal _blnDemoDensitometer As Boolean)
            If m_blnDemoDensitometer <> _blnDemoDensitometer Then
                m_blnDemoDensitometer = _blnDemoDensitometer
                m_objInLineGuideTimer.Enabled = Me.DemoDensitometer Or Me.DemoRegister Or Me.DemoWebInspection
                UpdateDemoValues()
            End If
        End Set
    End Property

    Public Property DemoWebInspection() As Boolean
        Get
            Return m_blnDemoWebInspection
        End Get
        Set(ByVal _blnDemoWebInspection As Boolean)
            If m_blnDemoWebInspection <> _blnDemoWebInspection Then
                m_blnDemoWebInspection = _blnDemoWebInspection
                m_objInLineGuideTimer.Enabled = Me.DemoDensitometer Or Me.DemoRegister Or Me.DemoWebInspection
                UpdateDemoValues()
            End If
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

    Public Property CameraFlash() As Boolean
        Get
            Return m_blnCameraFlash
        End Get
        Set(ByVal _blnCameraFlash As Boolean)
            m_blnCameraFlash = _blnCameraFlash
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

    Protected Sub UpdateDemoValues()
        m_arintInLineGuidePosition.Clear()
        If Me.DemoWebInspection Then
            m_arintInLineGuidePosition.Add(11000)
            m_arintInLineGuidePosition.Add(10800)
            m_arintInLineGuidePosition.Add(10720)
            m_arintInLineGuidePosition.Add(10500)
            m_arintInLineGuidePosition.Add(10100)
            m_arintInLineGuidePosition.Add(9500)
            m_arintInLineGuidePosition.Add(9250)
            m_arintInLineGuidePosition.Add(7900)
            m_arintInLineGuidePosition.Add(6650)
            m_arintInLineGuidePosition.Add(5350)
            m_arintInLineGuidePosition.Add(4550)
            m_arintInLineGuidePosition.Add(3400)
            m_arintInLineGuidePosition.Add(2550)
            m_arintInLineGuidePosition.Add(920)
            m_objInLineGuideTimer.Interval = 3000

        ElseIf Me.DemoRegister Then
            m_arintInLineGuidePosition.Add(600)
            m_objInLineGuideTimer.Interval = 500
        ElseIf Me.DemoDensitometer Then
            m_arintInLineGuidePosition.Add(4250)
            m_arintInLineGuidePosition.Add(3700)
            m_arintInLineGuidePosition.Add(3150)
            m_arintInLineGuidePosition.Add(2600)
            m_objInLineGuideTimer.Interval = 1000
        End If


        m_intCurrentIndexGuidePosition = 0

        m_objInLineGuideTimer.Enabled = Me.DemoDensitometer Or Me.DemoRegister Or Me.DemoWebInspection

    End Sub

    Public Sub New()

        m_arintInLineGuidePosition = New ArrayList

        m_objInLineGuideTimer = New Timers.Timer
        m_objRandom = New Random
        m_objInLineGuideTimer.AutoReset = True

        UpdateDemoValues()
       
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
            m_arintInLineGuidePosition.Clear()
            If Not m_objInLineGuide Is Nothing Then
                m_objInLineGuide.MoveTo(0)
            End If
            m_objInLineGuide = Nothing
        End If
        Me.disposedValue = True
    End Sub
#End Region

#Region "Events Handlers"
    Private Sub m_objInLineGuideTimer_Elapsed(ByVal sender As Object, ByVal e As System.Timers.ElapsedEventArgs) Handles m_objInLineGuideTimer.Elapsed
        Dim intPosition As Integer
        m_objInLineGuideTimer.Enabled = False
        If Not m_objInLineGuide Is Nothing Then

            If Me.DemoWebInspection Then
                m_intCurrentIndexGuidePosition = m_objRandom.Next(0, m_arintInLineGuidePosition.Count - 1)
                intPosition = CInt(m_arintInLineGuidePosition(m_intCurrentIndexGuidePosition))
                m_objInLineGuide.MoveTo(intPosition)
                'm_intCurrentIndexGuidePosition += 1
                'If m_intCurrentIndexGuidePosition = m_arintInLineGuidePosition.Count Then
                '    m_intCurrentIndexGuidePosition = 0
                'End If
                If Me.CameraFlash Then
                    CameraConnector.Flash()
                End If
                RaiseEvent InLineGuideMoved(Me, intPosition, m_intCurrentIndexGuidePosition)
            ElseIf Me.DemoDensitometer Then
                m_intCurrentIndexGuidePosition = (m_intCurrentIndexGuidePosition + 1) Mod m_arintInLineGuidePosition.Count
                intPosition = CInt(m_arintInLineGuidePosition(m_intCurrentIndexGuidePosition))
                m_objInLineGuide.MoveTo(intPosition)

                RaiseEvent InLineGuideMoved(Me, intPosition, m_intCurrentIndexGuidePosition)

            ElseIf Me.DemoRegister Then
                m_intCurrentIndexGuidePosition = (m_intCurrentIndexGuidePosition + 1) Mod m_arintInLineGuidePosition.Count
                intPosition = CInt(m_arintInLineGuidePosition(m_intCurrentIndexGuidePosition))
                m_objInLineGuide.MoveTo(intPosition)

                RaiseEvent InLineGuideMoved(Me, intPosition, m_intCurrentIndexGuidePosition)
            End If
        End If
        m_objInLineGuideTimer.Enabled = True
    End Sub

#End Region

#End Region






End Class
