Public Class GUISelector

    Protected m_intSelectID As Integer
    Protected m_dtDataTable As DataTable
    Protected m_strDisplayMemberID As String
    Protected m_strDisplayMemberValue As String
    Protected m_objDataView As DataView
    Protected m_strPreviousFilter As String


    Public Event KeyEnter(ByRef _objSender As Object)
    Public Event KeyEsc(ByRef _objSender As Object)

    Public Property DataTable() As DataTable
        Get
            Return m_dtDataTable
        End Get
        Set(ByVal _dtDataTable As DataTable)
            m_dtDataTable = _dtDataTable
            RefreshItems()
        End Set
    End Property

    Public Property DisplayMemberID() As String
        Get
            Return m_strDisplayMemberID
        End Get
        Set(ByVal _strDisplayMemberID As String)
            m_strDisplayMemberID = _strDisplayMemberID
            RefreshItems()
        End Set
    End Property

    Public Property DisplayMemberValue() As String
        Get
            Return m_strDisplayMemberValue
        End Get
        Set(ByVal _strDisplayMemberValue As String)
            m_strDisplayMemberValue = _strDisplayMemberValue
            RefreshItems()
        End Set
    End Property

    Public Property DataFilter() As String
        Get
            Return txtFilter.Text
        End Get
        Set(ByVal _strFilter As String)
            txtFilter.Text = _strFilter
        End Set
    End Property

    Public Property SelectID() As Integer
        Get
            Return m_intSelectID
        End Get
        Set(ByVal _intSelectID As Integer)
            m_intSelectID = _intSelectID
        End Set
    End Property

    Protected Sub RefreshItems()
        If m_dtDataTable Is Nothing Then
            lstItems.Items.Clear()
            RaiseEvent KeyEsc(Me)
            Return
        End If


        If Me.DataFilter.Length > 0 Then
            m_objDataView = New DataView(Me.DataTable, String.Format("{0} LIKE '{1}%'", Me.m_strDisplayMemberValue, Me.DataFilter), Me.DisplayMemberValue, DataViewRowState.CurrentRows)
        Else
            m_objDataView = New DataView(Me.DataTable, "", Me.DisplayMemberValue, DataViewRowState.CurrentRows)
        End If

        lstItems.DataSource = m_objDataView
        lstItems.DisplayMember = Me.DisplayMemberValue
        lstItems.ValueMember = Me.DisplayMemberID
        If lstItems.Items.Count > 0 Then
            lstItems.SelectedIndex = 0
        End If

        lstItems_SelectedIndexChanged(Nothing, Nothing)
    End Sub

    Protected Sub LoadData()
        RefreshItems()
        guiKeyboard.Visible = False
    End Sub

    Private Sub cmdUp_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdUp.Click
        If lstItems.Items.Count > 0 Then
            lstItems.SelectedIndex = Math.Max(lstItems.SelectedIndex - 1, 0)
        End If
    End Sub

    Private Sub cmdDown_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDown.Click
        If lstItems.Items.Count > 0 Then
            lstItems.SelectedIndex = Math.Min(lstItems.SelectedIndex + 1, lstItems.Items.Count - 1)
        End If
    End Sub

    Private Sub cmdFUp_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdFUp.Click
        If lstItems.Items.Count > 0 Then
            lstItems.SelectedIndex = Math.Max(lstItems.SelectedIndex - 9, 0)
        End If
    End Sub

    Private Sub cmdFDown_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdFDown.Click
        If lstItems.Items.Count > 0 Then
            lstItems.SelectedIndex = Math.Min(lstItems.SelectedIndex + 9, lstItems.Items.Count - 1)
        End If
    End Sub

    Private Sub guiKeyboard_KeyAnyKey(ByRef _objSender As Object, ByVal _objChar As Char) Handles guiKeyboard.KeyAnyKey
        txtFilter.Text &= _objChar
        RefreshItems()
    End Sub

    Private Sub guiKeyboard_KeyBackspace(ByRef _objSender As Object) Handles guiKeyboard.KeyBackspace
        If txtFilter.Text.Length > 0 Then
            txtFilter.Text = txtFilter.Text.Substring(0, txtFilter.Text.Length - 1)
        End If
        RefreshItems()
    End Sub

    Private Sub guiKeyboard_KeyEnter(ByRef _objSender As Object) Handles guiKeyboard.KeyEnter
        'RaiseEvent KeyEnter(Me)
        guiKeyboard.Visible = False
    End Sub

    Private Sub guiKeyboard_KeyEsc(ByRef _objSender As Object) Handles guiKeyboard.KeyEsc
        m_intSelectID = -1
        txtFilter.Text = m_strPreviousFilter
        'RaiseEvent KeyEsc(Me)
        guiKeyboard.Visible = False
    End Sub

    Private Sub lstItems_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles lstItems.DoubleClick
        If lstItems.SelectedIndex >= 0 Then
            RaiseEvent KeyEnter(Me)
        End If
    End Sub

    Private Sub lstItems_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstItems.SelectedIndexChanged
        cmdUp.Enabled = (lstItems.SelectedIndex > 0)
        cmdFUp.Enabled = (lstItems.SelectedIndex > 0)
        cmdDown.Enabled = (lstItems.SelectedIndex < (lstItems.Items.Count - 1))
        cmdFDown.Enabled = (lstItems.SelectedIndex < (lstItems.Items.Count - 1))
        If lstItems.SelectedIndex >= 0 Then
            Me.SelectID = CInt(m_objDataView.Item(lstItems.SelectedIndex)(Me.DisplayMemberID))
            Me.cmdAccept.Enabled = True
        Else
            Me.SelectID = -1
            Me.cmdAccept.Enabled = False
        End If
    End Sub

    Private Sub lblFilter_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lblFilter.Click
        m_strPreviousFilter = txtFilter.Text
        guiKeyboard.Visible = True
    End Sub

    Private Sub cmdAccept_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdAccept.Click
        If lstItems.SelectedIndex >= 0 Then
            RaiseEvent KeyEnter(Me)
        Else
            cmdAccept.Enabled = False
        End If
    End Sub

    Private Sub cmdCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancel.Click
        m_intSelectID = -1
        RaiseEvent KeyEsc(Me)
    End Sub
End Class
