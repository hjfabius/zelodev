' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com

Imports System.Drawing.Drawing2D

<System.ComponentModel.DefaultEvent("Click")> _
Public Class GUIRectangle

#Region "Constants"

#End Region

#Region "Variables"
    Protected m_objBackColorFaded1 As Color = Color.Black
    Protected m_objBackColorFaded2 As Color = Color.LightGray
    Protected m_objBorderColor As Color = Color.Black
    Protected m_intBorderWidth As Integer = 0
    Protected m_enmGradientMode As Drawing2D.LinearGradientMode = LinearGradientMode.Vertical
    Protected m_enmRectangleStyle As RectangleStyle = RectangleStyle.Rounded
    Protected m_intRadius As Integer = 25
    Protected m_intShadowWidth As Integer = 0
    Protected m_objShadowColor As Color = Color.LightGray
    Protected m_objMainRectangle As Rectangle
    Protected m_objPathGradientBrush As Drawing2D.LinearGradientBrush
    Protected m_objPathSolidBrush As SolidBrush
    Protected m_objGraphicsPathMain As GraphicsPath
    Protected m_objGraphicsPathRounded As GraphicsPath
    Protected m_objGraphicsPathShadows As GraphicsPath
    Protected m_objBorderPen As Pen

#End Region

#Region "Events"
    ' Public Shadows Event Click(ByVal sender As Object, ByVal e As System.EventArgs)
#End Region

#Region "Properties"

    <System.ComponentModel.Category("Appearance")> _
    <System.ComponentModel.DefaultValue("Color.LightGray")> _
    Public Property ShadowColor() As Color
        Get
            Return m_objShadowColor
        End Get
        Set(ByVal _objShadowColor As Color)
            m_objShadowColor = _objShadowColor
            RedefineGraphicsPaths()
            Me.Invalidate()
        End Set
    End Property


    <System.ComponentModel.Category("Appearance")> _
    <System.ComponentModel.DefaultValue("0")> _
    Public Property ShadowWidth() As Integer
        Get
            Return m_intShadowWidth
        End Get
        Set(ByVal _intShadowWidth As Integer)
            m_intShadowWidth = _intShadowWidth
            RedefineGraphicsPaths()
            Me.Invalidate()
        End Set
    End Property



    <System.ComponentModel.Category("Appearance")> _
    <System.ComponentModel.DefaultValue("0")> _
    Public Property BorderWidth() As Integer
        Get
            Return m_intBorderWidth
        End Get
        Set(ByVal _intBorderWidth As Integer)
            m_intBorderWidth = _intBorderWidth
            RedefineGraphicsPaths()
            Me.Invalidate()
        End Set
    End Property


    <System.ComponentModel.Category("Appearance")> _
    <System.ComponentModel.DefaultValue("Color.Black")> _
    Public Property BorderColor() As Color
        Get
            Return m_objBorderColor
        End Get
        Set(ByVal _objBorderColor As Color)
            m_objBorderColor = _objBorderColor
            RedefineGraphicsPaths()
            Me.Invalidate()
        End Set
    End Property


    <System.ComponentModel.Category("Appearance")> _
    <System.ComponentModel.DefaultValue("Color.LightGray")> _
    Public Property BackColorFaded2() As Color
        Get
            Return m_objBackColorFaded2
        End Get
        Set(ByVal _objBackColorFaded2 As Color)
            m_objBackColorFaded2 = _objBackColorFaded2
            RedefineGraphicsPaths()
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.Category("Appearance")> _
    <System.ComponentModel.DefaultValue("Color.Black")> _
    Public Property BackColorFaded1() As Color
        Get
            Return m_objBackColorFaded1
        End Get
        Set(ByVal _objBackColorFaded1 As Color)
            m_objBackColorFaded1 = _objBackColorFaded1
            RedefineGraphicsPaths()
            Me.Invalidate()
        End Set
    End Property



    <System.ComponentModel.Category("Appearance")> _
    <System.ComponentModel.DefaultValue("Drawing2D.LinearGradientMode.Vertical")> _
    Public Property GradientMode() As Drawing2D.LinearGradientMode
        Get
            Return m_enmGradientMode
        End Get
        Set(ByVal _enmGradientMode As Drawing2D.LinearGradientMode)
            m_enmGradientMode = _enmGradientMode
            RedefineGraphicsPaths()
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.Category("Appearance")> _
       <System.ComponentModel.DefaultValue("RectangleStyle.Rounded")> _
       Public Property RectangleStyle() As RectangleStyle
        Get
            Return m_enmRectangleStyle
        End Get
        Set(ByVal _enmRectangleStyle As RectangleStyle)
            m_enmRectangleStyle = _enmRectangleStyle
            RedefineGraphicsPaths()
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.DefaultValue("20")> _
    <System.ComponentModel.Category("Appearance")> _
    Public Property Radius() As Integer
        Get
            Return m_intRadius
        End Get
        Set(ByVal _intRadius As Integer)
            m_intRadius = _intRadius
            RedefineGraphicsPaths()
            Me.Invalidate()
        End Set
    End Property

