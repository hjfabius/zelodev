Public Class MeshconMark
    Implements IMark

    Protected m_arobjMarks As List(Of Mark)



    Public Property Marks() As List(Of Mark) Implements IMark.Marks
        Get
            Return m_arobjMarks
        End Get
        Set(ByVal _arobjMarks As List(Of Mark))
            m_arobjMarks = _arobjMarks
            Me.Invalidate()
        End Set
    End Property

    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        'm_arobjMarks = New List(Of Mark)
    End Sub

    Private Sub MashComMark_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Me.Paint
        Dim objMark As Mark
        Dim i As Integer

        If Not m_arobjMarks Is Nothing AndAlso _
            m_arobjMarks.Count > 0 Then

            For i = 0 To m_arobjMarks.Count - 1
                objMark = m_arobjMarks(i)
                If i = 0 Then
                    If objMark.Active Then
                        guiBaseMark1.Color = objMark.Color
                        guiBaseMark2.Color = objMark.Color
                        guiBaseMark3.Color = objMark.Color
                        guiBaseMark4.Color = objMark.Color
                        guiBaseMark5.Color = objMark.Color
                        guiBaseMark6.Color = objMark.Color
                        guiBaseMark7.Color = objMark.Color
                        guiBaseMark8.Color = objMark.Color
                    Else
                        guiBaseMark1.Color = Color.Transparent
                        guiBaseMark2.Color = Color.Transparent
                        guiBaseMark3.Color = Color.Transparent
                        guiBaseMark4.Color = Color.Transparent
                        guiBaseMark5.Color = Color.Transparent
                        guiBaseMark6.Color = Color.Transparent
                        guiBaseMark7.Color = Color.Transparent
                        guiBaseMark8.Color = Color.Transparent
                    End If
                Else
                    If objMark.Active Then
                        CType(Me.Controls("guiMark" & i), SingleMark).Color = objMark.Color
                    Else
                        CType(Me.Controls("guiMark" & i), SingleMark).Color = Color.Transparent
                    End If
                End If
            Next
        End If
    End Sub

End Class
