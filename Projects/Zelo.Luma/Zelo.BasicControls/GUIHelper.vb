Imports System.Drawing.Drawing2D

' Fabio Cristini @ Zelo Elettronica srl
' http://www.zeloelettronica.it
' http://www.fabiocristini.com
'
Public Class GUIHelper

#Region "Constants"

#End Region

#Region "Variables"
#End Region

#Region "Events"

#End Region

#Region "Properties"

#End Region

#Region "Methods"

#Region "Public Methods"
    ' This method will change the square button to a circular button by 
    ' creating a new circle-shaped GraphicsPath object and setting it 
    ' to the RoundButton objects region.
    Public Shared Sub RoundControl(ByRef _objControl As Control, ByVal _enmRectangleStyle As RectangleStyle, ByVal _intRadius As Integer)
        Select Case _enmRectangleStyle
            Case Luma.RectangleStyle.Elliptic
                _objControl.Region = GetRoundedRect(_objControl.ClientRectangle, CSng(Math.Max(_objControl.ClientRectangle.Width, _objControl.ClientRectangle.Height) / 2))
            Case Luma.RectangleStyle.Rounded
                _objControl.Region = GetRoundedRect(_objControl.ClientRectangle, _intRadius)
            Case Else 'Luma.RectangleStyle.Squared
                _objControl.Region = New Region(_objControl.ClientRectangle)
        End Select
    End Sub

#End Region

#Region "Protected Methods"
    Protected Shared Function GetRoundedRect(ByVal BaseRect As RectangleF, ByVal Radius As Single) As Region
        ' If corner radius is less than or equal to zero, return the original Rectangle
        If Radius <= 0 Then Return New Region(BaseRect)
        ' If corner radius is greater than or equal to half the width or height (whichever is shorter) then
        ' return a capsule instead of a lozenge.
        If Radius >= (Math.Min(BaseRect.Width, BaseRect.Height) / 2.0) Then
            Return GetCapsule(BaseRect)
        End If

        Dim Diameter As Single = Radius + Radius
        Dim ArcRect As New RectangleF(BaseRect.Location, New SizeF(Diameter, Diameter))
        Dim RR As New Drawing2D.GraphicsPath()

        With RR
            ' top left arc
            .AddArc(ArcRect, 180, 90)

            ' top right arc
            ArcRect.X = BaseRect.Right - Diameter
            .AddArc(ArcRect, 270, 90)

            ' bottom right arc
            ArcRect.Y = BaseRect.Bottom - Diameter
            .AddArc(ArcRect, 0, 90)

            ' bottom left arc
            ArcRect.X = BaseRect.Left
            .AddArc(ArcRect, 90, 90)

            .CloseFigure()
        End With

        Return New Region(RR)
    End Function

    Protected Shared Function GetCapsule(ByVal BaseRect As RectangleF) As Region
        Dim Diameter As Single
        Dim ArcRect As RectangleF
        Dim RR As New Drawing2D.GraphicsPath()

        With RR
            Try
                If BaseRect.Width > BaseRect.Height Then
                    ' Return horizontal capsule
                    Diameter = BaseRect.Height
                    ArcRect = New RectangleF(BaseRect.Location, New SizeF(Diameter, Diameter))
                    .AddArc(ArcRect, 90, 180)
                    ArcRect.X = BaseRect.Right - Diameter
                    .AddArc(ArcRect, 270, 180)

                ElseIf BaseRect.Height > BaseRect.Width Then
                    ' Return vertical capsule
                    Diameter = BaseRect.Width
                    ArcRect = New RectangleF(BaseRect.Location, New SizeF(Diameter, Diameter))
                    .AddArc(ArcRect, 180, 180)
                    ArcRect.Y = BaseRect.Bottom - Diameter
                    .AddArc(ArcRect, 0, 180)

                Else
                    ' return circle
                    .AddEllipse(BaseRect)
                End If

            Catch e As Exception
                .AddEllipse(BaseRect)
            Finally
                .CloseFigure()
            End Try
        End With

        Return New Region(RR)
    End Function

#End Region


#End Region

End Class