#End Region

#Region "Methods"

#Region "Public Methods"

#Region " IDisposable Support "

#End Region

#End Region

#Region "Protected Methods"
    Private Sub RedefineGraphicsPaths()
        Dim intRadius As Integer
        Dim objRectangle As Rectangle


        intRadius = Math.Max(1, m_intRadius)
        m_objMainRectangle = New Rectangle(Me.ClientRectangle.X, Me.ClientRectangle.Y, Me.ClientRectangle.Width - ((m_intShadowWidth + m_intBorderWidth) * 2), Me.ClientRectangle.Height - ((m_intShadowWidth + m_intBorderWidth) * 2))

        If m_intRadius > 0 Then
            If Not m_objGraphicsPathMain Is Nothing Then
                m_objGraphicsPathMain.Dispose()
            End If
            m_objGraphicsPathMain = New GraphicsPath
            m_objGraphicsPathMain.AddRectangle(Me.ClientRectangle)
        End If

        If m_intShadowWidth > 0 Then
            If Not m_objGraphicsPathShadows Is Nothing Then
                m_objGraphicsPathShadows.Dispose()
            End If
            m_objGraphicsPathShadows = New GraphicsPath

            'Client rectangle is diveded in a matrix of subrectangles 1|2|3/4|5|6/7|8|9

            'Rectangle 1
            objRectangle = New Rectangle(m_objMainRectangle.Left + m_intBorderWidth + m_intShadowWidth, m_objMainRectangle.Top + m_intBorderWidth + m_intShadowWidth, intRadius, intRadius)
            objRectangle.Offset(m_intShadowWidth + m_intBorderWidth, m_intShadowWidth + m_intBorderWidth)
            m_objGraphicsPathShadows.AddArc(objRectangle, 180, 90)

            'Rectangle 3
            objRectangle = New Rectangle(m_objMainRectangle.Right - intRadius - m_intBorderWidth - m_intShadowWidth, m_objMainRectangle.Top + m_intBorderWidth + m_intShadowWidth, intRadius, intRadius)
            objRectangle.Offset(m_intShadowWidth + m_intBorderWidth, m_intShadowWidth + m_intBorderWidth)
            m_objGraphicsPathShadows.AddArc(objRectangle, 270, 90)

            'Rectangle 9
            objRectangle = New Rectangle(m_objMainRectangle.Right - intRadius - m_intBorderWidth - m_intShadowWidth, m_objMainRectangle.Bottom - m_intBorderWidth - m_intShadowWidth - intRadius, intRadius, intRadius)
            objRectangle.Offset(m_intShadowWidth + m_intBorderWidth, m_intShadowWidth + m_intBorderWidth)
            m_objGraphicsPathShadows.AddArc(objRectangle, 0, 90)

            'Rectangle 7
            objRectangle = New Rectangle(m_objMainRectangle.Left + m_intBorderWidth + m_intShadowWidth, m_objMainRectangle.Bottom - m_intBorderWidth - m_intShadowWidth - intRadius, intRadius, intRadius)
            objRectangle.Offset(m_intShadowWidth + m_intBorderWidth, m_intShadowWidth + m_intBorderWidth)
            m_objGraphicsPathShadows.AddArc(objRectangle, 90, 90)

            m_objGraphicsPathShadows.CloseFigure()

        End If


        If Not m_objGraphicsPathRounded Is Nothing Then
            m_objGraphicsPathRounded.Dispose()
        End If
        m_objGraphicsPathRounded = New GraphicsPath

        'fill with gradient
        If m_intRadius > 0 Then

            'Client rectangle is diveded in a matrix of subrectangles 1|2|3/4|5|6/7|8|9
            'Rectangle 1
            objRectangle = New Rectangle(m_objMainRectangle.Left + m_intBorderWidth + m_intShadowWidth, m_objMainRectangle.Top + m_intBorderWidth + m_intShadowWidth, intRadius, intRadius)
            m_objGraphicsPathRounded.AddArc(objRectangle, 180, 90)

            'Rectangle 3
            objRectangle = New Rectangle(m_objMainRectangle.Right - intRadius - m_intBorderWidth - m_intShadowWidth, m_objMainRectangle.Top + m_intBorderWidth + m_intShadowWidth, intRadius, intRadius)
            m_objGraphicsPathRounded.AddArc(objRectangle, 270, 90)

            'Rectangle 9
            objRectangle = New Rectangle(m_objMainRectangle.Right - intRadius - m_intBorderWidth - m_intShadowWidth, m_objMainRectangle.Bottom - m_intBorderWidth - m_intShadowWidth - intRadius, intRadius, intRadius)
            m_objGraphicsPathRounded.AddArc(objRectangle, 0, 90)

            'Rectangle 7
            objRectangle = New Rectangle(m_objMainRectangle.Left + m_intBorderWidth + m_intShadowWidth, m_objMainRectangle.Bottom - m_intBorderWidth - m_intShadowWidth - intRadius, intRadius, intRadius)
            m_objGraphicsPathRounded.AddArc(objRectangle, 90, 90)

            m_objGraphicsPathRounded.CloseFigure()
        Else
            objRectangle = m_objMainRectangle
            objRectangle.Inflate(m_intBorderWidth, m_intBorderWidth)

            m_objGraphicsPathRounded.AddRectangle(objRectangle)
            m_objGraphicsPathRounded.CloseFigure()
        End If

        If Me.BackColorFaded1 <> Me.BackColorFaded2 Then
            If Not m_objPathGradientBrush Is Nothing Then
                m_objPathGradientBrush.Dispose()
            End If
            m_objPathGradientBrush = New Drawing2D.LinearGradientBrush(m_objMainRectangle, Me.BackColorFaded1, Me.BackColorFaded2, m_enmGradientMode)
        Else
            If Not m_objPathSolidBrush Is Nothing Then
                m_objPathSolidBrush.Dispose()
            End If
            m_objPathSolidBrush = New SolidBrush(Me.BackColorFaded1)
        End If

        'Draw the border
        If m_intBorderWidth > 0 Then
            If Not m_objBorderPen Is Nothing Then
                m_objBorderPen.Dispose()
            End If
            m_objBorderPen = New Pen(Me.BorderColor, m_intBorderWidth)
        End If

    End Sub

