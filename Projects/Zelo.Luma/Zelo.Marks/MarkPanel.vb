Public Class MarkPanel

#Region "Variables"
    Protected m_enmMarkType As MarkType
    Protected m_objMark As IMark
    Protected m_arobjMarks As List(Of Mark)
    Protected m_arobjCurrentMarks As List(Of Mark)
    Protected m_objMarkColor As Color = Color.Red
    Protected m_intSelectedMark As Integer = Integer.MinValue
    Protected m_intOriginalSelectedMark As Integer = Integer.MinValue
#End Region

#Region "Events"
    Event KeyOkClick_Event(ByRef sender As Object)
    Event KeyCancelClick_Event(ByRef sender As Object)
#End Region

#Region "Properties"

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue("Color.Red")> _
    Public Property MarkColor() As Color
        Get
            Return m_objMarkColor
        End Get
        Set(ByVal _objMarkColor As Color)
            m_objMarkColor = _objMarkColor
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    Public Property SelectedMark() As Integer
        Get
            Return m_intSelectedMark
        End Get
        Set(ByVal _intSelectedMark As Integer)
            Dim objButton As GUIButton
            Dim objControl As Control
            If m_intSelectedMark = Integer.MinValue Then
                m_intOriginalSelectedMark = _intSelectedMark
            End If
            m_intSelectedMark = _intSelectedMark

            For Each objControl In Me.Controls
                If objControl.Name.StartsWith("cmdKey") Then
                    objButton = CType(objControl, GUIButton)
                    If objButton.Name = "cmdKey" & m_intSelectedMark Then
                        objButton.ShadowColor = GlobalParameters.GUI_ShadowColorSelected
                    Else
                        objButton.ShadowColor = GlobalParameters.GUI_ShadowColor
                    End If
                End If
            Next


            UpdateMarks()

        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.Browsable(True)> _
    Public Property MarkType() As MarkType
        Get
            Return m_enmMarkType
        End Get
        Set(ByVal _enmMarkType As MarkType)
            m_enmMarkType = _enmMarkType

            If Not m_objMark Is Nothing Then
                CType(m_objMark, UserControl).Dispose()
            End If

            Select Case m_enmMarkType
                Case Luma.MarkType.InLineMark
                    m_objMark = New InLineMark
                    cmdKey9.Enabled = False
                    cmdKey10.Enabled = False
                    cmdKey11.Enabled = False
                    cmdKey12.Enabled = False

                Case Luma.MarkType.MeshConMark
                    m_objMark = New MeshconMark
                    cmdKey9.Enabled = True
                    cmdKey10.Enabled = True
                    cmdKey11.Enabled = True
                    cmdKey12.Enabled = True
                Case Luma.MarkType.InLineRotoMark
                    m_objMark = New InLineRotoMark
                    cmdKey9.Enabled = False
                    cmdKey10.Enabled = False
                    cmdKey11.Enabled = False
                    cmdKey12.Enabled = False

            End Select

            With CType(m_objMark, UserControl)
                .Parent = pnlMark
                .Location = New Point(0, 0)
                .BackColor = Me.BackColor
                .Visible = True
            End With

            UpdateMarks()

        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.Browsable(False)> _
    Public Property Marks() As List(Of Mark)
        Get
            Return m_arobjMarks
        End Get
        Set(ByVal _arobjMarks As List(Of Mark))
            m_arobjMarks = _arobjMarks
            UpdateMarks()
        End Set
    End Property

#End Region

#Region "Methods"

    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        AddHandler cmdKey1.Click, AddressOf KeyButton_Click
        AddHandler cmdKey2.Click, AddressOf KeyButton_Click
        AddHandler cmdKey3.Click, AddressOf KeyButton_Click
        AddHandler cmdKey4.Click, AddressOf KeyButton_Click
        AddHandler cmdKey5.Click, AddressOf KeyButton_Click
        AddHandler cmdKey6.Click, AddressOf KeyButton_Click
        AddHandler cmdKey7.Click, AddressOf KeyButton_Click
        AddHandler cmdKey8.Click, AddressOf KeyButton_Click
        AddHandler cmdKey9.Click, AddressOf KeyButton_Click
        AddHandler cmdKey10.Click, AddressOf KeyButton_Click
        AddHandler cmdKey11.Click, AddressOf KeyButton_Click
        AddHandler cmdKey12.Click, AddressOf KeyButton_Click
    End Sub

    Protected Sub UpdateMarks()
        Dim objMark As Mark
        Dim I As Integer

        If Not m_arobjCurrentMarks Is Nothing Then
            m_arobjCurrentMarks.Clear()
        End If

        m_arobjCurrentMarks = New List(Of Mark)
        If Not m_arobjMarks Is Nothing Then
            For I = 1 To m_arobjMarks.Count
                objMark = New Mark
                If (I = Me.SelectedMark) And (I = m_intOriginalSelectedMark) Then
                    objMark.Active = True
                    objMark.Color = Me.MarkColor
                ElseIf (I = m_intOriginalSelectedMark) Then
                    objMark.Active = True
                    objMark.Color = Color.Transparent
                ElseIf (I = SelectedMark) Then
                    objMark.Active = True
                    objMark.Color = Me.MarkColor
                Else
                    objMark.Color = m_arobjMarks(I - 1).Color
                    objMark.Active = m_arobjMarks(I - 1).Active
                End If
                m_arobjCurrentMarks.Add(objMark)
            Next
        End If

        If Not m_objMark Is Nothing Then
            m_objMark.Marks = m_arobjCurrentMarks
        End If
        m_arobjCurrentMarks = Nothing
    End Sub

    Private Sub cmdKeyOk_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdKeyOk.Click
        RaiseEvent KeyOkClick_Event(Me)
    End Sub

    Private Sub cmdKeyEsc_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdKeyEsc.Click
        RaiseEvent KeyCancelClick_Event(Me)
    End Sub

    Private Sub KeyButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.SelectedMark = CInt(CType(sender, GUIButton).Tag)
        UpdateMarks()
        Me.Invalidate()
    End Sub

    Private Sub MarkPanel_Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Disposed
        RemoveHandler cmdKey1.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey2.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey3.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey4.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey5.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey6.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey7.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey8.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey9.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey10.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey11.Click, AddressOf KeyButton_Click
        RemoveHandler cmdKey12.Click, AddressOf KeyButton_Click
    End Sub

#End Region

End Class
