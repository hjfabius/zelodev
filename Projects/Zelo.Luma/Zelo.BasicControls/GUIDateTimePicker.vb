Public Class GUIDateTimePicker

    Public Event KeyEnter(ByRef _objSender As Object, ByVal _intMonth As Integer, ByVal _intYear As Integer)
    Public Event KeyEsc(ByRef _objSender As Object)

    Protected m_intYear As Integer
    Protected m_intMonth As Integer

    Public Property Month() As Integer
        Get
            Return m_intMonth
        End Get
        Set(ByVal _intMonth As Integer)
            Dim objControl As Control
            Dim objButton As GUIButton
            m_intMonth = _intMonth

            For Each objControl In Me.Controls
                If objControl.Name.StartsWith("cmdMonth") Then
                    objButton = CType(objControl, GUIButton)
                    If Not objControl.Tag Is Nothing AndAlso _
                        CInt(objControl.Tag) = m_intMonth Then
                        objButton.ShadowColor = GlobalParameters.GUI_ShadowColorSelected
                    Else
                        objButton.ShadowColor = GlobalParameters.GUI_ShadowColor
                    End If
                End If
            Next
        End Set
    End Property

    Public Property Year() As Integer
        Get
            Return m_intYear
        End Get
        Set(ByVal _intYear As Integer)
            Dim objControl As Control
            Dim objButton As GUIButton
            m_intYear = _intYear

            For Each objControl In Me.Controls
                If objControl.Name.StartsWith("cmdYear") Then
                    objButton = CType(objControl, GUIButton)
                    If Not objControl.Tag Is Nothing AndAlso _
                        CInt(objControl.Tag) = m_intYear Then
                        objButton.ShadowColor = GlobalParameters.GUI_ShadowColorSelected
                    Else
                        objButton.ShadowColor = GlobalParameters.GUI_ShadowColor
                    End If
                End If
            Next
        End Set
    End Property

    Private Sub guiKeyEsc_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles guiKeyEsc.Click
        RaiseEvent KeyEsc(Me)
    End Sub

    Private Sub guiKeyEnter_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles guiKeyEnter.Click
        RaiseEvent KeyEnter(Me, Me.Month, Me.Year)
    End Sub

    Private Sub GUIDateTimePicker_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Me.Month = Date.Now.Month
        'Me.Year = Date.Now.Year

        AddHandler cmdMonth01.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth02.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth03.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth04.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth05.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth06.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth07.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth08.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth09.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth10.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth11.Click, AddressOf cmdMonth_Click
        AddHandler cmdMonth12.Click, AddressOf cmdMonth_Click

        AddHandler cmdYear2005.Click, AddressOf cmdYear_Click
        AddHandler cmdYear2006.Click, AddressOf cmdYear_Click
        AddHandler cmdYear2007.Click, AddressOf cmdYear_Click
        AddHandler cmdYear2008.Click, AddressOf cmdYear_Click
        AddHandler cmdYear2009.Click, AddressOf cmdYear_Click
        AddHandler cmdYear2010.Click, AddressOf cmdYear_Click
        AddHandler cmdYear2011.Click, AddressOf cmdYear_Click
        AddHandler cmdYear2012.Click, AddressOf cmdYear_Click
        AddHandler cmdYear2013.Click, AddressOf cmdYear_Click
    End Sub

    Private Sub cmdMonth_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.Month = CInt(CType(sender, GUIButton).Tag)
    End Sub

    Private Sub cmdYear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.Year = CInt(CType(sender, GUIButton).Tag)
    End Sub
End Class
