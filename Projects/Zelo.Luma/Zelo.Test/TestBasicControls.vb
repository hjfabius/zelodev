Public Class TestBasicControls

    Private Sub nudRadius_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles nudRadius.ValueChanged
        objGuiRectangle.Radius = CInt(nudRadius.Value)
    End Sub

    Private Sub TestBasicControls_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        GlobalParameters.GUI_ButtonRadius = CInt(nudRadius.Value)
    End Sub

    Private Sub TestBasicControls_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        nudRadius.Value = GlobalParameters.GUI_ButtonRadius
        objGuiRectangle.BackColorFaded1 = GlobalParameters.GUI_ColorSecondary1
        objGuiRectangle.BackColorFaded2 = GlobalParameters.GUI_ColorSecondary2
    End Sub

    Private Sub nudBorderWidth_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles nudBorderWidth.ValueChanged
        objGuiRectangle.BorderWidth = CInt(nudBorderWidth.Value)
    End Sub

    Private Sub cmdBackColor1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdBackColor1.Click
        objColorDialog.Reset()
        If objColorDialog.ShowDialog() = Windows.Forms.DialogResult.OK Then
            objGuiRectangle.BackColorFaded1 = objColorDialog.Color
            objGuiRectangle.BorderColor = objColorDialog.Color
            GlobalParameters.GUI_ColorSecondary1 = objGuiRectangle.BackColorFaded1
        End If
    End Sub

    Private Sub cmdBackColor2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdBackColor2.Click
        objColorDialog.Reset()
        If objColorDialog.ShowDialog() = Windows.Forms.DialogResult.OK Then
            objGuiRectangle.BackColorFaded2 = objColorDialog.Color
            objGuiRectangle.BorderColor = objColorDialog.Color
            GlobalParameters.GUI_ColorSecondary2 = objGuiRectangle.BackColorFaded1
        End If
    End Sub

    Private Sub nudShadowWidth_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles nudShadowWidth.ValueChanged
        objGuiRectangle.ShadowWidth = CInt(nudShadowWidth.Value)
    End Sub

    Private Sub GuiButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GuiButton1.Click
        MessageBox.Show("GuiButton1_Click")
    End Sub

    Private Sub GuiKeyboard1_KeyAnyKey(ByRef _objSender As Object, ByVal _objChar As Char) Handles GuiKeyboard1.KeyAnyKey
        MessageBox.Show("Keyboard: " & _objChar.ToString)
    End Sub

    Private Sub GuiKeyboard1_KeyBackspace(ByRef _objSender As Object) Handles GuiKeyboard1.KeyBackspace
        MessageBox.Show("Keyboard: Backspace")
    End Sub

    Private Sub GuiKeyboard1_KeyEnter(ByRef _objSender As Object) Handles GuiKeyboard1.KeyEnter
        MessageBox.Show("Keyboard: Enter")
    End Sub

    Private Sub GuiKeyboard1_KeyEsc(ByRef _objSender As Object) Handles GuiKeyboard1.KeyEsc
        MessageBox.Show("Keyboard: Esc")
    End Sub

    Private Sub GuiKeyboard1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GuiKeyboard1.Load

    End Sub
End Class