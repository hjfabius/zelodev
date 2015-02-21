' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class GuiDensibar

#Region "Constants"

#End Region

#Region "Variables"
    Protected m_dblRefValue As Double = 60
    Protected m_dblRange As Double = 100
    Protected m_dblValue As Double = 30
    Protected m_dblAcceptanceRange As Double = 10

#End Region

#Region "Event"
    '   Public Shadows Event Click(ByVal sender As Object, ByVal e As System.EventArgs)
#End Region


#Region "Properties"


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(60.0)> _
    Public Property RefValue() As Double
        Get
            Return m_dblRefValue
        End Get
        Set(ByVal _dblRefValue As Double)
            m_dblRefValue = _dblRefValue
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(30.0)> _
    Public Property Value() As Double
        Get
            Return m_dblValue
        End Get
        Set(ByVal _dblValue As Double)
            m_dblValue = _dblValue
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(100.0)> _
    Public Property Range() As Double
        Get
            Return m_dblRange
        End Get
        Set(ByVal _dblRange As Double)
            m_dblRange = _dblRange
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(10.0)> _
    Public Property AcceptanceRange() As Double
        Get
            Return m_dblAcceptanceRange
        End Get
        Set(ByVal _dblAcceptanceRange As Double)
            m_dblAcceptanceRange = _dblAcceptanceRange
            Me.Invalidate()
        End Set
    End Property


#End Region

#Region "Methods"

#Region "Public Methods"
    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        Me.SetStyle(ControlStyles.SupportsTransparentBackColor, True)
        Me.SetStyle(ControlStyles.UserPaint, True)
        Me.SetStyle(ControlStyles.ResizeRedraw, True)
        Me.SetStyle(ControlStyles.AllPaintingInWmPaint, True)
        Me.SetStyle(ControlStyles.OptimizedDoubleBuffer, True)
    End Sub
#End Region

#Region "Protected Methods"

#End Region

#Region "Events Handlers"

    Private Sub GUIDensibar_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Me.Paint
        'Dim objLinearGradientBrush As LinearGradientBrush
        Dim objSolidBrush As SolidBrush
        Dim objPen As Pen
        Dim sngYValue As Double

        e.Graphics.FillRectangle(Brushes.White, New RectangleF(2, 2, CInt(Me.Width * 0.75) - 4, Me.Height - 4))


        If Me.Enabled And Me.Range > 0 Then
            'If Me.Value > Me.RefValue Then
            '    'objLinearGradientBrush = New Drawing2D.LinearGradientBrush(New Rectangle(0, 0, Me.Width, Me.Height \ 2), Color.Red, Color.Orange, LinearGradientMode.Vertical)
            '    objSolidBrush = New SolidBrush(Me.ForeColor)
            '    e.Graphics.FillRectangle(objSolidBrush, New Rectangle(2, 2 + CInt(sngYValue), Me.Width - 4, Me.Height - 4 - CInt(sngYValue)))
            'ElseIf Me.Value < Me.RefValue Then
            '    'objLinearGradientBrush = New Drawing2D.LinearGradientBrush(New Rectangle(0, (Me.Height \ 2), Me.Width, Me.Height \ 2), Color.Orange, Color.Red, LinearGradientMode.Vertical)
            '    objSolidBrush = New SolidBrush(Me.ForeColor)
            '    e.Graphics.FillRectangle(objSolidBrush, New Rectangle(2, (Me.Height \ 2), Me.Width - 4, CInt(sngYValue)))
            'End If
            objSolidBrush = New SolidBrush(Me.ForeColor)
            sngYValue = (1 - (Me.Value / Me.Range)) * Me.Height
            e.Graphics.FillRectangle(objSolidBrush, New Rectangle(2, 2 + CInt(sngYValue), CInt(Me.Width * 0.75) - 4, Me.Height - 4 - CInt(sngYValue)))

            objPen = New Pen(Color.Black, 2)
            sngYValue = (1 - (Me.RefValue / Me.Range)) * Me.Height
            e.Graphics.DrawLine(objPen, 0, 2 + CInt(sngYValue), CInt(Me.Width * 0.75) + 4, 2 + CInt(sngYValue))


            If m_dblAcceptanceRange > 0 Then

                objPen = New Pen(Color.Black, 2)

                'Vertical
                e.Graphics.DrawLine(objPen, CInt(Me.Width * 0.75) + 4, _
                                            CInt(2 + sngYValue - ((Me.AcceptanceRange / Me.Range) * Me.Height)), _
                                            CInt(Me.Width * 0.75) + 4, _
                                            CInt(2 + sngYValue + ((Me.AcceptanceRange / Me.Range) * Me.Height)))

                e.Graphics.DrawLine(objPen, CInt(Me.Width * 0.75) - CInt(Me.Width * 0.1), _
                                            CInt(2 + sngYValue - ((Me.AcceptanceRange / Me.Range) * Me.Height)), _
                                            CInt(Me.Width * 0.75) + 4, _
                                            CInt(2 + sngYValue - ((Me.AcceptanceRange / Me.Range) * Me.Height)))

                e.Graphics.DrawLine(objPen, CInt(Me.Width * 0.75) - CInt(Me.Width * 0.1), _
                                            CInt(2 + sngYValue + ((Me.AcceptanceRange / Me.Range) * Me.Height)), _
                                            CInt(Me.Width * 0.75) + 4, _
                                            CInt(2 + sngYValue + ((Me.AcceptanceRange / Me.Range) * Me.Height)))

            End If


        End If




        e.Graphics.DrawRectangle(Pens.Black, New Rectangle(2, 2, CInt(Me.Width * 0.75) - 4, Me.Height - 4))

    End Sub

#End Region

#End Region
End Class
