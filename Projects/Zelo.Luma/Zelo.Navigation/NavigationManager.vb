Imports System.Reflection

' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class NavigationManager
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Private m_blnDisposedValue As Boolean = False        ' To detect redundant calls
    Private m_dsNavigation As DSNavigation
    Private m_objPageStack As Stack(Of NavigationPages)
    Protected m_objInLineGuide As InLineGuide
    Protected m_objCameraConnector As CameraConnector
    Protected m_objDemo As Demo
#End Region

#Region "Events"
    Public Event MainPageChanged(ByRef _objSender As Object, ByRef _objMainPage As MainPage, ByRef _blnCanceled As Boolean)
#End Region

#Region "Properties"
    Public Property CameraConnector() As CameraConnector
        Get
            Return m_objCameraConnector
        End Get
        Set(ByVal _objCameraConnector As CameraConnector)
            m_objCameraConnector = _objCameraConnector
        End Set
    End Property
#End Region

#Region "Methods"

#Region "Public Methods"
    Public Sub New()
        Dim drNavigation As DSNavigation.NavigationRow
        m_dsNavigation = New DSNavigation
        m_dsNavigation.BeginInit()
        If System.IO.File.Exists(GlobalParameters.BLL_DSNavigationFilename) Then
            m_dsNavigation.ReadXml(GlobalParameters.BLL_DSNavigationFilename, XmlReadMode.ReadSchema)
        Else
            drNavigation = CType(m_dsNavigation.Navigation.NewRow(), DSNavigation.NavigationRow)
            drNavigation.NavigationID = CType(NavigationPages.MenuPage, Short)
            drNavigation.NavigationTitle = "Menù"
            drNavigation.NavigationAssembly = "Zelo.Navigation"
            drNavigation.NavigationClass = "Zelo.Luma.MenuPage"
            drNavigation.NavigationClientVisible = True
            drNavigation.NavigationProjectVisible = True
            m_dsNavigation.Navigation.Rows.Add(drNavigation)

            m_dsNavigation.WriteXml(GlobalParameters.BLL_DSNavigationFilename, XmlWriteMode.WriteSchema)
        End If
        m_dsNavigation.EndInit()

        m_objPageStack = New Stack(Of NavigationPages)
        InitInLineGuide()
        m_objDemo = New Demo
        m_objDemo.InLineGuide = m_objInLineGuide
    End Sub


