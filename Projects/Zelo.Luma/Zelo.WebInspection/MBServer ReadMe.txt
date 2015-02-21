Modbus Automation Server Installation

There is no installation setup with this server , but it's not very difficult to install. 

System and Files Requirements:

This software was tested with win95 and NT 4.0 with service pack 4.0

You need to install DCOM95 to work with win95 , download from 
www.microsoft.com/com/dcom95/download.asp

MFC,ATL and Ole32 Run-Time Files:

Download from http://members.tripod.com/~mbserver/archives/mfcatl.zip

Files Included with the server.

MBServer.exe - ActiveX server executable.
ModbusServer.tlb - Type Library with server component information.
Modbucfg.exe - Client test application
Moddocs.zip - home page and documentation of the software.


Modbus Server Installation

1. -  Install DCOM95 if you are using win95.

2.  - Install MFC, ATL and Ole run-time files from mfcatl.zip 
just type MBServer.exe /RegServer

3.  - Extract Server files (MBServer.exe,Modbucfg.exe,...) 
to any directory.

4. - Run Modbucfg.exe to test the installation. See the documentation.
If you have Visual Basic you can try vb sample. Maybe you have to choose
References and select MBSever.Exe before running the sample.


	You can uninstall the MBServer.exe typing 
	
	MBServer.exe /UnregServer 

to remove the registry entry and delete the directory 
where you extract the files. The run-time files should not
be uninstalled because many programs use MFC run-time files. 


Author Ricardo Saat - rsaat@altavista.net 
		      http://members.tripod.com/~mbserver/		
