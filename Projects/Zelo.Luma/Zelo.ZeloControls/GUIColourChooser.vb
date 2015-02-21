Public Class GUIColourChooser

    Private Declare Function GetPixel Lib "gdi32" (ByVal hdc As System.IntPtr, ByVal x As Integer, ByVal y As Integer) As Integer

    Public Event OnClosing(ByRef sender As Object, ByVal _objSelectedColor As Color)


    Protected m_objSelectedColor As Color
    Protected m_intGradient As Integer


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Color.Red")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property CurrentColor() As Color
        Get
            Return txtCurrentColor.BackColorFaded1
        End Get
        Set(ByVal _objCurrentColor As Color)
            txtCurrentColor.BackColorFaded1 = _objCurrentColor
            txtCurrentColor.BackColorFaded2 = _objCurrentColor
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Color.Blue")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property PreviousColor() As Color
        Get
            Return txtPreviousColor.BackColorFaded1
        End Get
        Set(ByVal _objPreviousColor As Color)
            txtPreviousColor.BackColorFaded1 = _objPreviousColor
            txtPreviousColor.BackColorFaded2 = _objPreviousColor
        End Set
    End Property

    Private Sub pnlColorTable_MouseMove(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles pnlColorTable.MouseMove
        Dim hdc As System.IntPtr
        Dim G As Graphics

        If e.Button = Windows.Forms.MouseButtons.Left Then
            G = pnlColorTable.CreateGraphics()
            hdc = G.GetHdc()
            m_objSelectedColor = ColorTranslator.FromWin32(GetPixel(hdc, e.X, e.Y))
            pnlGradient.Invalidate()
            pnlGradient_MouseMove(pnlGradient, New MouseEventArgs(Windows.Forms.MouseButtons.None, 0, 0, 0, 0))

            G.ReleaseHdc(hdc)
            G.Dispose()
        End If
    End Sub

    Private Sub pnlColorTable_Paint(ByVal sender As System.Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles pnlColorTable.Paint
        Dim path As GraphicsPath
        Dim pathGradient As PathGradientBrush
        Dim arobjSurroundingColors(3) As Color

        path = New GraphicsPath()
        path.AddRectangle(pnlColorTable.ClientRectangle)

        pathGradient = New PathGradientBrush(path)
        pathGradient.CenterColor = System.Drawing.Color.White
        arobjSurroundingColors(0) = System.Drawing.Color.Red
        arobjSurroundingColors(1) = System.Drawing.Color.Green
        arobjSurroundingColors(2) = System.Drawing.Color.Blue
        arobjSurroundingColors(3) = System.Drawing.Color.Yellow
        pathGradient.SurroundColors = arobjSurroundingColors
        e.Graphics.FillPath(pathGradient, path)


    End Sub

    Private Sub pnlGradient_MouseMove(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles pnlGradient.MouseMove
        Dim hdc As System.IntPtr
        Dim G As Graphics

        If e.Button = Windows.Forms.MouseButtons.Left Then
            G = pnlGradient.CreateGraphics()
            hdc = G.GetHdc()

            Me.CurrentColor = ColorTranslator.FromWin32(GetPixel(hdc, e.X, e.Y))
            m_intGradient = e.Y
            G.ReleaseHdc(hdc)
            G.Dispose()
        Else
            G = pnlGradient.CreateGraphics()
            hdc = G.GetHdc()

            Me.CurrentColor = ColorTranslator.FromWin32(GetPixel(hdc, 2, m_intGradient))
            G.ReleaseHdc(hdc)
            G.Dispose()
        End If
    End Sub

    Private Sub pnlGradient_Paint(ByVal sender As System.Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles pnlGradient.Paint
        Dim objGradientBrush As Drawing2D.LinearGradientBrush
        objGradientBrush = New Drawing2D.LinearGradientBrush(pnlGradient.ClientRectangle, m_objSelectedColor, Color.Black, LinearGradientMode.Vertical)
        e.Graphics.FillRectangle(objGradientBrush, pnlGradient.ClientRectangle)
        objGradientBrush.Dispose()
        objGradientBrush = Nothing
    End Sub

    Private Sub cmdOk_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdOk.Click
        RaiseEvent OnClosing(Me, Me.CurrentColor)
    End Sub

    Private Sub cmdCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancel.Click
        RaiseEvent OnClosing(Me, Me.PreviousColor)
    End Sub
End Class
