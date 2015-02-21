' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Imports System.Windows.Forms

Public Class InLineGuide
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Private disposedValue As Boolean = False        ' To detect redundant calls
    Protected m_shoSlaveID As Short
    Protected m_blnAsync As Boolean
    Protected m_intGuideLength As Integer
    Protected WithEvents m_objSyncTimer As Timer
    Protected WithEvents m_objBoundsTimer As Timer
    Protected WithEvents m_objModBusConnection As ModBusConnection
    Protected m_intMaxSpeed As Integer
    Protected m_intMaxSpeedOnGoTo As Integer
    Protected m_enmSerialPort As SerialPort

#End Region

#Region "Events"
    Public Event MovementTerminated(ByRef _objSender As Object, ByVal _shoDeviceID As Short)
    Public Event NewMessageEvent(ByRef sender As Object, ByVal _shoSlaveID As Short, ByVal _strMessage As String)
#End Region

#Region "Properties"
    Public Property CurrentPosition() As Integer
        Get
            Return m_objModBusConnection.GetParameter(m_shoSlaveID, &H1000, "Position_Actual_Value")
        End Get
        Set(ByVal _intCurrentPosition As Integer)
            m_objModBusConnection.SetParameter(m_shoSlaveID, &H4101, "Direct_Cmd_Param_1", 4) 'Go to position
            m_objModBusConnection.SetParameter(m_shoSlaveID, &H4102, "Direct_Cmd_Param_2", _intCurrentPosition) 'Position
            m_objModBusConnection.SetParameter(m_shoSlaveID, &H4105, "Direct_Cmd", 1) 'Move
            Syncronisation()
        End Set
    End Property

    Public ReadOnly Property CurrentSpeed() As Integer
        Get
            Return m_objModBusConnection.GetParameter(m_shoSlaveID, &H1009, "Velocity_Actual_Value") 'Hz
        End Get
    End Property

    Public Property MaxSpeed() As Integer
        Get
            Return m_objModBusConnection.GetParameter(m_shoSlaveID, &H1017, "Profile_Velocity") 'Hz
        End Get
        Set(ByVal _intSpeed As Integer)
            m_intMaxSpeed = _intSpeed
            m_objModBusConnection.SetParameter(m_shoSlaveID, &H1017, "Profile_Velocity", _intSpeed) 'Hz
        End Set
    End Property

    Public Property MaxSpeedOnGoTo() As Integer
        Get
            Return m_intMaxSpeedOnGoTo
        End Get
        Set(ByVal _intMaxSpeedOnGoTo As Integer)
            m_intMaxSpeedOnGoTo = _intMaxSpeedOnGoTo
            m_objModBusConnection.SetParameter(m_shoSlaveID, &H1019, "Profile_Acceleration", Math.Max(300, m_intMaxSpeedOnGoTo \ 5)) 'ms
            m_objModBusConnection.SetParameter(m_shoSlaveID, &H101A, "Profile_Deceleration", Math.Max(300, m_intMaxSpeedOnGoTo \ 5)) 'ms
        End Set
    End Property

    Public ReadOnly Property CurrentCurrent() As Integer
        Get
            Return m_objModBusConnection.GetParameter(m_shoSlaveID, &H1008, "Current_Actual_Value") 'mA
        End Get
    End Property

    Public Property GuideLength() As Integer
        Get
            Return m_intGuideLength
        End Get
        Set(ByVal _intGuideLength As Integer)
            m_intGuideLength = _intGuideLength
        End Set
    End Property

    Public ReadOnly Property AnalogicInput(ByVal _intIndex As Integer) As Integer
        Get
            Return m_objModBusConnection.GetParameter(m_shoSlaveID, &H1110 + _intIndex, "Analog_In") 'mV
        End Get
    End Property

    Public ReadOnly Property SerialPort() As SerialPort
        Get
            Return m_enmSerialPort
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

    Public Sub Open(ByVal _shoSlaveID As Short, ByVal _enmSerialPort As SerialPort, Optional ByVal _enmBaudRate As BaudRate = BaudRate.BaudRate57600, Optional ByVal _blnAsync As Boolean = True)
        m_shoSlaveID = _shoSlaveID
        m_blnAsync = _blnAsync
        m_intGuideLength = 11450
        m_objSyncTimer = New Timer
        m_objSyncTimer.Interval = 400
        m_objSyncTimer.Enabled = False
        m_enmSerialPort = _enmSerialPort

        m_objBoundsTimer = New Timer
        m_objBoundsTimer.Interval = 100
        m_objBoundsTimer.Enabled = False
        m_intMaxSpeed = 5000
        m_intMaxSpeedOnGoTo = 20000

        m_objModBusConnection = New ModBusConnection

        m_objModBusConnection.Open(_enmSerialPort, _enmBaudRate)

        'Current
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1013, "Nominal_Current", 4600) 'mA
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1010, "Min_Current", 0) 'mA
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1012, "Max_Current", 4000) 'mA
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1011, "Boost_Current", 4600) 'mA
        'Motors parameter
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1026, "Motor_Step_Angle", 8) '1/8 step (200 step/cycle)
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1027, "Motor_Poles", 50) 'Number of poles
        'Speed profile
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1014, "Min_Profile_Velocity", 200) 'Hz
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1015, "Max_Profile_Velocity", 20000) 'Hz
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1019, "Profile_Acceleration", 800) 'ms
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H101A, "Profile_Deceleration", 800) 'ms
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1017, "Profile_Velocity", m_intMaxSpeed) 'Hz

        'Enable Analog Inputs:
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1120, "Analog_Inputs_K_Filter", 1) 'Analog_Inputs Enable
    End Sub

    Public Sub Close()
        If Not m_objModBusConnection Is Nothing Then
            Me.GoHome()
            m_objModBusConnection.Close()
            m_objModBusConnection.Dispose()
            m_objModBusConnection = Nothing
        End If

        If Not m_objSyncTimer Is Nothing Then
            m_objSyncTimer.Enabled = False
            m_objSyncTimer.Dispose()
            m_objSyncTimer = Nothing
        End If

        If Not m_objBoundsTimer Is Nothing Then
            m_objBoundsTimer.Enabled = False
            m_objBoundsTimer.Dispose()
            m_objBoundsTimer = Nothing
        End If


    End Sub

    Public Sub SetHome()
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1000, "Position_Actual_Value", 0)
    End Sub

    Public Sub GoHome()
        'm_objModBusConnection.SetParameter(m_shoSlaveID, &H4101, "Direct_Cmd_Param_1", 4) 'Go to position
        'm_objModBusConnection.SetParameter(m_shoSlaveID, &H4102, "Direct_Cmd_Param_2", 0) 'Position
        'm_objModBusConnection.SetParameter(m_shoSlaveID, &H4105, "Direct_Cmd", 1) 'Move
        'Syncronisation()
        Me.MoveTo(500)
    End Sub

    Public Sub MoveLeft()
        Me.MaxSpeed = m_intMaxSpeed
        'Me.CurrentPosition = Me.GuideLength

        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4101, "Direct_Cmd_Param_1", 0) 'Go to position
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4105, "Direct_Cmd", 1) 'Move

    End Sub

    Public Sub MoveRight()
        Me.MaxSpeed = m_intMaxSpeed
        'Me.CurrentPosition = 0
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4101, "Direct_Cmd_Param_1", 1) 'Go to position
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4105, "Direct_Cmd", 1) 'Move

    End Sub

    Public Sub MoveTo(ByVal _intNewPosition As Integer)
        Dim blnAsync As Boolean
        blnAsync = m_blnAsync
        m_blnAsync = False
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4101, "Direct_Cmd_Param_1", 4) 'Go to position
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4102, "Direct_Cmd_Param_2", _intNewPosition) 'Position
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4105, "Direct_Cmd", 1) 'Move
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1017, "Profile_Velocity", m_intMaxSpeedOnGoTo) 'Hz
        Syncronisation()
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H1017, "Profile_Velocity", m_intMaxSpeed) 'Hz
        m_blnAsync = blnAsync
    End Sub


    Public Sub HomingLeft()
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4101, "Direct_Cmd_Param_1", 0) 'Go forward
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4105, "Direct_Cmd", 1) 'Move
        CheckBounds()
        Syncronisation()
    End Sub

    Public Sub HomingRight()
        Dim intSpeed As Integer
        intSpeed = Me.MaxSpeed
        Me.MaxSpeed = 600
        'CheckBounds()
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4101, "Direct_Cmd_Param_1", 1) 'Go backward
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4105, "Direct_Cmd", 1) 'Move

        While (Me.AnalogicInput(0) > 5000 And Me.IsMoving)

        End While
        Me.ImmediateStop()
        Syncronisation()
        Me.MaxSpeed = intSpeed
        Me.SetHome()
    End Sub

    Public Sub [Stop]()
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4101, "Direct_Cmd_Param_1", 1) 'Slow Down
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4105, "Direct_Cmd", 0) 'Stop
    End Sub

    Public Sub ImmediateStop()
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4101, "Direct_Cmd_Param_1", 0) 'Fast Stop
        m_objModBusConnection.SetParameter(m_shoSlaveID, &H4105, "Direct_Cmd", 0) 'Stop
    End Sub


    Public Function IsMoving() As Boolean
        Return ((m_objModBusConnection.GetParameter(m_shoSlaveID, &H1202, "Drive_Register") And 1) = 1)
    End Function