#Region " IDisposable Support "
    ' This code added by Visual Basic to correctly implement the disposable pattern.
    Public Sub Dispose() Implements IDisposable.Dispose
        ' Do not change this code.  Put cleanup code in Dispose(ByVal disposing As Boolean) above.
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub
#End Region

    Public Sub SetMainPage(ByVal _enmNavigationID As NavigationPages)
        Dim objMainPage As MainPage
        Dim objRuntimeClass As Object
        Dim objAssembly As Reflection.Assembly
        Dim ardrNavigation As DSNavigation.NavigationRow()
        Dim blnCanceled As Boolean

        If _enmNavigationID = NavigationPages.None Then
            Return
        End If

        Try
            ardrNavigation = CType(m_dsNavigation.Navigation.Select("NavigationID=" & _enmNavigationID), DSNavigation.NavigationRow())
            If ardrNavigation Is Nothing OrElse ardrNavigation.Length = 0 Then
                Throw New Exception("Navigation page " & _enmNavigationID & "(Navigation ID) not found")
            End If

            If ardrNavigation(0).NavigationAssembly Is Nothing OrElse _
                    ardrNavigation(0).NavigationAssembly.Length = 0 OrElse _
                    ardrNavigation(0).NavigationClass Is Nothing OrElse _
                    ardrNavigation(0).NavigationClass.Length = 0 Then
                Throw New Exception("Navigation Page (" & _enmNavigationID & ") not correctly filled")
            End If

            'If Not IO.File.Exists(ardrNavigation(0).NavigationAssembly) Then
            '    Throw New Exception("Impossible to find """ & ardrNavigation(0).NavigationAssembly & """ file")
            'End If

            Try
                objAssembly = Reflection.Assembly.Load(ardrNavigation(0).NavigationAssembly)
                If objAssembly Is Nothing Then
                    Throw New Exception("Impossible to create """ & ardrNavigation(0).NavigationAssembly & """ assembly")
                End If

                objRuntimeClass = objAssembly.CreateInstance(ardrNavigation(0).NavigationClass)

                If objRuntimeClass Is Nothing Then
                    Throw New Exception
                End If
            Catch ex As Exception
                Throw New Exception("Impossible to create """ & ardrNavigation(0).NavigationClass & """ instance", ex)
            End Try

            objMainPage = CType(objRuntimeClass, MainPage)

            'm_objDemo.DemoRegister = (_enmNavigationID = NavigationPages.RegisterControlPage) Or _
            '(_enmNavigationID = NavigationPages.RegisterControlPageDetail) Or _
            '(_enmNavigationID = NavigationPages.RegisterControlParameter) Or _
            '(_enmNavigationID = NavigationPages.RegisterViscosityControlPage) Or _
            '(_enmNavigationID = NavigationPages.RegisterViscosityControlPageDetail) Or _
            '(_enmNavigationID = NavigationPages.RegisterViscosityControlParameter)

            'm_objDemo.DemoDensitometer = Not m_objDemo.DemoRegister


            objMainPage.MainPageID = _enmNavigationID
            objMainPage.ClientVisible = ardrNavigation(0).NavigationClientVisible
            objMainPage.ProjectVisible = ardrNavigation(0).NavigationProjectVisible
            objMainPage.Title = ardrNavigation(0).NavigationTitle
            objMainPage.InLineGuide = m_objInLineGuide
            objMainPage.CameraConnector = m_objCameraConnector
            objMainPage.Demo = m_objDemo
            objMainPage.DebugInfo = " Assembly=" & objAssembly.GetName.Name & _
                                    " Version=" & objAssembly.GetName.Version.ToString & _
                                    " Class=" & ardrNavigation(0).NavigationClass
            objAssembly = Nothing


            RaiseEvent MainPageChanged(Me, objMainPage, blnCanceled)
            If Not blnCanceled Then
                If m_objPageStack.Count = 0 OrElse _
                    Not _enmNavigationID = m_objPageStack.Peek Then
                    m_objPageStack.Push(_enmNavigationID)
                End If
            End If

        Catch ex As Exception
            objMainPage = New ErrorPage
            objMainPage.ProjectVisible = False
            objMainPage.ClientVisible = False
            objMainPage.Title = ""
            CType(objMainPage, ErrorPage).Exception = ex
            RaiseEvent MainPageChanged(Me, objMainPage, blnCanceled)
        End Try

    End Sub

    Public Sub Home()
        Me.SetMainPage(NavigationPages.MenuPage)
    End Sub

    Public Sub Back()
        If m_objPageStack.Count > 1 Then
            m_objPageStack.Pop()
            Me.SetMainPage(m_objPageStack.Peek)
        End If
    End Sub

#End Region

#Region "Protected Methods"

    Protected Sub InitInLineGuide()
        Dim enmSerialPort As SerialPort
        Dim blnFound As Boolean = False

        m_objInLineGuide = New InLineGuide

        For enmSerialPort = SerialPort.Com1 To SerialPort.Com8
            Try
                m_objInLineGuide.Open(1, enmSerialPort, BaudRate.BaudRate57600, True)
                blnFound = True
                Exit For
            Catch ex As Exception

            End Try
        Next
        If blnFound Then
            m_objInLineGuide.MaxSpeed = InLineGuideParameter.Speed
            m_objInLineGuide.MaxSpeedOnGoTo = InLineGuideParameter.MaxSpeed
            m_objInLineGuide.GuideLength = InLineGuideParameter.GuideLength
            m_objInLineGuide.HomingRight()
        Else
            m_objInLineGuide.Dispose()
            m_objInLineGuide = Nothing
        End If
    End Sub

    ' IDisposable
    Protected Overridable Sub Dispose(ByVal disposing As Boolean)
        If Not Me.m_blnDisposedValue Then
            If disposing Then
                ' TODO: free unmanaged resources when explicitly called
                If Not m_dsNavigation Is Nothing Then
                    m_dsNavigation.Dispose()
                    m_dsNavigation = Nothing
                End If

                If Not m_objInLineGuide Is Nothing Then
                    m_objInLineGuide.Close()
                    m_objInLineGuide.Dispose()
                    m_objInLineGuide = Nothing
                End If
            End If

            ' TODO: free shared unmanaged resources
        End If
        Me.m_blnDisposedValue = True
    End Sub
#End Region

#Region "Events Handlers"

#End Region

#End Region

End Class
