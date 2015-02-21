' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class JobsManager
    Implements IDisposable

#Region "Constants"

#End Region

#Region "Variables"
    Private m_blnDisposedValue As Boolean = False        ' To detect redundant calls
    Protected m_dsJobs As DSJobs
    Protected m_drCurrentJob As DSJobs.JobsRow
    Protected m_dblSpeed As Double
#End Region

#Region "Events"
    Public Event ClientNameChangedEvent(ByRef _objSender As Object, ByVal _strNewName As String)
    Public Event ProjectNameChangedEvent(ByRef _objSender As Object, ByVal _strNewName As String)
    Public Event CylinderLengthChangedEvent(ByRef _objSender As Object, ByVal _intRegistersRowID As Integer, ByVal _dblCylinderLength As Double)
#End Region

#Region "Properties"

    Public Property ClientName() As String
        Get
            If m_drCurrentJob.ClientName Is Nothing OrElse _
                m_drCurrentJob.ClientName Is DBNull.Value Then
                Return ""
            Else
                Return m_drCurrentJob.ClientName
            End If
        End Get
        Set(ByVal _strClientName As String)
            m_drCurrentJob.BeginEdit()
            m_drCurrentJob.ClientName = _strClientName
            m_drCurrentJob.DateModified = Now
            m_drCurrentJob.EndEdit()
            m_dsJobs.AcceptChanges()
            m_dsJobs.WriteXml(GlobalParameters.BLL_DSJobFilename, XmlWriteMode.WriteSchema)

            RaiseEvent ClientNameChangedEvent(Me, _strClientName)
        End Set
    End Property

    Public Property ProjectName() As String
        Get
            If m_drCurrentJob.ProjectName Is Nothing OrElse _
                m_drCurrentJob.ProjectName Is DBNull.Value Then
                Return ""
            Else
                Return m_drCurrentJob.ProjectName
            End If
        End Get
        Set(ByVal _strProjectName As String)
            m_drCurrentJob.BeginEdit()
            m_drCurrentJob.ProjectName = _strProjectName
            m_drCurrentJob.DateModified = Now
            m_drCurrentJob.EndEdit()
            m_dsJobs.AcceptChanges()
            m_dsJobs.WriteXml(GlobalParameters.BLL_DSJobFilename, XmlWriteMode.WriteSchema)

            RaiseEvent ProjectNameChangedEvent(Me, _strProjectName)
        End Set
    End Property

    Public Property DateModified() As String
        Get
            If m_drCurrentJob.DateModified = Date.MaxValue Then
                Return ""
            Else
                Return m_drCurrentJob.DateModified.ToShortDateString
            End If
        End Get
        Set(ByVal _strDateModified As String)
            Dim objDateTime As DateTime

            If DateTime.TryParse(_strDateModified, objDateTime) Then
                m_drCurrentJob.BeginEdit()
                m_drCurrentJob.DateModified = objDateTime
                m_drCurrentJob.EndEdit()
                m_dsJobs.AcceptChanges()
                m_dsJobs.WriteXml(GlobalParameters.BLL_DSJobFilename, XmlWriteMode.WriteSchema)
            End If
        End Set
    End Property

    Public Property DateCreated() As String
        Get
            If m_drCurrentJob.DateCreated = Date.MaxValue Then
                Return ""
            Else
                Return m_drCurrentJob.DateCreated.ToShortDateString
            End If
        End Get
        Set(ByVal _strDateCreated As String)
            Dim objDateTime As DateTime

            If DateTime.TryParse(_strDateCreated, objDateTime) Then
                m_drCurrentJob.BeginEdit()
                m_drCurrentJob.DateCreated = objDateTime
                m_drCurrentJob.EndEdit()
                m_dsJobs.AcceptChanges()
                m_dsJobs.WriteXml(GlobalParameters.BLL_DSJobFilename, XmlWriteMode.WriteSchema)
            End If
        End Set
    End Property

    Public ReadOnly Property Groups() As DSJobs.GroupsRow()
        Get
            If m_drCurrentJob Is Nothing Then
                Return Nothing
            Else
                Return m_drCurrentJob.GetGroupsRows
            End If
        End Get
    End Property

    Public Property Speed() As Double
        Get
            Return m_dblSpeed
        End Get
        Set(ByVal _dblSpeed As Double)
            m_dblSpeed = _dblSpeed
        End Set
    End Property

    Public Property CylidnerLength() As Double
        Get
            Dim drRegistersRow As DSJobs.RegistersRow
            If Me.Groups Is Nothing OrElse Me.Groups.Length = 0 Then
                Return 0.0
            Else
                drRegistersRow = Me.Groups(0).RegistersRow
                If drRegistersRow Is Nothing Then
                    Return 0.0
                Else
                    Return drRegistersRow.CylinderLength
                End If
            End If
        End Get
        Set(ByVal _dblCylidnerLength As Double)
            Dim drRegistersRow As DSJobs.RegistersRow
            Dim drGroupRow As DSJobs.GroupsRow
            If Not Me.Groups Is Nothing Then
                For Each drGroupRow In Me.Groups
                    drRegistersRow = drGroupRow.RegistersRow
                    If Not drRegistersRow Is Nothing Then
                        drRegistersRow.CylinderLength = _dblCylidnerLength
                    End If
                Next
            End If

            RaiseEvent CylinderLengthChangedEvent(Me, Nothing, _dblCylidnerLength)
        End Set
    End Property
