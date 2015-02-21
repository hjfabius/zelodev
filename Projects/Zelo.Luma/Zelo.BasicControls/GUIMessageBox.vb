' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'

Public Class GUIMessageBox
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Private disposedValue As Boolean = False        ' To detect redundant calls
    Protected Shared m_intSharedResult As Integer
#End Region

#Region "Events"

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

    Public Shared Sub ShowStop(ByVal _strText As String, Optional ByVal _strCaption As String = "")
        Dim arstrButton(0) As String
        arstrButton(0) = "Stop"
        GUIMessageBox.Show(_strText, _strCaption, arstrButton)
    End Sub

    Public Shared Sub ShowOkOnly(ByVal _strText As String, Optional ByVal _strCaption As String = "")
        Dim arstrButton(0) As String
        arstrButton(0) = DialogResult.OK.ToString
        GUIMessageBox.Show(_strText, _strCaption, arstrButton)
    End Sub

    Public Shared Function QuestionContinueCancel(ByVal _strText As String, Optional ByVal _strCaption As String = "") As DialogResult
        Dim arstrButton(1) As String
        arstrButton(0) = "Continue"
        arstrButton(1) = DialogResult.Cancel.ToString

        Select Case GUIMessageBox.Show(_strText, _strCaption, arstrButton)
            Case 0
                Return DialogResult.OK
            Case Else
                Return DialogResult.Cancel
        End Select
    End Function


    Public Shared Function QuestionOkCancel(ByVal _strText As String, Optional ByVal _strCaption As String = "") As DialogResult
        Dim arstrButton(1) As String
        arstrButton(0) = DialogResult.OK.ToString
        arstrButton(1) = DialogResult.Cancel.ToString

        Select Case GUIMessageBox.Show(_strText, _strCaption, arstrButton)
            Case 0
                Return DialogResult.OK
            Case Else
                Return DialogResult.Cancel
        End Select
    End Function

    Public Shared Function QuestionYesNo(ByVal _strText As String, Optional ByVal _strCaption As String = "") As DialogResult
        Dim arstrButton(1) As String
        arstrButton(0) = DialogResult.Yes.ToString
        arstrButton(1) = DialogResult.No.ToString

        Select Case GUIMessageBox.Show(_strText, _strCaption, arstrButton)
            Case 0
                Return DialogResult.Yes
            Case Else
                Return DialogResult.No
        End Select
    End Function

    Public Shared Function Show(ByVal _strText As String, Optional ByVal _strCaption As String = "", Optional ByVal _arstrButtons As String() = Nothing) As Integer
        Dim objForm As Form
        Dim objRecBackGround As GUIButton
        Dim objRecCaption As GUIButton
        Dim arobjGuiButtons() As GUIButton
        Dim objLocation As Point
        Dim i As Integer

        objForm = New Form
        objForm.Name = "GUIMessageBoxForm"
        objForm.Width = 700
        objForm.Height = 200
        objForm.FormBorderStyle = FormBorderStyle.None
        objForm.StartPosition = FormStartPosition.CenterScreen
        objForm.BackColor = Color.White




        If Not _arstrButtons Is Nothing AndAlso _
            _arstrButtons.Length > 0 Then
            ReDim arobjGuiButtons(_arstrButtons.Length - 1)

            For i = 0 To _arstrButtons.Length - 1
                If Not _arstrButtons(i) Is Nothing AndAlso _
                    _arstrButtons(i).Length > 0 Then
                    arobjGuiButtons(i) = New GUIButton
                    arobjGuiButtons(i).Parent = objForm
                    arobjGuiButtons(i).Visible = True
                    arobjGuiButtons(i).BackColor = GlobalParameters.GUI_ColorSecondary1
                    arobjGuiButtons(i).Radius = 25
                    arobjGuiButtons(i).BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
                    arobjGuiButtons(i).BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
                    arobjGuiButtons(i).ForeColor = GlobalParameters.GUI_PrimaryForecolor
                    arobjGuiButtons(i).ShadowWidth = 2
                    arobjGuiButtons(i).Text = _arstrButtons(i)
                    arobjGuiButtons(i).Width = 200
                    arobjGuiButtons(i).Tag = i
                    arobjGuiButtons(i).Height = 34
                    arobjGuiButtons(i).Cursor = Cursors.Hand
                    objLocation = New Point((objForm.Width \ (_arstrButtons.Length + 1)) - (arobjGuiButtons(i).Width \ 2) + (arobjGuiButtons(i).Width) * i, objForm.Height - CInt(1.5 * arobjGuiButtons(i).Height))
                    arobjGuiButtons(i).Location = objLocation
                    AddHandler arobjGuiButtons(i).Click, AddressOf ButtonClickEventHandler
                End If
            Next
        End If

        If Not _strCaption Is Nothing AndAlso _
            _strCaption.Length > 0 Then
            objRecCaption = New GUIButton
            objRecCaption.Parent = objForm
            objRecCaption.Visible = True
            objRecCaption.BackColor = GlobalParameters.GUI_ColorSecondary1
            objRecCaption.Radius = 25
            objRecCaption.BackColorFaded1 = GlobalParameters.GUI_ColorSecondary1
            objRecCaption.BackColorFaded2 = GlobalParameters.GUI_ColorSecondary1
            objRecCaption.ForeColor = GlobalParameters.GUI_ColorPrimary2
            'objRecCaption.ShadowWidth = 2
            objRecCaption.Text = _strCaption
            objRecCaption.Width = CInt(objForm.Width * 0.75)
            objRecCaption.Height = 34
            objLocation = New Point((objForm.Width - objRecCaption.Width) \ 2, objRecCaption.Height \ 2)
            objRecCaption.Location = objLocation
        End If

        objRecBackGround = New GUIButton
        objRecBackGround.Parent = objForm
        objRecBackGround.Dock = DockStyle.Fill
        objRecBackGround.BackColor = objForm.BackColor
        objRecBackGround.BackColorFaded1 = GlobalParameters.GUI_ColorSecondary1
        objRecBackGround.BackColorFaded2 = GlobalParameters.GUI_ColorSecondary1
        objRecBackGround.ForeColor = GlobalParameters.GUI_ColorPrimary1
        objRecBackGround.BorderColor = GlobalParameters.GUI_ColorPrimary2
        'objRecBackGround.BorderWidth = 3
        'objRecBackGround.ShadowWidth = 2
        objRecBackGround.TextAlign = ContentAlignment.MiddleCenter
        objRecBackGround.Text = _strText
        objRecBackGround.Radius = 25
        objRecBackGround.Visible = True


        objForm.ShowDialog()

        Return m_intSharedResult
    End Function

#End Region

#Region "Protected Methods"

    Protected Shared Sub ButtonClickEventHandler(ByVal sender As Object, ByVal e As System.EventArgs)
        m_intSharedResult = CInt(CType(sender, GUIButton).Tag)
        Application.OpenForms("GUIMessageBoxForm").Close()

    End Sub

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
