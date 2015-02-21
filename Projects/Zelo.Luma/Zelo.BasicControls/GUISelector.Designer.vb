<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GUISelector
    Inherits System.Windows.Forms.UserControl

    'UserControl overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.pnlScrollBar = New System.Windows.Forms.Panel
        Me.lstItems = New System.Windows.Forms.ListBox
        Me.cmdAccept = New Zelo.Luma.GUIButton
        Me.cmdCancel = New Zelo.Luma.GUIButton
        Me.guiList = New Zelo.Luma.GUIButton
        Me.cmdFDown = New Zelo.Luma.GUIButton
        Me.cmdFUp = New Zelo.Luma.GUIButton
        Me.cmdDown = New Zelo.Luma.GUIButton
        Me.cmdUp = New Zelo.Luma.GUIButton
        Me.GuiButton1 = New Zelo.Luma.GUIButton
        Me.txtFilter = New Zelo.Luma.GUIButton
        Me.lblFilter = New Zelo.Luma.GUIButton
        Me.guiKeyboard = New Zelo.Luma.GUIKeyboard
        Me.guiAcceptCancel = New Zelo.Luma.GUIButton
        Me.guiFilter = New Zelo.Luma.GUIButton
        Me.pnlScrollBar.SuspendLayout()
        Me.SuspendLayout()
        '
        'pnlScrollBar
        '
        Me.pnlScrollBar.Controls.Add(Me.lstItems)
        Me.pnlScrollBar.Location = New System.Drawing.Point(15, 9)
        Me.pnlScrollBar.Name = "pnlScrollBar"
        Me.pnlScrollBar.Size = New System.Drawing.Size(395, 374)
        Me.pnlScrollBar.TabIndex = 67
        '
        'lstItems
        '
        Me.lstItems.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.lstItems.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.lstItems.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lstItems.FormattingEnabled = True
        Me.lstItems.ItemHeight = 29
        Me.lstItems.Location = New System.Drawing.Point(1, 1)
        Me.lstItems.Name = "lstItems"
        Me.lstItems.Size = New System.Drawing.Size(412, 377)
        Me.lstItems.Sorted = True
        Me.lstItems.TabIndex = 57
        '
        'cmdAccept
        '
        Me.cmdAccept.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdAccept.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdAccept.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdAccept.BorderColor = System.Drawing.Color.Black
        Me.cmdAccept.BorderWidth = 0
        Me.cmdAccept.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdAccept.EditMode = False
        Me.cmdAccept.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdAccept.ForeColor = System.Drawing.Color.Black
        Me.cmdAccept.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdAccept.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdAccept.Location = New System.Drawing.Point(571, 10)
        Me.cmdAccept.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdAccept.Name = "cmdAccept"
        Me.cmdAccept.Radius = 55
        Me.cmdAccept.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdAccept.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdAccept.ShadowWidth = 2
        Me.cmdAccept.Size = New System.Drawing.Size(192, 60)
        Me.cmdAccept.TabIndex = 69
        Me.cmdAccept.Text = "Accept"
        Me.cmdAccept.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdAccept.TextAngle = 0
        '
        'cmdCancel
        '
        Me.cmdCancel.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdCancel.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdCancel.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdCancel.BorderColor = System.Drawing.Color.Black
        Me.cmdCancel.BorderWidth = 0
        Me.cmdCancel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdCancel.EditMode = False
        Me.cmdCancel.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.cmdCancel.ForeColor = System.Drawing.Color.Black
        Me.cmdCancel.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdCancel.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdCancel.Location = New System.Drawing.Point(571, 75)
        Me.cmdCancel.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.cmdCancel.Name = "cmdCancel"
        Me.cmdCancel.Radius = 55
        Me.cmdCancel.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdCancel.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdCancel.ShadowWidth = 2
        Me.cmdCancel.Size = New System.Drawing.Size(192, 60)
        Me.cmdCancel.TabIndex = 68
        Me.cmdCancel.Text = "Cancel"
        Me.cmdCancel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdCancel.TextAngle = 0
        '
        'guiList
        '
        Me.guiList.BackColor = System.Drawing.Color.White
        Me.guiList.BackColorFaded1 = System.Drawing.Color.White
        Me.guiList.BackColorFaded2 = System.Drawing.Color.White
        Me.guiList.BorderColor = System.Drawing.Color.Black
        Me.guiList.BorderWidth = 0
        Me.guiList.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiList.EditMode = False
        Me.guiList.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiList.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiList.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiList.Location = New System.Drawing.Point(-1, -1)
        Me.guiList.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.guiList.Name = "guiList"
        Me.guiList.Radius = 55
        Me.guiList.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiList.ShadowColor = System.Drawing.Color.LightGray
        Me.guiList.ShadowWidth = 2
        Me.guiList.Size = New System.Drawing.Size(429, 409)
        Me.guiList.TabIndex = 66
        Me.guiList.Text = ""
        Me.guiList.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiList.TextAngle = 0
        '
        'cmdFDown
        '
        Me.cmdFDown.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdFDown.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdFDown.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdFDown.BorderColor = System.Drawing.Color.Black
        Me.cmdFDown.BorderWidth = 0
        Me.cmdFDown.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdFDown.EditMode = False
        Me.cmdFDown.Font = New System.Drawing.Font("Wingdings 3", 36.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdFDown.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdFDown.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdFDown.Location = New System.Drawing.Point(439, 329)
        Me.cmdFDown.Margin = New System.Windows.Forms.Padding(11, 6, 11, 6)
        Me.cmdFDown.Name = "cmdFDown"
        Me.cmdFDown.Radius = 54
        Me.cmdFDown.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdFDown.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdFDown.ShadowWidth = 2
        Me.cmdFDown.Size = New System.Drawing.Size(62, 58)
        Me.cmdFDown.TabIndex = 64
        Me.cmdFDown.Text = "¼"
        Me.cmdFDown.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdFDown.TextAngle = 0
        '
        'cmdFUp
        '
        Me.cmdFUp.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdFUp.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdFUp.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdFUp.BorderColor = System.Drawing.Color.Black
        Me.cmdFUp.BorderWidth = 0
        Me.cmdFUp.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdFUp.EditMode = False
        Me.cmdFUp.Font = New System.Drawing.Font("Wingdings 3", 36.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdFUp.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdFUp.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdFUp.Location = New System.Drawing.Point(439, 21)
        Me.cmdFUp.Margin = New System.Windows.Forms.Padding(11, 6, 11, 6)
        Me.cmdFUp.Name = "cmdFUp"
        Me.cmdFUp.Radius = 54
        Me.cmdFUp.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdFUp.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdFUp.ShadowWidth = 2
        Me.cmdFUp.Size = New System.Drawing.Size(62, 58)
        Me.cmdFUp.TabIndex = 63
        Me.cmdFUp.Text = "»"
        Me.cmdFUp.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdFUp.TextAngle = 0
        '
        'cmdDown
        '
        Me.cmdDown.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdDown.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdDown.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdDown.BorderColor = System.Drawing.Color.Black
        Me.cmdDown.BorderWidth = 0
        Me.cmdDown.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdDown.EditMode = False
        Me.cmdDown.Font = New System.Drawing.Font("Wingdings 3", 36.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdDown.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdDown.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdDown.Location = New System.Drawing.Point(439, 256)
        Me.cmdDown.Margin = New System.Windows.Forms.Padding(11, 6, 11, 6)
        Me.cmdDown.Name = "cmdDown"
        Me.cmdDown.Radius = 54
        Me.cmdDown.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdDown.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdDown.ShadowWidth = 2
        Me.cmdDown.Size = New System.Drawing.Size(62, 58)
        Me.cmdDown.TabIndex = 62
        Me.cmdDown.Text = "¸"
        Me.cmdDown.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdDown.TextAngle = 0
        '
        'cmdUp
        '
        Me.cmdUp.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.cmdUp.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdUp.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.cmdUp.BorderColor = System.Drawing.Color.Black
        Me.cmdUp.BorderWidth = 0
        Me.cmdUp.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdUp.EditMode = False
        Me.cmdUp.Font = New System.Drawing.Font("Wingdings 3", 36.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(2, Byte))
        Me.cmdUp.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.cmdUp.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.cmdUp.Location = New System.Drawing.Point(439, 94)
        Me.cmdUp.Margin = New System.Windows.Forms.Padding(11, 6, 11, 6)
        Me.cmdUp.Name = "cmdUp"
        Me.cmdUp.Radius = 54
        Me.cmdUp.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.cmdUp.ShadowColor = System.Drawing.Color.LightGray
        Me.cmdUp.ShadowWidth = 2
        Me.cmdUp.Size = New System.Drawing.Size(62, 58)
        Me.cmdUp.TabIndex = 61
        Me.cmdUp.Text = "·"
        Me.cmdUp.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdUp.TextAngle = 0
        '
        'GuiButton1
        '
        Me.GuiButton1.BackColor = System.Drawing.Color.White
        Me.GuiButton1.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.GuiButton1.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.GuiButton1.BorderColor = System.Drawing.Color.Black
        Me.GuiButton1.BorderWidth = 0
        Me.GuiButton1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.GuiButton1.EditMode = False
        Me.GuiButton1.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.GuiButton1.ForeColor = System.Drawing.Color.White
        Me.GuiButton1.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.GuiButton1.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.GuiButton1.Location = New System.Drawing.Point(432, -1)
        Me.GuiButton1.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.GuiButton1.Name = "GuiButton1"
        Me.GuiButton1.Radius = 55
        Me.GuiButton1.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.GuiButton1.ShadowColor = System.Drawing.Color.LightGray
        Me.GuiButton1.ShadowWidth = 2
        Me.GuiButton1.Size = New System.Drawing.Size(78, 409)
        Me.GuiButton1.TabIndex = 65
        Me.GuiButton1.Text = ""
        Me.GuiButton1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.GuiButton1.TextAngle = 0
        '
        'txtFilter
        '
        Me.txtFilter.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.txtFilter.BackColorFaded1 = System.Drawing.Color.White
        Me.txtFilter.BackColorFaded2 = System.Drawing.Color.White
        Me.txtFilter.BorderColor = System.Drawing.Color.Black
        Me.txtFilter.BorderWidth = 0
        Me.txtFilter.Cursor = System.Windows.Forms.Cursors.Hand
        Me.txtFilter.EditMode = False
        Me.txtFilter.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.txtFilter.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.txtFilter.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.txtFilter.Location = New System.Drawing.Point(522, 323)
        Me.txtFilter.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.txtFilter.Name = "txtFilter"
        Me.txtFilter.Radius = 55
        Me.txtFilter.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.txtFilter.ShadowColor = System.Drawing.Color.LightGray
        Me.txtFilter.ShadowWidth = 2
        Me.txtFilter.Size = New System.Drawing.Size(291, 60)
        Me.txtFilter.TabIndex = 59
        Me.txtFilter.Text = ""
        Me.txtFilter.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.txtFilter.TextAngle = 0
        '
        'lblFilter
        '
        Me.lblFilter.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.lblFilter.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblFilter.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(110, Byte), Integer))
        Me.lblFilter.BorderColor = System.Drawing.Color.Black
        Me.lblFilter.BorderWidth = 0
        Me.lblFilter.Cursor = System.Windows.Forms.Cursors.Hand
        Me.lblFilter.EditMode = False
        Me.lblFilter.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.lblFilter.ForeColor = System.Drawing.Color.Black
        Me.lblFilter.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.lblFilter.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.lblFilter.Location = New System.Drawing.Point(522, 249)
        Me.lblFilter.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.lblFilter.Name = "lblFilter"
        Me.lblFilter.Radius = 55
        Me.lblFilter.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.lblFilter.ShadowColor = System.Drawing.Color.LightGray
        Me.lblFilter.ShadowWidth = 2
        Me.lblFilter.Size = New System.Drawing.Size(291, 60)
        Me.lblFilter.TabIndex = 58
        Me.lblFilter.Text = "Filter"
        Me.lblFilter.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.lblFilter.TextAngle = 0
        '
        'guiKeyboard
        '
        Me.guiKeyboard.Location = New System.Drawing.Point(-8, 413)
        Me.guiKeyboard.Name = "guiKeyboard"
        Me.guiKeyboard.Size = New System.Drawing.Size(832, 252)
        Me.guiKeyboard.TabIndex = 57
        Me.guiKeyboard.Visible = False
        '
        'guiAcceptCancel
        '
        Me.guiAcceptCancel.BackColor = System.Drawing.Color.White
        Me.guiAcceptCancel.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiAcceptCancel.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiAcceptCancel.BorderColor = System.Drawing.Color.Black
        Me.guiAcceptCancel.BorderWidth = 0
        Me.guiAcceptCancel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiAcceptCancel.EditMode = False
        Me.guiAcceptCancel.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiAcceptCancel.ForeColor = System.Drawing.Color.White
        Me.guiAcceptCancel.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiAcceptCancel.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiAcceptCancel.Location = New System.Drawing.Point(516, 0)
        Me.guiAcceptCancel.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.guiAcceptCancel.Name = "guiAcceptCancel"
        Me.guiAcceptCancel.Radius = 55
        Me.guiAcceptCancel.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiAcceptCancel.ShadowColor = System.Drawing.Color.LightGray
        Me.guiAcceptCancel.ShadowWidth = 2
        Me.guiAcceptCancel.Size = New System.Drawing.Size(308, 152)
        Me.guiAcceptCancel.TabIndex = 70
        Me.guiAcceptCancel.Text = ""
        Me.guiAcceptCancel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiAcceptCancel.TextAngle = 0
        '
        'guiFilter
        '
        Me.guiFilter.BackColor = System.Drawing.Color.White
        Me.guiFilter.BackColorFaded1 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiFilter.BackColorFaded2 = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(51, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.guiFilter.BorderColor = System.Drawing.Color.Black
        Me.guiFilter.BorderWidth = 0
        Me.guiFilter.Cursor = System.Windows.Forms.Cursors.Hand
        Me.guiFilter.EditMode = False
        Me.guiFilter.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Bold)
        Me.guiFilter.ForeColor = System.Drawing.Color.White
        Me.guiFilter.ForeColorDisabled = System.Drawing.Color.LightGray
        Me.guiFilter.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical
        Me.guiFilter.Location = New System.Drawing.Point(516, 233)
        Me.guiFilter.Margin = New System.Windows.Forms.Padding(8, 7, 8, 7)
        Me.guiFilter.Name = "guiFilter"
        Me.guiFilter.Radius = 55
        Me.guiFilter.RectangleStyle = Zelo.Luma.RectangleStyle.Rounded
        Me.guiFilter.ShadowColor = System.Drawing.Color.LightGray
        Me.guiFilter.ShadowWidth = 2
        Me.guiFilter.Size = New System.Drawing.Size(308, 170)
        Me.guiFilter.TabIndex = 71
        Me.guiFilter.Text = ""
        Me.guiFilter.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.guiFilter.TextAngle = 0
        '
        'GUISelector
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.Controls.Add(Me.cmdAccept)
        Me.Controls.Add(Me.cmdCancel)
        Me.Controls.Add(Me.pnlScrollBar)
        Me.Controls.Add(Me.guiList)
        Me.Controls.Add(Me.cmdFDown)
        Me.Controls.Add(Me.cmdFUp)
        Me.Controls.Add(Me.cmdDown)
        Me.Controls.Add(Me.cmdUp)
        Me.Controls.Add(Me.GuiButton1)
        Me.Controls.Add(Me.txtFilter)
        Me.Controls.Add(Me.lblFilter)
        Me.Controls.Add(Me.guiKeyboard)
        Me.Controls.Add(Me.guiAcceptCancel)
        Me.Controls.Add(Me.guiFilter)
        Me.Name = "GUISelector"
        Me.Size = New System.Drawing.Size(832, 661)
        Me.pnlScrollBar.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents guiKeyboard As Zelo.Luma.GUIKeyboard
    Friend WithEvents txtFilter As Zelo.Luma.GUIButton
    Friend WithEvents lblFilter As Zelo.Luma.GUIButton
    Friend WithEvents GuiButton1 As Zelo.Luma.GUIButton
    Friend WithEvents cmdUp As Zelo.Luma.GUIButton
    Friend WithEvents cmdDown As Zelo.Luma.GUIButton
    Friend WithEvents cmdFUp As Zelo.Luma.GUIButton
    Friend WithEvents cmdFDown As Zelo.Luma.GUIButton
    Friend WithEvents guiList As Zelo.Luma.GUIButton
    Friend WithEvents pnlScrollBar As System.Windows.Forms.Panel
    Friend WithEvents lstItems As System.Windows.Forms.ListBox
    Friend WithEvents cmdCancel As Zelo.Luma.GUIButton
    Friend WithEvents cmdAccept As Zelo.Luma.GUIButton
    Friend WithEvents guiAcceptCancel As Zelo.Luma.GUIButton
    Friend WithEvents guiFilter As Zelo.Luma.GUIButton

End Class
