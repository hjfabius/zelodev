' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class CurrentJobDensityControl
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Protected m_intNewIndex As Integer = 0
#End Region

#Region "Events"

#End Region

#Region "Properties"

#End Region

#Region "Methods"

#Region "Public Methods"

    Public Overrides Sub LoadData()
        Dim I As Integer
        Dim drGroup As DSJobs.GroupsRow
        Dim guiDensiMultibarEx As GUIDensiMultibarEx

        If Not Me.Demo Is Nothing And Not Me.Demo.InLineGuide Is Nothing Then
            AddHandler m_objDemo.InLineGuideMoved, AddressOf InLineGuideMovedEventHandler
        End If



        For I = 1 To 12
            drGroup = MyBase.JobsManager.GroupByNumber(I)
            guiDensiMultibarEx = CType(Me.Controls("GUIDensiMultibarEx" & I), GUIDensiMultibarEx)
            If drGroup Is Nothing Then
                guiDensiMultibarEx.GroupRow = Nothing
            Else
                guiDensiMultibarEx.GroupRow = drGroup
                AddHandler guiDensiMultibarEx.Click, AddressOf GuiDensiMultibarEx_Click
            End If
        Next


    End Sub

#End Region

#Region "Protected Methods"
    Protected Sub UpdateData()
    End Sub
#End Region

#Region "Events Handlers"

    Protected Sub InLineGuideMovedEventHandler(ByRef _objSender As Object, ByVal _intNewPosition As Integer, ByVal _intNewIndex As Integer)
        'Me.Demo
        'CameraConnector.Flash()
        'm_intNewIndex = _intNewIndex
        'UpdateData()
    End Sub

    Private Sub Densitometer_Disposed(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not Me.Demo Is Nothing Then
            RemoveHandler m_objDemo.InLineGuideMoved, AddressOf InLineGuideMovedEventHandler
        End If
    End Sub

    Private Sub GuiDensiMultibarEx_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        GlobalParameters.N_Tag = CType(sender, GUIDensiMultibarEx).GroupRow
        Me.NavigationManager.SetMainPage(NavigationPages.DensityControlPageDetail)
    End Sub

#End Region

#End Region

End Class