#End Region

#Region "Protected Methods"

    Protected Sub CheckBounds()
        m_objBoundsTimer.Enabled = Me.IsMoving
    End Sub

    Protected Sub Syncronisation()
        If Not m_blnAsync Then
            Do
                Threading.Thread.Sleep(1)
            Loop Until Not IsMoving()
            RaiseEvent MovementTerminated(Me, m_shoSlaveID)
        Else
            m_objSyncTimer.Enabled = True
        End If
    End Sub


    ' IDisposable
    Protected Overridable Sub Dispose(ByVal disposing As Boolean)
        If Not Me.disposedValue Then
            If disposing Then
                ' TODO: free unmanaged resources when explicitly called
            End If
            Try
                Me.Close()
            Catch ex As Exception

            End Try
            ' TODO: free shared unmanaged resources
        End If
        Me.disposedValue = True
    End Sub
#End Region

#Region "Events Handlers"
    Private Sub m_objSyncTimer_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles m_objSyncTimer.Tick
        m_objSyncTimer.Enabled = False
        If Me.IsMoving Then
            m_objSyncTimer.Enabled = True
        Else
            RaiseEvent MovementTerminated(Me, m_shoSlaveID)
        End If
    End Sub

    Private Sub m_objModBusConnection_NewMessageEvent(ByRef sender As Object, ByVal _strMessage As String) Handles m_objModBusConnection.NewMessageEvent
        RaiseEvent NewMessageEvent(Me, m_shoSlaveID, _strMessage)
    End Sub

    Private Sub m_objBoundsTimer_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles m_objBoundsTimer.Tick
        Dim intCurrentPosition As Integer
        m_objBoundsTimer.Enabled = False

        intCurrentPosition = Me.CurrentPosition
        If intCurrentPosition > Me.GuideLength Or _
            intCurrentPosition <= 1 Then
            Me.Stop()
            Do
                Threading.Thread.Sleep(10)
            Loop Until Not IsMoving()
            If Me.CurrentPosition > 55000 Then
                Me.SetHome()
            End If
        End If

        m_objBoundsTimer.Enabled = Me.IsMoving

    End Sub


#End Region

#End Region

End Class
