' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'

Public Class GUIButton
    Inherits GUIRectangle

#Region "Constants"
#End Region

#Region "Variables"
    Protected m_strText As String = "GuiButton"
    Protected m_enmTextAlign As ContentAlignment = ContentAlignment.MiddleCenter
    Protected m_objForeColorDisabled As Color = Color.LightGray
    Protected m_blnEditMode As Boolean
    Protected m_blnEditUnderscoreVisible As Boolean
    Protected m_intTextAngle As Integer = 0
#End Region

#Region "Events"
    '  Public Shadows Event Click(ByVal sender As Object, ByVal e As System.EventArgs)
#End Region

#Region "Properties"

    Protected Overrides ReadOnly Property CreateParams() As CreateParams
        Get
            Dim objCreateParams As CreateParams
            objCreateParams = MyBase.CreateParams
            objCreateParams.Style = objCreateParams.Style Or &H20 'WS_EX_TRANSPARENT 
            Return objCreateParams
        End Get
    End Property


    <System.ComponentModel.DefaultValue("Color.LightGray")> _
    <System.ComponentModel.Category("Appearance")> _
    Public Property ForeColorDisabled() As Color
        Get
            Return m_objForeColorDisabled
        End Get
        Set(ByVal _objForeColorDisabled As Color)
            m_objForeColorDisabled = _objForeColorDisabled
            Me.Invalidate()
        End Set
    End Property


    <System.ComponentModel.DefaultValue("ContentAlignment.MiddleCenter")> _
    <System.ComponentModel.Category("Appearance")> _
    Public Property TextAlign() As ContentAlignment
        Get
            Return m_enmTextAlign
        End Get
        Set(ByVal _enmTextAlign As ContentAlignment)
            m_enmTextAlign = _enmTextAlign
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.Browsable(True)> _
    <System.ComponentModel.DefaultValue("GuiButton")> _
    <System.ComponentModel.Category("Appearance")> _
    <System.ComponentModel.DesignerSerializationVisibility(System.ComponentModel.DesignerSerializationVisibility.Visible)> _
    Public Overrides Property Text() As String
        Get
            Return m_strText
        End Get
        Set(ByVal _strText As String)
            m_strText = _strText
            Me.Invalidate()
        End Set
    End Property


    <System.ComponentModel.Browsable(True)> _
    <System.ComponentModel.DefaultValue("True")> _
    <System.ComponentModel.Category("Appearance")> _
    Public Property EditMode() As Boolean
        Get
            Return m_blnEditMode
        End Get
        Set(ByVal _blnEditMode As Boolean)
            m_blnEditMode = _blnEditMode
            timerEdit.Enabled = m_blnEditMode
        End Set
    End Property


    <System.ComponentModel.Browsable(True)> _
    <System.ComponentModel.DefaultValue("True")> _
    <System.ComponentModel.Category("Appearance")> _
    Public Property TextAngle() As Integer
        Get
            Return m_intTextAngle
        End Get
        Set(ByVal _intTextAngle As Integer)
            m_intTextAngle = _intTextAngle
            Me.Invalidate()
        End Set
    End Property

#End Region

#Region "Methods"

#Region "Public Methods"

#End Region

#Region "Protected Methods"

    Public Sub InvalidateEx()
        Dim objRectangle As Rectangle
        If Not Me.Parent Is Nothing Then
            objRectangle = New Rectangle(Me.Location, Me.Size)
            Me.Parent.Invalidate(objRectangle, True)
        End If
    End Sub

    Protected Overrides Sub OnPaintBackground(ByVal e As System.Windows.Forms.PaintEventArgs)
        'do not allow the background to be painted  
        'MyBase.OnPaintBackground(e)
    End Sub


#End Region