#End Region

#Region "Methods"

#Region "Public Methods"

    Public Sub New()
        '        m_arobjGroups = New List(Of GroupParameter)
        InitJobs()
    End Sub

    Public Sub NewJob()

        'TODO:to subsitute after demo
        CopyJob()
        m_drCurrentJob.BeginEdit()
        m_drCurrentJob.ClientName = ""
        m_drCurrentJob.ProjectName = ""
        m_drCurrentJob.DateCreated = Now
        m_drCurrentJob.DateModified = Now
        m_drCurrentJob.EndEdit()


        'Dim drJob As DSJobs.JobsRow
        'drJob = m_dsJobs.Jobs.NewJobsRow()
        'drJob.BeginEdit()
        ''drJob.JobID = Autoincrement
        'drJob.ClientName = ""
        'drJob.ProjectName = ""
        'drJob.DateCreated = Now
        'drJob.DateModified = Now
        'drJob.EndEdit()
        'm_dsJobs.Jobs.AddJobsRow(drJob)

        'm_drCurrentJob = drJob

        m_dsJobs.AcceptChanges()
        m_dsJobs.WriteXml(GlobalParameters.BLL_DSJobFilename, XmlWriteMode.WriteSchema)

        GlobalParameters.BLL_JobID = m_drCurrentJob.JobID
    End Sub

    Public Sub CopyJob()
        Dim drJob As DSJobs.JobsRow
        Dim drGroup As DSJobs.GroupsRow
        Dim drNewGroup As DSJobs.GroupsRow
        Dim drNewViscosity As DSJobs.ViscositiesRow
        Dim drNewRegister As DSJobs.RegistersRow
        drJob = m_dsJobs.Jobs.NewJobsRow()
        drJob.BeginEdit()
        'drJob.JobID = Autoincrement
        drJob.ClientName = m_drCurrentJob.ClientName
        drJob.ProjectName = ""
        drJob.DateCreated = Now
        drJob.DateModified = Now
        drJob.EndEdit()
        m_dsJobs.Jobs.AddJobsRow(drJob)

        For Each drGroup In m_drCurrentJob.GetGroupsRows
            drNewRegister = m_dsJobs.Registers.NewRegistersRow()
            drNewRegister.BeginEdit()
            drNewRegister.IsBaseColor = drGroup.RegistersRow.IsBaseColor
            drNewRegister.IsInstalled = drGroup.RegistersRow.IsInstalled
            drNewRegister.LateralValue = drGroup.RegistersRow.LateralValue
            drNewRegister.LateralRefValue = drGroup.RegistersRow.LateralRefValue
            drNewRegister.LateralMode = drGroup.RegistersRow.LateralMode
            drNewRegister.LongitudinalValue = drGroup.RegistersRow.LongitudinalValue
            drNewRegister.LongitudinalRefValue = drGroup.RegistersRow.LongitudinalRefValue
            drNewRegister.LongitudinalMode = drGroup.RegistersRow.LongitudinalMode
            drNewRegister.MarkID = drGroup.RegistersRow.MarkID
            drNewRegister.LateralGain = drGroup.RegistersRow.LateralGain
            drNewRegister.LongitudinalGain = drGroup.RegistersRow.LongitudinalGain
            drNewRegister.LateralFactor = drGroup.RegistersRow.LateralFactor
            drNewRegister.LongitudinalFactor = drGroup.RegistersRow.LongitudinalFactor
            drNewRegister.Side = drGroup.RegistersRow.Side
            drNewRegister.EndEdit()
            m_dsJobs.Registers.AddRegistersRow(drNewRegister)


            drNewViscosity = m_dsJobs.Viscosities.NewViscositiesRow
            drNewViscosity.BeginEdit()
            drNewViscosity.IsInstalled = drGroup.ViscositiesRow.IsInstalled
            drNewViscosity.Fluid = drGroup.ViscositiesRow.Fluid
            drNewViscosity.Pause = drGroup.ViscositiesRow.Pause

            drNewViscosity.PhGain = drGroup.ViscositiesRow.PhGain
            drNewViscosity.PhMax = drGroup.ViscositiesRow.PhMax
            drNewViscosity.PhMin = drGroup.ViscositiesRow.PhMin
            drNewViscosity.PhRefValue = drGroup.ViscositiesRow.PhRefValue
            drNewViscosity.PhValue = drGroup.ViscositiesRow.PhValue
            drNewViscosity.PhFactor = drGroup.ViscositiesRow.PhFactor

            drNewViscosity.TemperatureGain = drGroup.ViscositiesRow.TemperatureGain
            drNewViscosity.TemperatureMax = drGroup.ViscositiesRow.TemperatureMax
            drNewViscosity.TemperatureMin = drGroup.ViscositiesRow.TemperatureMin
            drNewViscosity.TemperatureRange = drGroup.ViscositiesRow.TemperatureRange
            drNewViscosity.TemperatureValue = drGroup.ViscositiesRow.TemperatureValue
            drNewViscosity.TemperatureFactor = drGroup.ViscositiesRow.TemperatureFactor

            drNewViscosity.ViscosityGain = drGroup.ViscositiesRow.ViscosityGain
            drNewViscosity.ViscosityMax = drGroup.ViscositiesRow.ViscosityMax
            drNewViscosity.ViscosityMin = drGroup.ViscositiesRow.ViscosityMin
            drNewViscosity.ViscosityMode = drGroup.ViscositiesRow.ViscosityMode
            drNewViscosity.ViscosityRange = drGroup.ViscositiesRow.ViscosityRange
            drNewViscosity.ViscosityRefValue = drGroup.ViscositiesRow.ViscosityRefValue
            drNewViscosity.ViscosityValue = drGroup.ViscositiesRow.ViscosityValue
            drNewViscosity.ViscosityFactor = drGroup.ViscositiesRow.ViscosityFactor


            drNewViscosity.EndEdit()
            m_dsJobs.Viscosities.AddViscositiesRow(drNewViscosity)

            drNewGroup = m_dsJobs.Groups.NewGroupsRow
            drNewGroup.JobID = drJob.JobID
            drNewGroup.RegistersRow = drNewRegister
            drNewGroup.ViscositiesRow = drNewViscosity
            drNewGroup.GroupColor = drGroup.GroupColor
            drNewGroup.GroupNumber = drGroup.GroupNumber
            m_dsJobs.Groups.AddGroupsRow(drNewGroup)
        Next

        drNewViscosity = Nothing
        drNewRegister = Nothing
        drNewGroup = Nothing
        drGroup = Nothing


        m_drCurrentJob = drJob
        m_dsJobs.AcceptChanges()
        m_dsJobs.WriteXml(GlobalParameters.BLL_DSJobFilename, XmlWriteMode.WriteSchema)

        GlobalParameters.BLL_JobID = m_drCurrentJob.JobID
    End Sub

    Public Sub SetJobByID(ByVal _intJobID As Integer)
        Dim ardsJobs As DSJobs.JobsRow()
        ardsJobs = CType(m_dsJobs.Jobs.Select("JobID = " & _intJobID), DSJobs.JobsRow())

        Try

            If ardsJobs Is Nothing OrElse _
                ardsJobs.Length = 0 Then
                Throw New Exception("Job ID (" & _intJobID & ") not found.")
            End If

            If ardsJobs.Length > 1 Then
                Throw New Exception("Job ID (" & _intJobID & ") not unique.")
            End If

            m_drCurrentJob = ardsJobs(0)
        Catch ex As Exception
            If Not m_dsJobs.Jobs.Rows Is Nothing Then
                m_drCurrentJob = CType(m_dsJobs.Jobs.Rows(0), DSJobs.JobsRow)
            Else
                Throw ex
            End If
        End Try



        'LoadGroupParameterByJobID()

        GlobalParameters.BLL_JobID = m_drCurrentJob.JobID

        RaiseEvent ClientNameChangedEvent(Me, Me.ClientName)
        RaiseEvent ProjectNameChangedEvent(Me, Me.ProjectName)
        RaiseEvent CylinderLengthChangedEvent(Me, Nothing, Me.CylidnerLength)


    End Sub

    Public Function GroupByNumber(ByVal _intGroupNumber As Integer) As DSJobs.GroupsRow
        Dim drGroup As DSJobs.GroupsRow
        For Each drGroup In m_drCurrentJob.GetGroupsRows
            If drGroup.GroupNumber = _intGroupNumber Then
                Return drGroup
            End If
        Next
        Return Nothing
    End Function

    Public Sub SaveJobs()
        m_dsJobs.AcceptChanges()
        m_dsJobs.WriteXml(GlobalParameters.BLL_DSJobFilename, XmlWriteMode.WriteSchema)
    End Sub

    Public Function GetFilteredJobTable(Optional ByVal _strClientName As String = "", Optional ByVal _strProjectName As String = "", Optional ByVal _intDateCreatedMonth As Integer = -1, Optional ByVal _intDateCreatedYear As Integer = -1, Optional ByVal _intDateModifiedMonth As Integer = -1, Optional ByVal _intDateModifiedYear As Integer = -1) As DSJobs.JobsRow()
        Dim strSql As String

        strSql = "(0=0) "

        If Not _strClientName Is Nothing AndAlso _
            _strClientName.Length > 0 Then
            strSql &= String.Format("AND (ClientName LIKE '{0}%') ", _strClientName)
        End If

        If Not _strProjectName Is Nothing AndAlso _
            _strProjectName.Length > 0 Then
            strSql &= String.Format("AND (ProjectName LIKE '{0}%') ", _strProjectName)
        End If

        If _intDateCreatedYear >= 0 Then
            If _intDateCreatedMonth >= 0 Then
                strSql &= String.Format("AND (DateCreated >= #{0}#) AND (DateCreated <= #{1}#)", _intDateCreatedMonth & "/01/" & _intDateCreatedYear, _intDateCreatedMonth & "/" & Date.DaysInMonth(_intDateCreatedYear, _intDateCreatedMonth) & "/" & _intDateCreatedYear)
            Else
                strSql &= String.Format("AND (DateCreated >= #{0}#) AND (DateCreated <= #{1}#)", "01/01/" & _intDateCreatedYear, "12/31/" & _intDateCreatedYear)
            End If
        End If

        If _intDateModifiedYear >= 0 Then
            If _intDateModifiedMonth >= 0 Then
                strSql &= String.Format("AND (DateModified >= #{0}#) AND (DateModified <= #{1}#)", _intDateModifiedMonth & "/01/" & _intDateModifiedYear, _intDateModifiedMonth & "/" & Date.DaysInMonth(_intDateModifiedYear, _intDateModifiedMonth) & "/" & _intDateModifiedYear)
            Else
                strSql &= String.Format("AND (DateModified >= #{0}#) AND (DateModified <= #{1}#)", "01/01/" & _intDateModifiedYear, "12/31/" & _intDateModifiedYear)
            End If
        End If

        Return CType(m_dsJobs.Jobs.Select(strSql), DSJobs.JobsRow())

    End Function

