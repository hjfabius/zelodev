' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class GUICalculator
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Protected m_blnAcceptDecimal As Boolean = True
    Protected m_sngValue As Single = 100
    Protected m_strLabel As String = ""
    Protected m_blnPositiveValue As Boolean = True
#End Region

#Region "Events"
    Public Event KeyEnter(ByRef _objSender As Object)
    Public Event KeyEsc(ByRef _objSender As Object)
    Public Event KeyBackspace(ByRef _objSender As Object)
    Public Event KeyAnyKey(ByRef _objSender As Object, ByVal _objChar As Char)
#End Region

#Region "Properties"

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Label() As String
        Get
            Return m_strLabel
        End Get
        Set(ByVal _strLabel As String)
            m_strLabel = _strLabel
            If m_strLabel Is Nothing OrElse m_strLabel.Length = 0 Then
                guiBackground.Text = ""
            Else
                guiBackground.Text = m_strLabel
            End If
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(100)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Value() As Single
        Get
            If Not m_blnPositiveValue Then
                Return -m_sngValue
            Else
                Return m_sngValue
            End If

        End Get
        Set(ByVal _sngValue As Single)
            m_sngValue = _sngValue

            If Single.IsPositiveInfinity(m_sngValue) Then
                guiDisplay.Text = ""
                m_blnPositiveValue = True
            ElseIf Single.IsNegativeInfinity(m_sngValue) Then
                guiDisplay.Text = ""
                m_blnPositiveValue = False
            Else
                If m_blnAcceptDecimal Then
                    guiDisplay.Text = m_sngValue.ToString
                Else
                    guiDisplay.Text = CInt(m_sngValue).ToString
                End If
            End If
            guiKeyDot.Visible = Me.AcceptDecimal And Not guiDisplay.Text.Contains(guiKeyDot.Text)
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(True)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property AcceptDecimal() As Boolean
        Get
            Return m_blnAcceptDecimal
        End Get
        Set(ByVal _blnAcceptDecimal As Boolean)
            m_blnAcceptDecimal = _blnAcceptDecimal

            If Single.IsPositiveInfinity(m_sngValue) Then
                guiDisplay.Text = ""
                m_blnPositiveValue = True
            ElseIf Single.IsNegativeInfinity(m_sngValue) Then
                guiDisplay.Text = ""
                m_blnPositiveValue = False
            Else
                If m_blnAcceptDecimal Then
                    guiDisplay.Text = m_sngValue.ToString
                Else
                    guiDisplay.Text = CInt(m_sngValue).ToString
                End If
            End If

            guiKeyDot.Visible = Me.AcceptDecimal And Not guiDisplay.Text.Contains(guiKeyDot.Text)
        End Set
    End Property

#End Region

#Region "Methods"

#Region "Public Methods"

    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        InitGui()
    End Sub

#End Region

#Region "Protected Methods"

    Protected Sub InitGui()
        Dim objControl As Control
        Dim guiButton As GUIButton
        For Each objControl In Me.tblMain.Controls
            If Not objControl Is guiDisplay Then
                'Not objControl Is guiBackground And _
                '    Not objControl Is guiDisplay And _
                '    objControl.GetType.FullName = "Zelo.Luma.GUIButton" Then
                guiButton = CType(objControl, Zelo.Luma.GUIButton)
                guiButton.BackColorFaded1 = GlobalParameters.GUI_ColorPrimary2
                guiButton.BackColorFaded2 = GlobalParameters.GUI_ColorPrimary2
                guiButton.ForeColor = GlobalParameters.GUI_PrimaryForecolor
                guiButton.ForeColorDisabled = GlobalParameters.GUI_PrimaryForecolorDisabled
                guiButton.ShadowColor = GlobalParameters.GUI_ShadowColor
                guiButton.ShadowWidth = GlobalParameters.GUI_ShadowSize

                AddHandler guiButton.Click, AddressOf Key_ClickEventHandler
            End If
        Next

        guiBackground.BackColorFaded1 = GlobalParameters.GUI_ColorSecondary1
        guiBackground.BackColorFaded2 = GlobalParameters.GUI_ColorSecondary1
        guiBackground.ShadowColor = GlobalParameters.GUI_ShadowColor
        guiBackground.ShadowWidth = GlobalParameters.GUI_ShadowSize


        guiKeyDot.Text = Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.NumberDecimalSeparator
    End Sub