#Region "Events Handlers"

    'Private Sub GUIButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Click
    '    If Me.Enabled Then
    '        RaiseEvent Click(sender, e)
    '    End If
    'End Sub

    Private Sub GUIButton_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Me.Paint
        Dim objTextSolidBrush As SolidBrush
        Dim objStringFormat As StringFormat
        Dim objRectangle As Rectangle
        Dim strText As String
        objStringFormat = New StringFormat

        If Me.Text Is Nothing Then
            strText = ""
        Else
            strText = Me.Text
        End If

        If m_blnEditMode Then
            If m_blnEditUnderscoreVisible Then
                strText &= "_"
            Else
                strText &= ".."
            End If
        End If


        If strText.Length > 0 Then
            If Me.Enabled Then
                objTextSolidBrush = New SolidBrush(Me.ForeColor)
            Else
                objTextSolidBrush = New SolidBrush(Me.ForeColorDisabled)
            End If


            Select Case m_enmTextAlign
                Case ContentAlignment.BottomCenter
                    objStringFormat.Alignment = StringAlignment.Center
                    objStringFormat.LineAlignment = StringAlignment.Far
                Case ContentAlignment.BottomLeft
                    objStringFormat.Alignment = StringAlignment.Near
                    objStringFormat.LineAlignment = StringAlignment.Far
                Case ContentAlignment.BottomRight
                    objStringFormat.Alignment = StringAlignment.Far
                    objStringFormat.LineAlignment = StringAlignment.Far
                Case ContentAlignment.MiddleCenter
                    objStringFormat.Alignment = StringAlignment.Center
                    objStringFormat.LineAlignment = StringAlignment.Center
                Case ContentAlignment.MiddleLeft
                    objStringFormat.Alignment = StringAlignment.Near
                    objStringFormat.LineAlignment = StringAlignment.Center
                Case ContentAlignment.MiddleRight
                    objStringFormat.Alignment = StringAlignment.Far
                    objStringFormat.LineAlignment = StringAlignment.Center
                Case ContentAlignment.TopCenter
                    objStringFormat.Alignment = StringAlignment.Center
                    objStringFormat.LineAlignment = StringAlignment.Near
                Case ContentAlignment.TopLeft
                    objStringFormat.Alignment = StringAlignment.Near
                    objStringFormat.LineAlignment = StringAlignment.Near
                Case ContentAlignment.TopRight
                    objStringFormat.Alignment = StringAlignment.Far
                    objStringFormat.LineAlignment = StringAlignment.Near
            End Select


            objRectangle = New Rectangle(m_objMainRectangle.Left + m_intBorderWidth + m_intShadowWidth, _
                                            m_objMainRectangle.Top + m_intBorderWidth + m_intShadowWidth, _
                                            m_objMainRectangle.Right - m_intBorderWidth - 2 * m_intShadowWidth, _
                                            m_objMainRectangle.Bottom - m_intBorderWidth - 2 * m_intShadowWidth)

            objRectangle.Inflate(-CInt(Math.Round(objRectangle.Width) * 0.02), -CInt(Math.Round(objRectangle.Height) * 0.02))

            'objRectangle = MyBase.m_objMainRectangle
            'objRectangle.Offset(2 * (m_intShadowWidth + m_intBorderWidth), 2 * (m_intShadowWidth + m_intBorderWidth))
            'objRectangle.Inflate(2 * (m_intShadowWidth + m_intBorderWidth), 2 * (m_intShadowWidth + m_intBorderWidth))
            If Me.TextAngle <> 0 Then
                e.Graphics.TranslateTransform(objRectangle.Width \ 2, objRectangle.Height \ 2)
                e.Graphics.RotateTransform(Me.TextAngle)
                'e.Graphics.DrawString(strText, Me.Font, objTextSolidBrush, objRectangle, objStringFormat)
                'e.Graphics.DrawString(strText, Me.Font, objTextSolidBrush, 0, -50, StringFormat.GenericDefault)
                e.Graphics.DrawString(strText, Me.Font, objTextSolidBrush, -50, -Me.Height \ 25, StringFormat.GenericTypographic)
            Else
                e.Graphics.DrawString(strText, Me.Font, objTextSolidBrush, objRectangle, objStringFormat)
            End If
            objTextSolidBrush.Dispose()
        End If



    End Sub

    Private Sub timerEdit_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles timerEdit.Tick
        m_blnEditUnderscoreVisible = Not m_blnEditUnderscoreVisible
        Me.Invalidate()
    End Sub



#End Region

#End Region

End Class
