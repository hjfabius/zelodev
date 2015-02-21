Public Class NoritakeDisplay

    Public ReadOnly Property ComPort() As Integer
        Get
            Return CInt(Val(objSerialPort.PortName))
        End Get
    End Property

    Public ReadOnly Property IsOpen() As Boolean
        Get
            Return objSerialPort.IsOpen
        End Get
    End Property


    Public Sub Connect(ByVal _intComPort As Integer)
        Try
            objSerialPort.PortName = "COM" & _intComPort
            objSerialPort.BaudRate = 19200
            objSerialPort.Parity = IO.Ports.Parity.None
            objSerialPort.StopBits = IO.Ports.StopBits.One
            objSerialPort.Handshake = IO.Ports.Handshake.None
            objSerialPort.Open()
        Catch ex As Exception
            Throw New Exception("Error opening connection" & Environment.NewLine & ex.Message, ex)
        End Try
    End Sub

    Public Sub Disconnect()
        Try
            objSerialPort.DiscardInBuffer()
            objSerialPort.Close()
        Catch ex As Exception
            Throw New Exception("Error closing connection" & Environment.NewLine & ex.Message, ex)
        End Try

    End Sub










    Public Sub Home()
        SendByte(&HB)
    End Sub

    Public Sub Reset()
        SendByte(&H19)
        Threading.Thread.Sleep(50)

        'Disable hex receive mode.
        SendByte(&H1B)
        SendByte(&H42)
        Threading.Thread.Sleep(1)

        'Set Horizontal Write Mode
        SendByte(&H1A)
        SendByte(&H40)
        Threading.Thread.Sleep(1)

    End Sub

    Public Sub SetPixel(ByVal _intX As Integer, ByVal _intY As Integer, Optional ByVal _blnSet As Boolean = True)
        SetCursorPosition(_intX, _intY)
        If _blnSet Then
            SendByte(&H16) 'set
        Else
            SendByte(&H17) 'clear
        End If
    End Sub

    Public Sub SetCursorPosition(ByVal _intX As Integer, ByVal _intY As Integer)
        If _intX >= 0 And _intY >= 0 Then
            SendByte(&H10)
            SendByte(_intX)
            SendByte(_intY)
        End If
    End Sub

    Public Sub SetVerticalLine(ByVal _intX As Integer, ByVal _intTop As Integer, ByVal _intLength As Integer)
        SetArea(_intX, _intTop, _intX, _intTop + _intLength)
        Threading.Thread.Sleep(10)
    End Sub

    Public Sub SetHorizontalLine(ByVal _intY As Integer, ByVal _intLeft As Integer, ByVal _intWidth As Integer)
        SetArea(_intLeft, _intY, _intLeft + _intWidth, _intY)
        Threading.Thread.Sleep(10)
    End Sub


    Public Sub SetArea(ByVal _intLeft As Integer, ByVal _intTop As Integer, ByVal _intRight As Integer, ByVal _intBottom As Integer)
        SendByte(&H11)
        SendByte(_intLeft)
        SendByte(_intTop)
        SendByte(_intRight)
        SendByte(_intBottom)
        Threading.Thread.Sleep(New TimeSpan((_intBottom - _intTop) * (_intRight - _intLeft) * 50))
    End Sub

    Public Sub ClearArea(ByVal _intLeft As Integer, ByVal _intTop As Integer, ByVal _intRight As Integer, ByVal _intBottom As Integer)
        SendByte(&H12)
        SendByte(_intLeft)
        SendByte(_intTop)
        SendByte(_intRight)
        SendByte(_intBottom)

        Threading.Thread.Sleep(New TimeSpan((_intBottom - _intTop) * (_intRight - _intLeft) * 50))

    End Sub

    Public Sub InvertArea(ByVal _intLeft As Integer, ByVal _intTop As Integer, ByVal _intRight As Integer, ByVal _intBottom As Integer)
        SendByte(&H13)
        SendByte(_intLeft)
        SendByte(_intTop)
        SendByte(Math.Min(_intRight, 124))
        SendByte(Math.Min(_intBottom, 62))

        Threading.Thread.Sleep(New TimeSpan((_intBottom - _intTop) * (_intRight - _intLeft) * 50))

    End Sub

    Public Sub SetOutline(ByVal _intLeft As Integer, ByVal _intTop As Integer, ByVal _intRight As Integer, ByVal _intBottom As Integer, Optional ByVal _blnReversed As Boolean = False)
        SendByte(&H14)
        SendByte(_intLeft)
        SendByte(_intTop)
        SendByte(_intRight)
        SendByte(_intBottom)

        Threading.Thread.Sleep(New TimeSpan((_intBottom - _intTop) * (_intRight - _intLeft) * 50))

        If _blnReversed Then
            Me.InvertArea(_intLeft + 1, _intTop + 1, _intRight - 1, _intBottom - 1)
        End If
    End Sub

    Public Sub ClearOutline(ByVal _intLeft As Integer, ByVal _intTop As Integer, ByVal _intRight As Integer, ByVal _intBottom As Integer)
        SendByte(&H15)
        SendByte(_intLeft)
        SendByte(_intTop)
        SendByte(_intRight)
        SendByte(_intBottom)
    End Sub

    Public Enum FontSize
        None = 0
        Mini = &H1C
        Fix5x7 = &H1D
        Fix10x14 = &H1E
    End Enum

    Public Sub SelectFont(ByVal _enmFontSize As FontSize)
        If _enmFontSize <> FontSize.None Then
            SendByte(_enmFontSize)
        End If
    End Sub

    Public Sub SendByte(ByVal _intValue As Integer)
        Dim objbyte(0) As Byte
        objbyte(0) = _intValue
        objSerialPort.Write(objbyte, 0, 1)
        'Threading.Thread.Sleep(New TimeSpan(10000))
    End Sub

    Public Sub WriteString(ByVal _strValue As String, Optional ByVal _enmFontSize As FontSize = FontSize.None, Optional ByVal _intX As Integer = -1, Optional ByVal _intY As Integer = -1)
        Dim objChar As Char

        SetCursorPosition(_intX, _intY)

        SelectFont(_enmFontSize)

        For Each objChar In _strValue.ToCharArray
            SendByte(AscW(objChar))
        Next

        Threading.Thread.Sleep(New TimeSpan(1000 * _strValue.Length))
    End Sub

    Public Sub DesignSelector(ByVal _intX As Integer, ByVal _intY As Integer, ByVal _blnFilled As Boolean, ByVal _blnReversed As Boolean)
        SetCursorPosition(_intX - 3, _intY)
        If _blnReversed Then
            If _blnFilled Then
                DesignGraphic(&H38, &H38, &H38, &H38, &H38, &H38, &H38, &H10)
            Else
                DesignGraphic(&H38, &H28, &H28, &H28, &H28, &H28, &H28, &H10)
            End If
        Else
            If _blnFilled Then
                DesignGraphic(&H0, &H10, &H38, &H38, &H38, &H38, &H38, &H0)
            Else
                DesignGraphic(&H0, &H10, &H28, &H28, &H28, &H28, &H38, &H0)
            End If
        End If
    End Sub

    Public Sub DesignLed(ByVal _intX As Integer, ByVal _intY As Integer, Optional ByVal _blnFilled As Boolean = True)
        SetCursorPosition(_intX - 2, _intY)
        If _blnFilled Then
            DesignGraphic(&H30, &H78, &HFC, &HFC, &H78, &H30, &H0, &H0)
        Else
            DesignGraphic(&H30, &H48, &H84, &H84, &H48, &H30, &H0, &H0)
        End If
    End Sub


    Public Sub DesignGraphic(ByVal _intValue01 As Integer, ByVal _intValue02 As Integer, ByVal _intValue03 As Integer, ByVal _intValue04 As Integer, ByVal _intValue05 As Integer, ByVal _intValue06 As Integer, ByVal _intValue07 As Integer, ByVal _intValue08 As Integer)
        'Graphic Write
        SendByte(&H18)

        'Length
        SendByte(&H8)

        'Data
        SendByte(_intValue01)
        Threading.Thread.Sleep(1)
        SendByte(_intValue02)
        Threading.Thread.Sleep(1)
        SendByte(_intValue03)
        Threading.Thread.Sleep(1)
        SendByte(_intValue04)
        Threading.Thread.Sleep(1)
        SendByte(_intValue05)
        Threading.Thread.Sleep(1)
        SendByte(_intValue06)
        Threading.Thread.Sleep(1)
        SendByte(_intValue07)
        Threading.Thread.Sleep(1)
        SendByte(_intValue08)
        Threading.Thread.Sleep(1)
    End Sub
End Class
