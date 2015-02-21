﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:2.0.50727.42
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On

Imports System


<System.CodeDom.Compiler.GeneratedCodeAttribute("System.Data.Design.TypedDataSetGenerator", "2.0.0.0"),  _
 Serializable(),  _
 System.ComponentModel.DesignerCategoryAttribute("code"),  _
 System.ComponentModel.ToolboxItem(true),  _
 System.Xml.Serialization.XmlSchemaProviderAttribute("GetTypedDataSetSchema"),  _
 System.Xml.Serialization.XmlRootAttribute("DSNavigation"),  _
 System.ComponentModel.Design.HelpKeywordAttribute("vs.data.DataSet")>  _
Partial Public Class DSNavigation
    Inherits System.Data.DataSet
    
    Private tableNavigation As NavigationDataTable
    
    Private _schemaSerializationMode As System.Data.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Public Sub New()
        MyBase.New
        Me.BeginInit
        Me.InitClass
        Dim schemaChangedHandler As System.ComponentModel.CollectionChangeEventHandler = AddressOf Me.SchemaChanged
        AddHandler MyBase.Tables.CollectionChanged, schemaChangedHandler
        AddHandler MyBase.Relations.CollectionChanged, schemaChangedHandler
        Me.EndInit
    End Sub
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Protected Sub New(ByVal info As System.Runtime.Serialization.SerializationInfo, ByVal context As System.Runtime.Serialization.StreamingContext)
        MyBase.New(info, context, false)
        If (Me.IsBinarySerialized(info, context) = true) Then
            Me.InitVars(false)
            Dim schemaChangedHandler1 As System.ComponentModel.CollectionChangeEventHandler = AddressOf Me.SchemaChanged
            AddHandler Me.Tables.CollectionChanged, schemaChangedHandler1
            AddHandler Me.Relations.CollectionChanged, schemaChangedHandler1
            Return
        End If
        Dim strSchema As String = CType(info.GetValue("XmlSchema", GetType(String)),String)
        If (Me.DetermineSchemaSerializationMode(info, context) = System.Data.SchemaSerializationMode.IncludeSchema) Then
            Dim ds As System.Data.DataSet = New System.Data.DataSet
            ds.ReadXmlSchema(New System.Xml.XmlTextReader(New System.IO.StringReader(strSchema)))
            If (Not (ds.Tables("Navigation")) Is Nothing) Then
                MyBase.Tables.Add(New NavigationDataTable(ds.Tables("Navigation")))
            End If
            Me.DataSetName = ds.DataSetName
            Me.Prefix = ds.Prefix
            Me.Namespace = ds.Namespace
            Me.Locale = ds.Locale
            Me.CaseSensitive = ds.CaseSensitive
            Me.EnforceConstraints = ds.EnforceConstraints
            Me.Merge(ds, false, System.Data.MissingSchemaAction.Add)
            Me.InitVars
        Else
            Me.ReadXmlSchema(New System.Xml.XmlTextReader(New System.IO.StringReader(strSchema)))
        End If
        Me.GetSerializationData(info, context)
        Dim schemaChangedHandler As System.ComponentModel.CollectionChangeEventHandler = AddressOf Me.SchemaChanged
        AddHandler MyBase.Tables.CollectionChanged, schemaChangedHandler
        AddHandler Me.Relations.CollectionChanged, schemaChangedHandler
    End Sub
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
     System.ComponentModel.Browsable(false),  _
     System.ComponentModel.DesignerSerializationVisibility(System.ComponentModel.DesignerSerializationVisibility.Content)>  _
    Public ReadOnly Property Navigation() As NavigationDataTable
        Get
            Return Me.tableNavigation
        End Get
    End Property
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
     System.ComponentModel.BrowsableAttribute(true),  _
     System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Visible)>  _
    Public Overrides Property SchemaSerializationMode() As System.Data.SchemaSerializationMode
        Get
            Return Me._schemaSerializationMode
        End Get
        Set
            Me._schemaSerializationMode = value
        End Set
    End Property
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
     System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Hidden)>  _
    Public Shadows ReadOnly Property Tables() As System.Data.DataTableCollection
        Get
            Return MyBase.Tables
        End Get
    End Property
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
     System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Hidden)>  _
    Public Shadows ReadOnly Property Relations() As System.Data.DataRelationCollection
        Get
            Return MyBase.Relations
        End Get
    End Property
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Protected Overrides Sub InitializeDerivedDataSet()
        Me.BeginInit
        Me.InitClass
        Me.EndInit
    End Sub
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Public Overrides Function Clone() As System.Data.DataSet
        Dim cln As DSNavigation = CType(MyBase.Clone,DSNavigation)
        cln.InitVars
        cln.SchemaSerializationMode = Me.SchemaSerializationMode
        Return cln
    End Function
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Protected Overrides Function ShouldSerializeTables() As Boolean
        Return false
    End Function
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Protected Overrides Function ShouldSerializeRelations() As Boolean
        Return false
    End Function
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Protected Overrides Sub ReadXmlSerializable(ByVal reader As System.Xml.XmlReader)
        If (Me.DetermineSchemaSerializationMode(reader) = System.Data.SchemaSerializationMode.IncludeSchema) Then
            Me.Reset
            Dim ds As System.Data.DataSet = New System.Data.DataSet
            ds.ReadXml(reader)
            If (Not (ds.Tables("Navigation")) Is Nothing) Then
                MyBase.Tables.Add(New NavigationDataTable(ds.Tables("Navigation")))
            End If
            Me.DataSetName = ds.DataSetName
            Me.Prefix = ds.Prefix
            Me.Namespace = ds.Namespace
            Me.Locale = ds.Locale
            Me.CaseSensitive = ds.CaseSensitive
            Me.EnforceConstraints = ds.EnforceConstraints
            Me.Merge(ds, false, System.Data.MissingSchemaAction.Add)
            Me.InitVars
        Else
            Me.ReadXml(reader)
            Me.InitVars
        End If
    End Sub
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Protected Overrides Function GetSchemaSerializable() As System.Xml.Schema.XmlSchema
        Dim stream As System.IO.MemoryStream = New System.IO.MemoryStream
        Me.WriteXmlSchema(New System.Xml.XmlTextWriter(stream, Nothing))
        stream.Position = 0
        Return System.Xml.Schema.XmlSchema.Read(New System.Xml.XmlTextReader(stream), Nothing)
    End Function
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Friend Overloads Sub InitVars()
        Me.InitVars(true)
    End Sub
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Friend Overloads Sub InitVars(ByVal initTable As Boolean)
        Me.tableNavigation = CType(MyBase.Tables("Navigation"),NavigationDataTable)
        If (initTable = true) Then
            If (Not (Me.tableNavigation) Is Nothing) Then
                Me.tableNavigation.InitVars
            End If
        End If
    End Sub
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Private Sub InitClass()
        Me.DataSetName = "DSNavigation"
        Me.Prefix = ""
        Me.Namespace = "http://tempuri.org/DSNavigation.xsd"
        Me.EnforceConstraints = true
        Me.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        Me.tableNavigation = New NavigationDataTable
        MyBase.Tables.Add(Me.tableNavigation)
    End Sub
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Private Function ShouldSerializeNavigation() As Boolean
        Return false
    End Function
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Private Sub SchemaChanged(ByVal sender As Object, ByVal e As System.ComponentModel.CollectionChangeEventArgs)
        If (e.Action = System.ComponentModel.CollectionChangeAction.Remove) Then
            Me.InitVars
        End If
    End Sub
    
    <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
    Public Shared Function GetTypedDataSetSchema(ByVal xs As System.Xml.Schema.XmlSchemaSet) As System.Xml.Schema.XmlSchemaComplexType
        Dim ds As DSNavigation = New DSNavigation
        Dim type As System.Xml.Schema.XmlSchemaComplexType = New System.Xml.Schema.XmlSchemaComplexType
        Dim sequence As System.Xml.Schema.XmlSchemaSequence = New System.Xml.Schema.XmlSchemaSequence
        xs.Add(ds.GetSchemaSerializable)
        Dim any As System.Xml.Schema.XmlSchemaAny = New System.Xml.Schema.XmlSchemaAny
        any.Namespace = ds.Namespace
        sequence.Items.Add(any)
        type.Particle = sequence
        Return type
    End Function
    
    Public Delegate Sub NavigationRowChangeEventHandler(ByVal sender As Object, ByVal e As NavigationRowChangeEvent)
    
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Data.Design.TypedDataSetGenerator", "2.0.0.0"),  _
     System.Serializable(),  _
     System.Xml.Serialization.XmlSchemaProviderAttribute("GetTypedTableSchema")>  _
    Partial Public Class NavigationDataTable
        Inherits System.Data.DataTable
        Implements System.Collections.IEnumerable
        
        Private columnNavigationID As System.Data.DataColumn
        
        Private columnNavigationTitle As System.Data.DataColumn
        
        Private columnNavigationAssembly As System.Data.DataColumn
        
        Private columnNavigationClass As System.Data.DataColumn
        
        Private columnNavigationClientVisible As System.Data.DataColumn
        
        Private columnNavigationProjectVisible As System.Data.DataColumn
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Sub New()
            MyBase.New
            Me.TableName = "Navigation"
            Me.BeginInit
            Me.InitClass
            Me.EndInit
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Friend Sub New(ByVal table As System.Data.DataTable)
            MyBase.New
            Me.TableName = table.TableName
            If (table.CaseSensitive <> table.DataSet.CaseSensitive) Then
                Me.CaseSensitive = table.CaseSensitive
            End If
            If (table.Locale.ToString <> table.DataSet.Locale.ToString) Then
                Me.Locale = table.Locale
            End If
            If (table.Namespace <> table.DataSet.Namespace) Then
                Me.Namespace = table.Namespace
            End If
            Me.Prefix = table.Prefix
            Me.MinimumCapacity = table.MinimumCapacity
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Protected Sub New(ByVal info As System.Runtime.Serialization.SerializationInfo, ByVal context As System.Runtime.Serialization.StreamingContext)
            MyBase.New(info, context)
            Me.InitVars
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public ReadOnly Property NavigationIDColumn() As System.Data.DataColumn
            Get
                Return Me.columnNavigationID
            End Get
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public ReadOnly Property NavigationTitleColumn() As System.Data.DataColumn
            Get
                Return Me.columnNavigationTitle
            End Get
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public ReadOnly Property NavigationAssemblyColumn() As System.Data.DataColumn
            Get
                Return Me.columnNavigationAssembly
            End Get
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public ReadOnly Property NavigationClassColumn() As System.Data.DataColumn
            Get
                Return Me.columnNavigationClass
            End Get
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public ReadOnly Property NavigationClientVisibleColumn() As System.Data.DataColumn
            Get
                Return Me.columnNavigationClientVisible
            End Get
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public ReadOnly Property NavigationProjectVisibleColumn() As System.Data.DataColumn
            Get
                Return Me.columnNavigationProjectVisible
            End Get
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
         System.ComponentModel.Browsable(false)>  _
        Public ReadOnly Property Count() As Integer
            Get
                Return Me.Rows.Count
            End Get
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Default ReadOnly Property Item(ByVal index As Integer) As NavigationRow
            Get
                Return CType(Me.Rows(index),NavigationRow)
            End Get
        End Property
        
        Public Event NavigationRowChanging As NavigationRowChangeEventHandler
        
        Public Event NavigationRowChanged As NavigationRowChangeEventHandler
        
        Public Event NavigationRowDeleting As NavigationRowChangeEventHandler
        
        Public Event NavigationRowDeleted As NavigationRowChangeEventHandler
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Overloads Sub AddNavigationRow(ByVal row As NavigationRow)
            Me.Rows.Add(row)
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Overloads Function AddNavigationRow(ByVal NavigationID As Short, ByVal NavigationTitle As String, ByVal NavigationAssembly As String, ByVal NavigationClass As String, ByVal NavigationClientVisible As Boolean, ByVal NavigationProjectVisible As Boolean) As NavigationRow
            Dim rowNavigationRow As NavigationRow = CType(Me.NewRow,NavigationRow)
            rowNavigationRow.ItemArray = New Object() {NavigationID, NavigationTitle, NavigationAssembly, NavigationClass, NavigationClientVisible, NavigationProjectVisible}
            Me.Rows.Add(rowNavigationRow)
            Return rowNavigationRow
        End Function
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Function FindByNavigationID(ByVal NavigationID As Short) As NavigationRow
            Return CType(Me.Rows.Find(New Object() {NavigationID}),NavigationRow)
        End Function
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Overridable Function GetEnumerator() As System.Collections.IEnumerator Implements System.Collections.IEnumerable.GetEnumerator
            Return Me.Rows.GetEnumerator
        End Function
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Overrides Function Clone() As System.Data.DataTable
            Dim cln As NavigationDataTable = CType(MyBase.Clone,NavigationDataTable)
            cln.InitVars
            Return cln
        End Function
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Protected Overrides Function CreateInstance() As System.Data.DataTable
            Return New NavigationDataTable
        End Function
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Friend Sub InitVars()
            Me.columnNavigationID = MyBase.Columns("NavigationID")
            Me.columnNavigationTitle = MyBase.Columns("NavigationTitle")
            Me.columnNavigationAssembly = MyBase.Columns("NavigationAssembly")
            Me.columnNavigationClass = MyBase.Columns("NavigationClass")
            Me.columnNavigationClientVisible = MyBase.Columns("NavigationClientVisible")
            Me.columnNavigationProjectVisible = MyBase.Columns("NavigationProjectVisible")
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Private Sub InitClass()
            Me.columnNavigationID = New System.Data.DataColumn("NavigationID", GetType(Short), Nothing, System.Data.MappingType.Element)
            MyBase.Columns.Add(Me.columnNavigationID)
            Me.columnNavigationTitle = New System.Data.DataColumn("NavigationTitle", GetType(String), Nothing, System.Data.MappingType.Element)
            MyBase.Columns.Add(Me.columnNavigationTitle)
            Me.columnNavigationAssembly = New System.Data.DataColumn("NavigationAssembly", GetType(String), Nothing, System.Data.MappingType.Element)
            MyBase.Columns.Add(Me.columnNavigationAssembly)
            Me.columnNavigationClass = New System.Data.DataColumn("NavigationClass", GetType(String), Nothing, System.Data.MappingType.Element)
            MyBase.Columns.Add(Me.columnNavigationClass)
            Me.columnNavigationClientVisible = New System.Data.DataColumn("NavigationClientVisible", GetType(Boolean), Nothing, System.Data.MappingType.Element)
            MyBase.Columns.Add(Me.columnNavigationClientVisible)
            Me.columnNavigationProjectVisible = New System.Data.DataColumn("NavigationProjectVisible", GetType(Boolean), Nothing, System.Data.MappingType.Element)
            MyBase.Columns.Add(Me.columnNavigationProjectVisible)
            Me.Constraints.Add(New System.Data.UniqueConstraint("Constraint1", New System.Data.DataColumn() {Me.columnNavigationID}, true))
            Me.columnNavigationID.AllowDBNull = false
            Me.columnNavigationID.Unique = true
            Me.columnNavigationTitle.AllowDBNull = false
            Me.columnNavigationAssembly.AllowDBNull = false
            Me.columnNavigationClass.AllowDBNull = false
            Me.Locale = New System.Globalization.CultureInfo("")
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Function NewNavigationRow() As NavigationRow
            Return CType(Me.NewRow,NavigationRow)
        End Function
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Protected Overrides Function NewRowFromBuilder(ByVal builder As System.Data.DataRowBuilder) As System.Data.DataRow
            Return New NavigationRow(builder)
        End Function
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Protected Overrides Function GetRowType() As System.Type
            Return GetType(NavigationRow)
        End Function
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Protected Overrides Sub OnRowChanged(ByVal e As System.Data.DataRowChangeEventArgs)
            MyBase.OnRowChanged(e)
            If (Not (Me.NavigationRowChangedEvent) Is Nothing) Then
                RaiseEvent NavigationRowChanged(Me, New NavigationRowChangeEvent(CType(e.Row,NavigationRow), e.Action))
            End If
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Protected Overrides Sub OnRowChanging(ByVal e As System.Data.DataRowChangeEventArgs)
            MyBase.OnRowChanging(e)
            If (Not (Me.NavigationRowChangingEvent) Is Nothing) Then
                RaiseEvent NavigationRowChanging(Me, New NavigationRowChangeEvent(CType(e.Row,NavigationRow), e.Action))
            End If
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Protected Overrides Sub OnRowDeleted(ByVal e As System.Data.DataRowChangeEventArgs)
            MyBase.OnRowDeleted(e)
            If (Not (Me.NavigationRowDeletedEvent) Is Nothing) Then
                RaiseEvent NavigationRowDeleted(Me, New NavigationRowChangeEvent(CType(e.Row,NavigationRow), e.Action))
            End If
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Protected Overrides Sub OnRowDeleting(ByVal e As System.Data.DataRowChangeEventArgs)
            MyBase.OnRowDeleting(e)
            If (Not (Me.NavigationRowDeletingEvent) Is Nothing) Then
                RaiseEvent NavigationRowDeleting(Me, New NavigationRowChangeEvent(CType(e.Row,NavigationRow), e.Action))
            End If
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Sub RemoveNavigationRow(ByVal row As NavigationRow)
            Me.Rows.Remove(row)
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Shared Function GetTypedTableSchema(ByVal xs As System.Xml.Schema.XmlSchemaSet) As System.Xml.Schema.XmlSchemaComplexType
            Dim type As System.Xml.Schema.XmlSchemaComplexType = New System.Xml.Schema.XmlSchemaComplexType
            Dim sequence As System.Xml.Schema.XmlSchemaSequence = New System.Xml.Schema.XmlSchemaSequence
            Dim ds As DSNavigation = New DSNavigation
            xs.Add(ds.GetSchemaSerializable)
            Dim any1 As System.Xml.Schema.XmlSchemaAny = New System.Xml.Schema.XmlSchemaAny
            any1.Namespace = "http://www.w3.org/2001/XMLSchema"
            any1.MinOccurs = New Decimal(0)
            any1.MaxOccurs = Decimal.MaxValue
            any1.ProcessContents = System.Xml.Schema.XmlSchemaContentProcessing.Lax
            sequence.Items.Add(any1)
            Dim any2 As System.Xml.Schema.XmlSchemaAny = New System.Xml.Schema.XmlSchemaAny
            any2.Namespace = "urn:schemas-microsoft-com:xml-diffgram-v1"
            any2.MinOccurs = New Decimal(1)
            any2.ProcessContents = System.Xml.Schema.XmlSchemaContentProcessing.Lax
            sequence.Items.Add(any2)
            Dim attribute1 As System.Xml.Schema.XmlSchemaAttribute = New System.Xml.Schema.XmlSchemaAttribute
            attribute1.Name = "namespace"
            attribute1.FixedValue = ds.Namespace
            type.Attributes.Add(attribute1)
            Dim attribute2 As System.Xml.Schema.XmlSchemaAttribute = New System.Xml.Schema.XmlSchemaAttribute
            attribute2.Name = "tableTypeName"
            attribute2.FixedValue = "NavigationDataTable"
            type.Attributes.Add(attribute2)
            type.Particle = sequence
            Return type
        End Function
    End Class
    
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Data.Design.TypedDataSetGenerator", "2.0.0.0")>  _
    Partial Public Class NavigationRow
        Inherits System.Data.DataRow
        
        Private tableNavigation As NavigationDataTable
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Friend Sub New(ByVal rb As System.Data.DataRowBuilder)
            MyBase.New(rb)
            Me.tableNavigation = CType(Me.Table,NavigationDataTable)
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Property NavigationID() As Short
            Get
                Return CType(Me(Me.tableNavigation.NavigationIDColumn),Short)
            End Get
            Set
                Me(Me.tableNavigation.NavigationIDColumn) = value
            End Set
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Property NavigationTitle() As String
            Get
                Return CType(Me(Me.tableNavigation.NavigationTitleColumn),String)
            End Get
            Set
                Me(Me.tableNavigation.NavigationTitleColumn) = value
            End Set
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Property NavigationAssembly() As String
            Get
                Return CType(Me(Me.tableNavigation.NavigationAssemblyColumn),String)
            End Get
            Set
                Me(Me.tableNavigation.NavigationAssemblyColumn) = value
            End Set
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Property NavigationClass() As String
            Get
                Return CType(Me(Me.tableNavigation.NavigationClassColumn),String)
            End Get
            Set
                Me(Me.tableNavigation.NavigationClassColumn) = value
            End Set
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Property NavigationClientVisible() As Boolean
            Get
                Try 
                    Return CType(Me(Me.tableNavigation.NavigationClientVisibleColumn),Boolean)
                Catch e As System.InvalidCastException
                    Throw New System.Data.StrongTypingException("The value for column 'NavigationClientVisible' in table 'Navigation' is DBNull.", e)
                End Try
            End Get
            Set
                Me(Me.tableNavigation.NavigationClientVisibleColumn) = value
            End Set
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Property NavigationProjectVisible() As Boolean
            Get
                Try 
                    Return CType(Me(Me.tableNavigation.NavigationProjectVisibleColumn),Boolean)
                Catch e As System.InvalidCastException
                    Throw New System.Data.StrongTypingException("The value for column 'NavigationProjectVisible' in table 'Navigation' is DBNull.", e)
                End Try
            End Get
            Set
                Me(Me.tableNavigation.NavigationProjectVisibleColumn) = value
            End Set
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Function IsNavigationClientVisibleNull() As Boolean
            Return Me.IsNull(Me.tableNavigation.NavigationClientVisibleColumn)
        End Function
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Sub SetNavigationClientVisibleNull()
            Me(Me.tableNavigation.NavigationClientVisibleColumn) = System.Convert.DBNull
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Function IsNavigationProjectVisibleNull() As Boolean
            Return Me.IsNull(Me.tableNavigation.NavigationProjectVisibleColumn)
        End Function
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Sub SetNavigationProjectVisibleNull()
            Me(Me.tableNavigation.NavigationProjectVisibleColumn) = System.Convert.DBNull
        End Sub
    End Class
    
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Data.Design.TypedDataSetGenerator", "2.0.0.0")>  _
    Public Class NavigationRowChangeEvent
        Inherits System.EventArgs
        
        Private eventRow As NavigationRow
        
        Private eventAction As System.Data.DataRowAction
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public Sub New(ByVal row As NavigationRow, ByVal action As System.Data.DataRowAction)
            MyBase.New
            Me.eventRow = row
            Me.eventAction = action
        End Sub
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public ReadOnly Property Row() As NavigationRow
            Get
                Return Me.eventRow
            End Get
        End Property
        
        <System.Diagnostics.DebuggerNonUserCodeAttribute()>  _
        Public ReadOnly Property Action() As System.Data.DataRowAction
            Get
                Return Me.eventAction
            End Get
        End Property
    End Class
End Class
