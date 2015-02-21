' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class GUIKeyboard
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Protected m_blnUpper As Boolean
    Protected m_blnNumeric As Boolean
#End Region

#Region "Events"
    Public Event KeyEnter(ByRef _objSender As Object)
    Public Event KeyEsc(ByRef _objSender As Object)
    Public Event KeyBackspace(ByRef _objSender As Object)
    Public Event KeyAnyKey(ByRef _objSender As Object, ByVal _objChar As Char)
#End Region

#Region "Properties"

#End Region

#Region "Methods"

#Region "Public Methods"

    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        AddHandlers()

        m_blnUpper = True
        m_blnNumeric = False
    End Sub

#End Region

#Region "Protected Methods"

    Protected Sub AddHandlers()
        Dim objControl As Control
        Dim guiButton As GUIButton
        For Each objControl In Me.Controls
            If objControl.GetType.FullName = "Zelo.Luma.GUIButton" Then
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

        guirecBackground.BackColorFaded1 = GlobalParameters.GUI_ColorSecondary1
        guirecBackground.BackColorFaded2 = GlobalParameters.GUI_ColorSecondary1
        guirecBackground.ShadowColor = GlobalParameters.GUI_ShadowColor
        guirecBackground.ShadowWidth = GlobalParameters.GUI_ShadowSize

    End Sub

#End Region

