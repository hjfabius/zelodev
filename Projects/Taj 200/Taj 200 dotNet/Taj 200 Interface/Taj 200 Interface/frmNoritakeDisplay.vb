Public Class frmNoritakeDisplay

    Private m_arobjParameters As ArrayList
    Private m_arintParameters As ArrayList

    Public Class Parameter
        Public Index As Integer
        Public Label As String
        Public Value As Integer

        Public Sub New(ByVal _intIndex As Integer, ByVal _strLabel As String)
            Me.Index = _intIndex
            Me.Label = _strLabel
            Me.Value = 100
        End Sub
    End Class


    Private Sub InitializeParameters()
        Dim I As Integer

        m_arobjParameters = New ArrayList
        m_arintParameters = New ArrayList

        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Lingua"))
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Derivativo"))
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Velocita minima")) 'Soglia d'inserzione
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Salto anomalie"))
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Tipo di marca")) 'Longitudinale, Quadrato, Triangolo Operatore, Triangolo Trasmissione
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Inversione corr."))
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Sensibilta acc/dec.")) 'Trip
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Guadagno Tiro"))
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Intervallo Tiro"))
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Segno in MM"))

        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Guadagno Long."))
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Intervallo Long.")) 'Ciclico
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Zona Morta Long."))
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Velocita Motore Long."))

        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Guadagno Tras."))
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Intervallo Tras.")) 'Ciclico
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Zona Morta Tras."))
        m_arobjParameters.Add(New Parameter(m_arobjParameters.Count, "Velocità Motore Tras."))


        For I = 0 To m_arobjParameters.Count - 1
            m_arintParameters.Add(I)
        Next

    End Sub


    Private Sub cmbComPort_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbComPort.SelectedIndexChanged
        My.Settings.COMPort = Me.cmbComPort.SelectedIndex + 1
    End Sub

    Private Sub Test1()
        Dim intRegisterWidth As Integer = 111
        Dim intRegisterLeft As Integer = 7

        objNoritakeDisplay.DesignLed(2, 0, False)
        objNoritakeDisplay.DesignLed(intRegisterWidth + intRegisterLeft + 4, 0, True)

        objNoritakeDisplay.SetHorizontalLine(3, intRegisterLeft, intRegisterWidth)
        objNoritakeDisplay.SetVerticalLine(intRegisterLeft, 1, 4)
        'objNoritakeDisplay.SetVerticalLine((intRegisterWidth / 4) + intRegisterLeft, 2, 2)
        objNoritakeDisplay.SetVerticalLine((intRegisterWidth / 2) + intRegisterLeft, 1, 4)
        objNoritakeDisplay.SetVerticalLine((intRegisterWidth * 3 / 4) + intRegisterLeft, 2, 2)
        objNoritakeDisplay.SetVerticalLine(intRegisterWidth + intRegisterLeft, 1, 4)

        objNoritakeDisplay.WriteString("R", NoritakeDisplay.FontSize.Mini, -1 + intRegisterLeft, 13)
        objNoritakeDisplay.WriteString("A", NoritakeDisplay.FontSize.Mini, -1 + intRegisterLeft + intRegisterWidth, 13)

        objNoritakeDisplay.DesignSelector((intRegisterWidth / 2) + intRegisterLeft, 7, True, False)



        objNoritakeDisplay.WriteString("vel:", NoritakeDisplay.FontSize.Mini, 0, 25)
        objNoritakeDisplay.WriteString("127", NoritakeDisplay.FontSize.Fix5x7, 30, 25)
        objNoritakeDisplay.WriteString(" mt/m", NoritakeDisplay.FontSize.Mini)

        objNoritakeDisplay.WriteString("err:", NoritakeDisplay.FontSize.Mini, 0, 35)
        objNoritakeDisplay.WriteString("1.27", NoritakeDisplay.FontSize.Fix5x7, 24, 35)
        objNoritakeDisplay.WriteString(" avanti", NoritakeDisplay.FontSize.Mini)


        'objNoritakeDisplay.WriteString("speed:", NoritakeDisplay.FontSize.Mini, 63, 30)




        'objNoritakeDisplay.SetOutline(3, 3, 10, 10)

        Dim intBoxHeigth As Integer = 11

        objNoritakeDisplay.SetOutline(0, 64 - intBoxHeigth, 126 / 3, 64)
        objNoritakeDisplay.SetOutline(126 / 3, 64 - intBoxHeigth, 2 * 126 / 3, 64)
        objNoritakeDisplay.SetOutline(2 * 126 / 3, 64 - intBoxHeigth, 126, 64)
    End Sub


    Private Sub Test2()
        Dim intRegisterWidth As Integer = 50
        Dim intRegisterLeft As Integer = 7

        objNoritakeDisplay.DesignLed(2, 0, False)
        objNoritakeDisplay.DesignLed(intRegisterWidth + intRegisterLeft + 4, 0, True)

        objNoritakeDisplay.SetHorizontalLine(3, intRegisterLeft, intRegisterWidth)
        objNoritakeDisplay.SetVerticalLine(intRegisterLeft, 1, 4)
        'objNoritakeDisplay.SetVerticalLine((intRegisterWidth / 4) + intRegisterLeft, 2, 2)
        objNoritakeDisplay.SetVerticalLine((intRegisterWidth / 2) + intRegisterLeft, 1, 4)
        objNoritakeDisplay.SetVerticalLine((intRegisterWidth * 3 / 4) + intRegisterLeft, 2, 2)
        objNoritakeDisplay.SetVerticalLine(intRegisterWidth + intRegisterLeft, 1, 4)

        objNoritakeDisplay.WriteString("R", NoritakeDisplay.FontSize.Mini, -1 + intRegisterLeft, 13)
        objNoritakeDisplay.WriteString("A", NoritakeDisplay.FontSize.Mini, -1 + intRegisterLeft + intRegisterWidth, 13)

        objNoritakeDisplay.DesignSelector((intRegisterWidth / 2) + intRegisterLeft, 7, True, False)



        'Speed
        Dim intX As Integer
        Dim intY As Integer

        intX = intRegisterWidth + intRegisterLeft + 13
        intY = 0
        DrawBox(intX, intY, 56, 16, "velocita:", "mt/m", "127")


        'Error
        intX = intRegisterWidth + intRegisterLeft + 13
        intY = 18
        DrawBox(intX, intY, 56, 16, "errore:", "avanti", "8.42")


        'Modo
        'intX = intRegisterWidth + intRegisterLeft + 13
        'intY = 36
        intX = intRegisterWidth + intRegisterLeft + 13
        intY = 36
        DrawBox(intX, intY, 56, 16, "modo:", "automatico", "")


        'objNoritakeDisplay.SetOutline(intRegisterWidth + intRegisterLeft + 13, 36, 126, 52)
        'objNoritakeDisplay.WriteString("modo:", NoritakeDisplay.FontSize.Mini, intRegisterWidth + intRegisterLeft + 15, 42)
        'objNoritakeDisplay.WriteString("automatico", NoritakeDisplay.FontSize.Mini, intRegisterWidth + intRegisterLeft + 15, 51)
        'objNoritakeDisplay.InvertArea(intRegisterWidth + intRegisterLeft + 14, 37, 124, 42)



        'Oscilloscope
        'objNoritakeDisplay.SetOutline(intRegisterWidth + intRegisterLeft + 13, 18, 126, 35)


        'objNoritakeDisplay.WriteString("speed:", NoritakeDisplay.FontSize.Mini, 63, 30)




        'objNoritakeDisplay.SetOutline(3, 3, 10, 10)

        Dim intBoxHeigth As Integer = 11

        'objNoritakeDisplay.SetOutline(0, 64 - intBoxHeigth, 126 / 3, 64)
        'objNoritakeDisplay.SetOutline(126 / 3, 64 - intBoxHeigth, 2 * 126 / 3, 64)
        'objNoritakeDisplay.SetOutline(2 * 126 / 3, 64 - intBoxHeigth, 126, 64)
    End Sub


    Private Sub TestOscilloscope()
        Dim intRegisterWidth As Integer = 50
        Dim intRegisterLeft As Integer = 7
        Dim intOscilloscopeResolution As Integer = 120
        Dim arintScanningHead(intOscilloscopeResolution) As Integer
        Dim arblnGate(intOscilloscopeResolution) As Boolean
        Dim dblRegister As Double
        Dim I As Integer
        Dim objRandom As Random
        objRandom = New Random

        For I = 0 To intOscilloscopeResolution
            If I = 0 Then
                arintScanningHead(I) = objRandom.Next(0, 7)
            Else
                arintScanningHead(I) = Math.Max(Math.Min(arintScanningHead(I - 1) + objRandom.Next(-1, 2), 7), 0)
            End If
            arblnGate(I) = (I < 10 Or I > 85)
        Next

        dblRegister = objRandom.Next(-100, 100) / 100

        'Modo
        DrawBox(0, 0, 62, 16, "modo:", "automatico", "")

        'Speed
        DrawBox(64, 0, 62, 16, "velocita:", "mt/min", "127")


        'Error
        If dblRegister = 0 Then
            DrawBox(0, 18, 62, 16, "errore:", "", "0.00")
        ElseIf dblRegister > 0 Then
            DrawBox(0, 18, 62, 16, "errore:", "avanti", dblRegister.ToString("0.00"))
        ElseIf dblRegister < 0 Then
            DrawBox(0, 18, 62, 16, "errore:", "ritardo", Math.Abs(dblRegister).ToString("0.00"))
        End If

        'Register
        DrawRegister(64, 18, 62, 16, dblRegister, CorrectionDirection.Minus, False)
        DrawOscilloscope(0, 36, 126, 64 - 36, arintScanningHead, arblnGate)



        'DrawRegister(0, 36, 126, 64 - 36, dblRegister, CorrectionDirection.Minus)

        'DrawRegister(0, 18, 126, 38, dblRegister, CorrectionDirection.Minus)
        'objNoritakeDisplay.WriteString("ritardo 1.27", NoritakeDisplay.FontSize.Fix5x7, 30, 60)
        'objNoritakeDisplay.WriteString("ritardo", NoritakeDisplay.FontSize.Mini, 30, 60)

        'DrawRegister(0, 36, 62, 16, -0.26, CorrectionDirection.Plus)

        'DrawRegister(64, 36, 62, 16, 1.2, CorrectionDirection.None)

        'DrawOscilloscope(0, 36, 126, 64 - 36, arintScanningHead, arblnGate)


        'DrawRegister(0, 36, 126, 64 - 36, dblRegister, CorrectionDirection.Minus)


        Dim intBoxHeigth As Integer = 11

        'objNoritakeDisplay.SetOutline(0, 64 - intBoxHeigth, 126 / 3, 64)
        'objNoritakeDisplay.SetOutline(126 / 3, 64 - intBoxHeigth, 2 * 126 / 3, 64)
        'objNoritakeDisplay.SetOutline(2 * 126 / 3, 64 - intBoxHeigth, 126, 64)
    End Sub

    Private Sub TestRegister()
        Dim intRegisterWidth As Integer = 50
        Dim intRegisterLeft As Integer = 7
        Dim intOscilloscopeResolution As Integer = 120
        Dim arintScanningHead(intOscilloscopeResolution) As Integer
        Dim arblnGate(intOscilloscopeResolution) As Boolean
        Dim dblRegister As Double
        Dim I As Integer
        Dim objRandom As Random
        objRandom = New Random

        For I = 0 To intOscilloscopeResolution
            If I = 0 Then
                arintScanningHead(I) = objRandom.Next(0, 7)
            Else
                'arintScanningHead(I) = arintScanningHead(I - 1) + objRandom.Next(-1, 2)
                arintScanningHead(I) = Math.Max(Math.Min(arintScanningHead(I - 1) + objRandom.Next(-1, 2), 7), 0)
            End If
            arblnGate(I) = (I < 10 Or I > 85)
        Next

        dblRegister = objRandom.Next(-100, 100) / 100

        'Modo
        DrawBox(0, 0, 62, 16, "modo:", "automatico", "")

        'Speed
        DrawBox(64, 0, 62, 16, "velocita:", "mt/min", "127")
        DrawRegister(0, 18, 126, 64 - 18, dblRegister, IIf(dblRegister > 0, CorrectionDirection.Plus, CorrectionDirection.Minus), True)
        objNoritakeDisplay.WriteString(IIf(dblRegister > 0, "+", "-") & Math.Abs(dblRegister).ToString("0.00"), NoritakeDisplay.FontSize.Fix5x7, 42, 57)
    End Sub

    Public Enum Funtionality
        Parameter
        [Function]
        Test
        Setup
    End Enum


    Private Sub Confirm()
        objNoritakeDisplay.ClearArea(20, 15, 126 - 20, 64 - 15)
        objNoritakeDisplay.SetOutline(22, 17, 126 - 22, 64 - 17)
        objNoritakeDisplay.WriteString("Salvare il", NoritakeDisplay.FontSize.Mini, 35, 30)
        objNoritakeDisplay.WriteString("nuovo valore?", NoritakeDisplay.FontSize.Mini, 35, 38)

    End Sub

    Private Sub TestFunctions(ByVal _enmFuntionality As Funtionality, ByVal _intSelected As Integer, Optional ByVal _intOffset As Integer = 0, Optional ByVal _blnEdit As Boolean = False)

        Select Case _enmFuntionality
            Case Funtionality.Parameter
                objNoritakeDisplay.WriteString("1", NoritakeDisplay.FontSize.Fix10x14, 2, 17)
                objNoritakeDisplay.WriteString("2", NoritakeDisplay.FontSize.Fix10x14, 2, 39)
                objNoritakeDisplay.WriteString("3", NoritakeDisplay.FontSize.Fix10x14, 2, 61)

                objNoritakeDisplay.WriteString("Sviluppo", NoritakeDisplay.FontSize.Fix5x7, 20, 9)
                objNoritakeDisplay.WriteString("cilindro", NoritakeDisplay.FontSize.Fix5x7, 20, 18)
                objNoritakeDisplay.WriteString("Soglia", NoritakeDisplay.FontSize.Fix5x7, 20, 31)
                objNoritakeDisplay.WriteString("d'allarme", NoritakeDisplay.FontSize.Fix5x7, 20, 40)
                objNoritakeDisplay.WriteString("Ampiezza", NoritakeDisplay.FontSize.Fix5x7, 20, 53)
                objNoritakeDisplay.WriteString("Gate", NoritakeDisplay.FontSize.Fix5x7, 20, 61)

                objNoritakeDisplay.SetOutline(0, 0, 126, 20, (_intSelected = 1))
                objNoritakeDisplay.SetOutline(0, 22, 126, 42, (_intSelected = 2))
                objNoritakeDisplay.SetOutline(0, 44, 126, 64, (_intSelected = 3))

            Case Funtionality.Function
                objNoritakeDisplay.WriteString("4", NoritakeDisplay.FontSize.Fix10x14, 2, 17)
                objNoritakeDisplay.WriteString("5", NoritakeDisplay.FontSize.Fix10x14, 2, 39)
                objNoritakeDisplay.WriteString("6", NoritakeDisplay.FontSize.Fix10x14, 2, 61)

                objNoritakeDisplay.WriteString("Fasatura", NoritakeDisplay.FontSize.Fix5x7, 20, 9)
                objNoritakeDisplay.WriteString("automatica", NoritakeDisplay.FontSize.Fix5x7, 20, 18)
                objNoritakeDisplay.WriteString("Fasatura", NoritakeDisplay.FontSize.Fix5x7, 20, 31)
                objNoritakeDisplay.WriteString("con oscilloscopio", NoritakeDisplay.FontSize.Fix5x7, 20, 40)
                objNoritakeDisplay.WriteString("Fasatura a", NoritakeDisplay.FontSize.Fix5x7, 20, 53)
                objNoritakeDisplay.WriteString("correzione rapida", NoritakeDisplay.FontSize.Fix5x7, 20, 61)


                objNoritakeDisplay.SetOutline(0, 0, 126, 20, (_intSelected = 4))
                objNoritakeDisplay.SetOutline(0, 22, 126, 42, (_intSelected = 5))
                objNoritakeDisplay.SetOutline(0, 44, 126, 64, (_intSelected = 6))
            Case Funtionality.Test
                objNoritakeDisplay.WriteString("1", NoritakeDisplay.FontSize.Fix10x14, 2, 17)
                objNoritakeDisplay.WriteString("2", NoritakeDisplay.FontSize.Fix10x14, 2, 39)
                objNoritakeDisplay.WriteString("3", NoritakeDisplay.FontSize.Fix10x14, 2, 61)
                objNoritakeDisplay.WriteString("4", NoritakeDisplay.FontSize.Fix10x14, 67, 17)
                objNoritakeDisplay.WriteString("5", NoritakeDisplay.FontSize.Fix10x14, 67, 39)
                objNoritakeDisplay.WriteString("6", NoritakeDisplay.FontSize.Fix10x14, 67, 61)

                objNoritakeDisplay.WriteString("Test", NoritakeDisplay.FontSize.Mini, 16, 9)
                objNoritakeDisplay.WriteString("testina", NoritakeDisplay.FontSize.Mini, 16, 18)
                objNoritakeDisplay.WriteString("Test", NoritakeDisplay.FontSize.Mini, 16, 31)
                objNoritakeDisplay.WriteString("encoder", NoritakeDisplay.FontSize.Mini, 16, 40)
                objNoritakeDisplay.WriteString("Intervallo", NoritakeDisplay.FontSize.Mini, 16, 52)
                objNoritakeDisplay.WriteString("offset", NoritakeDisplay.FontSize.Mini, 16, 61)

                objNoritakeDisplay.WriteString("Versione", NoritakeDisplay.FontSize.Mini, 81, 9)
                objNoritakeDisplay.WriteString("Software", NoritakeDisplay.FontSize.Mini, 81, 18)
                objNoritakeDisplay.WriteString("", NoritakeDisplay.FontSize.Mini, 81, 31)
                objNoritakeDisplay.WriteString("", NoritakeDisplay.FontSize.Mini, 81, 40)
                objNoritakeDisplay.WriteString("", NoritakeDisplay.FontSize.Mini, 81, 52)
                objNoritakeDisplay.WriteString("", NoritakeDisplay.FontSize.Mini, 81, 61)





                objNoritakeDisplay.SetOutline(0, 0, 63, 20, (_intSelected = 1))
                objNoritakeDisplay.SetOutline(0, 22, 63, 42, (_intSelected = 2))
                objNoritakeDisplay.SetOutline(0, 44, 63, 64, (_intSelected = 3))
                objNoritakeDisplay.SetOutline(65, 0, 126, 20, (_intSelected = 4))
                objNoritakeDisplay.SetOutline(65, 22, 126, 42, (_intSelected = 5))
                objNoritakeDisplay.SetOutline(65, 44, 126, 64, (_intSelected = 6))
            Case Funtionality.Setup
                'objNoritakeDisplay.WriteString("1", NoritakeDisplay.FontSize.Fix10x14, 2, 17)
                'objNoritakeDisplay.WriteString("2", NoritakeDisplay.FontSize.Fix10x14, 2, 39)
                'objNoritakeDisplay.WriteString("3", NoritakeDisplay.FontSize.Fix10x14, 2, 61)
                'objNoritakeDisplay.WriteString("4", NoritakeDisplay.FontSize.Fix10x14, 67, 17)
                'objNoritakeDisplay.WriteString("5", NoritakeDisplay.FontSize.Fix10x14, 67, 39)
                'objNoritakeDisplay.WriteString("6", NoritakeDisplay.FontSize.Fix10x14, 67, 61)

                'objNoritakeDisplay.WriteString("Trip", NoritakeDisplay.FontSize.Mini, 16, 9)
                ''objNoritakeDisplay.WriteString("testina", NoritakeDisplay.FontSize.Mini, 16, 18)
                'objNoritakeDisplay.WriteString("Guadagno", NoritakeDisplay.FontSize.Mini, 16, 31)
                'objNoritakeDisplay.WriteString("longit.", NoritakeDisplay.FontSize.Mini, 16, 40)
                'objNoritakeDisplay.WriteString("Ciclico", NoritakeDisplay.FontSize.Mini, 16, 52)
                'objNoritakeDisplay.WriteString("longit.", NoritakeDisplay.FontSize.Mini, 16, 61)

                'objNoritakeDisplay.WriteString("Zona morta", NoritakeDisplay.FontSize.Mini, 81, 9)
                ''objNoritakeDisplay.WriteString("longit.", NoritakeDisplay.FontSize.Mini, 81, 18)
                'objNoritakeDisplay.WriteString("Guadagno", NoritakeDisplay.FontSize.Mini, 81, 31)
                'objNoritakeDisplay.WriteString("longit.", NoritakeDisplay.FontSize.Mini, 81, 40)
                'objNoritakeDisplay.WriteString("Ciclico", NoritakeDisplay.FontSize.Mini, 81, 52)
                'objNoritakeDisplay.WriteString("longit.", NoritakeDisplay.FontSize.Mini, 81, 61)


                'objNoritakeDisplay.SetOutline(0, 0, 63, 20, (_intSelected = 1))
                'objNoritakeDisplay.SetOutline(0, 22, 63, 42, (_intSelected = 2))
                'objNoritakeDisplay.SetOutline(0, 44, 63, 64, (_intSelected = 3))
                'objNoritakeDisplay.SetOutline(65, 0, 126, 20, (_intSelected = 4))
                'objNoritakeDisplay.SetOutline(65, 22, 126, 42, (_intSelected = 5))
                'objNoritakeDisplay.SetOutline(65, 44, 126, 64, (_intSelected = 6))
                Dim intIndex As Integer
                Dim intProgressive As Integer
                Dim objParameter As Parameter
                Dim intOffset As Integer
                Dim I As Integer
                intProgressive = 0
                intOffset = Math.Max(0, _intOffset)



                For I = 0 To Math.Min(7, ((m_arintParameters.Count - 1) - intOffset))
                    intIndex = m_arintParameters(intOffset + I)

                    objParameter = m_arobjParameters(intIndex)

                    objNoritakeDisplay.ClearArea(0, (intProgressive * 8), 126, 7 + (intProgressive * 8))

                    'objNoritakeDisplay.SetHorizontalLine(5 + (intProgressive * 8), 20, 80)
                    objNoritakeDisplay.WriteString(objParameter.Index.ToString.PadLeft(2), NoritakeDisplay.FontSize.Mini, 0, 6 + (intProgressive * 8))
                    objNoritakeDisplay.WriteString("-" & objParameter.Label, NoritakeDisplay.FontSize.Mini, 9, 6 + (intProgressive * 8))
                    objNoritakeDisplay.WriteString(objParameter.Value.ToString, NoritakeDisplay.FontSize.Mini, 105, 6 + (intProgressive * 8))

                    If objParameter.Index = _intSelected Then
                        If _blnEdit Then
                            objNoritakeDisplay.InvertArea(100, (intProgressive * 8), 120, 6 + (intProgressive * 8))
                            'objNoritakeDisplay.SetOutline(100, (intProgressive * 8), 120, 6 + (intProgressive * 8))
                        Else
                            objNoritakeDisplay.InvertArea(0, (intProgressive * 8), 126, 6 + (intProgressive * 8))
                            'objNoritakeDisplay.SetOutline(0, (intProgressive * 8), 126, 6 + (intProgressive * 8))
                        End If
                    End If
                    intProgressive += 1

                Next

                'For Each intIndex In m_arintParameters
                '    objParameter = m_arobjParameters(intIndex)

                '    objNoritakeDisplay.WriteString(objParameter.Index.ToString.PadLeft(2) & ")", NoritakeDisplay.FontSize.Fix5x7, 0, 10 + (intProgressive * 8))
                '    intProgressive += 1
                'Next
        End Select


    End Sub


    Public Enum CorrectionDirection
        None = 0
        Minus = -1
        Plus = +1
    End Enum

    Private Sub DrawRegister(ByVal _intLeft As Integer, ByVal _intTop As Integer, ByVal _intWidth As Integer, ByVal _intHeigth As Integer, ByVal _dblPercent As Double, ByVal _enmCorrectionDirection As CorrectionDirection, ByVal _blnBig As Boolean)
        Dim intRight As Integer
        Dim intRulerTop As Integer

        If _dblPercent > 1 Then
            _dblPercent = 1
        ElseIf _dblPercent < -1 Then
            _dblPercent = -1
        End If

        If _intWidth < 0 Then
            Throw New Exception("Width cannot be negative")
        End If

        If _intLeft < 0 Then
            Throw New Exception("Left cannot be negative")
        End If

        If _intTop < 0 Then
            Throw New Exception("Top cannot be negative")
        End If

        If _intHeigth < 0 Then
            Throw New Exception("Heigth cannot be negative")
        End If

        intRight = _intLeft + _intWidth


        If _blnBig Then
            intRulerTop = _intTop + 22

            'Draw Box and selector
            objNoritakeDisplay.ClearArea(_intLeft, _intTop, intRight, _intTop + _intHeigth)
            objNoritakeDisplay.SetOutline(_intLeft, _intTop, intRight, _intTop + _intHeigth)

            'Label
            Threading.Thread.Sleep(2)
            objNoritakeDisplay.WriteString("errore:", NoritakeDisplay.FontSize.Mini, _intLeft + 2, _intTop + 6)
            objNoritakeDisplay.InvertArea(_intLeft + 1, _intTop + 1, intRight - 2, _intTop + 6)
            Threading.Thread.Sleep(4)

            'Draw Ruler
            objNoritakeDisplay.SetHorizontalLine(intRulerTop + 1, _intLeft + 6, _intWidth - 13)

            'Ruler labels
            objNoritakeDisplay.WriteString("-", NoritakeDisplay.FontSize.Mini, _intLeft + 4, intRulerTop - 3)
            objNoritakeDisplay.WriteString("+", NoritakeDisplay.FontSize.Mini, _intLeft + 4 + (_intWidth - 11), intRulerTop - 3)
            objNoritakeDisplay.WriteString("0", NoritakeDisplay.FontSize.Mini, _intLeft + 3 + CInt((_intWidth - 11) / 2), intRulerTop - 3)

            '-1
            objNoritakeDisplay.SetVerticalLine(_intLeft + 5, intRulerTop - 1, 4)
            '0
            objNoritakeDisplay.SetVerticalLine(_intLeft + 5 + (_intWidth - 11) / 2, intRulerTop - 1, 4)
            '+1
            objNoritakeDisplay.SetVerticalLine(_intLeft + 5 + (_intWidth - 11), intRulerTop - 1, 4)
            '-0.5
            objNoritakeDisplay.SetVerticalLine(_intLeft + 5 + (_intWidth - 11) / 4, intRulerTop + 2, 1)
            '+0.5
            objNoritakeDisplay.SetVerticalLine(_intLeft + 5 + (_intWidth - 11) * 3 / 4, intRulerTop + 2, 1)

            Select Case _enmCorrectionDirection
                Case CorrectionDirection.Minus
                    objNoritakeDisplay.SetCursorPosition(_intLeft + 2, intRulerTop + 7)
                    objNoritakeDisplay.DesignGraphic(&H0, &H3C, &H42, &H2, &H72, &H62, &H5C, &H0)
                Case CorrectionDirection.Plus
                    objNoritakeDisplay.SetCursorPosition(_intLeft + _intWidth - 10, intRulerTop + 7)
                    objNoritakeDisplay.DesignGraphic(&H0, &H3C, &H42, &H40, &H4E, &H46, &H3A, &H0)
            End Select

            'Selector
            objNoritakeDisplay.DesignSelector(_intLeft + 5 + ((_intWidth - 11) / 2 * (_dblPercent + 1)), intRulerTop - 11, _dblPercent <> 0, True)

        Else
            intRulerTop = _intTop + 4

            'Draw Box and selector
            objNoritakeDisplay.ClearArea(_intLeft, _intTop, intRight, _intTop + _intHeigth)
            objNoritakeDisplay.SetOutline(_intLeft, _intTop, intRight, _intTop + _intHeigth)

            objNoritakeDisplay.DesignSelector(_intLeft + 5 + ((_intWidth - 11) / 2 * (_dblPercent + 1)), _intTop + 8, _dblPercent <> 0, False)
            'Draw Ruler
            objNoritakeDisplay.SetHorizontalLine(intRulerTop + 1, _intLeft + 6, _intWidth - 13)

            '-1
            objNoritakeDisplay.SetVerticalLine(_intLeft + 5, intRulerTop - 1, 4)
            '0
            objNoritakeDisplay.SetVerticalLine(_intLeft + 5 + (_intWidth - 11) / 2, intRulerTop - 1, 4)
            '+1
            objNoritakeDisplay.SetVerticalLine(_intLeft + 5 + (_intWidth - 11), intRulerTop - 1, 4)
            '-0.5
            objNoritakeDisplay.SetVerticalLine(_intLeft + 5 + (_intWidth - 11) / 4, intRulerTop + 2, 1)
            '+0.5
            objNoritakeDisplay.SetVerticalLine(_intLeft + 5 + (_intWidth - 11) * 3 / 4, intRulerTop + 2, 1)

            'Draw Correction Leds
            Select Case _enmCorrectionDirection
                Case CorrectionDirection.Minus
                    objNoritakeDisplay.SetArea(_intLeft + 2, intRulerTop, _intLeft + 3, intRulerTop + 2)
                Case CorrectionDirection.Plus
                    objNoritakeDisplay.SetArea(_intLeft + _intWidth - 4, intRulerTop, _intLeft + _intWidth - 3, intRulerTop + 2)
            End Select
        End If

    End Sub

    Private Sub DrawBox(ByVal _intLeft As Integer, ByVal _intTop As Integer, ByVal _intWidth As Integer, ByVal _intHeigth As Integer, ByVal _strLabel As String, ByVal _strLabel2 As String, ByVal _strValue As String)
        Dim intRight As Integer

        intRight = _intLeft + _intWidth

        objNoritakeDisplay.ClearArea(_intLeft, _intTop, intRight + 1, _intTop + _intHeigth + 1)
        objNoritakeDisplay.SetOutline(_intLeft, _intTop, intRight, _intTop + _intHeigth)
        If _strLabel.Length > 0 Then
            objNoritakeDisplay.WriteString(_strLabel, NoritakeDisplay.FontSize.Mini, _intLeft + 2, _intTop + 6)

            If intRight = 126 Then 'workaround
                objNoritakeDisplay.InvertArea(_intLeft + 1, _intTop + 1, intRight - 2, _intTop + 6)
            Else
                objNoritakeDisplay.InvertArea(_intLeft + 1, _intTop + 1, intRight - 1, _intTop + 6)
            End If
        End If

        If _strLabel2.Length > 0 Then
            objNoritakeDisplay.WriteString(_strLabel2, NoritakeDisplay.FontSize.Mini, _intLeft + 2, _intTop + _intHeigth - 2)
        End If

        If _strValue.Length > 0 Then
            objNoritakeDisplay.WriteString(_strValue, NoritakeDisplay.FontSize.Fix5x7, intRight - (_strValue.Length * 6) - 1, _intTop + _intHeigth - 1)
        End If

    End Sub

    Private Sub DrawOscilloscope(ByVal _intLeft As Integer, ByVal _intTop As Integer, ByVal _intWidth As Integer, ByVal _intHeigth As Integer, ByVal _arintScanningHead() As Integer, ByVal _arblnGate() As Boolean)
        Dim intRight As Integer
        Dim intTopGate As Integer
        Dim intTopScanningHead As Integer

        Dim I As Integer

        intRight = _intLeft + _intWidth
        intTopGate = _intTop + 4
        intTopScanningHead = _intTop + _intHeigth - 4


        objNoritakeDisplay.ClearArea(_intLeft, _intTop, intRight, _intTop + _intHeigth)
        objNoritakeDisplay.SetOutline(_intLeft, _intTop, intRight, _intTop + _intHeigth)

        For I = 0 To _arintScanningHead.Length - 1
            If _arblnGate(I) Then
                objNoritakeDisplay.SetPixel(_intLeft + 2 + I, intTopGate)
            Else
                objNoritakeDisplay.SetPixel(_intLeft + 2 + I, intTopGate + 4)
            End If

            objNoritakeDisplay.SetPixel(_intLeft + 2 + I, intTopScanningHead - _arintScanningHead(I))
            Threading.Thread.Sleep(New TimeSpan(15000))
        Next

    End Sub

    Private Sub frmNoritakeDisplay_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.cmbComPort.SelectedIndex = My.Settings.COMPort - 1
        InitializeParameters()
        'cmdTest_Click(Nothing, Nothing)
        'Me.Close()
    End Sub









    Private Sub cmdTestRegister_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTestRegister.Click
        Dim I As Integer
        Try
            objToolStripStatusLabel.Text = "Connecting"
            picOn.Visible = True
            picOn.Refresh()
            objNoritakeDisplay.Connect(Me.cmbComPort.SelectedIndex + 1)
            objToolStripStatusLabel.Text = "Reset"
            objNoritakeDisplay.Reset()
            objToolStripStatusLabel.Text = "Home"
            objNoritakeDisplay.Home()

            TestRegister()

            objToolStripStatusLabel.Text = "Disconnecting"
            objNoritakeDisplay.Disconnect()


            picOn.Visible = False
            picOff.Refresh()
            objToolStripStatusLabel.Text = ""
        Catch ex As Exception
            MessageBox.Show("Error on communication" & Environment.NewLine & ex.Message, "Taj 200", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub cmdTestOscilloscope_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTestOscilloscope.Click
        Dim I As Integer
        Try
            objToolStripStatusLabel.Text = "Connecting"
            picOn.Visible = True
            picOn.Refresh()
            objNoritakeDisplay.Connect(Me.cmbComPort.SelectedIndex + 1)
            objToolStripStatusLabel.Text = "Reset"
            objNoritakeDisplay.Reset()
            objToolStripStatusLabel.Text = "Home"
            objNoritakeDisplay.Home()

            TestOscilloscope()


            objToolStripStatusLabel.Text = "Disconnecting"
            objNoritakeDisplay.Disconnect()


            picOn.Visible = False
            picOff.Refresh()
            objToolStripStatusLabel.Text = ""
        Catch ex As Exception
            MessageBox.Show("Error on communication" & Environment.NewLine & ex.Message, "Taj 200", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub cmdTestFunctions_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTestFunctions.Click
        Dim I As Integer
        Try
            objToolStripStatusLabel.Text = "Connecting"
            picOn.Visible = True
            picOn.Refresh()
            objNoritakeDisplay.Connect(Me.cmbComPort.SelectedIndex + 1)
            objToolStripStatusLabel.Text = "Reset"
            objNoritakeDisplay.Reset()
            objToolStripStatusLabel.Text = "Home"
            objNoritakeDisplay.Home()

            For I = 4 To 6
                objNoritakeDisplay.Reset()
                TestFunctions(Funtionality.Function, I)
                Threading.Thread.Sleep(500)
            Next


            objToolStripStatusLabel.Text = "Disconnecting"
            objNoritakeDisplay.Disconnect()


            picOn.Visible = False
            picOff.Refresh()
            objToolStripStatusLabel.Text = ""
        Catch ex As Exception
            MessageBox.Show("Error on communication" & Environment.NewLine & ex.Message, "Taj 200", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub cmdTestTest_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTestTest.Click
        Dim I As Integer
        Try
            objToolStripStatusLabel.Text = "Connecting"
            picOn.Visible = True
            picOn.Refresh()
            objNoritakeDisplay.Connect(Me.cmbComPort.SelectedIndex + 1)
            objToolStripStatusLabel.Text = "Reset"
            objNoritakeDisplay.Reset()
            objToolStripStatusLabel.Text = "Home"
            objNoritakeDisplay.Home()

      
            For I = 1 To 4
                objNoritakeDisplay.Reset()
                TestFunctions(Funtionality.Test, I)
                Threading.Thread.Sleep(500)
            Next

            objToolStripStatusLabel.Text = "Disconnecting"
            objNoritakeDisplay.Disconnect()


            picOn.Visible = False
            picOff.Refresh()
            objToolStripStatusLabel.Text = ""
        Catch ex As Exception
            MessageBox.Show("Error on communication" & Environment.NewLine & ex.Message, "Taj 200", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub cmdTestParameters_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTestParameters.Click
        Dim I As Integer
        Try
            objToolStripStatusLabel.Text = "Connecting"
            picOn.Visible = True
            picOn.Refresh()
            objNoritakeDisplay.Connect(Me.cmbComPort.SelectedIndex + 1)
            objToolStripStatusLabel.Text = "Reset"
            objNoritakeDisplay.Reset()
            objToolStripStatusLabel.Text = "Home"
            objNoritakeDisplay.Home()

            For I = 1 To 3
                objNoritakeDisplay.Reset()
                TestFunctions(Funtionality.Parameter, I)
                Threading.Thread.Sleep(500)
            Next

            objToolStripStatusLabel.Text = "Disconnecting"
            objNoritakeDisplay.Disconnect()


            picOn.Visible = False
            picOff.Refresh()
            objToolStripStatusLabel.Text = ""
        Catch ex As Exception
            MessageBox.Show("Error on communication" & Environment.NewLine & ex.Message, "Taj 200", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub cmdTestSetUp_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTestSetUp.Click
        Dim I As Integer
        Try
            objToolStripStatusLabel.Text = "Connecting"
            picOn.Visible = True
            picOn.Refresh()
            objNoritakeDisplay.Connect(Me.cmbComPort.SelectedIndex + 1)
            objToolStripStatusLabel.Text = "Reset"
            objNoritakeDisplay.Reset()
            objToolStripStatusLabel.Text = "Home"
            objNoritakeDisplay.Home()


            For I = 3 To 12
                TestFunctions(Funtionality.Setup, I, I - 7)
                Threading.Thread.Sleep(10)
            Next
            I = I - 1
            Threading.Thread.Sleep(1000)
            TestFunctions(Funtionality.Setup, I, I - 7, True)
            CType(m_arobjParameters(I), Parameter).Value = 101
            Threading.Thread.Sleep(1000)
            TestFunctions(Funtionality.Setup, I, I - 7, True)
            Threading.Thread.Sleep(1000)
            Confirm()
            Threading.Thread.Sleep(1000)
            TestFunctions(Funtionality.Setup, I, I - 7)



            objToolStripStatusLabel.Text = "Disconnecting"
            objNoritakeDisplay.Disconnect()


            picOn.Visible = False
            picOff.Refresh()
            objToolStripStatusLabel.Text = ""
        Catch ex As Exception
            MessageBox.Show("Error on communication" & Environment.NewLine & ex.Message, "Taj 200", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub cmdTestOther_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTestOther.Click
        Dim I As Integer
        Try
            objToolStripStatusLabel.Text = "Connecting"
            picOn.Visible = True
            picOn.Refresh()
            objNoritakeDisplay.Connect(Me.cmbComPort.SelectedIndex + 1)
            objToolStripStatusLabel.Text = "Reset"
            objNoritakeDisplay.Reset()
            objToolStripStatusLabel.Text = "Home"
            objNoritakeDisplay.Home()







            objToolStripStatusLabel.Text = "Disconnecting"
            objNoritakeDisplay.Disconnect()


            picOn.Visible = False
            picOff.Refresh()
            objToolStripStatusLabel.Text = ""
        Catch ex As Exception
            MessageBox.Show("Error on communication" & Environment.NewLine & ex.Message, "Taj 200", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub cmdTest_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTest.Click
        Dim I As Integer
        Try
            objToolStripStatusLabel.Text = "Connecting"
            picOn.Visible = True
            picOn.Refresh()
            objNoritakeDisplay.Connect(Me.cmbComPort.SelectedIndex + 1)
            objToolStripStatusLabel.Text = "Reset"
            objNoritakeDisplay.Reset()
            objToolStripStatusLabel.Text = "Home"
            objNoritakeDisplay.Home()



            objToolStripStatusLabel.Text = "Disconnecting"
            objNoritakeDisplay.Disconnect()


            picOn.Visible = False
            picOff.Refresh()
            objToolStripStatusLabel.Text = ""
        Catch ex As Exception
            MessageBox.Show("Error on communication" & Environment.NewLine & ex.Message, "Taj 200", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

    End Sub

End Class