#End Region

#Region "Events Handlers"

    Private Sub GUIRectangle_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.SetStyle(ControlStyles.SupportsTransparentBackColor, True)
        Me.SetStyle(ControlStyles.UserPaint, True)
        Me.SetStyle(ControlStyles.ResizeRedraw, True)
        Me.SetStyle(ControlStyles.AllPaintingInWmPaint, True)
        Me.SetStyle(ControlStyles.OptimizedDoubleBuffer, True)
        'Me.BackColor = Color.Transparent
    End Sub

    Private Sub GUIRectangle_Move(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Move
        RedefineGraphicsPaths()
    End Sub


    Private Sub GUIRectangleFilled_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Me.Paint
        If m_objGraphicsPathRounded Is Nothing Then
            RedefineGraphicsPaths()
        End If

        If m_intRadius > 0 Then
            e.Graphics.FillPath(New SolidBrush(Me.BackColor), m_objGraphicsPathMain)
        End If

        If m_intShadowWidth + m_intBorderWidth > 0 Then
            e.Graphics.SmoothingMode = SmoothingMode.AntiAlias
        End If

        If m_intShadowWidth > 0 Then
            e.Graphics.FillPath(New SolidBrush(m_objShadowColor), m_objGraphicsPathShadows)
        End If

        If Me.BackColorFaded1 <> Me.BackColorFaded2 Then
            e.Graphics.FillPath(m_objPathGradientBrush, m_objGraphicsPathRounded)
        Else
            e.Graphics.FillPath(m_objPathSolidBrush, m_objGraphicsPathRounded)
        End If

        If m_intBorderWidth > 0 Then
            e.Graphics.DrawPath(m_objBorderPen, m_objGraphicsPathRounded)
        End If

    End Sub

    Private Sub GUIRectangle_Resize(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Resize
        RedefineGraphicsPaths()
    End Sub
#End Region

#End Region


End Class
