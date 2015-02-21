Release Information

App (DRemover98_2K) Version: V1.3.0.0
Driver Version for Win98 & Me: V1.5.0.0 [V1.5.0.25]
Driver Version for Win2K: V1.3.0.0 [V1.3.0.3]
Released date: 8/18/2001

Files Included in This Release:
	DRemover98_2K.exe
	readme.txt
	serwpl.inf
	Win98_ME\ser9pl.sys
	Win98_ME\serspl.inf
	Win98_ME\serspl.vxd
	Win2K\ser2pl.sys
		
Changes in This Release:
	1. To fix Casio PDA can't works with their AP throught PL-2303 driver and cable.
	2. to fixed GetCommProperties() function error issue
	3. to fixed Leadtek connect/disconnect problem
	4. to fixed Windows98/Me driver "WaitCommEvent()" problem
	5. to fixed TransmitCommChar() of WindowsAPI, try to send 1byte data. But, it isn't sent at all.
	6. to fixed Ericssion R380  AP sometime can't snyc with  outlook.
	7. to fixed Pl-2303 DCR value will be cahnge after suspend /resume in WinME, this case only happen in device without EEPROM.
	8. to fixed TA would get blue screen in send out "AT&V" command
	9. to fixed PC anywhere AP can't remote contral issue
Note:   all of these solutions are for Win98/ME driver only.