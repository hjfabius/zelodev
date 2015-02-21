Public Class SingleMark


    Protected m_objColor As Color = Color.Red
    Protected m_enmMarkShape As MarkShape = MarkShape.Circle

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("MarkShape.Circle")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property MarkShape() As MarkShape
        Get
            Return m_enmMarkShape
        End Get
        Set(ByVal _enmMarkShape As MarkShape)
            m_enmMarkShape = _enmMarkShape
            Me.Invalidate()
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Color.Red")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Color() As Color
        Get
            Return m_objColor
        End Get
        Set(ByVal _objColor As Color)
            m_objColor = _objColor
            Me.Invalidate()
        End Set
    End Property


    Private Sub SingleMark_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Me.Paint
        Dim objBrush As SolidBrush
        Dim objRectangle As Rectangle
        If m_enmMarkShape = Luma.MarkShape.Circle Then
            e.Graphics.SmoothingMode = SmoothingMode.AntiAlias
        End If
        objRectangle = Me.ClientRectangle
        objRectangle.Width -= 2
        objRectangle.Height -= 2

        If Me.Color = Drawing.Color.Transparent Then
            objBrush = New SolidBrush(Me.BackColor)
        Else
            objBrush = New SolidBrush(Me.Color)
        End If

        Select Case m_enmMarkShape
            Case Luma.MarkShape.Circle
                e.Graphics.FillEllipse(objBrush, objRectangle)
                e.Graphics.DrawEllipse(Pens.Black, objRectangle)
            Case Luma.MarkShape.Square
                e.Graphics.FillRectangle(objBrush, objRectangle)
                e.Graphics.DrawRectangle(Pens.Black, objRectangle)
            Case Luma.MarkShape.Triangle
        End Select

    End Sub

    Private Sub SingleMark_Resize(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Resize
        If Me.Width <> Me.Height Then
            Me.Width = Me.Height
        End If
    End Sub
End Class
