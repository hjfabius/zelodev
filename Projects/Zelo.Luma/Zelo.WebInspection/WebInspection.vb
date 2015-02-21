' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class WebInspection
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Protected m_intAngle As Integer = 0
    Protected m_intZoom As Integer = 10
    Protected m_intNewIndex As Integer = 0
#End Region

#Region "Events"

#End Region

#Region "Properties"

#End Region

#Region "Methods"

#Region "Public Methods"
    Public Overrides Sub LoadData()
        MyBase.LoadData()

        If Not Me.Demo Is Nothing Then
            AddHandler m_objDemo.InLineGuideMoved, AddressOf InLineGuideMovedEventHandler
        End If
    End Sub
#End Region

#Region "Protected Methods"
    Protected Sub UpdateImage()
        Dim objImage As Image
        Dim strPath As String

        strPath = String.Format("\Images\{0}\{1}\{2}.JPG", m_intAngle.ToString, m_intZoom.ToString, (m_intNewIndex + 1).ToString("00"))
        strPath = Application.StartupPath & strPath

        If System.IO.File.Exists(strPath) Then
            objImage = New Bitmap(strPath)
            picCameraImage.Image = objImage
        Else
            picCameraImage.Image = Nothing
        End If
    End Sub

#End Region

#Region "Events Handlers"

    Protected Sub InLineGuideMovedEventHandler(ByRef _objSender As Object, ByVal _intNewPosition As Integer, ByVal _intNewIndex As Integer)
        m_intNewIndex = _intNewIndex
        UpdateImage()
    End Sub

    Private Sub WebInspection_Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Disposed
        If Not Me.Demo Is Nothing Then
            RemoveHandler m_objDemo.InLineGuideMoved, AddressOf InLineGuideMovedEventHandler
        End If
    End Sub


    Private Sub cmdRotate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdRotate.Click
        m_intAngle = (m_intAngle + 90) Mod 360
        If Not Me.InLineGuide Is Nothing AndAlso _
            Not Me.InLineGuide.IsMoving Then
            CameraConnector.Flash()
            UpdateImage()
        End If
    End Sub

    Private Sub cmdZoomIn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdZoomIn.Click
        m_intZoom = Math.Min(m_intZoom + 10, 50)
        If Not Me.InLineGuide Is Nothing AndAlso _
            Not Me.InLineGuide.IsMoving Then
            CameraConnector.Flash()
            UpdateImage()
        End If
    End Sub

    Private Sub cmdZoomOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdZoomOut.Click
        m_intZoom = Math.Max(m_intZoom - 10, 10)
        If Not Me.InLineGuide Is Nothing AndAlso _
            Not Me.InLineGuide.IsMoving Then
            CameraConnector.Flash()
            UpdateImage()
        End If
    End Sub

    Private Sub cmdZoom100_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdZoom100.Click
        m_intZoom = 10
        If Not Me.InLineGuide Is Nothing AndAlso _
            Not Me.InLineGuide.IsMoving Then
            CameraConnector.Flash()
            UpdateImage()
        End If
    End Sub

    Private Sub cmdMoveLeft_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles cmdMoveLeft.MouseDown
        If Me.Demo.DemoWebInspection Then
            GUIMessageBox.ShowOkOnly("Functionality not available in demo mode", "Web Inspection")
        Else
            If Not Me.InLineGuide Is Nothing Then
                m_objInLineGuide.MoveLeft()
            End If
        End If
    End Sub

    Private Sub cmdMoveLeft_MouseLeave(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdMoveLeft.MouseLeave
        If Not Me.InLineGuide Is Nothing AndAlso _
            Me.Demo.DemoWebInspection Then
            m_objInLineGuide.Stop()
            CameraConnector.Flash()
        End If
    End Sub

    Private Sub cmdMoveLeft_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles cmdMoveLeft.MouseUp
        If Not Me.InLineGuide Is Nothing AndAlso _
            Not Me.Demo.DemoWebInspection Then
            m_objInLineGuide.Stop()
            CameraConnector.Flash()
        End If
    End Sub

    Private Sub cmdMoveRight_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles cmdMoveRight.MouseDown
        If Me.Demo.DemoWebInspection Then
            GUIMessageBox.ShowOkOnly("Functionality not available in demo mode", "Web Inspection")
        Else
            If Not Me.InLineGuide Is Nothing Then
                m_objInLineGuide.MoveRight()
            End If
        End If
    End Sub

    Private Sub cmdMoveRight_MouseLeave(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdMoveRight.MouseLeave
        If Not Me.InLineGuide Is Nothing AndAlso _
            Not Me.Demo.DemoWebInspection Then
            m_objInLineGuide.Stop()
            CameraConnector.Flash()
        End If
    End Sub

    Private Sub cmdMoveRight_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles cmdMoveRight.MouseUp
        If Not Me.InLineGuide Is Nothing AndAlso _
            Not Me.Demo.DemoWebInspection Then
            m_objInLineGuide.Stop()
            CameraConnector.Flash()
        End If
    End Sub

    Private Sub cmdMoveP1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveP1.Click
        If Me.Demo.DemoWebInspection Then
            GUIMessageBox.ShowOkOnly("Functionality not available in demo mode", "Web Inspection")
        Else
            If Not Me.InLineGuide Is Nothing Then
                m_objInLineGuide.MoveTo(11000)
                CameraConnector.Flash()
            End If
        End If
    End Sub

    Private Sub cmdMoveP2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveP2.Click
        If Me.Demo.DemoWebInspection Then
            GUIMessageBox.ShowOkOnly("Functionality not available in demo mode", "Web Inspection")
        Else
            If Not Me.InLineGuide Is Nothing Then
                m_objInLineGuide.MoveTo(6000)
                CameraConnector.Flash()
            End If
        End If
    End Sub

    Private Sub cmdMoveP3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveP3.Click
        If Me.Demo.DemoWebInspection Then
            GUIMessageBox.ShowOkOnly("Functionality not available in demo mode", "Web Inspection")
        Else
            If Not Me.InLineGuide Is Nothing Then
                m_objInLineGuide.MoveTo(5000)
                CameraConnector.Flash()
            End If
        End If
    End Sub

    Private Sub cmdMoveP4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveP4.Click
        If Me.Demo.DemoWebInspection Then
            GUIMessageBox.ShowOkOnly("Functionality not available in demo mode", "Web Inspection")
        Else
            If Not Me.InLineGuide Is Nothing Then
                m_objInLineGuide.MoveTo(2000)
                CameraConnector.Flash()
            End If
        End If
    End Sub

    Private Sub cmdMoveP5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveP5.Click
        If Me.Demo.DemoWebInspection Then
            GUIMessageBox.ShowOkOnly("Functionality not available in demo mode", "Web Inspection")
        Else
            If Not Me.InLineGuide Is Nothing Then
                m_objInLineGuide.MoveTo(1000)
                CameraConnector.Flash()
            End If
        End If
    End Sub

    Private Sub cmdMoveP6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveP6.Click
        If Me.Demo.DemoWebInspection Then
            GUIMessageBox.ShowOkOnly("Functionality not available in demo mode", "Web Inspection")
        Else
            If Not Me.InLineGuide Is Nothing Then
                m_objInLineGuide.MoveTo(1000)
                CameraConnector.Flash()
            End If
        End If
    End Sub
#End Region

#End Region

End Class
