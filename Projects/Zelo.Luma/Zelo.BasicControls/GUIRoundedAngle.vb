' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com

Imports System.Drawing.Drawing2D


Public Class GUIRoundedAngle


#Region "Constants"

#End Region

#Region "Variables"
    Protected m_enmRoundAngle As RoundAngle = Luma.RoundAngle.BottomLeft
#End Region

#Region "Events"

#End Region

#Region "Properties"

    <System.ComponentModel.Category("Appearance")> _
    <System.ComponentModel.DefaultValue("RoundAngle.BottomLeft")> _
    Public Property RoundAngle() As RoundAngle
        Get
            Return m_enmRoundAngle
        End Get
        Set(ByVal _enmRoundAngle As RoundAngle)
            m_enmRoundAngle = _enmRoundAngle
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

#End Region

#Region "Events Handlers"
    Private Sub GUIRoundedAngle_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Me.Paint
        Dim objGraphicsPath As GraphicsPath
        Dim objSolidBrush As Brush
        objGraphicsPath = New GraphicsPath
        'Select Case m_enmRoundAngle
        '    Case Luma.RoundAngle.BottomLeft
        '        objGraphicsPath.AddArc(Me.ClientRectangle.Left - Me.ClientRectangle.Width, Me.ClientRectangle.Top + Me.ClientRectangle.Height, 2 * Me.ClientRectangle.Width, 2 * Me.ClientRectangle.Height, 180, 90)
        '    Case Luma.RoundAngle.BottomRight
        '        objGraphicsPath.AddArc(Me.ClientRectangle.Left + Me.ClientRectangle.Width, Me.ClientRectangle.Top - Me.ClientRectangle.Height, 2 * Me.ClientRectangle.Width, 2 * Me.ClientRectangle.Height, 270, 90)
        '    Case Luma.RoundAngle.TopLeft
        '        objGraphicsPath.AddArc(Me.ClientRectangle.Left - Me.ClientRectangle.Width, Me.ClientRectangle.Top + Me.ClientRectangle.Height, 2 * Me.ClientRectangle.Width, 2 * Me.ClientRectangle.Height, 0, 90)
        '    Case Luma.RoundAngle.TopRight
        '        objGraphicsPath.AddArc(Me.ClientRectangle.Left + Me.ClientRectangle.Width, Me.ClientRectangle.Top - Me.ClientRectangle.Height, 2 * Me.ClientRectangle.Width, 2 * Me.ClientRectangle.Height, 90, 90)
        'End Select

        Select Case m_enmRoundAngle
            Case Luma.RoundAngle.BottomLeft
                objGraphicsPath.AddArc(Me.ClientRectangle.Left - Me.ClientRectangle.Width, Me.ClientRectangle.Top, 2 * Me.ClientRectangle.Width, 2 * Me.ClientRectangle.Height, 270, 180)
            Case Luma.RoundAngle.BottomRight
                objGraphicsPath.AddArc(Me.ClientRectangle.Left, Me.ClientRectangle.Top, 2 * Me.ClientRectangle.Width, 2 * Me.ClientRectangle.Height, 180, 180)
            Case Luma.RoundAngle.TopLeft
                objGraphicsPath.AddArc(Me.ClientRectangle.Left - Me.ClientRectangle.Width, Me.ClientRectangle.Top - Me.ClientRectangle.Height, 2 * Me.ClientRectangle.Width, 2 * Me.ClientRectangle.Height, 270, 180)
            Case Luma.RoundAngle.TopRight
                objGraphicsPath.AddArc(Me.ClientRectangle.Left, Me.ClientRectangle.Top - Me.ClientRectangle.Height, 2 * Me.ClientRectangle.Width, 2 * Me.ClientRectangle.Height, 0, 180)
        End Select


        objGraphicsPath.CloseFigure()
        objSolidBrush = New SolidBrush(Me.ForeColor)
        e.Graphics.SmoothingMode = SmoothingMode.AntiAlias
        e.Graphics.FillPath(objSolidBrush, objGraphicsPath)
        objGraphicsPath.Dispose()
        objSolidBrush.Dispose()
    End Sub

#End Region

#End Region






End Class
