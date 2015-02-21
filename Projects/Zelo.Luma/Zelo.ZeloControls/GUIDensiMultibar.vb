' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Imports System.Drawing

Public Class GUIDensiMultibar

#Region "Constants"

#End Region

#Region "Variables"
    Protected m_dblRange As Double = 100
    Protected m_dblAcceptanceRange As Double = 10

    Protected m_ardblValues As New ArrayList
    Protected m_ardblRefValues As New ArrayList
    Protected m_intGroupNumber As Integer = 1
    Protected m_objGroupColor As Color = Color.Red
#End Region

#Region "Event"
    '   Public Shadows Event Click(ByVal sender As Object, ByVal e As System.EventArgs)
#End Region


#Region "Properties"

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(100.0)> _
    Public Property Range() As Double
        Get
            Return m_dblRange
        End Get
        Set(ByVal _dblRange As Double)
            m_dblRange = _dblRange
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(10.0)> _
    Public Property AcceptanceRange() As Double
        Get
            Return m_dblAcceptanceRange
        End Get
        Set(ByVal _dblAcceptanceRange As Double)
            m_dblAcceptanceRange = _dblAcceptanceRange
            Me.Invalidate()
        End Set
    End Property

    <System.ComponentModel.DefaultValue(30.0)> _
    Public ReadOnly Property Values() As ArrayList
        Get
            Return m_ardblValues
        End Get
    End Property

    <System.ComponentModel.DefaultValue(30.0)> _
    Public ReadOnly Property RefValues() As ArrayList
        Get
            Return m_ardblRefValues
        End Get
    End Property

    Public Property Value(ByVal _byIndex As Integer) As Double
        Get
            If _byIndex < Me.Values.Count Then
                Return CDbl(Me.Values(_byIndex))
            Else
                Return Nothing
            End If
        End Get
        Set(ByVal _dblValue As Double)
            If _byIndex < Me.Values.Count Then
                Me.Values(_byIndex) = _dblValue
                Me.Invalidate()
            End If
        End Set
    End Property

    Public Property RefValue(ByVal _byIndex As Integer) As Double
        Get
            If _byIndex < Me.RefValues.Count Then
                Return CDbl(Me.RefValues(_byIndex))
            Else
                Return Nothing
            End If
        End Get
        Set(ByVal _dblRefValue As Double)
            If _byIndex < Me.RefValues.Count Then
                Me.RefValues(_byIndex) = _dblRefValue
                Me.Invalidate()
            End If
        End Set
    End Property

    <System.ComponentModel.Category("Custom")> _
    <System.ComponentModel.DefaultValue(0)> _
    <System.ComponentModel.Browsable(True)> _
    Public Property GroupNumber() As Integer
        Get
            Return m_intGroupNumber
        End Get
        Set(ByVal _intGroupNumber As Integer)
            If m_intGroupNumber <> _intGroupNumber Then
                m_intGroupNumber = _intGroupNumber
                Me.Invalidate()
            End If
        End Set
    End Property


    <System.ComponentModel.Category("Custom")> _
<System.ComponentModel.DefaultValue("Color.Red")> _
<System.ComponentModel.Browsable(True)> _
Public Property GroupColor() As Color
        Get
            Return m_objGroupColor
        End Get
        Set(ByVal _objGroupColor As Color)
            If m_objGroupColor <> _objGroupColor Then
                m_objGroupColor = _objGroupColor
                Me.Invalidate()
            End If
        End Set
    End Property
#End Region

#Region "Methods"

#Region "Public Methods"
    Public Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        Me.SetStyle(ControlStyles.SupportsTransparentBackColor, True)
        Me.SetStyle(ControlStyles.UserPaint, True)
        Me.SetStyle(ControlStyles.ResizeRedraw, True)
        Me.SetStyle(ControlStyles.AllPaintingInWmPaint, True)
        Me.SetStyle(ControlStyles.OptimizedDoubleBuffer, True)
    End Sub
#End Region

#Region "Protected Methods"

#End Region

#Region "Events Handlers"

    Private Sub GUIDensibar_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Me.Paint
        Dim objLinearGradientBrush As LinearGradientBrush
        Dim sngHeigth As Single
        Dim sngTop As Single
        Dim sngWidth As Single
        Dim objPen As Pen
        Dim I As Integer

        e.Graphics.FillRectangle(Brushes.White, New RectangleF(2, 2, Me.Width - 4, Me.Height - 4))

        objLinearGradientBrush = New Drawing2D.LinearGradientBrush(New Rectangle(0, 0, Me.Width, CInt(Me.Height * 1.4)), Me.GroupColor, Color.White, LinearGradientMode.Vertical)
        sngWidth = CSng((Me.Width - 4) / Me.Values.Count)

        If Me.Enabled And Me.Range > 0 Then
            For I = 0 To Me.Values.Count - 1
                sngHeigth = CSng(Me.Value(I) / Me.Range * (Me.Height - 4))
                sngTop = (Me.Height - 2) - sngHeigth
                e.Graphics.FillRectangle(objLinearGradientBrush, New RectangleF(2 + (sngWidth * I), sngTop, sngWidth, sngHeigth))
                e.Graphics.DrawString(CStr(I + 1), _
                                        New Font("Arial", CSng(sngWidth * 0.8), FontStyle.Bold, GraphicsUnit.Pixel, New Byte()), _
                                        Brushes.White, _
                                        CSng(2 + (sngWidth * I) + (sngWidth * 0.1)), _
                                        CInt(Me.Height - sngWidth))

                sngHeigth = CSng(Me.RefValue(I) / Me.Range * (Me.Height - 4) + 2)
                sngTop = Me.Height - 2 - sngHeigth

                If I > 0 Then
                    objPen = New Pen(Color.White, 2)
                    e.Graphics.DrawLine(objPen, _
                                            CInt(2 + (sngWidth * I)), _
                                            2, _
                                            CInt(2 + (sngWidth * I)), _
                                            Me.Height - 2)

                End If

            Next

            'reference values
            For I = 0 To Me.Values.Count - 1
                objPen = New Pen(Color.Green, 2)
                sngHeigth = CSng(Me.RefValue(I) / Me.Range * (Me.Height - 4) + 2)
                sngTop = Me.Height - 2 - sngHeigth
                e.Graphics.DrawLine(objPen, _
                                        CInt(2 + sngWidth * I), _
                                        CInt(sngTop), _
                                        CInt(2 + sngWidth * (I + 1)), _
                                        CInt(sngTop))
            Next
        End If


        e.Graphics.DrawRectangle(Pens.LightGray, New Rectangle(1, 1, Me.Width - 2, Me.Height - 2))

    End Sub

#End Region

#End Region

End Class