#Region " IDisposable Support "
    ' This code added by Visual Basic to correctly implement the disposable pattern.
    Public Sub Dispose() Implements IDisposable.Dispose
        ' Do not change this code.  Put cleanup code in Dispose(ByVal disposing As Boolean) above.
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub
#End Region

    Public Sub SetSpeedByTime(ByVal _intSpeedTime As Integer)
        Me.Speed = 60 * (Me.CylidnerLength * 1000) / _intSpeedTime
    End Sub



#End Region

#Region "Protected Methods"

    'Protected Sub LoadGroupParameterByJobID()
    '    Dim drGroup As DSJobs.GroupsRow

    '    m_arobjGroups.Clear()

    '    For Each drGroup In m_drCurrentJob.GetGroupsRows
    '        m_arobjGroups.Add(New GroupParameter(m_dsJobs, m_drCurrentJob.JobID, drGroup.GroupNumber))
    '    Next
    'End Sub

    ' IDisposable
    Protected Overridable Sub Dispose(ByVal disposing As Boolean)
        If Not m_blnDisposedValue Then
            If disposing Then
                ' TODO: free unmanaged resources when explicitly called
            End If

            ' TODO: free shared unmanaged resources
            If Not m_dsJobs Is Nothing Then
                m_dsJobs.Dispose()
                m_dsJobs = Nothing
            End If
        End If
        Me.m_blnDisposedValue = True
    End Sub

    Protected Sub InitJobs()
        Dim drJob As DSJobs.JobsRow
        m_dsJobs = New DSJobs
        m_dsJobs.BeginInit()
        If System.IO.File.Exists(GlobalParameters.BLL_DSJobFilename) Then
            m_dsJobs.ReadXml(GlobalParameters.BLL_DSJobFilename, XmlReadMode.ReadSchema)
        Else
            drJob = CType(m_dsJobs.Jobs.NewRow(), DSJobs.JobsRow)
            drJob.JobID = 0
            drJob.ClientName = "Default Client"
            drJob.ProjectName = "Default Project"
            drJob.DateCreated = DateTime.Now
            drJob.DateModified = DateTime.Now
            m_dsJobs.Jobs.Rows.Add(drJob)

            m_dsJobs.WriteXml(GlobalParameters.BLL_DSJobFilename, XmlWriteMode.WriteSchema)
        End If
        m_dsJobs.EndInit()
    End Sub
#End Region

#Region "Events Handlers"

#End Region

#End Region






End Class
