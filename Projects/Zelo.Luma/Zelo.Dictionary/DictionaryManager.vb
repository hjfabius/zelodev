Imports System.Resources
Imports System.Reflection

' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class DictionaryManager
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Enums"
    Public Enum Languages
        Italian
        English
        German
        French
        Language5
        Language6
        Language7
        Language8
    End Enum
#End Region

#Region "Variables"
    Private m_blnDisposedValue As Boolean = False        ' To detect redundant calls
    Protected m_enmLanguage As Languages
    Protected m_objResXString As Resources.ResourceReader

#End Region

#Region "Events"

#End Region

#Region "Properties"

    Public Property Language() As Languages
        Get
            Return m_enmLanguage
        End Get
        Set(ByVal _enmLanguage As Languages)
            m_enmLanguage = _enmLanguage

            If Not m_objResXString Is Nothing Then
                m_objResXString.Close()
                m_objResXString = Nothing
            End If
            m_objResXString = New Resources.ResourceReader(GetResourceFileName(_enmLanguage))

        End Set
    End Property

#End Region

#Region "Methods"

#Region "Public Methods"

    Public Sub New()
        Me.Language = Languages.English
    End Sub

    Public Sub New(ByVal _enmLanguage As Languages)
        Me.Language = _enmLanguage
    End Sub

    Public Function GetResourceString(ByVal _enmDictionaryStrings As DictionaryStrings) As String
        Dim m_objResourceManager As ResourceManager
        m_objResourceManager = New ResourceManager(GetCurrentResourceFileName, Assembly.GetExecutingAssembly())

        'Dim obj As Assembly
        'Reflection.me()
        'Reflection.Assembly.GetAssembly(Me.ToString)

        Return m_objResourceManager.GetString(_enmDictionaryStrings.ToString)

        'm_objResXString.GetResourceData(_enmDictionaryStrings.ToString,  "System.String", 
        ''m_objResXString.AddResource("en-AU.jpg", img)
        'm_objResXString.Close()

    End Function


#Region " IDisposable Support "
    ' This code added by Visual Basic to correctly implement the disposable pattern.
    Public Sub Dispose() Implements IDisposable.Dispose
        ' Do not change this code.  Put cleanup code in Dispose(ByVal disposing As Boolean) above.
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub
#End Region

#End Region

#Region "Protected Methods"

    Protected Function GetCurrentResourceFileName() As String
        Return GetResourceFileName(Me.Language)
    End Function

    Protected Function GetResourceFileName(ByVal _enmLanguage As Languages) As String
        Select Case _enmLanguage
            Case Languages.French
                Return "English.resx"
            Case Languages.German
                Return "English.resx"
            Case Languages.Italian
                Return "Italian.resx"
            Case Languages.Language5
                Return "English.resx"
            Case Languages.Language6
                Return "English.resx"
            Case Languages.Language7
                Return "English.resx"
            Case Languages.Language8
                Return "English.resx"
            Case Else
                Return "English.resx"
        End Select
    End Function


    ' IDisposable
    Protected Overridable Sub Dispose(ByVal disposing As Boolean)
        If Not Me.m_blnDisposedValue Then
            If disposing Then
                ' TODO: free unmanaged resources when explicitly called
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