#Region "Events Handlers"

    Private Sub Key_ClickEventHandler(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If sender Is guiKeyEnter Then
            RaiseEvent KeyEnter(Me)
        ElseIf sender Is guiKeyEsc Then
            RaiseEvent KeyEsc(Me)
        ElseIf sender Is guiKeyBack Then
            RaiseEvent KeyBackspace(Me)
        ElseIf sender Is guiKeyShift Then
            If m_blnUpper Then
                guiKeyQ.Text = guiKeyQ.Text.ToLower
                guiKeyW.Text = guiKeyW.Text.ToLower
                guiKeyE.Text = guiKeyE.Text.ToLower
                guiKeyR.Text = guiKeyR.Text.ToLower
                guiKeyT.Text = guiKeyT.Text.ToLower
                guiKeyY.Text = guiKeyY.Text.ToLower
                guiKeyU.Text = guiKeyU.Text.ToLower
                guiKeyI.Text = guiKeyI.Text.ToLower
                guiKeyO.Text = guiKeyO.Text.ToLower
                guiKeyP.Text = guiKeyP.Text.ToLower
                guiKeyA.Text = guiKeyA.Text.ToLower
                guiKeyS.Text = guiKeyS.Text.ToLower
                guiKeyD.Text = guiKeyD.Text.ToLower
                guiKeyF.Text = guiKeyF.Text.ToLower
                guiKeyG.Text = guiKeyG.Text.ToLower
                guiKeyH.Text = guiKeyH.Text.ToLower
                guiKeyJ.Text = guiKeyJ.Text.ToLower
                guiKeyK.Text = guiKeyK.Text.ToLower
                guiKeyL.Text = guiKeyL.Text.ToLower
                guiKeyZ.Text = guiKeyZ.Text.ToLower
                guiKeyX.Text = guiKeyX.Text.ToLower
                guiKeyC.Text = guiKeyC.Text.ToLower
                guiKeyV.Text = guiKeyV.Text.ToLower
                guiKeyB.Text = guiKeyB.Text.ToLower
                guiKeyN.Text = guiKeyN.Text.ToLower
                guiKeyM.Text = guiKeyM.Text.ToLower
            Else
                guiKeyQ.Text = guiKeyQ.Text.ToUpper
                guiKeyW.Text = guiKeyW.Text.ToUpper
                guiKeyE.Text = guiKeyE.Text.ToUpper
                guiKeyR.Text = guiKeyR.Text.ToUpper
                guiKeyT.Text = guiKeyT.Text.ToUpper
                guiKeyY.Text = guiKeyY.Text.ToUpper
                guiKeyU.Text = guiKeyU.Text.ToUpper
                guiKeyI.Text = guiKeyI.Text.ToUpper
                guiKeyO.Text = guiKeyO.Text.ToUpper
                guiKeyP.Text = guiKeyP.Text.ToUpper
                guiKeyA.Text = guiKeyA.Text.ToUpper
                guiKeyS.Text = guiKeyS.Text.ToUpper
                guiKeyD.Text = guiKeyD.Text.ToUpper
                guiKeyF.Text = guiKeyF.Text.ToUpper
                guiKeyG.Text = guiKeyG.Text.ToUpper
                guiKeyH.Text = guiKeyH.Text.ToUpper
                guiKeyJ.Text = guiKeyJ.Text.ToUpper
                guiKeyK.Text = guiKeyK.Text.ToUpper
                guiKeyL.Text = guiKeyL.Text.ToUpper
                guiKeyZ.Text = guiKeyZ.Text.ToUpper
                guiKeyX.Text = guiKeyX.Text.ToUpper
                guiKeyC.Text = guiKeyC.Text.ToUpper
                guiKeyV.Text = guiKeyV.Text.ToUpper
                guiKeyB.Text = guiKeyB.Text.ToUpper
                guiKeyN.Text = guiKeyN.Text.ToUpper
                guiKeyM.Text = guiKeyM.Text.ToUpper
            End If

            m_blnUpper = Not m_blnUpper


        ElseIf sender Is guiKeyNumeric Then
            m_blnNumeric = Not m_blnNumeric
            guiKey1.Visible = m_blnNumeric
            guiKey2.Visible = m_blnNumeric
            guiKey3.Visible = m_blnNumeric
            guiKey4.Visible = m_blnNumeric
            guiKey5.Visible = m_blnNumeric
            guiKey6.Visible = m_blnNumeric
            guiKey7.Visible = m_blnNumeric
            guiKey8.Visible = m_blnNumeric
            guiKey9.Visible = m_blnNumeric
            guiKey0.Visible = m_blnNumeric
            guiKeyQ.Visible = Not m_blnNumeric
            guiKeyW.Visible = Not m_blnNumeric
            guiKeyE.Visible = Not m_blnNumeric
            guiKeyR.Visible = Not m_blnNumeric
            guiKeyT.Visible = Not m_blnNumeric
            guiKeyY.Visible = Not m_blnNumeric
            guiKeyU.Visible = Not m_blnNumeric
            guiKeyI.Visible = Not m_blnNumeric
            guiKeyO.Visible = Not m_blnNumeric
            guiKeyP.Visible = Not m_blnNumeric
            guiKeyA.Visible = Not m_blnNumeric
            guiKeyS.Visible = Not m_blnNumeric
            guiKeyD.Visible = Not m_blnNumeric
            guiKeyF.Visible = Not m_blnNumeric
            guiKeyG.Visible = Not m_blnNumeric
            guiKeyH.Visible = Not m_blnNumeric
            guiKeyJ.Visible = Not m_blnNumeric
            guiKeyK.Visible = Not m_blnNumeric
            guiKeyL.Visible = Not m_blnNumeric
            guiKeyZ.Visible = Not m_blnNumeric
            guiKeyX.Visible = Not m_blnNumeric
            guiKeyC.Visible = Not m_blnNumeric
            guiKeyV.Visible = Not m_blnNumeric
            guiKeyB.Visible = Not m_blnNumeric
            guiKeyN.Visible = Not m_blnNumeric
            guiKeyM.Visible = Not m_blnNumeric
            guiKeyShift.Visible = Not m_blnNumeric
            'guiKeySpace.Visible = not m_blnNumeric

        ElseIf sender Is guiKeySpace Then
            RaiseEvent KeyAnyKey(Me, " "c)
        Else
            RaiseEvent KeyAnyKey(Me, CType(sender, GUIButton).Text.ToCharArray()(0))
        End If
    End Sub

#End Region

#End Region






End Class
