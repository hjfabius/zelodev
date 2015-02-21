Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Windows.Forms

' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class GUITermometer

#Region "Constants"

#End Region

#Region "Variables"
    Protected m_objMercuryColor As Color = Color.Red
    Protected m_dblValue As Double
    Protected m_dblMin As Double
    Protected m_dblRange As Double
    Protected m_dblMax As Double
#End Region

#Region "Events"

#End Region

#Region "Properties"

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(0)> _
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
    <System.ComponentModel.DefaultValue(25)> _
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
    <System.ComponentModel.DefaultValue(10)> _
    Public Property Min() As Double
        Get
            Return m_dblMin
        End Get
        Set(ByVal _dblMin As Double)
            m_dblMin = _dblMin
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(45)> _
    Public Property Max() As Double
        Get
            Return m_dblMax
        End Get
        Set(ByVal _dblMax As Double)
            m_dblMax = _dblMax
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Color.Red")> _
    Public Property MercuryColor() As Color
        Get
            Return m_objMercuryColor
        End Get
        Set(ByVal _objMercuryColor As Color)
            m_objMercuryColor = _objMercuryColor
            Me.Invalidate()
        End Set
    End Property

#End Region

#Region "Methods"
    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        m_objMercuryColor = Color.Red
        Me.SetStyle(ControlStyles.SupportsTransparentBackColor, True)
        Me.SetStyle(ControlStyles.UserPaint, True)
        Me.SetStyle(ControlStyles.ResizeRedraw, True)
        Me.SetStyle(ControlStyles.AllPaintingInWmPaint, True)
        Me.SetStyle(ControlStyles.OptimizedDoubleBuffer, True)
    End Sub
#Region "Public Methods"

#End Region

#Region "Protected Methods"

#End Region

#Region "Events Handlers"


    Private Sub GUITermometer_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Me.Paint

        Dim sngFactor As Single
        Dim sngYValue As Single

        e.Graphics.SmoothingMode = SmoothingMode.HighQuality
        e.Graphics.DrawRectangle(Pens.Black, New Rectangle(CInt(Me.Width / 3), 2, CInt(Me.Width / 3), Me.Height - Me.Width + 2))
        e.Graphics.DrawEllipse(Pens.Black, New RectangleF(2, Me.Height - Me.Width + 2, Me.Width - 4, Me.Width - 4))
        e.Graphics.FillRectangle(New SolidBrush(Color.White), New RectangleF(CSng(Me.Width / 3), 2, CSng(Me.Width / 3), Me.Height - 8))

        e.Graphics.FillEllipse(New SolidBrush(Color.White), New RectangleF(2, Me.Height - Me.Width + 2, Me.Width - 4, Me.Width - 4))
        e.Graphics.FillEllipse(New SolidBrush(Me.MercuryColor), New RectangleF(4, Me.Height - Me.Width + 4, Me.Width - 8, Me.Width - 8))

        If Me.Enabled Then
            sngFactor = CSng((Me.Height - 12) / Me.Range)
            sngYValue = CSng((Me.Range - Me.Value) * sngFactor)
            e.Graphics.FillRectangle(New SolidBrush(Me.MercuryColor), New RectangleF(CSng(Me.Width * 4 / 9), 4 + sngYValue, CSng(Me.Width * 1 / 9), Me.Height - 8 - sngYValue))


            If Me.Min > 0 Then
                sngYValue = CSng((Me.Range - Me.Min) * sngFactor)
                e.Graphics.DrawLine(Pens.Black, 0, sngYValue, Me.Width, sngYValue)
            End If

            If Me.Max < Me.Range Then
                sngYValue = CSng((Me.Range - Me.Max) * sngFactor)
                e.Graphics.DrawLine(Pens.Black, 0, sngYValue, Me.Width, sngYValue)
            End If
        End If

    End Sub

    Private Sub PropertyChangedEventhandler(ByRef sender As Object, ByVal e As EventArgs)
        Me.Invalidate()
    End Sub
#End Region

#End Region

End Class