#End Region

#Region "Events Handlers"

    Private Sub Key_ClickEventHandler(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If sender Is guiKeyEnter Then
            If Single.IsInfinity(Me.Value) Then
                RaiseEvent KeyEsc(Me)
            Else
                RaiseEvent KeyEnter(Me)
            End If
        ElseIf sender Is guiKeyEscape Then
            RaiseEvent KeyEsc(Me)
        ElseIf sender Is guiKeyBack Then
            'RaiseEvent KeyBackspace(Me)
            If guiDisplay.Text.Length > 0 Then
                guiDisplay.Text = guiDisplay.Text.Substring(0, guiDisplay.Text.Length - 1)
            End If

            If guiDisplay.Text.Length > 0 Then
                m_sngValue = CSng(guiDisplay.Text)
            Else
                m_sngValue = 0
            End If
        Else
            'RaiseEvent KeyAnyKey(Me, CType(sender, GUIButton).Text.ToCharArray()(0))
            guiDisplay.Text &= CType(sender, GUIButton).Text.ToCharArray()(0)
            m_sngValue = CSng(guiDisplay.Text)
        End If

        guiKeyDot.Enabled = Me.AcceptDecimal And Not guiDisplay.Text.Contains(guiKeyDot.Text)
        guiKeyDot.Visible = Me.AcceptDecimal And Not guiDisplay.Text.Contains(guiKeyDot.Text)

    End Sub

    'Private Sub GUICalculator_KeyUp(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles Me.KeyUp
    '    Select Case e.KeyCode
    '        Case Keys.D0
    '            Key_ClickEventHandler(guiKey0, Nothing)
    '            e.Handled = True
    '        Case Keys.D1
    '            Key_ClickEventHandler(guiKey1, Nothing)
    '            e.Handled = True
    '        Case Keys.D2
    '            Key_ClickEventHandler(guiKey2, Nothing)
    '            e.Handled = True
    '        Case Keys.D3
    '            Key_ClickEventHandler(guiKey3, Nothing)
    '            e.Handled = True
    '        Case Keys.D4
    '            Key_ClickEventHandler(guiKey4, Nothing)
    '            e.Handled = True
    '        Case Keys.D5
    '            Key_ClickEventHandler(guiKey5, Nothing)
    '            e.Handled = True
    '        Case Keys.D6
    '            Key_ClickEventHandler(guiKey6, Nothing)
    '            e.Handled = True
    '        Case Keys.D7
    '            Key_ClickEventHandler(guiKey7, Nothing)
    '            e.Handled = True
    '        Case Keys.D8
    '            Key_ClickEventHandler(guiKey8, Nothing)
    '            e.Handled = True
    '        Case Keys.D9
    '            Key_ClickEventHandler(guiKey9, Nothing)
    '            e.Handled = True
    '        Case Keys.Decimal
    '            Key_ClickEventHandler(guiKeyDot, Nothing)
    '            e.Handled = True
    '        Case Keys.Escape
    '            Key_ClickEventHandler(guiKeyEnter, Nothing)
    '            e.Handled = True
    '        Case Keys.Enter
    '            Key_ClickEventHandler(guiKeyBack, Nothing)
    '            e.Handled = True
    '        Case Keys.Back
    '            Key_ClickEventHandler(guiKeyBack, Nothing)
    '            e.Handled = True
    '    End Select
    'End Sub

#End Region

#End Region

End Class
