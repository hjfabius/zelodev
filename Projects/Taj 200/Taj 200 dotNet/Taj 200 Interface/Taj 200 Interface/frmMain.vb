Imports System.Threading.Thread

Public Class frmMain

    Protected Shared m_arRxBytes(3) As Byte
    Protected Shared m_arTxBytes(3) As Byte
    Protected Shared m_blnRxError As Boolean

    Delegate Sub SetTextCallback(ByVal _strValue As String)
    Delegate Sub SubBytesReceived()
    Delegate Sub SubLedRx()

    Private Sub LedRx()
        picRxWarning.Visible = m_blnRxError
        picRxOn.Visible = Not m_blnRxError
        Me.Refresh()
        Threading.Thread.Sleep(300)
        picRxOn.Visible = False
        picRxWarning.Visible = False
    End Sub

    Private Sub LedTx()
        picTxOn.Visible = True
        Me.Refresh()
        Threading.Thread.Sleep(300)
        picTxOn.Visible = False
    End Sub

    Private Sub BytesReceived()
        cmbB0.SelectedIndex = m_arRxBytes(0)
        cmbB1.SelectedIndex = m_arRxBytes(1)
        cmbB2.SelectedIndex = m_arRxBytes(2)
        cmbB3.SelectedIndex = m_arRxBytes(3)
    End Sub

    Private Sub frmMain_Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Disposed
        If objSerialPort.IsOpen Then
            Me.Disconnect()
        End If
    End Sub


    Private Sub frmMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Init()
    End Sub

    Private Sub Init()
        Dim i As Integer
        Dim strValue As String

        Me.cmbComPort.SelectedIndex = My.Settings.COMPort - 1
        Me.cmbComSpeed.Text = My.Settings.COMSpeed

        cmbParameterName.Items.Clear()
        cmbParameterName.Items.Add("Sviluppo Cilindro")
        cmbParameterName.Items.Add("Allarme")
        cmbParameterName.Items.Add("Ampiezza Gate in MC")
        cmbParameterName.Items.Add("Posizione Segno in MM")
        cmbParameterName.Items.Add("Trip (Variazione di Velocità)")
        cmbParameterName.Items.Add("Guadagno Longitudinale")
        cmbParameterName.Items.Add("Guadagno Trasversale")
        cmbParameterName.Items.Add("Ciclico Longitudinale")
        cmbParameterName.Items.Add("Ciclico Trasversale")
        cmbParameterName.Items.Add("Zona Morta Longitudinale")
        cmbParameterName.Items.Add("Zona Morta Trasversale")
        cmbParameterName.Items.Add("Velocità Correzione Motore Longitudinale")
        cmbParameterName.Items.Add("Velocità Correzione Motore Trasversale")
        cmbParameterName.Items.Add("Correzione Longitudinale")
        cmbParameterName.Items.Add("Correzione Trasversale")
        cmbParameterName.Items.Add("Salto")
        cmbParameterName.Items.Add("Derivativo")
        cmbParameterName.Items.Add("Inserzione")
        cmbParameterName.Items.Add("Lingua")
        cmbParameterName.Items.Add("Segno di riferimento")
        cmbParameterName.Items.Add("Diagonale Lato Operatore/Trasmissione")
        cmbParameterName.Items.Add("Messa a registro Auto dopo Fasatura Automatica")
        cmbParameterName.Items.Add("Correzione Normale/Inversa")
        cmbParameterName.Items.Add("Lavora in MC/MM")
        cmbParameterName.Items.Add("Versione Programma")
        cmbParameterName.Items.Add("ID Macchina")
        cmbParameterName.Items.Add("Valore Errore Long")
        cmbParameterName.Items.Add("Valore Errore Trav")
        cmbParameterName.Items.Add("Stato Led")
        cmbParameterName.Items.Add("Abilita DAC per uscita Errore Longitudinale ")
        cmbParameterName.Items.Add("Abilita DAC per uscita Errore Trasversale")
        cmbParameterName.Items.Add("Abilita DAC per insetter")




        cmbB0.Items.Clear()
        cmbB1.Items.Clear()
        cmbB2.Items.Clear()
        cmbB3.Items.Clear()
        cmbB4.Items.Clear()
        cmbB5.Items.Clear()
        cmbB6.Items.Clear()
        cmbB7.Items.Clear()

        For i = 0 To 255
            strValue = Conversion.Hex(i)
            strValue = strValue.PadLeft(2, "0"c)
            cmbB0.Items.Add(strValue)
            cmbB1.Items.Add(strValue)
            cmbB2.Items.Add(strValue)
            cmbB3.Items.Add(strValue)
            cmbB4.Items.Add(strValue)
            cmbB5.Items.Add(strValue)
            cmbB6.Items.Add(strValue)
            cmbB7.Items.Add(strValue)
        Next

        Me.cmbB0.SelectedIndex = My.Settings.B0
        Me.cmbB1.SelectedIndex = My.Settings.B1
        Me.cmbB2.SelectedIndex = My.Settings.B2
        Me.cmbB3.SelectedIndex = My.Settings.B3
        Me.cmbB4.SelectedIndex = My.Settings.B4
        Me.cmbB5.SelectedIndex = My.Settings.B5
        Me.cmbB6.SelectedIndex = My.Settings.B6
        Me.cmbB7.SelectedIndex = My.Settings.B7

    End Sub

    Private Sub cmbComPort_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbComPort.SelectedIndexChanged
        My.Settings.COMPort = Me.cmbComPort.SelectedIndex + 1
    End Sub


    Private Sub cmbComSpeed_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbComSpeed.SelectedIndexChanged
        My.Settings.COMSpeed = CInt(Me.cmbComSpeed.Text)
    End Sub

    Private Sub UpdateSettings()
        objSerialPort.PortName = Me.cmbComPort.Text
        objSerialPort.BaudRate = My.Settings.COMSpeed + 50
        objSerialPort.ReceivedBytesThreshold = 4
    End Sub

    Private Sub Connect()
        Try
            UpdateSettings()
            objSerialPort.Open()
            AddHandler objSerialPort.DataReceived, AddressOf objSerialPort_DataReceived
            Me.cmbComPort.Enabled = False
            Me.cmbComSpeed.Enabled = False
            Me.cmdConnect.Text = "Disconnect"

            UpdateSendStatus()
            Me.cmbB4.Enabled = True
            Me.cmbB5.Enabled = True
            Me.cmbB6.Enabled = True
            Me.cmbB7.Enabled = True
        Catch ex As Exception
            MessageBox.Show("Error opening connection" & Environment.NewLine & ex.Message, "Taj 200", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub Disconnect()
        Try
            objSerialPort.DiscardInBuffer()
            objSerialPort.Close()
            RemoveHandler objSerialPort.DataReceived, AddressOf objSerialPort_DataReceived

            Me.cmbComPort.Enabled = True
            Me.cmbComSpeed.Enabled = True
            Me.cmdConnect.Text = "Connect"

            Me.cmbB4.Enabled = False
            Me.cmbB5.Enabled = False
            Me.cmbB6.Enabled = False
            Me.cmbB7.Enabled = False
            cmdSend.Enabled = False
        Catch ex As Exception
            MessageBox.Show("Error closing connection" & Environment.NewLine & ex.Message, "Taj 200", MessageBoxButtons.OK, MessageBoxIcon.Error)

        End Try

    End Sub

    Private Sub cmdConnect_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdConnect.Click
        If objSerialPort.IsOpen Then
            Me.Disconnect()
        Else
            Me.Connect()
        End If
    End Sub

    Private Sub objSerialPort_DataReceived(ByVal sender As Object, ByVal e As System.IO.Ports.SerialDataReceivedEventArgs)
        Dim arobjBuffer(4) As Byte
        Dim intResult As Integer
        intResult = objSerialPort.Read(arobjBuffer, 0, 4)


        If intResult = 4 Then
            If arobjBuffer(0) > 200 Then
                m_arRxBytes(0) = arobjBuffer(1)
                m_arRxBytes(1) = arobjBuffer(2)
                m_arRxBytes(2) = arobjBuffer(3)
                m_arRxBytes(3) = objSerialPort.ReadByte
            Else
                m_arRxBytes(0) = arobjBuffer(0)
                m_arRxBytes(1) = arobjBuffer(1)
                m_arRxBytes(2) = arobjBuffer(2)
                m_arRxBytes(3) = arobjBuffer(3)
            End If
            m_blnRxError = False
        Else
            m_blnRxError = True
        End If


        If Me.picRxOn.InvokeRequired Then
            Dim d As New SubLedRx(AddressOf LedRx)
            Me.Invoke(d, New Object() {})
        Else
            LedRx()
        End If

        If Me.cmbB0.InvokeRequired Then
            Dim d As New SubBytesReceived(AddressOf BytesReceived)
            Me.Invoke(d, New Object() {})
        Else
            BytesReceived()
        End If
    End Sub


    Private Sub cmdSend_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSend.Click
        m_arTxBytes(0) = Int32.Parse(cmbB4.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
        m_arTxBytes(1) = Int32.Parse(cmbB5.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
        m_arTxBytes(2) = Int32.Parse(cmbB6.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
        m_arTxBytes(3) = Int32.Parse(cmbB7.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier) 
        objSerialPort.Write(m_arTxBytes, 0, 1)
        Threading.Thread.Sleep(100)
        objSerialPort.Write(m_arTxBytes, 1, 1)
        Threading.Thread.Sleep(100)
        objSerialPort.Write(m_arTxBytes, 2, 1)
        Threading.Thread.Sleep(100)
        objSerialPort.Write(m_arTxBytes, 3, 1)
        LedTx()
    End Sub

    Private Sub cmbB4_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbB4.SelectedIndexChanged
        UpdateSendStatus()
        My.Settings.B4 = Int32.Parse(cmbB4.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
    End Sub

    Private Sub cmbB5_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbB5.SelectedIndexChanged
        UpdateSendStatus()
        My.Settings.B5 = Int32.Parse(cmbB5.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
    End Sub

    Private Sub cmbB6_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbB6.SelectedIndexChanged
        UpdateSendStatus()
        My.Settings.B6 = Int32.Parse(cmbB6.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
    End Sub

    Private Sub cmbB7_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbB7.SelectedIndexChanged
        UpdateSendStatus()
        My.Settings.B7 = Int32.Parse(cmbB7.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
    End Sub

    Private Sub UpdateSendStatus()
        If cmbB4.SelectedIndex > -1 And _
            cmbB5.SelectedIndex > -1 And _
            cmbB6.SelectedIndex > -1 And _
            cmbB7.SelectedIndex > -1 And _
            objSerialPort.IsOpen Then

            cmdSend.Enabled = True
        Else
            cmdSend.Enabled = False
        End If
    End Sub

    Private Sub cmdLoadData_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdLoadData.Click
        If cmbParmDirection.SelectedIndex = 0 Then
            cmbB4.SelectedIndex = 128 'read parameter
            cmbB6.SelectedIndex = 0
            cmbB7.SelectedIndex = 0
        ElseIf cmbParmDirection.SelectedIndex = 1 Then
            cmbB4.SelectedIndex = 129 'write parameter
            cmbB6.SelectedIndex = Math.Truncate(cmbParameterValue.Value / 256) \ 1
            cmbB7.SelectedIndex = cmbParameterValue.Value Mod 256
        End If
        cmbB5.SelectedIndex = cmbParameterName.SelectedIndex

        My.Settings.B4 = Int32.Parse(cmbB4.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
        My.Settings.B5 = Int32.Parse(cmbB5.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
        My.Settings.B6 = Int32.Parse(cmbB6.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
        My.Settings.B7 = Int32.Parse(cmbB7.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)

    End Sub

    Private Sub cmdTranslateFunction_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTranslateFunction.Click
        Dim intValue As Integer
        If radFunzione00.Checked Then
            intValue = 130
        ElseIf radFunzione01.Checked Then
            intValue = 131
        ElseIf radFunzione02.Checked Then
            intValue = 132
        ElseIf radFunzione03.Checked Then
            intValue = 133
        ElseIf radFunzione04.Checked Then
            intValue = 134
        ElseIf radFunzione05.Checked Then
            intValue = 135
        ElseIf radFunzione06.Checked Then
            intValue = 136
        ElseIf radFunzione07.Checked Then
            intValue = 137
        ElseIf radFunzione08.Checked Then
            intValue = 138
        ElseIf radFunzione09.Checked Then
            intValue = 139
        ElseIf radFunzione10.Checked Then
            intValue = 140
        ElseIf radFunzione11.Checked Then
            intValue = 141
        ElseIf radFunzione12.Checked Then
            intValue = 142
        ElseIf radFunzione13.Checked Then
            intValue = 143
        Else
            intValue = -1
        End If



        If intValue >= 0 Then
            cmbB4.SelectedIndex = intValue
            cmbB5.SelectedIndex = 0
            cmbB6.SelectedIndex = 0
            cmbB7.SelectedIndex = 0

            My.Settings.B4 = Int32.Parse(cmbB4.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
            My.Settings.B5 = Int32.Parse(cmbB5.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
            My.Settings.B6 = Int32.Parse(cmbB6.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)
            My.Settings.B7 = Int32.Parse(cmbB7.SelectedItem.ToString, System.Globalization.NumberStyles.HexNumber Or System.Globalization.NumberStyles.AllowHexSpecifier)

        End If

    End Sub

    Private Sub cmbParmDirection_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbParmDirection.SelectedIndexChanged
        cmbParameterValue.Enabled = (cmbParmDirection.SelectedIndex = 1)
    End Sub
End Class
