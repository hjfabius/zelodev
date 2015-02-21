Public Enum ConnectionType
    Local = 1 'connect with using serial port 
    Remote = 2 'connect using TCP/IP
End Enum

Public Enum ConnectionParity
    No = 0
    Odd = 1
    Even = 2
    Mark = 3
    Space = 4
End Enum

Public Enum ConnectionStopBit
    OneStopBit = 0
    One5StopBits = 1
    TwoStopBits = 2
End Enum

Public Enum ConnectionFlowControl
    None = 0
    DTRDSR = 1
    RTSCTS = 2
    XONXOFF = 4
End Enum

Public Enum ConnectionTransmissionMode
    RTU = 0
    ASCII = 1
End Enum

Public Enum ConnectionReal
    Normal = 0
    Reverse = 1
End Enum

Public Enum SerialPort
    Com1 = 1
    Com2 = 2
    Com3 = 3
    Com4 = 4
    Com5 = 5
    Com6 = 6
    Com7 = 7
    Com8 = 8
End Enum

Public Enum BaudRate
    BaudRate57600 = 57600
    BaudRate38400 = 38400
    BaudRate19200 = 19200
    BaudRate9600 = 9600
    BaudRate4800 = 4800
    BaudRate2400 = 2400
    BaudRate1200 = 1200
End Enum
