<System.Serializable()> Public Class Mark
    Protected m_objColor As Color
    Protected m_blnActive As Boolean

    Public Property Color() As Color
        Get
            Return m_objColor
        End Get
        Set(ByVal _objColor As Color)
            m_objColor = _objColor
        End Set
    End Property


    Public Property Active() As Boolean
        Get
            Return m_blnActive
        End Get
        Set(ByVal _blnActive As Boolean)
            m_blnActive = _blnActive
        End Set
    End Property
End Class
