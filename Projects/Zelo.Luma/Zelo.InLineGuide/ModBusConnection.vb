' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class ModBusConnection
    Implements IDisposable

#Region "Constants"
#End Region

#Region "Variables"
    Private disposedValue As Boolean = False        ' To detect redundant calls
    Protected m_objModBus As MODBUSSERVERLib.ModbusSrv
#End Region

#Region "Events"
    Public Event NewMessageEvent(ByRef sender As Object, ByVal _strMessage As String)
#End Region

#Region "Properties"
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


    Public Sub Close()
        If Not m_objModBus Is Nothing Then
            NewMessage("Closing ModBus server...")
            m_objModBus.CloseConnection()
            m_objModBus = Nothing
            NewMessage("ModBus server closed")
        End If
    End Sub

    Public Sub Open(ByVal _enmSerialPort As SerialPort, ByVal _enmBaudRate As BaudRate)
        NewMessage("Creating ModBus connection...")
        Try

            m_objModBus = New MODBUSSERVERLib.ModbusSrv

            NewMessage("Configuring ModBus device...")
            m_objModBus.OpenConnection(_enmSerialPort.ToString.ToLower, CShort(ConnectionType.Local)) 'change com port

            m_objModBus.ComPort = CShort(_enmSerialPort) 'change com port
            m_objModBus.BaudRate = _enmBaudRate
            m_objModBus.ByteSize = 8
            m_objModBus.StopBits = CShort(ConnectionStopBit.OneStopBit)
            m_objModBus.Parity = CShort(ConnectionParity.No)
            m_objModBus.FlowControl = CShort(ConnectionFlowControl.None)
            m_objModBus.SilentInterval = 20
            m_objModBus.TimeOut = 500
            m_objModBus.TransmissionMode = CShort(ConnectionTransmissionMode.RTU)

            m_objModBus.RaiseError = True
        Catch ex As Exception
            Throw New Exception("Impossible to setup the ModBus connection")
        End Try


        If Not m_objModBus.Connect Then
            Throw New Exception("Impossible to connect the ModBus device")
        Else
            NewMessage("ModBus device setup")
        End If
    End Sub

    Public Function GetParameter(ByVal _shSlaveID As Short, ByVal _intAddress As Integer, ByVal _strParameterName As String) As Integer
        Dim objValue As Object = Nothing
        Dim intErrorCode As Integer

        If m_objModBus Is Nothing Then
            Throw New Exception("ModBus exception: Connection lost")
        End If

        intErrorCode = m_objModBus.ReadOutputRegisters(_shSlaveID, _intAddress, 1, objValue)
        CheckError(intErrorCode)

        Return CInt(CType(objValue, Array).GetValue(0))

    End Function

    Public Sub SetParameter(ByVal _shSlaveID As Short, ByVal _intAddress As Integer, ByVal _strParameterName As String, ByVal _intValue As Integer)
        Dim intErrorCode As Integer
        Dim objValue As Object = Nothing

        If m_objModBus Is Nothing Then
            Throw New Exception("ModBus exception: Connection lost")
        End If

        intErrorCode = m_objModBus.ReadOutputRegisters(_shSlaveID, _intAddress, 1, objValue)
        CheckError(intErrorCode)
        intErrorCode = m_objModBus.PresetSingleRegister(_shSlaveID, _intAddress, _intValue)
        CheckError(intErrorCode)
        NewMessage(String.Format("{0} parameter set to {1} ({2})", _strParameterName, _intValue, CInt(CType(objValue, Array).GetValue(0))))
    End Sub



#End Region

#Region "Protected Methods"
    ' IDisposable
    Protected Overridable Sub Dispose(ByVal disposing As Boolean)
        If Not Me.disposedValue Then
            If disposing Then
                ' TODO: free unmanaged resources when explicitly called
            End If
            Me.Close()
            ' TODO: free shared unmanaged resources
        End If
        Me.disposedValue = True
    End Sub

    Protected Sub CheckError(ByVal _intErrorCode As Integer)
        Select Case _intErrorCode
            Case 0
                Return 'No Error.
            Case &H80040201
                Throw New Exception("Modbus Exception: Time-out error when executing communication with a slave.")
            Case &H80040202
                Throw New Exception("Modbus Exception: The slave returned an invalid response.")
            Case &H80040203
                Throw New Exception("Modbus Exception: Failed to check CRC of slave response.")
            Case &H80040208
                Throw New Exception("Modbus Exception: Error when writing to a com port.")
            Case &H80040209
                Throw New Exception("Modbus Exception: Error when reading from a com port.")
            Case &H8004020A
                Throw New Exception("Modbus Exception: The com port was not initialized.")
            Case &H80048200
                Throw New Exception("Modbus Exception: Slave returned exception code 0")
            Case &H800405E8
                Throw New Exception("Modbus Exception: The buffer can not store a modbus message.")
            Case &H800405EB
                Throw New Exception("Modbus Exception: Error while reading or writing using a socket api funtion.")
            Case &H800405EA
                Throw New Exception("Modbus Exception: Error while reading or writing using a socket api funtion.")
            Case &H800405E9
                Throw New Exception("Modbus Exception: Not specified socket error.")
            Case &H800405EC
                Throw New Exception("Modbus Exception: Try to send a modbus message with disconnected socket.")
            Case Else
                If _intErrorCode >= &H80048201 And _intErrorCode <= &H800482FF Then
                    Throw New Exception("Modbus Exception: Slave returned exception code " & (_intErrorCode - &H80048200))
                Else
                    Throw New Exception("Modbus Exception: Not specified error")
                End If
        End Select
    End Sub

    Protected Sub NewMessage(ByVal _strMessage As String)
        RaiseEvent NewMessageEvent(Me, _strMessage)
    End Sub
#End Region

#Region "Events Handlers"

#End Region

#End Region






End Class
