Public Class GUIRegisterCross

#Region "Event"
    Public Shadows Event Click(ByVal sender As Object, ByVal e As System.EventArgs)
#End Region

#Region "Variables"
    Protected m_intRange As Integer = 100
    Protected m_intLongitudinal As Integer = 0
    Protected m_intLateral As Integer = 0
    Protected m_blnIsBaseColor As Boolean = False
#End Region


#Region "Properties"
    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(False)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property IsBaseColor() As Boolean
        Get
            Return m_blnIsBaseColor
        End Get
        Set(ByVal _blnIsBaseColor As Boolean)
            m_blnIsBaseColor = _blnIsBaseColor
            Me.PaintEx()
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(100)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Range() As Integer
        Get
            Return m_intRange
        End Get
        Set(ByVal _intRange As Integer)
            m_intRange = _intRange
            Me.PaintEx()
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(0)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Lateral() As Integer
        Get
            Return m_intLateral
        End Get
        Set(ByVal _intLateral As Integer)
            m_intLateral = _intLateral
            Me.PaintEx()
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(0)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property Longitudinal() As Integer
        Get
            Return m_intLongitudinal
        End Get
        Set(ByVal _intLongitudinal As Integer)
            m_intLongitudinal = _intLongitudinal
            Me.PaintEx()
        End Set
    End Property
#End Region

#Region "Methods"

    Protected Sub PaintEx()
        Dim dblX As Double
        Dim dblY As Double

        picBall.Visible = Me.Enabled And Not Me.IsBaseColor
        picIconTop.Visible = Me.Enabled And Not Me.IsBaseColor
        picIconBottom.Visible = Me.Enabled And Not Me.IsBaseColor
        picIconLeft.Visible = Me.Enabled And Not Me.IsBaseColor
        picIconRight.Visible = Me.Enabled And Not Me.IsBaseColor


        If IsBaseColor Or Not Me.Enabled Then
            Return
        End If

        dblX = (pnlMain.Width / 2) + ((pnlMain.Width / (Me.Range * 2)) * Me.Longitudinal)

        dblY = (pnlMain.Height / 2) + ((pnlMain.Height / (Me.Range * 2)) * Me.Lateral)

        If Me.Longitudinal = 0 And Me.Lateral = 0 Then
            Me.picBall.Image = Global.Zelo.Luma.My.Resources.Resources.greenStar
        Else
            Me.picBall.Image = Global.Zelo.Luma.My.Resources.Resources.redStar
        End If

        dblX -= picBall.Width / 2
        dblY -= picBall.Height / 2

        picBall.Location = New Point(CInt(dblX), CInt(dblY))

    End Sub

    Private Sub tblMain_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles tblMain.Click
        RaiseEvent Click(sender, e)
    End Sub

    Private Sub picBall_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles picBall.Click
        RaiseEvent Click(sender, e)
    End Sub

#End Region

End Class
