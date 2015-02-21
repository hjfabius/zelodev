   1                     ; C Compiler for ST7 (COSMIC Software)
   2                     ; Generator V4.5.5 - 12 Jan 2006
1280                     .const:	section	.text
1281  0000               L327_mc_byApplicationVersion:
1282  0000 9d            	dc.b	157
1313                     	switch	.const
1314  0001               L147_mc_arstrSetupLabelsIT:
1315  0001 477561646167  	dc.b	"Guadagno longitudi"
1316  0013 6e2e202000    	dc.b	"n.  ",0
1317  0018 496e74657276  	dc.b	"Intervallo longitu"
1318  002a 642e202000    	dc.b	"d.  ",0
1319  002f 446572697661  	dc.b	"Derivativo longitu"
1320  0041 64696e2e00    	dc.b	"din.",0
1321  0046 5a6f6e61206d  	dc.b	"Zona morta longitu"
1322  0058 642e202000    	dc.b	"d.  ",0
1323  005d 56656c6f6369  	dc.b	"Velocita motore lo"
1324  006f 6e672e2000    	dc.b	"ng. ",0
1325  0074 477561646167  	dc.b	"Guadagno trasversa"
1326  0086 6c65202000    	dc.b	"le  ",0
1327  008b 496e74657276  	dc.b	"Intervallo trasver"
1328  009d 73616c6500    	dc.b	"sale",0
1329  00a2 5a6f6e61206d  	dc.b	"Zona morta trasver"
1330  00b4 73616c6500    	dc.b	"sale",0
1331  00b9 56656c6f6369  	dc.b	"Velocita motore tr"
1332  00cb 61732e2000    	dc.b	"as. ",0
1333  00d0 477561646167  	dc.b	"Guadagno tiro     "
1334  00e2 2020202000    	dc.b	"    ",0
1335  00e7 496e74657276  	dc.b	"Intervallo tiro   "
1336  00f9 2020202000    	dc.b	"    ",0
1337  00fe 56656c6f6369  	dc.b	"Velocita minima   "
1338  0110 2020202000    	dc.b	"    ",0
1339  0115 53616c746f20  	dc.b	"Salto anomalie    "
1340  0127 2020202000    	dc.b	"    ",0
1341  012c 53656e736962  	dc.b	"Sensibilta acc/dec"
1342  013e 2e20202000    	dc.b	".   ",0
1343  0143 5365676e6f20  	dc.b	"Segno di riferimen"
1344  0155 746f202000    	dc.b	"to  ",0
1345  015a 506f73697a69  	dc.b	"Posizione segno in"
1346  016c 204d4d2000    	dc.b	" MM ",0
1347  0171 466f726d6120  	dc.b	"Forma marca       "
1348  0183 2020202000    	dc.b	"    ",0
1349  0188 496e76657273  	dc.b	"Inversione correzi"
1350  019a 6f6e652000    	dc.b	"one ",0
1351  019f 4175746f2d52  	dc.b	"Auto-Registro dopo"
1352  01b1 2046342000    	dc.b	" F4 ",0
1353  01b6 4c696e677561  	dc.b	"Lingua            "
1354  01c8 2020202000    	dc.b	"    ",0
1355  01cd 547261737665  	dc.b	"Trasversale attivo"
1356  01df 2020202000    	dc.b	"    ",0
1357  01e4 5469726f2061  	dc.b	"Tiro attivo       "
1358  01f6 2020202000    	dc.b	"    ",0
1359  01fb 436f6c642053  	dc.b	"Cold Seal attivo  "
1360  020d 2020202000    	dc.b	"    ",0
1361  0212 5a6f6f6d2045  	dc.b	"Zoom Errore       "
1362  0224 2020202000    	dc.b	"    ",0
1363  0229 4170706c6963  	dc.b	"Applicazione Twin "
1364  023b 3031202000    	dc.b	"01  ",0
1365  0240 4170706c6963  	dc.b	"Applicazione Twin "
1366  0252 3032202000    	dc.b	"02  ",0
1367  0257 53656c657a69  	dc.b	"Selezione Encoder "
1368  0269 2020202000    	dc.b	"    ",0
1369  026e 4d6174726963  	dc.b	"Matricola Macchina"
1370  0280 2020202000    	dc.b	"    ",0
1371  0285 417265612076  	dc.b	"Area vuota in F4  "
1372  0297 2020202000    	dc.b	"    ",0
1373  029c 526974617264  	dc.b	"Ritardo Tastiera  "
1374  02ae 2020202000    	dc.b	"    ",0
1375  02b3 4d6172636120  	dc.b	"Marca PN attiva   "
1376  02c5 2020202000    	dc.b	"    ",0
1377  02ca 444143206c6f  	dc.b	"DAC long. attivo  "
1378  02dc 2020202000    	dc.b	"    ",0
1379  02e1 444143207472  	dc.b	"DAC trasv. attivo "
1380  02f3 2020202000    	dc.b	"    ",0
1381  02f8 444143207469  	dc.b	"DAC tiro attivo   "
1382  030a 2020202000    	dc.b	"    ",0
1383  030f 444143206775  	dc.b	"DAC guadagno longi"
1384  0321 7475642e00    	dc.b	"tud.",0
1385  0326 444143206775  	dc.b	"DAC guadagno tiro "
1386  0338 2020202000    	dc.b	"    ",0
1387  033d 444143206775  	dc.b	"DAC guadagno manua"
1388  034f 6c65202000    	dc.b	"le  ",0
1389  0354 444143206f66  	dc.b	"DAC offset        "
1390  0366 2020202000    	dc.b	"    ",0
1391  036b 4d6f73747261  	dc.b	"Mostra Svil. Cilin"
1392  037d 64726f2000    	dc.b	"dro ",0
1393  0382 54696d657220  	dc.b	"Timer SNI         "
1394  0394 2020202000    	dc.b	"    ",0
1395  0399               L347_mc_arstrSetupLabelsEN:
1396  0399 4c6f6e676974  	dc.b	"Longitudinal Gain "
1397  03ab 2020202000    	dc.b	"    ",0
1398  03b0 4c6f6e676974  	dc.b	"Longitudinal Inter"
1399  03c2 76616c2000    	dc.b	"val ",0
1400  03c7 4c6f6e676974  	dc.b	"Longitudinal Deriv"
1401  03d9 61742e2000    	dc.b	"at. ",0
1402  03de 4c6f6e676974  	dc.b	"Longitudinal Dead "
1403  03f0 5a6f6e6500    	dc.b	"Zone",0
1404  03f5 4c6f6e676974  	dc.b	"Longitudinal Motor"
1405  0407 2053706400    	dc.b	" Spd",0
1406  040c 5472616e7376  	dc.b	"Transversal Gain  "
1407  041e 2020202000    	dc.b	"    ",0
1408  0423 5472616e7376  	dc.b	"Transversal Interv"
1409  0435 616c202000    	dc.b	"al  ",0
1410  043a 5472616e7376  	dc.b	"Transversal Dead Z"
1411  044c 6f6e652000    	dc.b	"one ",0
1412  0451 5472616e7376  	dc.b	"Transversal Motor "
1413  0463 5370642000    	dc.b	"Spd ",0
1414  0468 54656e73696f  	dc.b	"Tension Gain      "
1415  047a 2020202000    	dc.b	"    ",0
1416  047f 54656e73696f  	dc.b	"Tension Interval  "
1417  0491 2020202000    	dc.b	"    ",0
1418  0496 4d696e696d75  	dc.b	"Minimum Speed     "
1419  04a8 2020202000    	dc.b	"    ",0
1420  04ad 4a756d702045  	dc.b	"Jump Error        "
1421  04bf 2020202000    	dc.b	"    ",0
1422  04c4 537065656420  	dc.b	"Speed Variation   "
1423  04d6 2020202000    	dc.b	"    ",0
1424  04db 526566657265  	dc.b	"Reference Mark    "
1425  04ed 2020202000    	dc.b	"    ",0
1426  04f2 4d61726b2050  	dc.b	"Mark Position in M"
1427  0504 4d20202000    	dc.b	"M   ",0
1428  0509 4d61726b2073  	dc.b	"Mark shape        "
1429  051b 2020202000    	dc.b	"    ",0
1430  0520 526576657273  	dc.b	"Reversal Correctio"
1431  0532 6e20202000    	dc.b	"n   ",0
1432  0537 4175746f2d52  	dc.b	"Auto-Register afte"
1433  0549 7220463400    	dc.b	"r F4",0
1434  054e 4c616e677561  	dc.b	"Language          "
1435  0560 2020202000    	dc.b	"    ",0
1436  0565 5472616e7376  	dc.b	"Transversal Enable"
1437  0577 6420202000    	dc.b	"d   ",0
1438  057c 54656e73696f  	dc.b	"Tension Enabled   "
1439  058e 2020202000    	dc.b	"    ",0
1440  0593 436f6c642053  	dc.b	"Cold Seal Enabled "
1441  05a5 2020202000    	dc.b	"    ",0
1442  05aa 4572726f7220  	dc.b	"Error Zoom        "
1443  05bc 2020202000    	dc.b	"    ",0
1444  05c1 5477696e2041  	dc.b	"Twin Application 0"
1445  05d3 3120202000    	dc.b	"1   ",0
1446  05d8 5477696e2041  	dc.b	"Twin Application 0"
1447  05ea 3220202000    	dc.b	"2   ",0
1448  05ef 456e636f6465  	dc.b	"Encoder Selection "
1449  0601 2020202000    	dc.b	"    ",0
1450  0606 4d616368696e  	dc.b	"Machine Serial Num"
1451  0618 6265722000    	dc.b	"ber ",0
1452  061d 456d70747920  	dc.b	"Empty Area in F4  "
1453  062f 2020202000    	dc.b	"    ",0
1454  0634 4b6579626f61  	dc.b	"Keyboard Delay    "
1455  0646 2020202000    	dc.b	"    ",0
1456  064b 504e206d6172  	dc.b	"PN mark enabled   "
1457  065d 2020202000    	dc.b	"    ",0
1458  0662 456e61626c65  	dc.b	"Enable DAC long.  "
1459  0674 2020202000    	dc.b	"    ",0
1460  0679 456e61626c65  	dc.b	"Enable DAC transv."
1461  068b 2020202000    	dc.b	"    ",0
1462  0690 456e61626c65  	dc.b	"Enable DAC tension"
1463  06a2 2020202000    	dc.b	"    ",0
1464  06a7 444143206c6f  	dc.b	"DAC longitud. gain"
1465  06b9 2020202000    	dc.b	"    ",0
1466  06be 444143207465  	dc.b	"DAC tension gain  "
1467  06d0 2020202000    	dc.b	"    ",0
1468  06d5 444143206d61  	dc.b	"DAC manual gain   "
1469  06e7 2020202000    	dc.b	"    ",0
1470  06ec 444143206f66  	dc.b	"DAC offset        "
1471  06fe 2020202000    	dc.b	"    ",0
1472  0703 53686f772063  	dc.b	"Show cylinder size"
1473  0715 2020202000    	dc.b	"    ",0
1474  071a 54696d657220  	dc.b	"Timer SNI         "
1475  072c 2020202000    	dc.b	"    ",0
1476  0731               L547_mc_arstrSetupLabelsDE:
1477  0731 4c616e676520  	dc.b	"Lange Gewinn      "
1478  0743 2020202000    	dc.b	"    ",0
1479  0748 4c616e676520  	dc.b	"Lange Interwal    "
1480  075a 2020202000    	dc.b	"    ",0
1481  075f 4c616e676520  	dc.b	"Lange Ruckstand   "
1482  0771 2020202000    	dc.b	"    ",0
1483  0776 546f747a6f6e  	dc.b	"Totzone lange Regi"
1484  0788 7374657200    	dc.b	"ster",0
1485  078d 476573636877  	dc.b	"Geschwin. lange Mo"
1486  079f 746f722000    	dc.b	"tor ",0
1487  07a4 517565722047  	dc.b	"Quer Gewinn       "
1488  07b6 2020202000    	dc.b	"    ",0
1489  07bb 517565722049  	dc.b	"Quer Interwal     "
1490  07cd 2020202000    	dc.b	"    ",0
1491  07d2 517565722054  	dc.b	"Quer Totzone      "
1492  07e4 2020202000    	dc.b	"    ",0
1493  07e9 476573636877  	dc.b	"Geschwin. quer Mot"
1494  07fb 6f72202000    	dc.b	"or  ",0
1495  0800 476577696e6e  	dc.b	"Gewinn Spannung   "
1496  0812 2020202000    	dc.b	"    ",0
1497  0817 496e74657277  	dc.b	"Interwal Spannung "
1498  0829 2020202000    	dc.b	"    ",0
1499  082e 4d696e696d61  	dc.b	"Minimal Geschwindi"
1500  0840 676b2e2000    	dc.b	"gk. ",0
1501  0845 4665686c6572  	dc.b	"Fehler Uberspringe"
1502  0857 6e20202000    	dc.b	"n   ",0
1503  085c 53656e736962  	dc.b	"Sensibilit",228
1504  0867 7420686f6368  	dc.b	"t hochlauf ",0
1505  0873 48696e776569  	dc.b	"Hinweis Marke     "
1506  0885 2020202000    	dc.b	"    ",0
1507  088a 4d61726b6520  	dc.b	"Marke Stellung MM "
1508  089c 2020202000    	dc.b	"    ",0
1509  08a1 4d61726b6520  	dc.b	"Marke Form        "
1510  08b3 2020202000    	dc.b	"    ",0
1511  08b8 556d6b656872  	dc.b	"Umkehrung Korrektu"
1512  08ca 7220202000    	dc.b	"r   ",0
1513  08cf 4175746f2d52  	dc.b	"Auto-Register nach"
1514  08e1 2046342000    	dc.b	" F4 ",0
1515  08e6 537072616368  	dc.b	"Sprache           "
1516  08f8 2020202000    	dc.b	"    ",0
1517  08fd 616b74697620  	dc.b	"aktiv Quer        "
1518  090f 2020202000    	dc.b	"    ",0
1519  0914 616b74697620  	dc.b	"aktiv Spannung    "
1520  0926 2020202000    	dc.b	"    ",0
1521  092b 616b74697620  	dc.b	"aktiv Cold seal   "
1522  093d 2020202000    	dc.b	"    ",0
1523  0942 5a6f6f6d2046  	dc.b	"Zoom Fehler       "
1524  0954 2020202000    	dc.b	"    ",0
1525  0959 416e77656e64  	dc.b	"Anwendung Twin 01 "
1526  096b 2020202000    	dc.b	"    ",0
1527  0970 416e77656e64  	dc.b	"Anwendung Twin 02 "
1528  0982 2020202000    	dc.b	"    ",0
1529  0987 417573776168  	dc.b	"Auswahl Encoder   "
1530  0999 2020202000    	dc.b	"    ",0
1531  099e 4b656e6e756d  	dc.b	"Kennummer Register"
1532  09b0 2020202000    	dc.b	"    ",0
1533  09b5 447275636b66  	dc.b	"Druckfreier Bereic"
1534  09c7 6820463400    	dc.b	"h F4",0
1535  09cc 5665727a6f67  	dc.b	"Verzogerung Tastat"
1536  09de 7572202000    	dc.b	"ur  ",0
1537  09e3 4d61726b6520  	dc.b	"Marke PN aktiv    "
1538  09f5 2020202000    	dc.b	"    ",0
1539  09fa 44414320616b  	dc.b	"DAC aktiv l",228
1540  0a06 6e6765202020  	dc.b	"nge       ",0
1541  0a11 44414320616b  	dc.b	"DAC aktiv quer    "
1542  0a23 2020202000    	dc.b	"    ",0
1543  0a28 44414320616b  	dc.b	"DAC aktiv Spannung"
1544  0a3a 2020202000    	dc.b	"    ",0
1545  0a3f 444143206c61  	dc.b	"DAC lange Gewinn  "
1546  0a51 2020202000    	dc.b	"    ",0
1547  0a56 444143204765  	dc.b	"DAC Gewinn Spannun"
1548  0a68 6720202000    	dc.b	"g   ",0
1549  0a6d 444143206d61  	dc.b	"DAC manual Gewinn "
1550  0a7f 2020202000    	dc.b	"    ",0
1551  0a84 444143204f66  	dc.b	"DAC Offset        "
1552  0a96 2020202000    	dc.b	"    ",0
1553  0a9b 5a796c696e64  	dc.b	"Zylindergro",223
1554  0aa7 65207a656967  	dc.b	"e zeigen  ",0
1555  0ab2 54696d657220  	dc.b	"Timer SNI         "
1556  0ac4 2020202000    	dc.b	"    ",0
1557  0ac9               L747_mc_arstrSetupLabelsFR:
1558  0ac9 4761696e2063  	dc.b	"Gain circonferenti"
1559  0adb 616c202000    	dc.b	"al  ",0
1560  0ae0 4379636c6971  	dc.b	"Cyclique circonfer"
1561  0af2 2e20202000    	dc.b	".   ",0
1562  0af7 446572697661  	dc.b	"Derivativ circonfe"
1563  0b09 722e202000    	dc.b	"r.  ",0
1564  0b0e 5a6f6e65206d  	dc.b	"Zone morte circonf"
1565  0b20 65722e2000    	dc.b	"er. ",0
1566  0b25 566974657373  	dc.b	"Vitesse moteur cir"
1567  0b37 636f6e2e00    	dc.b	"con.",0
1568  0b3c 4761696e2074  	dc.b	"Gain trasversal   "
1569  0b4e 2020202000    	dc.b	"    ",0
1570  0b53 4379636c6971  	dc.b	"Cyclique trasversa"
1571  0b65 6c20202000    	dc.b	"l   ",0
1572  0b6a 5a6f6e65206d  	dc.b	"Zone morte circonf"
1573  0b7c 65722e2000    	dc.b	"er. ",0
1574  0b81 566974657373  	dc.b	"Vitesse moteur tra"
1575  0b93 73762e2000    	dc.b	"sv. ",0
1576  0b98 4761696e2064  	dc.b	"Gain de la tension"
1577  0baa 2020202000    	dc.b	"    ",0
1578  0baf 4379636c6971  	dc.b	"Cyclique de tensio"
1579  0bc1 6e20202000    	dc.b	"n   ",0
1580  0bc6 566974657373  	dc.b	"Vitesse moindre   "
1581  0bd8 2020202000    	dc.b	"    ",0
1582  0bdd 536175742064  	dc.b	"Saut de erreur    "
1583  0bef 2020202000    	dc.b	"    ",0
1584  0bf4 566172696174  	dc.b	"Variation de vites"
1585  0c06 7365202000    	dc.b	"se  ",0
1586  0c0b 4d6172717565  	dc.b	"Marque de referenc"
1587  0c1d 6520202000    	dc.b	"e   ",0
1588  0c22 506f73697469  	dc.b	"Position de marque"
1589  0c34 204d4d2000    	dc.b	" MM ",0
1590  0c39 466f726d6520  	dc.b	"Forme de la marque"
1591  0c4b 2020202000    	dc.b	"    ",0
1592  0c50 496e76657273  	dc.b	"Inversion correcti"
1593  0c62 6f6e202000    	dc.b	"on  ",0
1594  0c67 4175746f2d52  	dc.b	"Auto-Reperage apre"
1595  0c79 7320463400    	dc.b	"s F4",0
1596  0c7e 4c616e677565  	dc.b	"Langue            "
1597  0c90 2020202000    	dc.b	"    ",0
1598  0c95 547261737665  	dc.b	"Trasversal actif  "
1599  0ca7 2020202000    	dc.b	"    ",0
1600  0cac 54656e73696f  	dc.b	"Tension actif     "
1601  0cbe 2020202000    	dc.b	"    ",0
1602  0cc3 436f6c642053  	dc.b	"Cold Seal actif   "
1603  0cd5 2020202000    	dc.b	"    ",0
1604  0cda 457272657572  	dc.b	"Erreur zoom       "
1605  0cec 2020202000    	dc.b	"    ",0
1606  0cf1 4170706c6963  	dc.b	"Application Twin 0"
1607  0d03 3120202000    	dc.b	"1   ",0
1608  0d08 4170706c6963  	dc.b	"Application Twin 0"
1609  0d1a 3220202000    	dc.b	"2   ",0
1610  0d1f 53656c656374  	dc.b	"Selection encoder "
1611  0d31 2020202000    	dc.b	"    ",0
1612  0d36 4d6174726963  	dc.b	"Matricule machine "
1613  0d48 2020202000    	dc.b	"    ",0
1614  0d4d 5a6f6e65206c  	dc.b	"Zone libre impres."
1615  0d5f 2020463400    	dc.b	"  F4",0
1616  0d64 526574617264  	dc.b	"Retard clavier    "
1617  0d76 2020202000    	dc.b	"    ",0
1618  0d7b 4d6172717565  	dc.b	"Marque PN actif   "
1619  0d8d 2020202000    	dc.b	"    ",0
1620  0d92 444143206369  	dc.b	"DAC circonfer. act"
1621  0da4 6966202000    	dc.b	"if  ",0
1622  0da9 444143207472  	dc.b	"DAC trasversal act"
1623  0dbb 6966202000    	dc.b	"if  ",0
1624  0dc0 444143207465  	dc.b	"DAC tension actif "
1625  0dd2 2020202000    	dc.b	"    ",0
1626  0dd7 444143206761  	dc.b	"DAC gain circonfer"
1627  0de9 2e20202000    	dc.b	".   ",0
1628  0dee 444143206761  	dc.b	"DAC gain de la ten"
1629  0e00 73696f6e00    	dc.b	"sion",0
1630  0e05 444143206761  	dc.b	"DAC gain manuel   "
1631  0e17 2020202000    	dc.b	"    ",0
1632  0e1c 444143206f66  	dc.b	"DAC offset        "
1633  0e2e 2020202000    	dc.b	"    ",0
1634  0e33 4d6f6e747265  	dc.b	"Montrer le cylindr"
1635  0e45 6520202000    	dc.b	"e   ",0
1636  0e4a 54696d657220  	dc.b	"Timer SNI         "
1637  0e5c 2020202000    	dc.b	"    ",0
1638  0e61               L157_mc_arstrSetupLabelsES:
1639  0e61 47616e616e63  	dc.b	"Ganancia circunfer"
1640  0e73 656e2e2000    	dc.b	"en. ",0
1641  0e78 4369636c6963  	dc.b	"Ciclico circunfere"
1642  0e8a 6e2e202000    	dc.b	"n.  ",0
1643  0e8f 446572697661  	dc.b	"Derivativo circunf"
1644  0ea1 65722e2000    	dc.b	"er. ",0
1645  0ea6 5a6f6e61206d  	dc.b	"Zona muerta cincun"
1646  0eb8 662e202000    	dc.b	"f.  ",0
1647  0ebd 56656c6f6369  	dc.b	"Velocidad motor ci"
1648  0ecf 7263752e00    	dc.b	"rcu.",0
1649  0ed4 47616e616e63  	dc.b	"Ganancia transvers"
1650  0ee6 616c202000    	dc.b	"al  ",0
1651  0eeb 4369636c6963  	dc.b	"Ciclico transversa"
1652  0efd 6c20202000    	dc.b	"l   ",0
1653  0f02 5a6f6e61206d  	dc.b	"Zona muerta trans."
1654  0f14 2020202000    	dc.b	"    ",0
1655  0f19 56656c6f6369  	dc.b	"Velocidad motor tr"
1656  0f2b 616e732e00    	dc.b	"ans.",0
1657  0f30 47616e616e63  	dc.b	"Ganancia de tensi",243
1658  0f42 6e20202000    	dc.b	"n   ",0
1659  0f47 4369636c6963  	dc.b	"Ciclico de la tens"
1660  0f59 69f3          	dc.b	"i",243
1661  0f5b 6e2000        	dc.b	"n ",0
1662  0f5e 56656c6f6369  	dc.b	"Velocidad minima  "
1663  0f70 2020202000    	dc.b	"    ",0
1664  0f75 53616c746f20  	dc.b	"Salto de error    "
1665  0f87 2020202000    	dc.b	"    ",0
1666  0f8c 566172696163  	dc.b	"Variaci",243
1667  0f94 6e2076656c6f  	dc.b	"n velocidad   ",0
1668  0fa3 4d6172636120  	dc.b	"Marca de referenci"
1669  0fb5 6120202000    	dc.b	"a   ",0
1670  0fba 506f73696369  	dc.b	"Posici",243
1671  0fc1 6e2064656c20  	dc.b	"n del senal MM ",0
1672  0fd1 466f726d6120  	dc.b	"Forma marca       "
1673  0fe3 2020202000    	dc.b	"    ",0
1674  0fe8 43616d62696f  	dc.b	"Cambio correcci",243
1675  0ff8 6e2020202020  	dc.b	"n     ",0
1676  0fff 4175746f2d52  	dc.b	"Auto-Registro F4  "
1677  1011 2020202000    	dc.b	"    ",0
1678  1016 4c656e677561  	dc.b	"Lengua            "
1679  1028 2020202000    	dc.b	"    ",0
1680  102d 5472616e7376  	dc.b	"Transversal activo"
1681  103f 2020202000    	dc.b	"    ",0
1682  1044 54656e7369f3  	dc.b	"Tensi",243
1683  104a 6e2061637469  	dc.b	"n activo        ",0
1684  105b 436f6c642053  	dc.b	"Cold Seal activo  "
1685  106d 2020202000    	dc.b	"    ",0
1686  1072 5a6f6f6d2065  	dc.b	"Zoom error        "
1687  1084 2020202000    	dc.b	"    ",0
1688  1089 41706c696361  	dc.b	"Aplicaci",243
1689  1092 6e205477696e  	dc.b	"n Twin 01    ",0
1690  10a0 41706c696361  	dc.b	"Aplicaci",243
1691  10a9 6e205477696e  	dc.b	"n Twin 02    ",0
1692  10b7 53656c656363  	dc.b	"Selecci",243
1693  10bf 6e20656e636f  	dc.b	"n encoder     ",0
1694  10ce 4d6174726963  	dc.b	"Matricula maquina "
1695  10e0 2020202000    	dc.b	"    ",0
1696  10e5 417265612069  	dc.b	"Area imprenta libr"
1697  10f7 6520463400    	dc.b	"e F4",0
1698  10fc 526574617264  	dc.b	"Retardo tecla     "
1699  110e 2020202000    	dc.b	"    ",0
1700  1113 4d6172636120  	dc.b	"Marca PN activo   "
1701  1125 2020202000    	dc.b	"    ",0
1702  112a 444143206369  	dc.b	"DAC circonf. Activ"
1703  113c 6f20202000    	dc.b	"o   ",0
1704  1141 444143207472  	dc.b	"DAC transversal Ac"
1705  1153 7469766f00    	dc.b	"tivo",0
1706  1158 444143207465  	dc.b	"DAC tensione Activ"
1707  116a 6f20202000    	dc.b	"o   ",0
1708  116f 444143206761  	dc.b	"DAC ganancia circu"
1709  1181 6e662e2000    	dc.b	"nf. ",0
1710  1186 444143206761  	dc.b	"DAC ganancia tensi"
1711  1198 6f6e202000    	dc.b	"on  ",0
1712  119d 444143206761  	dc.b	"DAC ganancia manua"
1713  11af 6c20202000    	dc.b	"l   ",0
1714  11b4 444143206f66  	dc.b	"DAC offset        "
1715  11c6 2020202000    	dc.b	"    ",0
1716  11cb 44656d6f7374  	dc.b	"Demostrar el cilin"
1717  11dd 64726f2000    	dc.b	"dro ",0
1718  11e2 54696d657220  	dc.b	"Timer SNI         "
1719  11f4 2020202000    	dc.b	"    ",0
1761                     	switch	.const
1762  11f9               L01:
1763  11f9 003a          	dc.w	L557
1764  11fb 0044          	dc.w	L167
1765  11fd 003f          	dc.w	L757
1766  11ff 0049          	dc.w	L367
1767  1201 0058          	dc.w	L177
1768  1203 005d          	dc.w	L377
1769  1205 0062          	dc.w	L577
1770  1207 0067          	dc.w	L777
1771  1209 006c          	dc.w	L1001
1772  120b 0071          	dc.w	L3001
1773  120d 0076          	dc.w	L5001
1774  120f 007b          	dc.w	L7001
1775  1211 0080          	dc.w	L1101
1776  1213 0085          	dc.w	L3101
1777  1215 008a          	dc.w	L5101
1778  1217 008f          	dc.w	L7101
1779  1219 0094          	dc.w	L1201
1780  121b 0099          	dc.w	L3201
1781  121d 009e          	dc.w	L5201
1782  121f 00a3          	dc.w	L7201
1783  1221 00a8          	dc.w	L1301
1784  1223 00ad          	dc.w	L3301
1785  1225 00b2          	dc.w	L5301
1786  1227 00b7          	dc.w	L7301
1787  1229 00bc          	dc.w	L1401
1788  122b 0274          	dc.w	L1231
1789  122d 00d0          	dc.w	L1501
1790  122f 00d5          	dc.w	L3501
1791  1231 00da          	dc.w	L5501
1792  1233 00df          	dc.w	L7501
1793  1235 00e4          	dc.w	L1601
1794  1237 00e9          	dc.w	L3601
1795  1239 00ee          	dc.w	L5601
1796  123b 00f3          	dc.w	L7601
1797  123d 00f8          	dc.w	L1701
1798  123f 00fd          	dc.w	L3701
1799  1241 0102          	dc.w	L5701
1800  1243 0107          	dc.w	L7701
1801  1245 010c          	dc.w	L1011
1802  1247 0111          	dc.w	L3011
1803  1249 0116          	dc.w	L5011
1804  124b 011b          	dc.w	L7011
1805  124d 0120          	dc.w	L1111
1806  124f 0125          	dc.w	L3111
1807  1251 012a          	dc.w	L5111
1808  1253 012f          	dc.w	L7111
1809  1255 0134          	dc.w	L1211
1810  1257 0139          	dc.w	L3211
1811  1259 013e          	dc.w	L5211
1812  125b 0143          	dc.w	L7211
1813  125d 0148          	dc.w	L1311
1814  125f 014d          	dc.w	L3311
1815  1261 0152          	dc.w	L5311
1816  1263 0157          	dc.w	L7311
1817  1265 015c          	dc.w	L1411
1818  1267 0161          	dc.w	L3411
1819  1269 0166          	dc.w	L5411
1820  126b 016b          	dc.w	L7411
1821  126d 0170          	dc.w	L1511
1822  126f 0175          	dc.w	L3511
1823  1271 017a          	dc.w	L5511
1824  1273 00c6          	dc.w	L5401
1825  1275 00cb          	dc.w	L7401
1826  1277 017f          	dc.w	L7511
1827  1279 0184          	dc.w	L1611
1828  127b 0189          	dc.w	L3611
1829  127d 018e          	dc.w	L5611
1830  127f 0193          	dc.w	L7611
1831  1281 0198          	dc.w	L1711
1832  1283 019d          	dc.w	L3711
1833  1285 01a2          	dc.w	L5711
1834  1287 01a7          	dc.w	L7711
1835  1289 01ac          	dc.w	L1021
1836  128b 01b1          	dc.w	L3021
1837  128d 01b6          	dc.w	L5021
1838  128f 01bb          	dc.w	L7021
1839  1291 01c0          	dc.w	L1121
1840  1293 01c5          	dc.w	L3121
1841  1295 01ca          	dc.w	L5121
1842  1297 01cf          	dc.w	L7121
1843  1299 01d4          	dc.w	L1221
1844  129b 01d9          	dc.w	L3221
1845  129d 01de          	dc.w	L5221
1846  129f 01e3          	dc.w	L7221
1847  12a1 01e8          	dc.w	L1321
1848  12a3 01ed          	dc.w	L3321
1849  12a5 01f2          	dc.w	L5321
1850  12a7 01f7          	dc.w	L7321
1851  12a9 01fc          	dc.w	L1421
1852  12ab 00c1          	dc.w	L3401
1853  12ad 0201          	dc.w	L3421
1854  12af 0206          	dc.w	L5421
1855  12b1 020b          	dc.w	L7421
1856  12b3 0210          	dc.w	L1521
1857  12b5 0215          	dc.w	L3521
1858  12b7 021a          	dc.w	L5521
1859  12b9 021f          	dc.w	L7521
1860  12bb 0224          	dc.w	L1621
1861  12bd 0229          	dc.w	L3621
1862  12bf 022e          	dc.w	L5621
1863  12c1 0233          	dc.w	L7621
1864  12c3 0238          	dc.w	L1721
1865  12c5 023d          	dc.w	L3721
1866  12c7 0242          	dc.w	L5721
1867  12c9 0247          	dc.w	L7721
1868  12cb 024c          	dc.w	L1031
1869  12cd 0251          	dc.w	L3031
1870  12cf 0256          	dc.w	L5031
1871  12d1 025b          	dc.w	L7031
1872  12d3 0260          	dc.w	L1131
1873  12d5 0265          	dc.w	L3131
1874  12d7 026a          	dc.w	L5131
1875  12d9 026f          	dc.w	L7131
1876  12db 004e          	dc.w	L567
1877  12dd 0053          	dc.w	L767
1878  12df               L41:
1879  12df 0290          	dc.w	L5231
1880  12e1 029a          	dc.w	L1331
1881  12e3 0295          	dc.w	L7231
1882  12e5 029f          	dc.w	L3331
1883  12e7 02ae          	dc.w	L1431
1884  12e9 02b3          	dc.w	L3431
1885  12eb 02b8          	dc.w	L5431
1886  12ed 02bd          	dc.w	L7431
1887  12ef 02c2          	dc.w	L1531
1888  12f1 02c7          	dc.w	L3531
1889  12f3 02cc          	dc.w	L5531
1890  12f5 02d1          	dc.w	L7531
1891  12f7 02d6          	dc.w	L1631
1892  12f9 02db          	dc.w	L3631
1893  12fb 02e0          	dc.w	L5631
1894  12fd 02e5          	dc.w	L7631
1895  12ff 02ea          	dc.w	L1731
1896  1301 02ef          	dc.w	L3731
1897  1303 02f4          	dc.w	L5731
1898  1305 02f9          	dc.w	L7731
1899  1307 02fe          	dc.w	L1041
1900  1309 0303          	dc.w	L3041
1901  130b 0308          	dc.w	L5041
1902  130d 030d          	dc.w	L7041
1903  130f 0312          	dc.w	L1141
1904  1311 04ca          	dc.w	L1153
1905  1313 0326          	dc.w	L1241
1906  1315 032b          	dc.w	L3241
1907  1317 0330          	dc.w	L5241
1908  1319 0335          	dc.w	L7241
1909  131b 033a          	dc.w	L1341
1910  131d 033f          	dc.w	L3341
1911  131f 0344          	dc.w	L5341
1912  1321 0349          	dc.w	L7341
1913  1323 034e          	dc.w	L1441
1914  1325 0353          	dc.w	L3441
1915  1327 0358          	dc.w	L5441
1916  1329 035d          	dc.w	L7441
1917  132b 0362          	dc.w	L1541
1918  132d 0367          	dc.w	L3541
1919  132f 036c          	dc.w	L5541
1920  1331 0371          	dc.w	L7541
1921  1333 0376          	dc.w	L1641
1922  1335 037b          	dc.w	L3641
1923  1337 0380          	dc.w	L5641
1924  1339 0385          	dc.w	L7641
1925  133b 038a          	dc.w	L1741
1926  133d 038f          	dc.w	L3741
1927  133f 0394          	dc.w	L5741
1928  1341 0399          	dc.w	L7741
1929  1343 039e          	dc.w	L1051
1930  1345 03a3          	dc.w	L3051
1931  1347 03a8          	dc.w	L5051
1932  1349 03ad          	dc.w	L7051
1933  134b 03b2          	dc.w	L1151
1934  134d 03b7          	dc.w	L3151
1935  134f 03bc          	dc.w	L5151
1936  1351 03c1          	dc.w	L7151
1937  1353 03c6          	dc.w	L1251
1938  1355 03cb          	dc.w	L3251
1939  1357 03d0          	dc.w	L5251
1940  1359 031c          	dc.w	L5141
1941  135b 0321          	dc.w	L7141
1942  135d 03d5          	dc.w	L7251
1943  135f 03da          	dc.w	L1351
1944  1361 03df          	dc.w	L3351
1945  1363 03e4          	dc.w	L5351
1946  1365 03e9          	dc.w	L7351
1947  1367 03ee          	dc.w	L1451
1948  1369 03f3          	dc.w	L3451
1949  136b 03f8          	dc.w	L5451
1950  136d 03fd          	dc.w	L7451
1951  136f 0402          	dc.w	L1551
1952  1371 0407          	dc.w	L3551
1953  1373 040c          	dc.w	L5551
1954  1375 0411          	dc.w	L7551
1955  1377 0416          	dc.w	L1651
1956  1379 041b          	dc.w	L3651
1957  137b 0420          	dc.w	L5651
1958  137d 0425          	dc.w	L7651
1959  137f 042a          	dc.w	L1751
1960  1381 042f          	dc.w	L3751
1961  1383 0434          	dc.w	L5751
1962  1385 0439          	dc.w	L7751
1963  1387 043e          	dc.w	L1061
1964  1389 0443          	dc.w	L3061
1965  138b 0448          	dc.w	L5061
1966  138d 044d          	dc.w	L7061
1967  138f 0452          	dc.w	L1161
1968  1391 0317          	dc.w	L3141
1969  1393 0457          	dc.w	L3161
1970  1395 045c          	dc.w	L5161
1971  1397 0461          	dc.w	L7161
1972  1399 0466          	dc.w	L1261
1973  139b 046b          	dc.w	L3261
1974  139d 0470          	dc.w	L5261
1975  139f 0475          	dc.w	L7261
1976  13a1 047a          	dc.w	L1361
1977  13a3 047f          	dc.w	L3361
1978  13a5 0484          	dc.w	L5361
1979  13a7 0489          	dc.w	L7361
1980  13a9 048e          	dc.w	L1461
1981  13ab 0493          	dc.w	L3461
1982  13ad 0498          	dc.w	L5461
1983  13af 049d          	dc.w	L7461
1984  13b1 04a2          	dc.w	L1561
1985  13b3 04a7          	dc.w	L3561
1986  13b5 04ac          	dc.w	L5561
1987  13b7 04b1          	dc.w	L7561
1988  13b9 04b6          	dc.w	L1661
1989  13bb 04bb          	dc.w	L3661
1990  13bd 04c0          	dc.w	L5661
1991  13bf 04c5          	dc.w	L7661
1992  13c1 02a4          	dc.w	L5331
1993  13c3 02a9          	dc.w	L7331
1994  13c5               L02:
1995  13c5 04e1          	dc.w	L3761
1996  13c7 04eb          	dc.w	L7761
1997  13c9 04e6          	dc.w	L5761
1998  13cb 04f0          	dc.w	L1071
1999  13cd 04ff          	dc.w	L7071
2000  13cf 0504          	dc.w	L1171
2001  13d1 0509          	dc.w	L3171
2002  13d3 050e          	dc.w	L5171
2003  13d5 0513          	dc.w	L7171
2004  13d7 0518          	dc.w	L1271
2005  13d9 051d          	dc.w	L3271
2006  13db 0522          	dc.w	L5271
2007  13dd 0527          	dc.w	L7271
2008  13df 052c          	dc.w	L1371
2009  13e1 0531          	dc.w	L3371
2010  13e3 0536          	dc.w	L5371
2011  13e5 053b          	dc.w	L7371
2012  13e7 0540          	dc.w	L1471
2013  13e9 0545          	dc.w	L3471
2014  13eb 054a          	dc.w	L5471
2015  13ed 054f          	dc.w	L7471
2016  13ef 0554          	dc.w	L1571
2017  13f1 0559          	dc.w	L3571
2018  13f3 055e          	dc.w	L5571
2019  13f5 0563          	dc.w	L7571
2020  13f7 071b          	dc.w	L3473
2021  13f9 0577          	dc.w	L7671
2022  13fb 057c          	dc.w	L1771
2023  13fd 0581          	dc.w	L3771
2024  13ff 0586          	dc.w	L5771
2025  1401 058b          	dc.w	L7771
2026  1403 0590          	dc.w	L1002
2027  1405 0595          	dc.w	L3002
2028  1407 059a          	dc.w	L5002
2029  1409 059f          	dc.w	L7002
2030  140b 05a4          	dc.w	L1102
2031  140d 05a9          	dc.w	L3102
2032  140f 05ae          	dc.w	L5102
2033  1411 05b3          	dc.w	L7102
2034  1413 05b8          	dc.w	L1202
2035  1415 05bd          	dc.w	L3202
2036  1417 05c2          	dc.w	L5202
2037  1419 05c7          	dc.w	L7202
2038  141b 05cc          	dc.w	L1302
2039  141d 05d1          	dc.w	L3302
2040  141f 05d6          	dc.w	L5302
2041  1421 05db          	dc.w	L7302
2042  1423 05e0          	dc.w	L1402
2043  1425 05e5          	dc.w	L3402
2044  1427 05ea          	dc.w	L5402
2045  1429 05ef          	dc.w	L7402
2046  142b 05f4          	dc.w	L1502
2047  142d 05f9          	dc.w	L3502
2048  142f 05fe          	dc.w	L5502
2049  1431 0603          	dc.w	L7502
2050  1433 0608          	dc.w	L1602
2051  1435 060d          	dc.w	L3602
2052  1437 0612          	dc.w	L5602
2053  1439 0617          	dc.w	L7602
2054  143b 061c          	dc.w	L1702
2055  143d 0621          	dc.w	L3702
2056  143f 056d          	dc.w	L3671
2057  1441 0572          	dc.w	L5671
2058  1443 0626          	dc.w	L5702
2059  1445 062b          	dc.w	L7702
2060  1447 0630          	dc.w	L1012
2061  1449 0635          	dc.w	L3012
2062  144b 063a          	dc.w	L5012
2063  144d 063f          	dc.w	L7012
2064  144f 0644          	dc.w	L1112
2065  1451 0649          	dc.w	L3112
2066  1453 064e          	dc.w	L5112
2067  1455 0653          	dc.w	L7112
2068  1457 0658          	dc.w	L1212
2069  1459 065d          	dc.w	L3212
2070  145b 0662          	dc.w	L5212
2071  145d 0667          	dc.w	L7212
2072  145f 066c          	dc.w	L1312
2073  1461 0671          	dc.w	L3312
2074  1463 0676          	dc.w	L5312
2075  1465 067b          	dc.w	L7312
2076  1467 0680          	dc.w	L1412
2077  1469 0685          	dc.w	L3412
2078  146b 068a          	dc.w	L5412
2079  146d 068f          	dc.w	L7412
2080  146f 0694          	dc.w	L1512
2081  1471 0699          	dc.w	L3512
2082  1473 069e          	dc.w	L5512
2083  1475 06a3          	dc.w	L7512
2084  1477 0568          	dc.w	L1671
2085  1479 06a8          	dc.w	L1612
2086  147b 06ad          	dc.w	L3612
2087  147d 06b2          	dc.w	L5612
2088  147f 06b7          	dc.w	L7612
2089  1481 06bc          	dc.w	L1712
2090  1483 06c1          	dc.w	L3712
2091  1485 06c6          	dc.w	L5712
2092  1487 06cb          	dc.w	L7712
2093  1489 06d0          	dc.w	L1022
2094  148b 06d5          	dc.w	L3022
2095  148d 06da          	dc.w	L5022
2096  148f 06df          	dc.w	L7022
2097  1491 06e4          	dc.w	L1122
2098  1493 06e9          	dc.w	L3122
2099  1495 06ee          	dc.w	L5122
2100  1497 06f3          	dc.w	L7122
2101  1499 06f8          	dc.w	L1222
2102  149b 06fd          	dc.w	L3222
2103  149d 0702          	dc.w	L5222
2104  149f 0707          	dc.w	L7222
2105  14a1 070c          	dc.w	L1322
2106  14a3 0711          	dc.w	L3322
2107  14a5 0716          	dc.w	L5322
2108  14a7 04f5          	dc.w	L3071
2109  14a9 04fa          	dc.w	L5071
2110  14ab               L42:
2111  14ab 0732          	dc.w	L1422
2112  14ad 073c          	dc.w	L5422
2113  14af 0737          	dc.w	L3422
2114  14b1 0741          	dc.w	L7422
2115  14b3 0750          	dc.w	L5522
2116  14b5 0755          	dc.w	L7522
2117  14b7 075a          	dc.w	L1622
2118  14b9 075f          	dc.w	L3622
2119  14bb 0764          	dc.w	L5622
2120  14bd 0769          	dc.w	L7622
2121  14bf 076e          	dc.w	L1722
2122  14c1 0773          	dc.w	L3722
2123  14c3 0778          	dc.w	L5722
2124  14c5 077d          	dc.w	L7722
2125  14c7 0782          	dc.w	L1032
2126  14c9 0787          	dc.w	L3032
2127  14cb 078c          	dc.w	L5032
2128  14cd 0791          	dc.w	L7032
2129  14cf 0796          	dc.w	L1132
2130  14d1 079b          	dc.w	L3132
2131  14d3 07a0          	dc.w	L5132
2132  14d5 07a5          	dc.w	L7132
2133  14d7 07aa          	dc.w	L1232
2134  14d9 07af          	dc.w	L3232
2135  14db 07b4          	dc.w	L5232
2136  14dd 096c          	dc.w	L7714
2137  14df 07c8          	dc.w	L5332
2138  14e1 07cd          	dc.w	L7332
2139  14e3 07d2          	dc.w	L1432
2140  14e5 07d7          	dc.w	L3432
2141  14e7 07dc          	dc.w	L5432
2142  14e9 07e1          	dc.w	L7432
2143  14eb 07e6          	dc.w	L1532
2144  14ed 07eb          	dc.w	L3532
2145  14ef 07f0          	dc.w	L5532
2146  14f1 07f5          	dc.w	L7532
2147  14f3 07fa          	dc.w	L1632
2148  14f5 07ff          	dc.w	L3632
2149  14f7 0804          	dc.w	L5632
2150  14f9 0809          	dc.w	L7632
2151  14fb 080e          	dc.w	L1732
2152  14fd 0813          	dc.w	L3732
2153  14ff 0818          	dc.w	L5732
2154  1501 081d          	dc.w	L7732
2155  1503 0822          	dc.w	L1042
2156  1505 0827          	dc.w	L3042
2157  1507 082c          	dc.w	L5042
2158  1509 0831          	dc.w	L7042
2159  150b 0836          	dc.w	L1142
2160  150d 083b          	dc.w	L3142
2161  150f 0840          	dc.w	L5142
2162  1511 0845          	dc.w	L7142
2163  1513 084a          	dc.w	L1242
2164  1515 084f          	dc.w	L3242
2165  1517 0854          	dc.w	L5242
2166  1519 0859          	dc.w	L7242
2167  151b 085e          	dc.w	L1342
2168  151d 0863          	dc.w	L3342
2169  151f 0868          	dc.w	L5342
2170  1521 086d          	dc.w	L7342
2171  1523 0872          	dc.w	L1442
2172  1525 07be          	dc.w	L1332
2173  1527 07c3          	dc.w	L3332
2174  1529 0877          	dc.w	L3442
2175  152b 087c          	dc.w	L5442
2176  152d 0881          	dc.w	L7442
2177  152f 0886          	dc.w	L1542
2178  1531 088b          	dc.w	L3542
2179  1533 0890          	dc.w	L5542
2180  1535 0895          	dc.w	L7542
2181  1537 089a          	dc.w	L1642
2182  1539 089f          	dc.w	L3642
2183  153b 08a4          	dc.w	L5642
2184  153d 08a9          	dc.w	L7642
2185  153f 08ae          	dc.w	L1742
2186  1541 08b3          	dc.w	L3742
2187  1543 08b8          	dc.w	L5742
2188  1545 08bd          	dc.w	L7742
2189  1547 08c2          	dc.w	L1052
2190  1549 08c7          	dc.w	L3052
2191  154b 08cc          	dc.w	L5052
2192  154d 08d1          	dc.w	L7052
2193  154f 08d6          	dc.w	L1152
2194  1551 08db          	dc.w	L3152
2195  1553 08e0          	dc.w	L5152
2196  1555 08e5          	dc.w	L7152
2197  1557 08ea          	dc.w	L1252
2198  1559 08ef          	dc.w	L3252
2199  155b 08f4          	dc.w	L5252
2200  155d 07b9          	dc.w	L7232
2201  155f 08f9          	dc.w	L7252
2202  1561 08fe          	dc.w	L1352
2203  1563 0903          	dc.w	L3352
2204  1565 0908          	dc.w	L5352
2205  1567 090d          	dc.w	L7352
2206  1569 0912          	dc.w	L1452
2207  156b 0917          	dc.w	L3452
2208  156d 091c          	dc.w	L5452
2209  156f 0921          	dc.w	L7452
2210  1571 0926          	dc.w	L1552
2211  1573 092b          	dc.w	L3552
2212  1575 0930          	dc.w	L5552
2213  1577 0935          	dc.w	L7552
2214  1579 093a          	dc.w	L1652
2215  157b 093f          	dc.w	L3652
2216  157d 0944          	dc.w	L5652
2217  157f 0949          	dc.w	L7652
2218  1581 094e          	dc.w	L1752
2219  1583 0953          	dc.w	L3752
2220  1585 0958          	dc.w	L5752
2221  1587 095d          	dc.w	L7752
2222  1589 0962          	dc.w	L1062
2223  158b 0967          	dc.w	L3062
2224  158d 0746          	dc.w	L1522
2225  158f 074b          	dc.w	L3522
2226  1591               L03:
2227  1591 0983          	dc.w	L7062
2228  1593 098d          	dc.w	L3162
2229  1595 0988          	dc.w	L1162
2230  1597 0992          	dc.w	L5162
2231  1599 09a1          	dc.w	L3262
2232  159b 09a6          	dc.w	L5262
2233  159d 09ab          	dc.w	L7262
2234  159f 09b0          	dc.w	L1362
2235  15a1 09b5          	dc.w	L3362
2236  15a3 09ba          	dc.w	L5362
2237  15a5 09bf          	dc.w	L7362
2238  15a7 09c4          	dc.w	L1462
2239  15a9 09c9          	dc.w	L3462
2240  15ab 09ce          	dc.w	L5462
2241  15ad 09d3          	dc.w	L7462
2242  15af 09d8          	dc.w	L1562
2243  15b1 09dd          	dc.w	L3562
2244  15b3 09e2          	dc.w	L5562
2245  15b5 09e7          	dc.w	L7562
2246  15b7 09ec          	dc.w	L1662
2247  15b9 09f1          	dc.w	L3662
2248  15bb 09f6          	dc.w	L5662
2249  15bd 09fb          	dc.w	L7662
2250  15bf 0a00          	dc.w	L1762
2251  15c1 0a05          	dc.w	L3762
2252  15c3 0bbd          	dc.w	L3513
2253  15c5 0a19          	dc.w	L3072
2254  15c7 0a1e          	dc.w	L5072
2255  15c9 0a23          	dc.w	L7072
2256  15cb 0a28          	dc.w	L1172
2257  15cd 0a2d          	dc.w	L3172
2258  15cf 0a32          	dc.w	L5172
2259  15d1 0a37          	dc.w	L7172
2260  15d3 0a3c          	dc.w	L1272
2261  15d5 0a41          	dc.w	L3272
2262  15d7 0a46          	dc.w	L5272
2263  15d9 0a4b          	dc.w	L7272
2264  15db 0a50          	dc.w	L1372
2265  15dd 0a55          	dc.w	L3372
2266  15df 0a5a          	dc.w	L5372
2267  15e1 0a5f          	dc.w	L7372
2268  15e3 0a64          	dc.w	L1472
2269  15e5 0a69          	dc.w	L3472
2270  15e7 0a6e          	dc.w	L5472
2271  15e9 0a73          	dc.w	L7472
2272  15eb 0a78          	dc.w	L1572
2273  15ed 0a7d          	dc.w	L3572
2274  15ef 0a82          	dc.w	L5572
2275  15f1 0a87          	dc.w	L7572
2276  15f3 0a8c          	dc.w	L1672
2277  15f5 0a91          	dc.w	L3672
2278  15f7 0a96          	dc.w	L5672
2279  15f9 0a9b          	dc.w	L7672
2280  15fb 0aa0          	dc.w	L1772
2281  15fd 0aa5          	dc.w	L3772
2282  15ff 0aaa          	dc.w	L5772
2283  1601 0aaf          	dc.w	L7772
2284  1603 0ab4          	dc.w	L1003
2285  1605 0ab9          	dc.w	L3003
2286  1607 0abe          	dc.w	L5003
2287  1609 0ac3          	dc.w	L7003
2288  160b 0a0f          	dc.w	L7762
2289  160d 0a14          	dc.w	L1072
2290  160f 0ac8          	dc.w	L1103
2291  1611 0acd          	dc.w	L3103
2292  1613 0ad2          	dc.w	L5103
2293  1615 0ad7          	dc.w	L7103
2294  1617 0adc          	dc.w	L1203
2295  1619 0ae1          	dc.w	L3203
2296  161b 0ae6          	dc.w	L5203
2297  161d 0aeb          	dc.w	L7203
2298  161f 0af0          	dc.w	L1303
2299  1621 0af5          	dc.w	L3303
2300  1623 0afa          	dc.w	L5303
2301  1625 0aff          	dc.w	L7303
2302  1627 0b04          	dc.w	L1403
2303  1629 0b09          	dc.w	L3403
2304  162b 0b0e          	dc.w	L5403
2305  162d 0b13          	dc.w	L7403
2306  162f 0b18          	dc.w	L1503
2307  1631 0b1d          	dc.w	L3503
2308  1633 0b22          	dc.w	L5503
2309  1635 0b27          	dc.w	L7503
2310  1637 0b2c          	dc.w	L1603
2311  1639 0b31          	dc.w	L3603
2312  163b 0b36          	dc.w	L5603
2313  163d 0b3b          	dc.w	L7603
2314  163f 0b40          	dc.w	L1703
2315  1641 0b45          	dc.w	L3703
2316  1643 0a0a          	dc.w	L5762
2317  1645 0b4a          	dc.w	L5703
2318  1647 0b4f          	dc.w	L7703
2319  1649 0b54          	dc.w	L1013
2320  164b 0b59          	dc.w	L3013
2321  164d 0b5e          	dc.w	L5013
2322  164f 0b63          	dc.w	L7013
2323  1651 0b68          	dc.w	L1113
2324  1653 0b6d          	dc.w	L3113
2325  1655 0b72          	dc.w	L5113
2326  1657 0b77          	dc.w	L7113
2327  1659 0b7c          	dc.w	L1213
2328  165b 0b81          	dc.w	L3213
2329  165d 0b86          	dc.w	L5213
2330  165f 0b8b          	dc.w	L7213
2331  1661 0b90          	dc.w	L1313
2332  1663 0b95          	dc.w	L3313
2333  1665 0b9a          	dc.w	L5313
2334  1667 0b9f          	dc.w	L7313
2335  1669 0ba4          	dc.w	L1413
2336  166b 0ba9          	dc.w	L3413
2337  166d 0bae          	dc.w	L5413
2338  166f 0bb3          	dc.w	L7413
2339  1671 0bb8          	dc.w	L1513
2340  1673 0997          	dc.w	L7162
2341  1675 099c          	dc.w	L1262
2342                     ; 220 BYTE * labelGet(BYTE a_byIndex)
2342                     ; 221 {
2343                     	switch	.text
2345                     	xref.b	_labelGet$L
2346  0000               _labelGet:
2348  0000 b700          	ld	_labelGet$L,a
2350                     ; 222 	switch(parametersGetValue(PARAM_LANGUAGE))
2352  0002 a62f          	ld	a,#47
2353  0004 cd0000        	call	_parametersGetValue
2356                     ; 1964 			break;
2357  0007 5d            	tnz	x
2358  0008 2703          	jreq	L43
2359  000a cc096f        	jp	L5062
2360  000d               L43:
2361  000d a002          	sub	a,#2
2362  000f 2715          	jreq	L357
2363  0011 4a            	dec	a
2364  0012 2603          	jrne	L63
2365  0014 cc071e        	jp	L7322
2366  0017               L63:
2367  0017 4a            	dec	a
2368  0018 2603          	jrne	L04
2369  001a cc04cd        	jp	L1761
2370  001d               L04:
2371  001d 4a            	dec	a
2372  001e 2603          	jrne	L24
2373  0020 cc027c        	jp	L3231
2374  0023               L24:
2375  0023 cc096f        	jp	L5062
2376  0026               L357:
2377                     ; 224 		case PARAM_LANGUAGE_EN: //English
2377                     ; 225 			switch(a_byIndex)
2379  0026 b600          	ld	a,_labelGet$L
2381                     ; 571 					break;
2383  0028 a173          	cp	a,#115
2384  002a 240b          	jruge	L6
2385  002c 48            	sll	a
2386  002d 97            	ld	x,a
2387  002e d611fa        	ld	a,(L01+1,x)
2388  0031 88            	push	a
2389  0032 d611f9        	ld	a,(L01,x)
2390  0035 88            	push	a
2391  0036 81            	ret
2392  0037               L6:
2393  0037 cc0274        	jp	L1231
2394  003a               L557:
2395                     ; 227 				case LABEL_MODE:
2395                     ; 228 					return "mode:";
2397  003a a6fb          	ld	a,#low(L1123)
2398  003c aefb          	ld	x,#high(L1123)
2401  003e 81            	ret
2402  003f               L757:
2403                     ; 230 				case LABEL_MANUAL:
2403                     ; 231 					return "manual";
2406  003f a6f4          	ld	a,#low(L3123)
2407  0041 aef4          	ld	x,#high(L3123)
2410  0043 81            	ret
2411  0044               L167:
2412                     ; 233 				case LABEL_AUTO:
2412                     ; 234 					return "automatic";
2415  0044 a6ea          	ld	a,#low(L5123)
2416  0046 aeea          	ld	x,#high(L5123)
2419  0048 81            	ret
2420  0049               L367:
2421                     ; 236 				case LABEL_SPEED:
2421                     ; 237 					return "speed:";
2424  0049 a6e3          	ld	a,#low(L7123)
2425  004b aee3          	ld	x,#high(L7123)
2428  004d 81            	ret
2429  004e               L567:
2430                     ; 239 				case LABEL_SPEED_SHORT:
2430                     ; 240 					return "spd:";
2433  004e a6de          	ld	a,#low(L1223)
2434  0050 aede          	ld	x,#high(L1223)
2437  0052 81            	ret
2438  0053               L767:
2439                     ; 242 				case LABEL_CYLINDER_SIZE:
2439                     ; 243 					return "size:";
2442  0053 a6d8          	ld	a,#low(L3223)
2443  0055 aed8          	ld	x,#high(L3223)
2446  0057 81            	ret
2447  0058               L177:
2448                     ; 245 				case LABEL_MT_MIN:
2448                     ; 246 					return "mt/min";
2451  0058 a6d1          	ld	a,#low(L5223)
2452  005a aed1          	ld	x,#high(L5223)
2455  005c 81            	ret
2456  005d               L377:
2457                     ; 248 				case LABEL_MESSAGE:
2457                     ; 249 					return "message:";
2460  005d a6c8          	ld	a,#low(L7223)
2461  005f aec8          	ld	x,#high(L7223)
2464  0061 81            	ret
2465  0062               L577:
2466                     ; 251 				case LABEL_ALARM:
2466                     ; 252 					return "alarm:";
2469  0062 a6c1          	ld	a,#low(L1323)
2470  0064 aec1          	ld	x,#high(L1323)
2473  0066 81            	ret
2474  0067               L777:
2475                     ; 254 				case LABEL_ALARM_ERR_NO_PRINT:
2475                     ; 255 					return "No print";
2478  0067 a6b8          	ld	a,#low(L3323)
2479  0069 aeb8          	ld	x,#high(L3323)
2482  006b 81            	ret
2483  006c               L1001:
2484                     ; 257 				case LABEL_ALARM_ERR_LOW_SPEED:
2484                     ; 258 					return "Low speed";
2487  006c a6ae          	ld	a,#low(L5323)
2488  006e aeae          	ld	x,#high(L5323)
2491  0070 81            	ret
2492  0071               L3001:
2493                     ; 260 				case LABEL_ALARM_ERR_TEST_SH_01:
2493                     ; 261 					return "Scanning Head";
2496  0071 a6a0          	ld	a,#low(L7323)
2497  0073 aea0          	ld	x,#high(L7323)
2500  0075 81            	ret
2501  0076               L5001:
2502                     ; 263 				case LABEL_ALARM_ERR_TEST_SH_02:
2502                     ; 264 					return "test failed";
2505  0076 a694          	ld	a,#low(L1423)
2506  0078 ae94          	ld	x,#high(L1423)
2509  007a 81            	ret
2510  007b               L7001:
2511                     ; 266 				case LABEL_ALARM_ERR_TEST_ENC_01:
2511                     ; 267 					return "Encoder";
2514  007b a68c          	ld	a,#low(L3423)
2515  007d ae8c          	ld	x,#high(L3423)
2518  007f 81            	ret
2519  0080               L1101:
2520                     ; 269 				case LABEL_ALARM_ERR_TEST_ENC_02:
2520                     ; 270 					return "test failed";
2523  0080 a694          	ld	a,#low(L1423)
2524  0082 ae94          	ld	x,#high(L1423)
2527  0084 81            	ret
2528  0085               L3101:
2529                     ; 272 				case LABEL_ALARM_ERR_PHASE_AUTO_01:
2529                     ; 273 					return "Automatic Phase";
2532  0085 a67c          	ld	a,#low(L5423)
2533  0087 ae7c          	ld	x,#high(L5423)
2536  0089 81            	ret
2537  008a               L5101:
2538                     ; 275 				case LABEL_ALARM_ERR_PHASE_AUTO_02:
2538                     ; 276 					return "failed";
2541  008a a675          	ld	a,#low(L7423)
2542  008c ae75          	ld	x,#high(L7423)
2545  008e 81            	ret
2546  008f               L7101:
2547                     ; 278 				case LABEL_ALARM_CYLINDER_TRAVEL_01:
2547                     ; 279 					return "Cylinder size (P1)";
2550  008f a662          	ld	a,#low(L1523)
2551  0091 ae62          	ld	x,#high(L1523)
2554  0093 81            	ret
2555  0094               L1201:
2556                     ; 281 				case LABEL_ALARM_CYLINDER_TRAVEL_02:
2556                     ; 282 					return "non acceptable";
2559  0094 a653          	ld	a,#low(L3523)
2560  0096 ae53          	ld	x,#high(L3523)
2563  0098 81            	ret
2564  0099               L3201:
2565                     ; 284 				case LABEL_ALARM_GATE_WINDOW_01:
2565                     ; 285 					return "Gate (P3)";
2568  0099 a649          	ld	a,#low(L5523)
2569  009b ae49          	ld	x,#high(L5523)
2572  009d 81            	ret
2573  009e               L5201:
2574                     ; 287 				case LABEL_ALARM_GATE_WINDOW_02:
2574                     ; 288 					return "non acceptable";
2577  009e a653          	ld	a,#low(L3523)
2578  00a0 ae53          	ld	x,#high(L3523)
2581  00a2 81            	ret
2582  00a3               L7201:
2583                     ; 290 				case LABEL_ANSWER_OK:
2583                     ; 291 					return "No problem";
2586  00a3 a63e          	ld	a,#low(L7523)
2587  00a5 ae3e          	ld	x,#high(L7523)
2590  00a7 81            	ret
2591  00a8               L1301:
2592                     ; 293 				case LABEL_GENERIC_ALARM_01:
2592                     ; 294 					return "Alarm  ";
2595  00a8 a636          	ld	a,#low(L1623)
2596  00aa ae36          	ld	x,#high(L1623)
2599  00ac 81            	ret
2600  00ad               L3301:
2601                     ; 296 				case LABEL_GENERIC_ALARM_02:
2601                     ; 297 					return "non recognized";
2604  00ad a627          	ld	a,#low(L3623)
2605  00af ae27          	ld	x,#high(L3623)
2608  00b1 81            	ret
2609  00b2               L5301:
2610                     ; 299 				case LABEL_PHASE_OSCILL:
2610                     ; 300 					return "phase with oscilloscope:";
2613  00b2 a60e          	ld	a,#low(L5623)
2614  00b4 ae0e          	ld	x,#high(L5623)
2617  00b6 81            	ret
2618  00b7               L7301:
2619                     ; 302 				case LABEL_PHASE_FAST:
2619                     ; 303 					return "fast correction phase:";
2622  00b7 a6f7          	ld	a,#low(L7623)
2623  00b9 aef7          	ld	x,#high(L7623)
2626  00bb 81            	ret
2627  00bc               L1401:
2628                     ; 305 				case LABEL_OSCILLOSCOPE:
2628                     ; 306 					return "oscilloscope:";
2631  00bc a6e9          	ld	a,#low(L1723)
2632  00be aee9          	ld	x,#high(L1723)
2635  00c0 81            	ret
2636  00c1               L3401:
2637                     ; 308 				case LABEL_REGISTER:
2637                     ; 309 					return "register:";
2640  00c1 a6df          	ld	a,#low(L3723)
2641  00c3 aedf          	ld	x,#high(L3723)
2644  00c5 81            	ret
2645  00c6               L5401:
2646                     ; 311 				case LABEL_PHASE_CENTER_01:
2646                     ; 312 					return "Error";
2649  00c6 a6d9          	ld	a,#low(L5723)
2650  00c8 aed9          	ld	x,#high(L5723)
2653  00ca 81            	ret
2654  00cb               L7401:
2655                     ; 314 				case LABEL_PHASE_CENTER_02:
2655                     ; 315 					return "reset";		
2658  00cb a6d3          	ld	a,#low(L7723)
2659  00cd aed3          	ld	x,#high(L7723)
2662  00cf 81            	ret
2663  00d0               L1501:
2664                     ; 317 				case LABEL_PHASE_MANUAL_01:
2664                     ; 318 					return "Manual";
2667  00d0 a6cc          	ld	a,#low(L1033)
2668  00d2 aecc          	ld	x,#high(L1033)
2671  00d4 81            	ret
2672  00d5               L3501:
2673                     ; 320 				case LABEL_PHASE_MANUAL_02:
2673                     ; 321 					return "phase";		
2676  00d5 a6c6          	ld	a,#low(L3033)
2677  00d7 aec6          	ld	x,#high(L3033)
2680  00d9 81            	ret
2681  00da               L5501:
2682                     ; 323 				case LABEL_PHASE_AUTO_01:
2682                     ; 324 					return "Automatic"; 	
2685  00da a6bc          	ld	a,#low(L5033)
2686  00dc aebc          	ld	x,#high(L5033)
2689  00de 81            	ret
2690  00df               L7501:
2691                     ; 326 				case LABEL_PHASE_AUTO_02:
2691                     ; 327 					return "phase"; 	
2694  00df a6c6          	ld	a,#low(L3033)
2695  00e1 aec6          	ld	x,#high(L3033)
2698  00e3 81            	ret
2699  00e4               L1601:
2700                     ; 329 				case LABEL_PHASE_OSCILL_01:
2700                     ; 330 					return "Phase with"; 	
2703  00e4 a6b1          	ld	a,#low(L7033)
2704  00e6 aeb1          	ld	x,#high(L7033)
2707  00e8 81            	ret
2708  00e9               L3601:
2709                     ; 332 				case LABEL_PHASE_OSCILL_02:
2709                     ; 333 					return "oscilloscop"; 	
2712  00e9 a6a5          	ld	a,#low(L1133)
2713  00eb aea5          	ld	x,#high(L1133)
2716  00ed 81            	ret
2717  00ee               L5601:
2718                     ; 335 				case LABEL_PHASE_FAST_01:
2718                     ; 336 					return "Fast correct"; 	
2721  00ee a698          	ld	a,#low(L3133)
2722  00f0 ae98          	ld	x,#high(L3133)
2725  00f2 81            	ret
2726  00f3               L7601:
2727                     ; 338 				case LABEL_PHASE_FAST_02:
2727                     ; 339 					return "phase"; 	
2730  00f3 a6c6          	ld	a,#low(L3033)
2731  00f5 aec6          	ld	x,#high(L3033)
2734  00f7 81            	ret
2735  00f8               L1701:
2736                     ; 341 				case LABEL_CYLINDER_TRAVEL_01:
2736                     ; 342 					return "Cylinder"; 	
2739  00f8 a68f          	ld	a,#low(L5133)
2740  00fa ae8f          	ld	x,#high(L5133)
2743  00fc 81            	ret
2744  00fd               L3701:
2745                     ; 344 				case LABEL_CYLINDER_TRAVEL_02:
2745                     ; 345 					return "size";
2748  00fd a68a          	ld	a,#low(L7133)
2749  00ff ae8a          	ld	x,#high(L7133)
2752  0101 81            	ret
2753  0102               L5701:
2754                     ; 347 				case LABEL_ALARM_BOUND_01:
2754                     ; 348 					return "Alarm";
2757  0102 a684          	ld	a,#low(L1233)
2758  0104 ae84          	ld	x,#high(L1233)
2761  0106 81            	ret
2762  0107               L7701:
2763                     ; 350 				case LABEL_ALARM_BOUND_02:
2763                     ; 351 					return "bound";
2766  0107 a67e          	ld	a,#low(L3233)
2767  0109 ae7e          	ld	x,#high(L3233)
2770  010b 81            	ret
2771  010c               L1011:
2772                     ; 353 				case LABEL_GATE_WINDOW_01:
2772                     ; 354 					return "Gate";
2775  010c a679          	ld	a,#low(L5233)
2776  010e ae79          	ld	x,#high(L5233)
2779  0110 81            	ret
2780  0111               L3011:
2781                     ; 356 				case LABEL_GATE_WINDOW_02:
2781                     ; 357 					return "width";
2784  0111 a673          	ld	a,#low(L7233)
2785  0113 ae73          	ld	x,#high(L7233)
2788  0115 81            	ret
2789  0116               L5011:
2790                     ; 359 				case LABEL_SW_VERSION_01:
2790                     ; 360 					return "Software";
2793  0116 a66a          	ld	a,#low(L1333)
2794  0118 ae6a          	ld	x,#high(L1333)
2797  011a 81            	ret
2798  011b               L7011:
2799                     ; 362 				case LABEL_SW_VERSION_02:
2799                     ; 363 					return "Version";
2802  011b a662          	ld	a,#low(L3333)
2803  011d ae62          	ld	x,#high(L3333)
2806  011f 81            	ret
2807  0120               L1111:
2808                     ; 365 				case LABEL_OFFSET_DISTANCE_01:
2808                     ; 366 					return "Offset";
2811  0120 a65b          	ld	a,#low(L5333)
2812  0122 ae5b          	ld	x,#high(L5333)
2815  0124 81            	ret
2816  0125               L3111:
2817                     ; 368 				case LABEL_OFFSET_DISTANCE_02:
2817                     ; 369 					return "distance";
2820  0125 a652          	ld	a,#low(L7333)
2821  0127 ae52          	ld	x,#high(L7333)
2824  0129 81            	ret
2825  012a               L5111:
2826                     ; 371 				case LABEL_TEST_SH_01:
2826                     ; 372 					return "Scanning ";
2829  012a a648          	ld	a,#low(L1433)
2830  012c ae48          	ld	x,#high(L1433)
2833  012e 81            	ret
2834  012f               L7111:
2835                     ; 374 				case LABEL_TEST_SH_02:
2835                     ; 375 					return "head test";
2838  012f a63e          	ld	a,#low(L3433)
2839  0131 ae3e          	ld	x,#high(L3433)
2842  0133 81            	ret
2843  0134               L1211:
2844                     ; 377 				case LABEL_TEST_ENC_01:
2844                     ; 378 					return "Encoder";
2847  0134 a68c          	ld	a,#low(L3423)
2848  0136 ae8c          	ld	x,#high(L3423)
2851  0138 81            	ret
2852  0139               L3211:
2853                     ; 380 				case LABEL_TEST_ENC_02:
2853                     ; 381 					return "test";
2856  0139 a639          	ld	a,#low(L5433)
2857  013b ae39          	ld	x,#high(L5433)
2860  013d 81            	ret
2861  013e               L5211:
2862                     ; 383 				case LABEL_TEST_OUTPUT_01:
2862                     ; 384 					return "Outputs";
2865  013e a631          	ld	a,#low(L7433)
2866  0140 ae31          	ld	x,#high(L7433)
2869  0142 81            	ret
2870  0143               L7211:
2871                     ; 386 				case LABEL_TEST_OUTPUT_02:
2871                     ; 387 					return "test";
2874  0143 a639          	ld	a,#low(L5433)
2875  0145 ae39          	ld	x,#high(L5433)
2878  0147 81            	ret
2879  0148               L1311:
2880                     ; 389 				case LABEL_VISUAL_REGISTER_01:
2880                     ; 390 					return "Visual";
2883  0148 a62a          	ld	a,#low(L1533)
2884  014a ae2a          	ld	x,#high(L1533)
2887  014c 81            	ret
2888  014d               L3311:
2889                     ; 392 				case LABEL_VISUAL_REGISTER_02:
2889                     ; 393 					return "Register";
2892  014d a621          	ld	a,#low(L3533)
2893  014f ae21          	ld	x,#high(L3533)
2896  0151 81            	ret
2897  0152               L5311:
2898                     ; 395 				case LABEL_VISUAL_OSCILL_01:
2898                     ; 396 					return "Visual";
2901  0152 a62a          	ld	a,#low(L1533)
2902  0154 ae2a          	ld	x,#high(L1533)
2905  0156 81            	ret
2906  0157               L7311:
2907                     ; 398 				case LABEL_VISUAL_OSCILL_02:
2907                     ; 399 					return "Oscilloscop";
2910  0157 a615          	ld	a,#low(L5533)
2911  0159 ae15          	ld	x,#high(L5533)
2914  015b 81            	ret
2915  015c               L1411:
2916                     ; 401 				case LABEL_JOB_ARCHIVE_01:
2916                     ; 402 					return "Jobs";
2919  015c a610          	ld	a,#low(L7533)
2920  015e ae10          	ld	x,#high(L7533)
2923  0160 81            	ret
2924  0161               L3411:
2925                     ; 404 				case LABEL_JOB_ARCHIVE_02:
2925                     ; 405 					return "archive";
2928  0161 a608          	ld	a,#low(L1633)
2929  0163 ae08          	ld	x,#high(L1633)
2932  0165 81            	ret
2933  0166               L5411:
2934                     ; 407 				case LABEL_FUNCTIONS:
2934                     ; 408 					return "Functions";
2937  0166 a6fe          	ld	a,#low(L3633)
2938  0168 aefe          	ld	x,#high(L3633)
2941  016a 81            	ret
2942  016b               L7411:
2943                     ; 410 				case LABEL_PARAMETERS:
2943                     ; 411 					return "Parameters";
2946  016b a6f3          	ld	a,#low(L5633)
2947  016d aef3          	ld	x,#high(L5633)
2950  016f 81            	ret
2951  0170               L1511:
2952                     ; 413 				case LABEL_TESTS:
2952                     ; 414 					return "Tests";
2955  0170 a6ed          	ld	a,#low(L7633)
2956  0172 aeed          	ld	x,#high(L7633)
2959  0174 81            	ret
2960  0175               L3511:
2961                     ; 416 				case LABEL_SIMPLE_SETUP:
2961                     ; 417 					return "simple setup:";
2964  0175 a6df          	ld	a,#low(L1733)
2965  0177 aedf          	ld	x,#high(L1733)
2968  0179 81            	ret
2969  017a               L5511:
2970                     ; 419 				case LABEL_FULL_SETUP:
2970                     ; 420 					return "full setup:";
2973  017a a6d3          	ld	a,#low(L3733)
2974  017c aed3          	ld	x,#high(L3733)
2977  017e 81            	ret
2978  017f               L7511:
2979                     ; 422 				case LABEL_ALARM_ERR_ACCELERATION:
2979                     ; 423 					return "Acceleration";
2982  017f a6c6          	ld	a,#low(L5733)
2983  0181 aec6          	ld	x,#high(L5733)
2986  0183 81            	ret
2987  0184               L1611:
2988                     ; 425 				case LABEL_ALARM_ERR_DECELERATION:
2988                     ; 426 					return "Deceleration";
2991  0184 a6b9          	ld	a,#low(L7733)
2992  0186 aeb9          	ld	x,#high(L7733)
2995  0188 81            	ret
2996  0189               L3611:
2997                     ; 428 				case LABEL_ALARM_ERR_DOUBLE_MARK:
2997                     ; 429 					return "Double Mark";
3000  0189 a6ad          	ld	a,#low(L1043)
3001  018b aead          	ld	x,#high(L1043)
3004  018d 81            	ret
3005  018e               L5611:
3006                     ; 431 				case LABEL_AUTO_SHORT:
3006                     ; 432 					return "Auto";
3009  018e a6a8          	ld	a,#low(L3043)
3010  0190 aea8          	ld	x,#high(L3043)
3013  0192 81            	ret
3014  0193               L7611:
3015                     ; 434 				case LABEL_MANUAL_SHORT:
3015                     ; 435 					return "Manual";
3018  0193 a6cc          	ld	a,#low(L1033)
3019  0195 aecc          	ld	x,#high(L1033)
3022  0197 81            	ret
3023  0198               L1711:
3024                     ; 437 				case LABEL_MODE_LONG:
3024                     ; 438 					return "Long:";
3027  0198 a6a2          	ld	a,#low(L5043)
3028  019a aea2          	ld	x,#high(L5043)
3031  019c 81            	ret
3032  019d               L3711:
3033                     ; 440 				case LABEL_MODE_TRANS:
3033                     ; 441 					return "Tran:";
3036  019d a69c          	ld	a,#low(L7043)
3037  019f ae9c          	ld	x,#high(L7043)
3040  01a1 81            	ret
3041  01a2               L5711:
3042                     ; 443 				case LABEL_MODE_PULL:
3042                     ; 444 					return "Tens:";
3045  01a2 a696          	ld	a,#low(L1143)
3046  01a4 ae96          	ld	x,#high(L1143)
3049  01a6 81            	ret
3050  01a7               L7711:
3051                     ; 446 				case LABEL_SAVE_JOB_01:
3051                     ; 447 					return "Save";
3054  01a7 a691          	ld	a,#low(L3143)
3055  01a9 ae91          	ld	x,#high(L3143)
3058  01ab 81            	ret
3059  01ac               L1021:
3060                     ; 449 				case LABEL_SAVE_JOB_02:
3060                     ; 450 					return "Job";
3063  01ac a68d          	ld	a,#low(L5143)
3064  01ae ae8d          	ld	x,#high(L5143)
3067  01b0 81            	ret
3068  01b1               L3021:
3069                     ; 452 				case LABEL_LOAD_JOB_01:
3069                     ; 453 					return "Load";
3072  01b1 a688          	ld	a,#low(L7143)
3073  01b3 ae88          	ld	x,#high(L7143)
3076  01b5 81            	ret
3077  01b6               L5021:
3078                     ; 455 				case LABEL_LOAD_JOB_02:
3078                     ; 456 					return "Job";
3081  01b6 a68d          	ld	a,#low(L5143)
3082  01b8 ae8d          	ld	x,#high(L5143)
3085  01ba 81            	ret
3086  01bb               L7021:
3087                     ; 458 				case LABEL_TWIN_APPLICATION_01_01:
3087                     ; 459 					return "Front/Back";
3090  01bb a67d          	ld	a,#low(L1243)
3091  01bd ae7d          	ld	x,#high(L1243)
3094  01bf 81            	ret
3095  01c0               L1121:
3096                     ; 461 				case LABEL_TWIN_APPLICATION_01_02:
3096                     ; 462 					return "application";
3099  01c0 a671          	ld	a,#low(L3243)
3100  01c2 ae71          	ld	x,#high(L3243)
3103  01c4 81            	ret
3104  01c5               L3121:
3105                     ; 464 				case LABEL_TWIN_APPLICATION_02_01:
3105                     ; 465 					return "Insetter";
3108  01c5 a668          	ld	a,#low(L5243)
3109  01c7 ae68          	ld	x,#high(L5243)
3112  01c9 81            	ret
3113  01ca               L5121:
3114                     ; 467 				case LABEL_TWIN_APPLICATION_02_02:
3114                     ; 468 					return "application";
3117  01ca a671          	ld	a,#low(L3243)
3118  01cc ae71          	ld	x,#high(L3243)
3121  01ce 81            	ret
3122  01cf               L7121:
3123                     ; 470 				case LABEL_TWIN_APPLICATION_03_01:
3123                     ; 471 					return "Cutting";
3126  01cf a660          	ld	a,#low(L7243)
3127  01d1 ae60          	ld	x,#high(L7243)
3130  01d3 81            	ret
3131  01d4               L1221:
3132                     ; 473 				case LABEL_TWIN_APPLICATION_03_02:
3132                     ; 474 					return "application";
3135  01d4 a671          	ld	a,#low(L3243)
3136  01d6 ae71          	ld	x,#high(L3243)
3139  01d8 81            	ret
3140  01d9               L3221:
3141                     ; 476 				case LABEL_TWIN_APPLICATION_04_01:
3141                     ; 477 					return "Web folding";
3144  01d9 a654          	ld	a,#low(L1343)
3145  01db ae54          	ld	x,#high(L1343)
3148  01dd 81            	ret
3149  01de               L5221:
3150                     ; 479 				case LABEL_TWIN_APPLICATION_04_02:
3150                     ; 480 					return "application";
3153  01de a671          	ld	a,#low(L3243)
3154  01e0 ae71          	ld	x,#high(L3243)
3157  01e2 81            	ret
3158  01e3               L7221:
3159                     ; 482 				case LABEL_TWIN_APPLICATION_05_01:
3159                     ; 483 					return "Perforation";
3162  01e3 a648          	ld	a,#low(L3343)
3163  01e5 ae48          	ld	x,#high(L3343)
3166  01e7 81            	ret
3167  01e8               L1321:
3168                     ; 485 				case LABEL_TWIN_APPLICATION_05_02:
3168                     ; 486 					return "application";
3171  01e8 a671          	ld	a,#low(L3243)
3172  01ea ae71          	ld	x,#high(L3243)
3175  01ec 81            	ret
3176  01ed               L3321:
3177                     ; 488 				case LABEL_TWIN_APPLICATION_06_01:
3177                     ; 489 					return "Frontside";
3180  01ed a63e          	ld	a,#low(L5343)
3181  01ef ae3e          	ld	x,#high(L5343)
3184  01f1 81            	ret
3185  01f2               L5321:
3186                     ; 491 				case LABEL_TWIN_APPLICATION_06_02:
3186                     ; 492 					return "application";
3189  01f2 a671          	ld	a,#low(L3243)
3190  01f4 ae71          	ld	x,#high(L3243)
3193  01f6 81            	ret
3194  01f7               L7321:
3195                     ; 494 				case LABEL_TWIN_APPLICATION_07_01:
3195                     ; 495 					return "Backside";
3198  01f7 a635          	ld	a,#low(L7343)
3199  01f9 ae35          	ld	x,#high(L7343)
3202  01fb 81            	ret
3203  01fc               L1421:
3204                     ; 497 				case LABEL_TWIN_APPLICATION_07_02:
3204                     ; 498 					return "application";
3207  01fc a671          	ld	a,#low(L3243)
3208  01fe ae71          	ld	x,#high(L3243)
3211  0200 81            	ret
3212  0201               L3421:
3213                     ; 500 				case LABEL_REGISTER_TWIN_APPLICATION_01:
3213                     ; 501 					return "Front/Backside register:";
3216  0201 a61c          	ld	a,#low(L1443)
3217  0203 ae1c          	ld	x,#high(L1443)
3220  0205 81            	ret
3221  0206               L5421:
3222                     ; 503 				case LABEL_REGISTER_TWIN_APPLICATION_02:
3222                     ; 504 					return "insetter register:";
3225  0206 a609          	ld	a,#low(L3443)
3226  0208 ae09          	ld	x,#high(L3443)
3229  020a 81            	ret
3230  020b               L7421:
3231                     ; 506 				case LABEL_REGISTER_TWIN_APPLICATION_03:
3231                     ; 507 					return "Cutting-off register:";
3234  020b a6f3          	ld	a,#low(L5443)
3235  020d aef3          	ld	x,#high(L5443)
3238  020f 81            	ret
3239  0210               L1521:
3240                     ; 509 				case LABEL_REGISTER_TWIN_APPLICATION_04:
3240                     ; 510 					return "Web folding register:";
3243  0210 a6dd          	ld	a,#low(L7443)
3244  0212 aedd          	ld	x,#high(L7443)
3247  0214 81            	ret
3248  0215               L3521:
3249                     ; 512 				case LABEL_REGISTER_TWIN_APPLICATION_05:
3249                     ; 513 					return "Perforation register:";
3252  0215 a6c7          	ld	a,#low(L1543)
3253  0217 aec7          	ld	x,#high(L1543)
3256  0219 81            	ret
3257  021a               L5521:
3258                     ; 515 				case LABEL_REGISTER_TWIN_APPLICATION_06:
3258                     ; 516 					return "Frontside register:";
3261  021a a6b3          	ld	a,#low(L3543)
3262  021c aeb3          	ld	x,#high(L3543)
3265  021e 81            	ret
3266  021f               L7521:
3267                     ; 518 				case LABEL_REGISTER_TWIN_APPLICATION_07:
3267                     ; 519 					return "Backside register:";
3270  021f a6a0          	ld	a,#low(L5543)
3271  0221 aea0          	ld	x,#high(L5543)
3274  0223 81            	ret
3275  0224               L1621:
3276                     ; 521 				case LABEL_ENCODER_01_01:
3276                     ; 522 					return "Encoder";
3279  0224 a68c          	ld	a,#low(L3423)
3280  0226 ae8c          	ld	x,#high(L3423)
3283  0228 81            	ret
3284  0229               L3621:
3285                     ; 524 				case LABEL_ENCODER_01_02:
3285                     ; 525 					return "1";
3288  0229 a69e          	ld	a,#low(L7543)
3289  022b ae9e          	ld	x,#high(L7543)
3292  022d 81            	ret
3293  022e               L5621:
3294                     ; 527 				case LABEL_ENCODER_02_01:
3294                     ; 528 					return "Encoder";
3297  022e a68c          	ld	a,#low(L3423)
3298  0230 ae8c          	ld	x,#high(L3423)
3301  0232 81            	ret
3302  0233               L7621:
3303                     ; 530 				case LABEL_ENCODER_02_02:
3303                     ; 531 					return "2";
3306  0233 a69c          	ld	a,#low(L1643)
3307  0235 ae9c          	ld	x,#high(L1643)
3310  0237 81            	ret
3311  0238               L1721:
3312                     ; 533 				case LABEL_SELECT_APPLICATION_01:
3312                     ; 534 					return "Application";
3315  0238 a690          	ld	a,#low(L3643)
3316  023a ae90          	ld	x,#high(L3643)
3319  023c 81            	ret
3320  023d               L3721:
3321                     ; 536 				case LABEL_SELECT_APPLICATION_02:
3321                     ; 537 					return "selection";
3324  023d a686          	ld	a,#low(L5643)
3325  023f ae86          	ld	x,#high(L5643)
3328  0241 81            	ret
3329  0242               L5721:
3330                     ; 539 				case LABEL_SELECT_ENCODER_01:
3330                     ; 540 					return "Encoder";
3333  0242 a68c          	ld	a,#low(L3423)
3334  0244 ae8c          	ld	x,#high(L3423)
3337  0246 81            	ret
3338  0247               L7721:
3339                     ; 542 				case LABEL_SELECT_ENCODER_02:
3339                     ; 543 					return "selection";
3342  0247 a686          	ld	a,#low(L5643)
3343  0249 ae86          	ld	x,#high(L5643)
3346  024b 81            	ret
3347  024c               L1031:
3348                     ; 545 				case LABEL_SH_PN_01_01:
3348                     ; 546 					return "Positive";
3351  024c a67d          	ld	a,#low(L7643)
3352  024e ae7d          	ld	x,#high(L7643)
3355  0250 81            	ret
3356  0251               L3031:
3357                     ; 548 				case LABEL_SH_PN_01_02:
3357                     ; 549 					return "Mark";
3360  0251 a678          	ld	a,#low(L1743)
3361  0253 ae78          	ld	x,#high(L1743)
3364  0255 81            	ret
3365  0256               L5031:
3366                     ; 551 				case LABEL_SH_PN_02_01:
3366                     ; 552 					return "Negative";
3369  0256 a66f          	ld	a,#low(L3743)
3370  0258 ae6f          	ld	x,#high(L3743)
3373  025a 81            	ret
3374  025b               L7031:
3375                     ; 554 				case LABEL_SH_PN_02_02:
3375                     ; 555 					return "Mark";
3378  025b a678          	ld	a,#low(L1743)
3379  025d ae78          	ld	x,#high(L1743)
3382  025f 81            	ret
3383  0260               L1131:
3384                     ; 557 				case LABEL_SELECT_SH_PN_01:
3384                     ; 558 					return "P/N Mark";
3387  0260 a666          	ld	a,#low(L5743)
3388  0262 ae66          	ld	x,#high(L5743)
3391  0264 81            	ret
3392  0265               L3131:
3393                     ; 560 				case LABEL_SELECT_SH_PN_02:
3393                     ; 561 					return "Selection";
3396  0265 a65c          	ld	a,#low(L7743)
3397  0267 ae5c          	ld	x,#high(L7743)
3400  0269 81            	ret
3401  026a               L5131:
3402                     ; 563 				case LABEL_TENSION_BASE_VALUE_01:
3402                     ; 564 					return "Tension base";
3405  026a a64f          	ld	a,#low(L1053)
3406  026c ae4f          	ld	x,#high(L1053)
3409  026e 81            	ret
3410  026f               L7131:
3411                     ; 566 				case LABEL_TENSION_BASE_VALUE_02:
3411                     ; 567 					return "value";
3414  026f a649          	ld	a,#low(L3053)
3415  0271 ae49          	ld	x,#high(L3053)
3418  0273 81            	ret
3419  0274               L1231:
3420                     ; 569 				default:
3420                     ; 570 					return "ERR_IDX";
3423  0274 a641          	ld	a,#low(L5053)
3424  0276 ae41          	ld	x,#high(L5053)
3427  0278 81            	ret
3428  0279               L7023:
3429                     ; 573 			break;
3431  0279 cc0bc2        	jp	L3023
3432  027c               L3231:
3433                     ; 574 		case PARAM_LANGUAGE_DE: //Deutch
3433                     ; 575 			switch(a_byIndex)
3435  027c b600          	ld	a,_labelGet$L
3437                     ; 918 					break;
3439  027e a173          	cp	a,#115
3440  0280 240b          	jruge	L21
3441  0282 48            	sll	a
3442  0283 97            	ld	x,a
3443  0284 d612e0        	ld	a,(L41+1,x)
3444  0287 88            	push	a
3445  0288 d612df        	ld	a,(L41,x)
3446  028b 88            	push	a
3447  028c 81            	ret
3448  028d               L21:
3449  028d cc0bc2        	jp	L3023
3450  0290               L5231:
3451                     ; 577 				case LABEL_MODE:
3451                     ; 578 					return "Bestimmung";
3453  0290 a636          	ld	a,#low(L3153)
3454  0292 ae36          	ld	x,#high(L3153)
3457  0294 81            	ret
3458  0295               L7231:
3459                     ; 580 				case LABEL_MANUAL:
3459                     ; 581 					return "manuell";
3462  0295 a62e          	ld	a,#low(L5153)
3463  0297 ae2e          	ld	x,#high(L5153)
3466  0299 81            	ret
3467  029a               L1331:
3468                     ; 583 				case LABEL_AUTO:
3468                     ; 584 					return "automatik";
3471  029a a624          	ld	a,#low(L7153)
3472  029c ae24          	ld	x,#high(L7153)
3475  029e 81            	ret
3476  029f               L3331:
3477                     ; 586 				case LABEL_SPEED:
3477                     ; 587 					return "Geschwindigkeit";
3480  029f a614          	ld	a,#low(L1253)
3481  02a1 ae14          	ld	x,#high(L1253)
3484  02a3 81            	ret
3485  02a4               L5331:
3486                     ; 589 				case LABEL_SPEED_SHORT:
3486                     ; 590 					return "Gesch:";
3489  02a4 a60d          	ld	a,#low(L3253)
3490  02a6 ae0d          	ld	x,#high(L3253)
3493  02a8 81            	ret
3494  02a9               L7331:
3495                     ; 592 				case LABEL_CYLINDER_SIZE:
3495                     ; 593 					return "grosse:";
3498  02a9 a605          	ld	a,#low(L5253)
3499  02ab ae05          	ld	x,#high(L5253)
3502  02ad 81            	ret
3503  02ae               L1431:
3504                     ; 595 				case LABEL_MT_MIN:
3504                     ; 596 					return "mt/min";
3507  02ae a6d1          	ld	a,#low(L5223)
3508  02b0 aed1          	ld	x,#high(L5223)
3511  02b2 81            	ret
3512  02b3               L3431:
3513                     ; 598 				case LABEL_MESSAGE:
3513                     ; 599 					return "Nachricht";
3516  02b3 a6fb          	ld	a,#low(L7253)
3517  02b5 aefb          	ld	x,#high(L7253)
3520  02b7 81            	ret
3521  02b8               L5431:
3522                     ; 601 				case LABEL_ALARM:
3522                     ; 602 					return "Alarm";
3525  02b8 a684          	ld	a,#low(L1233)
3526  02ba ae84          	ld	x,#high(L1233)
3529  02bc 81            	ret
3530  02bd               L7431:
3531                     ; 604 				case LABEL_ALARM_ERR_NO_PRINT:
3531                     ; 605 					return "Druck fehlt";
3534  02bd a6ef          	ld	a,#low(L1353)
3535  02bf aeef          	ld	x,#high(L1353)
3538  02c1 81            	ret
3539  02c2               L1531:
3540                     ; 607 				case LABEL_ALARM_ERR_LOW_SPEED:
3540                     ; 608 					return "langsam Geschwindigkeit";
3543  02c2 a6d7          	ld	a,#low(L3353)
3544  02c4 aed7          	ld	x,#high(L3353)
3547  02c6 81            	ret
3548  02c7               L3531:
3549                     ; 610 				case LABEL_ALARM_ERR_TEST_SH_01:
3549                     ; 611 					return "Lesekopf";
3552  02c7 a6ce          	ld	a,#low(L5353)
3553  02c9 aece          	ld	x,#high(L5353)
3556  02cb 81            	ret
3557  02cc               L5531:
3558                     ; 613 				case LABEL_ALARM_ERR_TEST_SH_02:
3558                     ; 614 					return "test Irrtum";
3561  02cc a6c2          	ld	a,#low(L7353)
3562  02ce aec2          	ld	x,#high(L7353)
3565  02d0 81            	ret
3566  02d1               L7531:
3567                     ; 616 				case LABEL_ALARM_ERR_TEST_ENC_01:
3567                     ; 617 					return "Encoder test";
3570  02d1 a6b5          	ld	a,#low(L1453)
3571  02d3 aeb5          	ld	x,#high(L1453)
3574  02d5 81            	ret
3575  02d6               L1631:
3576                     ; 619 				case LABEL_ALARM_ERR_TEST_ENC_02:
3576                     ; 620 					return "Irrtum";
3579  02d6 a6ae          	ld	a,#low(L3453)
3580  02d8 aeae          	ld	x,#high(L3453)
3583  02da 81            	ret
3584  02db               L3631:
3585                     ; 622 				case LABEL_ALARM_ERR_PHASE_AUTO_01:
3585                     ; 623 					return "Automatische";
3588  02db a6a1          	ld	a,#low(L5453)
3589  02dd aea1          	ld	x,#high(L5453)
3592  02df 81            	ret
3593  02e0               L5631:
3594                     ; 625 				case LABEL_ALARM_ERR_PHASE_AUTO_02:
3594                     ; 626 					return "Einstellung Irrtum";
3597  02e0 a68e          	ld	a,#low(L7453)
3598  02e2 ae8e          	ld	x,#high(L7453)
3601  02e4 81            	ret
3602  02e5               L7631:
3603                     ; 628 				case LABEL_ALARM_CYLINDER_TRAVEL_01:
3603                     ; 629 					return "Format Zylinder (P1)";
3606  02e5 a679          	ld	a,#low(L1553)
3607  02e7 ae79          	ld	x,#high(L1553)
3610  02e9 81            	ret
3611  02ea               L1731:
3612                     ; 631 				case LABEL_ALARM_CYLINDER_TRAVEL_02:
3612                     ; 632 					return "nicht akzeptabel";
3615  02ea a668          	ld	a,#low(L3553)
3616  02ec ae68          	ld	x,#high(L3553)
3619  02ee 81            	ret
3620  02ef               L3731:
3621                     ; 634 				case LABEL_ALARM_GATE_WINDOW_01:
3621                     ; 635 					return "Tor Weite (P3)";
3624  02ef a659          	ld	a,#low(L5553)
3625  02f1 ae59          	ld	x,#high(L5553)
3628  02f3 81            	ret
3629  02f4               L5731:
3630                     ; 637 				case LABEL_ALARM_GATE_WINDOW_02:
3630                     ; 638 					return "nicht akzeptabel";
3633  02f4 a668          	ld	a,#low(L3553)
3634  02f6 ae68          	ld	x,#high(L3553)
3637  02f8 81            	ret
3638  02f9               L7731:
3639                     ; 640 				case LABEL_ANSWER_OK:
3639                     ; 641 					return "OK";
3642  02f9 a656          	ld	a,#low(L7553)
3643  02fb ae56          	ld	x,#high(L7553)
3646  02fd 81            	ret
3647  02fe               L1041:
3648                     ; 643 				case LABEL_GENERIC_ALARM_01:
3648                     ; 644 					return "Alarm";
3651  02fe a684          	ld	a,#low(L1233)
3652  0300 ae84          	ld	x,#high(L1233)
3655  0302 81            	ret
3656  0303               L3041:
3657                     ; 646 				case LABEL_GENERIC_ALARM_02:
3657                     ; 647 					return "nicht anerkannt";
3660  0303 a646          	ld	a,#low(L1653)
3661  0305 ae46          	ld	x,#high(L1653)
3664  0307 81            	ret
3665  0308               L5041:
3666                     ; 649 				case LABEL_PHASE_OSCILL:
3666                     ; 650 					return "Einstellung mit dem Oszilloskop";
3669  0308 a626          	ld	a,#low(L3653)
3670  030a ae26          	ld	x,#high(L3653)
3673  030c 81            	ret
3674  030d               L7041:
3675                     ; 652 				case LABEL_PHASE_FAST:
3675                     ; 653 					return "Einstellung Verbesserung stromschenelle";
3678  030d a6fe          	ld	a,#low(L5653)
3679  030f aefe          	ld	x,#high(L5653)
3682  0311 81            	ret
3683  0312               L1141:
3684                     ; 655 				case LABEL_OSCILLOSCOPE:
3684                     ; 656 					return "Oszilloskop";
3687  0312 a6f2          	ld	a,#low(L7653)
3688  0314 aef2          	ld	x,#high(L7653)
3691  0316 81            	ret
3692  0317               L3141:
3693                     ; 658 				case LABEL_REGISTER:
3693                     ; 659 					return "Register";
3696  0317 a621          	ld	a,#low(L3533)
3697  0319 ae21          	ld	x,#high(L3533)
3700  031b 81            	ret
3701  031c               L5141:
3702                     ; 661 				case LABEL_PHASE_CENTER_01:
3702                     ; 662 					return "Nulleinstel.";
3705  031c a6e5          	ld	a,#low(L1753)
3706  031e aee5          	ld	x,#high(L1753)
3709  0320 81            	ret
3710  0321               L7141:
3711                     ; 664 				case LABEL_PHASE_CENTER_02:
3711                     ; 665 					return "Fehler";
3714  0321 a6de          	ld	a,#low(L3753)
3715  0323 aede          	ld	x,#high(L3753)
3718  0325 81            	ret
3719  0326               L1241:
3720                     ; 667 				case LABEL_PHASE_MANUAL_01:
3720                     ; 668 					return "Einstellung";
3723  0326 a6d2          	ld	a,#low(L5753)
3724  0328 aed2          	ld	x,#high(L5753)
3727  032a 81            	ret
3728  032b               L3241:
3729                     ; 670 				case LABEL_PHASE_MANUAL_02:
3729                     ; 671 					return "manuell";
3732  032b a62e          	ld	a,#low(L5153)
3733  032d ae2e          	ld	x,#high(L5153)
3736  032f 81            	ret
3737  0330               L5241:
3738                     ; 673 				case LABEL_PHASE_AUTO_01:
3738                     ; 674 					return "Einstellung";
3741  0330 a6d2          	ld	a,#low(L5753)
3742  0332 aed2          	ld	x,#high(L5753)
3745  0334 81            	ret
3746  0335               L7241:
3747                     ; 676 				case LABEL_PHASE_AUTO_02:
3747                     ; 677 					return "automatisch";
3750  0335 a6c6          	ld	a,#low(L7753)
3751  0337 aec6          	ld	x,#high(L7753)
3754  0339 81            	ret
3755  033a               L1341:
3756                     ; 679 				case LABEL_PHASE_OSCILL_01:
3756                     ; 680 					return "Einstellung";
3759  033a a6d2          	ld	a,#low(L5753)
3760  033c aed2          	ld	x,#high(L5753)
3763  033e 81            	ret
3764  033f               L3341:
3765                     ; 682 				case LABEL_PHASE_OSCILL_02:
3765                     ; 683 					return "Oszilloskop";
3768  033f a6f2          	ld	a,#low(L7653)
3769  0341 aef2          	ld	x,#high(L7653)
3772  0343 81            	ret
3773  0344               L5341:
3774                     ; 685 				case LABEL_PHASE_FAST_01:
3774                     ; 686 					return "Einstellung a";
3777  0344 a6b8          	ld	a,#low(L1063)
3778  0346 aeb8          	ld	x,#high(L1063)
3781  0348 81            	ret
3782  0349               L7341:
3783                     ; 688 				case LABEL_PHASE_FAST_02:
3783                     ; 689 					return "beschleunigung";
3786  0349 a6a9          	ld	a,#low(L3063)
3787  034b aea9          	ld	x,#high(L3063)
3790  034d 81            	ret
3791  034e               L1441:
3792                     ; 691 				case LABEL_CYLINDER_TRAVEL_01:
3792                     ; 692 					return "dimension";
3795  034e a69f          	ld	a,#low(L5063)
3796  0350 ae9f          	ld	x,#high(L5063)
3799  0352 81            	ret
3800  0353               L3441:
3801                     ; 694 				case LABEL_CYLINDER_TRAVEL_02:
3801                     ; 695 					return "zylinder";
3804  0353 a696          	ld	a,#low(L7063)
3805  0355 ae96          	ld	x,#high(L7063)
3808  0357 81            	ret
3809  0358               L5441:
3810                     ; 697 				case LABEL_ALARM_BOUND_01:
3810                     ; 698 					return "Limit";
3813  0358 a690          	ld	a,#low(L1163)
3814  035a ae90          	ld	x,#high(L1163)
3817  035c 81            	ret
3818  035d               L7441:
3819                     ; 700 				case LABEL_ALARM_BOUND_02:
3819                     ; 701 					return "Alarm";
3822  035d a684          	ld	a,#low(L1233)
3823  035f ae84          	ld	x,#high(L1233)
3826  0361 81            	ret
3827  0362               L1541:
3828                     ; 703 				case LABEL_GATE_WINDOW_01:
3828                     ; 704 					return "Weite";
3831  0362 a68a          	ld	a,#low(L3163)
3832  0364 ae8a          	ld	x,#high(L3163)
3835  0366 81            	ret
3836  0367               L3541:
3837                     ; 706 				case LABEL_GATE_WINDOW_02:
3837                     ; 707 					return "Tor";
3840  0367 a686          	ld	a,#low(L5163)
3841  0369 ae86          	ld	x,#high(L5163)
3844  036b 81            	ret
3845  036c               L5541:
3846                     ; 709 				case LABEL_SW_VERSION_01:
3846                     ; 710 					return "Version";
3849  036c a662          	ld	a,#low(L3333)
3850  036e ae62          	ld	x,#high(L3333)
3853  0370 81            	ret
3854  0371               L7541:
3855                     ; 712 				case LABEL_SW_VERSION_02:
3855                     ; 713 					return "Software";
3858  0371 a66a          	ld	a,#low(L1333)
3859  0373 ae6a          	ld	x,#high(L1333)
3862  0375 81            	ret
3863  0376               L1641:
3864                     ; 715 				case LABEL_OFFSET_DISTANCE_01:
3864                     ; 716 					return "Entfernung";
3867  0376 a67b          	ld	a,#low(L7163)
3868  0378 ae7b          	ld	x,#high(L7163)
3871  037a 81            	ret
3872  037b               L3641:
3873                     ; 718 				case LABEL_OFFSET_DISTANCE_02:
3873                     ; 719 					return "offset";
3876  037b a674          	ld	a,#low(L1263)
3877  037d ae74          	ld	x,#high(L1263)
3880  037f 81            	ret
3881  0380               L5641:
3882                     ; 721 				case LABEL_TEST_SH_01:
3882                     ; 722 					return "Test";
3885  0380 a66f          	ld	a,#low(L3263)
3886  0382 ae6f          	ld	x,#high(L3263)
3889  0384 81            	ret
3890  0385               L7641:
3891                     ; 724 				case LABEL_TEST_SH_02:
3891                     ; 725 					return "Lesekopf";
3894  0385 a6ce          	ld	a,#low(L5353)
3895  0387 aece          	ld	x,#high(L5353)
3898  0389 81            	ret
3899  038a               L1741:
3900                     ; 727 				case LABEL_TEST_ENC_01:
3900                     ; 728 					return "Test";
3903  038a a66f          	ld	a,#low(L3263)
3904  038c ae6f          	ld	x,#high(L3263)
3907  038e 81            	ret
3908  038f               L3741:
3909                     ; 730 				case LABEL_TEST_ENC_02:
3909                     ; 731 					return "Encoder";
3912  038f a68c          	ld	a,#low(L3423)
3913  0391 ae8c          	ld	x,#high(L3423)
3916  0393 81            	ret
3917  0394               L5741:
3918                     ; 733 				case LABEL_TEST_OUTPUT_01:
3918                     ; 734 					return "Test";
3921  0394 a66f          	ld	a,#low(L3263)
3922  0396 ae6f          	ld	x,#high(L3263)
3925  0398 81            	ret
3926  0399               L7741:
3927                     ; 736 				case LABEL_TEST_OUTPUT_02:
3927                     ; 737 					return "Ausgangen";
3930  0399 a665          	ld	a,#low(L5263)
3931  039b ae65          	ld	x,#high(L5263)
3934  039d 81            	ret
3935  039e               L1051:
3936                     ; 739 				case LABEL_VISUAL_REGISTER_01:
3936                     ; 740 					return "Visual";
3939  039e a62a          	ld	a,#low(L1533)
3940  03a0 ae2a          	ld	x,#high(L1533)
3943  03a2 81            	ret
3944  03a3               L3051:
3945                     ; 742 				case LABEL_VISUAL_REGISTER_02:
3945                     ; 743 					return "Register";
3948  03a3 a621          	ld	a,#low(L3533)
3949  03a5 ae21          	ld	x,#high(L3533)
3952  03a7 81            	ret
3953  03a8               L5051:
3954                     ; 745 				case LABEL_VISUAL_OSCILL_01:
3954                     ; 746 					return "Visual";
3957  03a8 a62a          	ld	a,#low(L1533)
3958  03aa ae2a          	ld	x,#high(L1533)
3961  03ac 81            	ret
3962  03ad               L7051:
3963                     ; 748 				case LABEL_VISUAL_OSCILL_02:
3963                     ; 749 					return "Oszilloskop";
3966  03ad a6f2          	ld	a,#low(L7653)
3967  03af aef2          	ld	x,#high(L7653)
3970  03b1 81            	ret
3971  03b2               L1151:
3972                     ; 751 				case LABEL_JOB_ARCHIVE_01:
3972                     ; 752 					return "Archiv";
3975  03b2 a65e          	ld	a,#low(L7263)
3976  03b4 ae5e          	ld	x,#high(L7263)
3979  03b6 81            	ret
3980  03b7               L3151:
3981                     ; 754 				case LABEL_JOB_ARCHIVE_02:
3981                     ; 755 					return "Arbeiten";
3984  03b7 a655          	ld	a,#low(L1363)
3985  03b9 ae55          	ld	x,#high(L1363)
3988  03bb 81            	ret
3989  03bc               L5151:
3990                     ; 757 				case LABEL_FUNCTIONS:
3990                     ; 758 					return "Funktionen";
3993  03bc a64a          	ld	a,#low(L3363)
3994  03be ae4a          	ld	x,#high(L3363)
3997  03c0 81            	ret
3998  03c1               L7151:
3999                     ; 760 				case LABEL_PARAMETERS:
3999                     ; 761 					return "Parametern";
4002  03c1 a63f          	ld	a,#low(L5363)
4003  03c3 ae3f          	ld	x,#high(L5363)
4006  03c5 81            	ret
4007  03c6               L1251:
4008                     ; 763 				case LABEL_TESTS:
4008                     ; 764 					return "Tests";
4011  03c6 a6ed          	ld	a,#low(L7633)
4012  03c8 aeed          	ld	x,#high(L7633)
4015  03ca 81            	ret
4016  03cb               L3251:
4017                     ; 766 				case LABEL_SIMPLE_SETUP:
4017                     ; 767 					return "leicht Setup";
4020  03cb a632          	ld	a,#low(L7363)
4021  03cd ae32          	ld	x,#high(L7363)
4024  03cf 81            	ret
4025  03d0               L5251:
4026                     ; 769 				case LABEL_FULL_SETUP:
4026                     ; 770 					return "vollstandig Setup";
4029  03d0 a620          	ld	a,#low(L1463)
4030  03d2 ae20          	ld	x,#high(L1463)
4033  03d4 81            	ret
4034  03d5               L7251:
4035                     ; 772 				case LABEL_ALARM_ERR_ACCELERATION:
4035                     ; 773 					return "Hochlauf";
4038  03d5 a617          	ld	a,#low(L3463)
4039  03d7 ae17          	ld	x,#high(L3463)
4042  03d9 81            	ret
4043  03da               L1351:
4044                     ; 775 				case LABEL_ALARM_ERR_DECELERATION:
4044                     ; 776 					return "Rüchlauf";
4047  03da a60e          	ld	a,#low(L5463)
4048  03dc ae0e          	ld	x,#high(L5463)
4051  03de 81            	ret
4052  03df               L3351:
4053                     ; 778 				case LABEL_ALARM_ERR_DOUBLE_MARK:
4053                     ; 779 					return "doppel Marke";
4056  03df a601          	ld	a,#low(L7463)
4057  03e1 ae01          	ld	x,#high(L7463)
4060  03e3 81            	ret
4061  03e4               L5351:
4062                     ; 781 				case LABEL_AUTO_SHORT:
4062                     ; 782 					return "Auto";
4065  03e4 a6a8          	ld	a,#low(L3043)
4066  03e6 aea8          	ld	x,#high(L3043)
4069  03e8 81            	ret
4070  03e9               L7351:
4071                     ; 784 				case LABEL_MANUAL_SHORT:
4071                     ; 785 					return "man.";
4074  03e9 a6fc          	ld	a,#low(L1563)
4075  03eb aefc          	ld	x,#high(L1563)
4078  03ed 81            	ret
4079  03ee               L1451:
4080                     ; 787 				case LABEL_MODE_LONG:
4080                     ; 788 					return "langs:";
4083  03ee a6f5          	ld	a,#low(L3563)
4084  03f0 aef5          	ld	x,#high(L3563)
4087  03f2 81            	ret
4088  03f3               L3451:
4089                     ; 790 				case LABEL_MODE_TRANS:
4089                     ; 791 					return "quer";
4092  03f3 a6f0          	ld	a,#low(L5563)
4093  03f5 aef0          	ld	x,#high(L5563)
4096  03f7 81            	ret
4097  03f8               L5451:
4098                     ; 793 				case LABEL_MODE_PULL:
4098                     ; 794 					return "Span.";
4101  03f8 a6ea          	ld	a,#low(L7563)
4102  03fa aeea          	ld	x,#high(L7563)
4105  03fc 81            	ret
4106  03fd               L7451:
4107                     ; 796 				case LABEL_SAVE_JOB_01:
4107                     ; 797 					return "speichern";
4110  03fd a6e0          	ld	a,#low(L1663)
4111  03ff aee0          	ld	x,#high(L1663)
4114  0401 81            	ret
4115  0402               L1551:
4116                     ; 799 				case LABEL_SAVE_JOB_02:
4116                     ; 800 					return "Arbeit";
4119  0402 a6d9          	ld	a,#low(L3663)
4120  0404 aed9          	ld	x,#high(L3663)
4123  0406 81            	ret
4124  0407               L3551:
4125                     ; 802 				case LABEL_LOAD_JOB_01:
4125                     ; 803 					return "laden";
4128  0407 a6d3          	ld	a,#low(L5663)
4129  0409 aed3          	ld	x,#high(L5663)
4132  040b 81            	ret
4133  040c               L5551:
4134                     ; 805 				case LABEL_LOAD_JOB_02:
4134                     ; 806 					return "Arbeit";
4137  040c a6d9          	ld	a,#low(L3663)
4138  040e aed9          	ld	x,#high(L3663)
4141  0410 81            	ret
4142  0411               L7551:
4143                     ; 808 				case LABEL_TWIN_APPLICATION_01_01:
4143                     ; 809 					return "Steuerung";
4146  0411 a6c9          	ld	a,#low(L7663)
4147  0413 aec9          	ld	x,#high(L7663)
4150  0415 81            	ret
4151  0416               L1651:
4152                     ; 811 				case LABEL_TWIN_APPLICATION_01_02:
4152                     ; 812 					return "Vorder/Ruckseite";
4155  0416 a6b8          	ld	a,#low(L1763)
4156  0418 aeb8          	ld	x,#high(L1763)
4159  041a 81            	ret
4160  041b               L3651:
4161                     ; 814 				case LABEL_TWIN_APPLICATION_02_01:
4161                     ; 815 					return "Register";
4164  041b a621          	ld	a,#low(L3533)
4165  041d ae21          	ld	x,#high(L3533)
4168  041f 81            	ret
4169  0420               L5651:
4170                     ; 817 				case LABEL_TWIN_APPLICATION_02_02:
4170                     ; 818 					return "Insetter";
4173  0420 a668          	ld	a,#low(L5243)
4174  0422 ae68          	ld	x,#high(L5243)
4177  0424 81            	ret
4178  0425               L7651:
4179                     ; 820 				case LABEL_TWIN_APPLICATION_03_01:
4179                     ; 821 					return "Register";
4182  0425 a621          	ld	a,#low(L3533)
4183  0427 ae21          	ld	x,#high(L3533)
4186  0429 81            	ret
4187  042a               L1751:
4188                     ; 823 				case LABEL_TWIN_APPLICATION_03_02:
4188                     ; 824 					return "Schnitt";
4191  042a a6b0          	ld	a,#low(L3763)
4192  042c aeb0          	ld	x,#high(L3763)
4195  042e 81            	ret
4196  042f               L3751:
4197                     ; 826 				case LABEL_TWIN_APPLICATION_04_01:
4197                     ; 827 					return "Register";
4200  042f a621          	ld	a,#low(L3533)
4201  0431 ae21          	ld	x,#high(L3533)
4204  0433 81            	ret
4205  0434               L5751:
4206                     ; 829 				case LABEL_TWIN_APPLICATION_04_02:
4206                     ; 830 					return "Falz";
4209  0434 a6ab          	ld	a,#low(L5763)
4210  0436 aeab          	ld	x,#high(L5763)
4213  0438 81            	ret
4214  0439               L7751:
4215                     ; 832 				case LABEL_TWIN_APPLICATION_05_01:
4215                     ; 833 					return "Register";
4218  0439 a621          	ld	a,#low(L3533)
4219  043b ae21          	ld	x,#high(L3533)
4222  043d 81            	ret
4223  043e               L1061:
4224                     ; 835 				case LABEL_TWIN_APPLICATION_05_02:
4224                     ; 836 					return "Perforation";
4227  043e a648          	ld	a,#low(L3343)
4228  0440 ae48          	ld	x,#high(L3343)
4231  0442 81            	ret
4232  0443               L3061:
4233                     ; 838 				case LABEL_TWIN_APPLICATION_06_01:
4233                     ; 839 					return "Register";
4236  0443 a621          	ld	a,#low(L3533)
4237  0445 ae21          	ld	x,#high(L3533)
4240  0447 81            	ret
4241  0448               L5061:
4242                     ; 841 				case LABEL_TWIN_APPLICATION_06_02:
4242                     ; 842 					return "Vorder";
4245  0448 a6a4          	ld	a,#low(L7763)
4246  044a aea4          	ld	x,#high(L7763)
4249  044c 81            	ret
4250  044d               L7061:
4251                     ; 844 				case LABEL_TWIN_APPLICATION_07_01:
4251                     ; 845 					return "Register";
4254  044d a621          	ld	a,#low(L3533)
4255  044f ae21          	ld	x,#high(L3533)
4258  0451 81            	ret
4259  0452               L1161:
4260                     ; 847 				case LABEL_TWIN_APPLICATION_07_02:
4260                     ; 848 					return "Rückseite";
4263  0452 a69a          	ld	a,#low(L1073)
4264  0454 ae9a          	ld	x,#high(L1073)
4267  0456 81            	ret
4268  0457               L3161:
4269                     ; 850 				case LABEL_REGISTER_TWIN_APPLICATION_01:
4269                     ; 851 					return "Vorder/Rückseite Register";
4272  0457 a680          	ld	a,#low(L3073)
4273  0459 ae80          	ld	x,#high(L3073)
4276  045b 81            	ret
4277  045c               L5161:
4278                     ; 853 				case LABEL_REGISTER_TWIN_APPLICATION_02:
4278                     ; 854 					return "Insetter Register";
4281  045c a66e          	ld	a,#low(L5073)
4282  045e ae6e          	ld	x,#high(L5073)
4285  0460 81            	ret
4286  0461               L7161:
4287                     ; 856 				case LABEL_REGISTER_TWIN_APPLICATION_03:
4287                     ; 857 					return "Schnitt Register";
4290  0461 a65d          	ld	a,#low(L7073)
4291  0463 ae5d          	ld	x,#high(L7073)
4294  0465 81            	ret
4295  0466               L1261:
4296                     ; 859 				case LABEL_REGISTER_TWIN_APPLICATION_04:
4296                     ; 860 					return "Falz Register";
4299  0466 a64f          	ld	a,#low(L1173)
4300  0468 ae4f          	ld	x,#high(L1173)
4303  046a 81            	ret
4304  046b               L3261:
4305                     ; 862 				case LABEL_REGISTER_TWIN_APPLICATION_05:
4305                     ; 863 					return "Perforation Register";
4308  046b a63a          	ld	a,#low(L3173)
4309  046d ae3a          	ld	x,#high(L3173)
4312  046f 81            	ret
4313  0470               L5261:
4314                     ; 865 				case LABEL_REGISTER_TWIN_APPLICATION_06:
4314                     ; 866 					return "Vorder Register";
4317  0470 a62a          	ld	a,#low(L5173)
4318  0472 ae2a          	ld	x,#high(L5173)
4321  0474 81            	ret
4322  0475               L7261:
4323                     ; 868 				case LABEL_REGISTER_TWIN_APPLICATION_07:
4323                     ; 869 					return "Rückseite register";
4326  0475 a617          	ld	a,#low(L7173)
4327  0477 ae17          	ld	x,#high(L7173)
4330  0479 81            	ret
4331  047a               L1361:
4332                     ; 871 				case LABEL_ENCODER_01_01:
4332                     ; 872 					return "Encoder";
4335  047a a68c          	ld	a,#low(L3423)
4336  047c ae8c          	ld	x,#high(L3423)
4339  047e 81            	ret
4340  047f               L3361:
4341                     ; 874 				case LABEL_ENCODER_01_02:
4341                     ; 875 					return "1";
4344  047f a69e          	ld	a,#low(L7543)
4345  0481 ae9e          	ld	x,#high(L7543)
4348  0483 81            	ret
4349  0484               L5361:
4350                     ; 877 				case LABEL_ENCODER_02_01:
4350                     ; 878 					return "Encoder";
4353  0484 a68c          	ld	a,#low(L3423)
4354  0486 ae8c          	ld	x,#high(L3423)
4357  0488 81            	ret
4358  0489               L7361:
4359                     ; 880 				case LABEL_ENCODER_02_02:
4359                     ; 881 					return "2";
4362  0489 a69c          	ld	a,#low(L1643)
4363  048b ae9c          	ld	x,#high(L1643)
4366  048d 81            	ret
4367  048e               L1461:
4368                     ; 883 				case LABEL_SELECT_APPLICATION_01:
4368                     ; 884 					return "Auswahl";
4371  048e a60f          	ld	a,#low(L1273)
4372  0490 ae0f          	ld	x,#high(L1273)
4375  0492 81            	ret
4376  0493               L3461:
4377                     ; 886 				case LABEL_SELECT_APPLICATION_02:
4377                     ; 887 					return "Anwendung";
4380  0493 a605          	ld	a,#low(L3273)
4381  0495 ae05          	ld	x,#high(L3273)
4384  0497 81            	ret
4385  0498               L5461:
4386                     ; 889 				case LABEL_SELECT_ENCODER_01:
4386                     ; 890 					return "Auswahl";
4389  0498 a60f          	ld	a,#low(L1273)
4390  049a ae0f          	ld	x,#high(L1273)
4393  049c 81            	ret
4394  049d               L7461:
4395                     ; 892 				case LABEL_SELECT_ENCODER_02:
4395                     ; 893 					return "Encoder";
4398  049d a68c          	ld	a,#low(L3423)
4399  049f ae8c          	ld	x,#high(L3423)
4402  04a1 81            	ret
4403  04a2               L1561:
4404                     ; 895 				case LABEL_SH_PN_01_01:
4404                     ; 896 					return "Marke";
4407  04a2 a6ff          	ld	a,#low(L5273)
4408  04a4 aeff          	ld	x,#high(L5273)
4411  04a6 81            	ret
4412  04a7               L3561:
4413                     ; 898 				case LABEL_SH_PN_01_02:
4413                     ; 899 					return "Positiv";
4416  04a7 a6f7          	ld	a,#low(L7273)
4417  04a9 aef7          	ld	x,#high(L7273)
4420  04ab 81            	ret
4421  04ac               L5561:
4422                     ; 901 				case LABEL_SH_PN_02_01:
4422                     ; 902 					return "Marke";
4425  04ac a6ff          	ld	a,#low(L5273)
4426  04ae aeff          	ld	x,#high(L5273)
4429  04b0 81            	ret
4430  04b1               L7561:
4431                     ; 904 				case LABEL_SH_PN_02_02:
4431                     ; 905 					return "Negativ";
4434  04b1 a6ef          	ld	a,#low(L1373)
4435  04b3 aeef          	ld	x,#high(L1373)
4438  04b5 81            	ret
4439  04b6               L1661:
4440                     ; 907 				case LABEL_SELECT_SH_PN_01:
4440                     ; 908 					return "Auswahl";
4443  04b6 a60f          	ld	a,#low(L1273)
4444  04b8 ae0f          	ld	x,#high(L1273)
4447  04ba 81            	ret
4448  04bb               L3661:
4449                     ; 910 				case LABEL_SELECT_SH_PN_02:
4449                     ; 911 					return "Marke P/N";
4452  04bb a6e5          	ld	a,#low(L3373)
4453  04bd aee5          	ld	x,#high(L3373)
4456  04bf 81            	ret
4457  04c0               L5661:
4458                     ; 913 				case LABEL_TENSION_BASE_VALUE_01:
4458                     ; 914 					return "Spannung";
4461  04c0 a6dc          	ld	a,#low(L5373)
4462  04c2 aedc          	ld	x,#high(L5373)
4465  04c4 81            	ret
4466  04c5               L7661:
4467                     ; 916 				case LABEL_TENSION_BASE_VALUE_02:
4467                     ; 917 					return "Anfangs";
4470  04c5 a6d4          	ld	a,#low(L7373)
4471  04c7 aed4          	ld	x,#high(L7373)
4474  04c9 81            	ret
4475  04ca               L1153:
4476                     ; 920 			break;			
4478  04ca cc0bc2        	jp	L3023
4479  04cd               L1761:
4480                     ; 921 		case PARAM_LANGUAGE_ES: //Spanish
4480                     ; 922 			switch(a_byIndex)
4482  04cd b600          	ld	a,_labelGet$L
4484                     ; 1265 					break;
4486  04cf a173          	cp	a,#115
4487  04d1 240b          	jruge	L61
4488  04d3 48            	sll	a
4489  04d4 97            	ld	x,a
4490  04d5 d613c6        	ld	a,(L02+1,x)
4491  04d8 88            	push	a
4492  04d9 d613c5        	ld	a,(L02,x)
4493  04dc 88            	push	a
4494  04dd 81            	ret
4495  04de               L61:
4496  04de cc0bc2        	jp	L3023
4497  04e1               L3761:
4498                     ; 924 				case LABEL_MODE:
4498                     ; 925 					return "modo";
4500  04e1 a6cf          	ld	a,#low(L5473)
4501  04e3 aecf          	ld	x,#high(L5473)
4504  04e5 81            	ret
4505  04e6               L5761:
4506                     ; 927 				case LABEL_MANUAL:
4506                     ; 928 					return "manual";
4509  04e6 a6f4          	ld	a,#low(L3123)
4510  04e8 aef4          	ld	x,#high(L3123)
4513  04ea 81            	ret
4514  04eb               L7761:
4515                     ; 930 				case LABEL_AUTO:
4515                     ; 931 					return "automatico";
4518  04eb a6c4          	ld	a,#low(L7473)
4519  04ed aec4          	ld	x,#high(L7473)
4522  04ef 81            	ret
4523  04f0               L1071:
4524                     ; 933 				case LABEL_SPEED:
4524                     ; 934 					return "velocidad";
4527  04f0 a6ba          	ld	a,#low(L1573)
4528  04f2 aeba          	ld	x,#high(L1573)
4531  04f4 81            	ret
4532  04f5               L3071:
4533                     ; 936 				case LABEL_SPEED_SHORT:
4533                     ; 937 					return "vel:";
4536  04f5 a6b5          	ld	a,#low(L3573)
4537  04f7 aeb5          	ld	x,#high(L3573)
4540  04f9 81            	ret
4541  04fa               L5071:
4542                     ; 939 				case LABEL_CYLINDER_SIZE:
4542                     ; 940 					return "tamano:";
4545  04fa a6ad          	ld	a,#low(L5573)
4546  04fc aead          	ld	x,#high(L5573)
4549  04fe 81            	ret
4550  04ff               L7071:
4551                     ; 942 				case LABEL_MT_MIN:
4551                     ; 943 					return "mt/min";
4554  04ff a6d1          	ld	a,#low(L5223)
4555  0501 aed1          	ld	x,#high(L5223)
4558  0503 81            	ret
4559  0504               L1171:
4560                     ; 945 				case LABEL_MESSAGE:
4560                     ; 946 					return "mensaje";
4563  0504 a6a5          	ld	a,#low(L7573)
4564  0506 aea5          	ld	x,#high(L7573)
4567  0508 81            	ret
4568  0509               L3171:
4569                     ; 948 				case LABEL_ALARM:
4569                     ; 949 					return "alarma";
4572  0509 a69e          	ld	a,#low(L1673)
4573  050b ae9e          	ld	x,#high(L1673)
4576  050d 81            	ret
4577  050e               L5171:
4578                     ; 951 				case LABEL_ALARM_ERR_NO_PRINT:
4578                     ; 952 					return "Falta de signo";
4581  050e a68f          	ld	a,#low(L3673)
4582  0510 ae8f          	ld	x,#high(L3673)
4585  0512 81            	ret
4586  0513               L7171:
4587                     ; 954 				case LABEL_ALARM_ERR_LOW_SPEED:
4587                     ; 955 					return "Velocidad lenta";
4590  0513 a67f          	ld	a,#low(L5673)
4591  0515 ae7f          	ld	x,#high(L5673)
4594  0517 81            	ret
4595  0518               L1271:
4596                     ; 957 				case LABEL_ALARM_ERR_TEST_SH_01:
4596                     ; 958 					return "Test cabeza";
4599  0518 a673          	ld	a,#low(L7673)
4600  051a ae73          	ld	x,#high(L7673)
4603  051c 81            	ret
4604  051d               L3271:
4605                     ; 960 				case LABEL_ALARM_ERR_TEST_SH_02:
4605                     ; 961 					return "exploradora error";
4608  051d a661          	ld	a,#low(L1773)
4609  051f ae61          	ld	x,#high(L1773)
4612  0521 81            	ret
4613  0522               L5271:
4614                     ; 963 				case LABEL_ALARM_ERR_TEST_ENC_01:
4614                     ; 964 					return "Test encoder";
4617  0522 a654          	ld	a,#low(L3773)
4618  0524 ae54          	ld	x,#high(L3773)
4621  0526 81            	ret
4622  0527               L7271:
4623                     ; 966 				case LABEL_ALARM_ERR_TEST_ENC_02:
4623                     ; 967 					return "error";
4626  0527 a64e          	ld	a,#low(L5773)
4627  0529 ae4e          	ld	x,#high(L5773)
4630  052b 81            	ret
4631  052c               L1371:
4632                     ; 969 				case LABEL_ALARM_ERR_PHASE_AUTO_01:
4632                     ; 970 					return "Fase";
4635  052c a649          	ld	a,#low(L7773)
4636  052e ae49          	ld	x,#high(L7773)
4639  0530 81            	ret
4640  0531               L3371:
4641                     ; 972 				case LABEL_ALARM_ERR_PHASE_AUTO_02:
4641                     ; 973 					return "automatica error";
4644  0531 a638          	ld	a,#low(L1004)
4645  0533 ae38          	ld	x,#high(L1004)
4648  0535 81            	ret
4649  0536               L5371:
4650                     ; 975 				case LABEL_ALARM_CYLINDER_TRAVEL_01:
4650                     ; 976 					return "Desarrollo del Cilindro (P1)";
4653  0536 a61b          	ld	a,#low(L3004)
4654  0538 ae1b          	ld	x,#high(L3004)
4657  053a 81            	ret
4658  053b               L7371:
4659                     ; 978 				case LABEL_ALARM_CYLINDER_TRAVEL_02:
4659                     ; 979 					return "non admisible";
4662  053b a60d          	ld	a,#low(L5004)
4663  053d ae0d          	ld	x,#high(L5004)
4666  053f 81            	ret
4667  0540               L1471:
4668                     ; 981 				case LABEL_ALARM_GATE_WINDOW_01:
4668                     ; 982 					return "Espacio de Lectura (P3)";
4671  0540 a6f5          	ld	a,#low(L7004)
4672  0542 aef5          	ld	x,#high(L7004)
4675  0544 81            	ret
4676  0545               L3471:
4677                     ; 984 				case LABEL_ALARM_GATE_WINDOW_02:
4677                     ; 985 					return "non admisible";
4680  0545 a60d          	ld	a,#low(L5004)
4681  0547 ae0d          	ld	x,#high(L5004)
4684  0549 81            	ret
4685  054a               L5471:
4686                     ; 987 				case LABEL_ANSWER_OK:
4686                     ; 988 					return "OK";
4689  054a a656          	ld	a,#low(L7553)
4690  054c ae56          	ld	x,#high(L7553)
4693  054e 81            	ret
4694  054f               L7471:
4695                     ; 990 				case LABEL_GENERIC_ALARM_01:
4695                     ; 991 					return "Alarma";
4698  054f a6ee          	ld	a,#low(L1104)
4699  0551 aeee          	ld	x,#high(L1104)
4702  0553 81            	ret
4703  0554               L1571:
4704                     ; 993 				case LABEL_GENERIC_ALARM_02:
4704                     ; 994 					return "desconocido";
4707  0554 a6e2          	ld	a,#low(L3104)
4708  0556 aee2          	ld	x,#high(L3104)
4711  0558 81            	ret
4712  0559               L3571:
4713                     ; 996 				case LABEL_PHASE_OSCILL:
4713                     ; 997 					return "Fase con osciloscopio";
4716  0559 a6cc          	ld	a,#low(L5104)
4717  055b aecc          	ld	x,#high(L5104)
4720  055d 81            	ret
4721  055e               L5571:
4722                     ; 999 				case LABEL_PHASE_FAST:
4722                     ; 1000 					return "Fase con correccion rapida";
4725  055e a6b1          	ld	a,#low(L7104)
4726  0560 aeb1          	ld	x,#high(L7104)
4729  0562 81            	ret
4730  0563               L7571:
4731                     ; 1002 				case LABEL_OSCILLOSCOPE:
4731                     ; 1003 					return "osciloscopio";
4734  0563 a6a4          	ld	a,#low(L1204)
4735  0565 aea4          	ld	x,#high(L1204)
4738  0567 81            	ret
4739  0568               L1671:
4740                     ; 1005 				case LABEL_REGISTER:
4740                     ; 1006 					return "registro";
4743  0568 a69b          	ld	a,#low(L3204)
4744  056a ae9b          	ld	x,#high(L3204)
4747  056c 81            	ret
4748  056d               L3671:
4749                     ; 1008 				case LABEL_PHASE_CENTER_01:
4749                     ; 1009 					return "puesta a cero";
4752  056d a68d          	ld	a,#low(L5204)
4753  056f ae8d          	ld	x,#high(L5204)
4756  0571 81            	ret
4757  0572               L5671:
4758                     ; 1011 				case LABEL_PHASE_CENTER_02:
4758                     ; 1012 					return "error";
4761  0572 a64e          	ld	a,#low(L5773)
4762  0574 ae4e          	ld	x,#high(L5773)
4765  0576 81            	ret
4766  0577               L7671:
4767                     ; 1014 				case LABEL_PHASE_MANUAL_01:
4767                     ; 1015 					return "Fase";
4770  0577 a649          	ld	a,#low(L7773)
4771  0579 ae49          	ld	x,#high(L7773)
4774  057b 81            	ret
4775  057c               L1771:
4776                     ; 1017 				case LABEL_PHASE_MANUAL_02:
4776                     ; 1018 					return "manual";
4779  057c a6f4          	ld	a,#low(L3123)
4780  057e aef4          	ld	x,#high(L3123)
4783  0580 81            	ret
4784  0581               L3771:
4785                     ; 1020 				case LABEL_PHASE_AUTO_01:
4785                     ; 1021 					return "Fase";
4788  0581 a649          	ld	a,#low(L7773)
4789  0583 ae49          	ld	x,#high(L7773)
4792  0585 81            	ret
4793  0586               L5771:
4794                     ; 1023 				case LABEL_PHASE_AUTO_02:
4794                     ; 1024 					return "automatica";
4797  0586 a682          	ld	a,#low(L7204)
4798  0588 ae82          	ld	x,#high(L7204)
4801  058a 81            	ret
4802  058b               L7771:
4803                     ; 1026 				case LABEL_PHASE_OSCILL_01:
4803                     ; 1027 					return "Fase";
4806  058b a649          	ld	a,#low(L7773)
4807  058d ae49          	ld	x,#high(L7773)
4810  058f 81            	ret
4811  0590               L1002:
4812                     ; 1029 				case LABEL_PHASE_OSCILL_02:
4812                     ; 1030 					return "osciloscop";
4815  0590 a677          	ld	a,#low(L1304)
4816  0592 ae77          	ld	x,#high(L1304)
4819  0594 81            	ret
4820  0595               L3002:
4821                     ; 1032 				case LABEL_PHASE_FAST_01:
4821                     ; 1033 					return "Fase";
4824  0595 a649          	ld	a,#low(L7773)
4825  0597 ae49          	ld	x,#high(L7773)
4828  0599 81            	ret
4829  059a               L5002:
4830                     ; 1035 				case LABEL_PHASE_FAST_02:
4830                     ; 1036 					return "aceleracion";
4833  059a a66b          	ld	a,#low(L3304)
4834  059c ae6b          	ld	x,#high(L3304)
4837  059e 81            	ret
4838  059f               L7002:
4839                     ; 1038 				case LABEL_CYLINDER_TRAVEL_01:
4839                     ; 1039 					return "desarrollo";
4842  059f a660          	ld	a,#low(L5304)
4843  05a1 ae60          	ld	x,#high(L5304)
4846  05a3 81            	ret
4847  05a4               L1102:
4848                     ; 1041 				case LABEL_CYLINDER_TRAVEL_02:
4848                     ; 1042 					return "cilindro";
4851  05a4 a657          	ld	a,#low(L7304)
4852  05a6 ae57          	ld	x,#high(L7304)
4855  05a8 81            	ret
4856  05a9               L3102:
4857                     ; 1044 				case LABEL_ALARM_BOUND_01:
4857                     ; 1045 					return "umbral";
4860  05a9 a650          	ld	a,#low(L1404)
4861  05ab ae50          	ld	x,#high(L1404)
4864  05ad 81            	ret
4865  05ae               L5102:
4866                     ; 1047 				case LABEL_ALARM_BOUND_02:
4866                     ; 1048 					return "alarma";
4869  05ae a69e          	ld	a,#low(L1673)
4870  05b0 ae9e          	ld	x,#high(L1673)
4873  05b2 81            	ret
4874  05b3               L7102:
4875                     ; 1050 				case LABEL_GATE_WINDOW_01:
4875                     ; 1051 					return "Espacio";
4878  05b3 a648          	ld	a,#low(L3404)
4879  05b5 ae48          	ld	x,#high(L3404)
4882  05b7 81            	ret
4883  05b8               L1202:
4884                     ; 1053 				case LABEL_GATE_WINDOW_02:
4884                     ; 1054 					return "gate";
4887  05b8 a643          	ld	a,#low(L5404)
4888  05ba ae43          	ld	x,#high(L5404)
4891  05bc 81            	ret
4892  05bd               L3202:
4893                     ; 1056 				case LABEL_SW_VERSION_01:
4893                     ; 1057 					return "Version";
4896  05bd a662          	ld	a,#low(L3333)
4897  05bf ae62          	ld	x,#high(L3333)
4900  05c1 81            	ret
4901  05c2               L5202:
4902                     ; 1059 				case LABEL_SW_VERSION_02:
4902                     ; 1060 					return "Software";
4905  05c2 a66a          	ld	a,#low(L1333)
4906  05c4 ae6a          	ld	x,#high(L1333)
4909  05c6 81            	ret
4910  05c7               L7202:
4911                     ; 1062 				case LABEL_OFFSET_DISTANCE_01:
4911                     ; 1063 					return "Distancia";
4914  05c7 a639          	ld	a,#low(L7404)
4915  05c9 ae39          	ld	x,#high(L7404)
4918  05cb 81            	ret
4919  05cc               L1302:
4920                     ; 1065 				case LABEL_OFFSET_DISTANCE_02:
4920                     ; 1066 					return "de offset";
4923  05cc a62f          	ld	a,#low(L1504)
4924  05ce ae2f          	ld	x,#high(L1504)
4927  05d0 81            	ret
4928  05d1               L3302:
4929                     ; 1068 				case LABEL_TEST_SH_01:
4929                     ; 1069 					return "Test";
4932  05d1 a66f          	ld	a,#low(L3263)
4933  05d3 ae6f          	ld	x,#high(L3263)
4936  05d5 81            	ret
4937  05d6               L5302:
4938                     ; 1071 				case LABEL_TEST_SH_02:
4938                     ; 1072 					return "Cabeza";
4941  05d6 a628          	ld	a,#low(L3504)
4942  05d8 ae28          	ld	x,#high(L3504)
4945  05da 81            	ret
4946  05db               L7302:
4947                     ; 1074 				case LABEL_TEST_ENC_01:
4947                     ; 1075 					return "Test";
4950  05db a66f          	ld	a,#low(L3263)
4951  05dd ae6f          	ld	x,#high(L3263)
4954  05df 81            	ret
4955  05e0               L1402:
4956                     ; 1077 				case LABEL_TEST_ENC_02:
4956                     ; 1078 					return "encoder";
4959  05e0 a620          	ld	a,#low(L5504)
4960  05e2 ae20          	ld	x,#high(L5504)
4963  05e4 81            	ret
4964  05e5               L3402:
4965                     ; 1080 				case LABEL_TEST_OUTPUT_01:
4965                     ; 1081 					return "Test";
4968  05e5 a66f          	ld	a,#low(L3263)
4969  05e7 ae6f          	ld	x,#high(L3263)
4972  05e9 81            	ret
4973  05ea               L5402:
4974                     ; 1083 				case LABEL_TEST_OUTPUT_02:
4974                     ; 1084 					return "salidas";
4977  05ea a618          	ld	a,#low(L7504)
4978  05ec ae18          	ld	x,#high(L7504)
4981  05ee 81            	ret
4982  05ef               L7402:
4983                     ; 1086 				case LABEL_VISUAL_REGISTER_01:
4983                     ; 1087 					return "Visual";
4986  05ef a62a          	ld	a,#low(L1533)
4987  05f1 ae2a          	ld	x,#high(L1533)
4990  05f3 81            	ret
4991  05f4               L1502:
4992                     ; 1089 				case LABEL_VISUAL_REGISTER_02:
4992                     ; 1090 					return "Registro";
4995  05f4 a60f          	ld	a,#low(L1604)
4996  05f6 ae0f          	ld	x,#high(L1604)
4999  05f8 81            	ret
5000  05f9               L3502:
5001                     ; 1092 				case LABEL_VISUAL_OSCILL_01:
5001                     ; 1093 					return "Visual";
5004  05f9 a62a          	ld	a,#low(L1533)
5005  05fb ae2a          	ld	x,#high(L1533)
5008  05fd 81            	ret
5009  05fe               L5502:
5010                     ; 1095 				case LABEL_VISUAL_OSCILL_02:
5010                     ; 1096 					return "Osciloscopio";
5013  05fe a602          	ld	a,#low(L3604)
5014  0600 ae02          	ld	x,#high(L3604)
5017  0602 81            	ret
5018  0603               L7502:
5019                     ; 1098 				case LABEL_JOB_ARCHIVE_01:
5019                     ; 1099 					return "Archivo";
5022  0603 a6fa          	ld	a,#low(L5604)
5023  0605 aefa          	ld	x,#high(L5604)
5026  0607 81            	ret
5027  0608               L1602:
5028                     ; 1101 				case LABEL_JOB_ARCHIVE_02:
5028                     ; 1102 					return "Trabajos";
5031  0608 a6f1          	ld	a,#low(L7604)
5032  060a aef1          	ld	x,#high(L7604)
5035  060c 81            	ret
5036  060d               L3602:
5037                     ; 1104 				case LABEL_FUNCTIONS:
5037                     ; 1105 					return "funciones";
5040  060d a6e7          	ld	a,#low(L1704)
5041  060f aee7          	ld	x,#high(L1704)
5044  0611 81            	ret
5045  0612               L5602:
5046                     ; 1107 				case LABEL_PARAMETERS:
5046                     ; 1108 					return "Parametros";
5049  0612 a6dc          	ld	a,#low(L3704)
5050  0614 aedc          	ld	x,#high(L3704)
5053  0616 81            	ret
5054  0617               L7602:
5055                     ; 1110 				case LABEL_TESTS:
5055                     ; 1111 					return "Tests";
5058  0617 a6ed          	ld	a,#low(L7633)
5059  0619 aeed          	ld	x,#high(L7633)
5062  061b 81            	ret
5063  061c               L1702:
5064                     ; 1113 				case LABEL_SIMPLE_SETUP:
5064                     ; 1114 					return "setup sencillo";
5067  061c a6cd          	ld	a,#low(L5704)
5068  061e aecd          	ld	x,#high(L5704)
5071  0620 81            	ret
5072  0621               L3702:
5073                     ; 1116 				case LABEL_FULL_SETUP:
5073                     ; 1117 					return "setup total";
5076  0621 a6c1          	ld	a,#low(L7704)
5077  0623 aec1          	ld	x,#high(L7704)
5080  0625 81            	ret
5081  0626               L5702:
5082                     ; 1119 				case LABEL_ALARM_ERR_ACCELERATION:
5082                     ; 1120 					return "Aceleracion";
5085  0626 a6b5          	ld	a,#low(L1014)
5086  0628 aeb5          	ld	x,#high(L1014)
5089  062a 81            	ret
5090  062b               L7702:
5091                     ; 1122 				case LABEL_ALARM_ERR_DECELERATION:
5091                     ; 1123 					return "Deceleracion";
5094  062b a6a8          	ld	a,#low(L3014)
5095  062d aea8          	ld	x,#high(L3014)
5098  062f 81            	ret
5099  0630               L1012:
5100                     ; 1125 				case LABEL_ALARM_ERR_DOUBLE_MARK:
5100                     ; 1126 					return "doble marca";
5103  0630 a69c          	ld	a,#low(L5014)
5104  0632 ae9c          	ld	x,#high(L5014)
5107  0634 81            	ret
5108  0635               L3012:
5109                     ; 1128 				case LABEL_AUTO_SHORT:
5109                     ; 1129 					return "Auto";
5112  0635 a6a8          	ld	a,#low(L3043)
5113  0637 aea8          	ld	x,#high(L3043)
5116  0639 81            	ret
5117  063a               L5012:
5118                     ; 1131 				case LABEL_MANUAL_SHORT:
5118                     ; 1132 					return "Manual";
5121  063a a6cc          	ld	a,#low(L1033)
5122  063c aecc          	ld	x,#high(L1033)
5125  063e 81            	ret
5126  063f               L7012:
5127                     ; 1134 				case LABEL_MODE_LONG:
5127                     ; 1135 					return "circ:";
5130  063f a696          	ld	a,#low(L7014)
5131  0641 ae96          	ld	x,#high(L7014)
5134  0643 81            	ret
5135  0644               L1112:
5136                     ; 1137 				case LABEL_MODE_TRANS:
5136                     ; 1138 					return "tras:";
5139  0644 a690          	ld	a,#low(L1114)
5140  0646 ae90          	ld	x,#high(L1114)
5143  0648 81            	ret
5144  0649               L3112:
5145                     ; 1140 				case LABEL_MODE_PULL:
5145                     ; 1141 					return "Tens:";
5148  0649 a696          	ld	a,#low(L1143)
5149  064b ae96          	ld	x,#high(L1143)
5152  064d 81            	ret
5153  064e               L5112:
5154                     ; 1143 				case LABEL_SAVE_JOB_01:
5154                     ; 1144 					return "Salvar";
5157  064e a689          	ld	a,#low(L3114)
5158  0650 ae89          	ld	x,#high(L3114)
5161  0652 81            	ret
5162  0653               L7112:
5163                     ; 1146 				case LABEL_SAVE_JOB_02:
5163                     ; 1147 					return "Trabajo";
5166  0653 a681          	ld	a,#low(L5114)
5167  0655 ae81          	ld	x,#high(L5114)
5170  0657 81            	ret
5171  0658               L1212:
5172                     ; 1149 				case LABEL_LOAD_JOB_01:
5172                     ; 1150 					return "Cargar";
5175  0658 a67a          	ld	a,#low(L7114)
5176  065a ae7a          	ld	x,#high(L7114)
5179  065c 81            	ret
5180  065d               L3212:
5181                     ; 1152 				case LABEL_LOAD_JOB_02:
5181                     ; 1153 					return "Trabajo";
5184  065d a681          	ld	a,#low(L5114)
5185  065f ae81          	ld	x,#high(L5114)
5188  0661 81            	ret
5189  0662               L5212:
5190                     ; 1155 				case LABEL_TWIN_APPLICATION_01_01:
5190                     ; 1156 					return "Control";
5193  0662 a672          	ld	a,#low(L1214)
5194  0664 ae72          	ld	x,#high(L1214)
5197  0666 81            	ret
5198  0667               L7212:
5199                     ; 1158 				case LABEL_TWIN_APPLICATION_01_02:
5199                     ; 1159 					return "Recto/Verso";
5202  0667 a666          	ld	a,#low(L3214)
5203  0669 ae66          	ld	x,#high(L3214)
5206  066b 81            	ret
5207  066c               L1312:
5208                     ; 1161 				case LABEL_TWIN_APPLICATION_02_01:
5208                     ; 1162 					return "Control";
5211  066c a672          	ld	a,#low(L1214)
5212  066e ae72          	ld	x,#high(L1214)
5215  0670 81            	ret
5216  0671               L3312:
5217                     ; 1164 				case LABEL_TWIN_APPLICATION_02_02:
5217                     ; 1165 					return "Insetter";
5220  0671 a668          	ld	a,#low(L5243)
5221  0673 ae68          	ld	x,#high(L5243)
5224  0675 81            	ret
5225  0676               L5312:
5226                     ; 1167 				case LABEL_TWIN_APPLICATION_03_01:
5226                     ; 1168 					return "Control";
5229  0676 a672          	ld	a,#low(L1214)
5230  0678 ae72          	ld	x,#high(L1214)
5233  067a 81            	ret
5234  067b               L7312:
5235                     ; 1170 				case LABEL_TWIN_APPLICATION_03_02:
5235                     ; 1171 					return "Corte";
5238  067b a660          	ld	a,#low(L5214)
5239  067d ae60          	ld	x,#high(L5214)
5242  067f 81            	ret
5243  0680               L1412:
5244                     ; 1173 				case LABEL_TWIN_APPLICATION_04_01:
5244                     ; 1174 					return "Control";
5247  0680 a672          	ld	a,#low(L1214)
5248  0682 ae72          	ld	x,#high(L1214)
5251  0684 81            	ret
5252  0685               L3412:
5253                     ; 1176 				case LABEL_TWIN_APPLICATION_04_02:
5253                     ; 1177 					return "Pliegue";
5256  0685 a658          	ld	a,#low(L7214)
5257  0687 ae58          	ld	x,#high(L7214)
5260  0689 81            	ret
5261  068a               L5412:
5262                     ; 1179 				case LABEL_TWIN_APPLICATION_05_01:
5262                     ; 1180 					return "Control";
5265  068a a672          	ld	a,#low(L1214)
5266  068c ae72          	ld	x,#high(L1214)
5269  068e 81            	ret
5270  068f               L7412:
5271                     ; 1182 				case LABEL_TWIN_APPLICATION_05_02:
5271                     ; 1183 					return "Perforacion";
5274  068f a64c          	ld	a,#low(L1314)
5275  0691 ae4c          	ld	x,#high(L1314)
5278  0693 81            	ret
5279  0694               L1512:
5280                     ; 1185 				case LABEL_TWIN_APPLICATION_06_01:
5280                     ; 1186 					return "Control";
5283  0694 a672          	ld	a,#low(L1214)
5284  0696 ae72          	ld	x,#high(L1214)
5287  0698 81            	ret
5288  0699               L3512:
5289                     ; 1188 				case LABEL_TWIN_APPLICATION_06_02:
5289                     ; 1189 					return "recto";
5292  0699 a646          	ld	a,#low(L3314)
5293  069b ae46          	ld	x,#high(L3314)
5296  069d 81            	ret
5297  069e               L5512:
5298                     ; 1191 				case LABEL_TWIN_APPLICATION_07_01:
5298                     ; 1192 					return "Control";
5301  069e a672          	ld	a,#low(L1214)
5302  06a0 ae72          	ld	x,#high(L1214)
5305  06a2 81            	ret
5306  06a3               L7512:
5307                     ; 1194 				case LABEL_TWIN_APPLICATION_07_02:
5307                     ; 1195 					return "verso";
5310  06a3 a640          	ld	a,#low(L5314)
5311  06a5 ae40          	ld	x,#high(L5314)
5314  06a7 81            	ret
5315  06a8               L1612:
5316                     ; 1197 				case LABEL_REGISTER_TWIN_APPLICATION_01:
5316                     ; 1198 					return "registro recto/verso";
5319  06a8 a62b          	ld	a,#low(L7314)
5320  06aa ae2b          	ld	x,#high(L7314)
5323  06ac 81            	ret
5324  06ad               L3612:
5325                     ; 1200 				case LABEL_REGISTER_TWIN_APPLICATION_02:
5325                     ; 1201 					return "registro insetter";
5328  06ad a619          	ld	a,#low(L1414)
5329  06af ae19          	ld	x,#high(L1414)
5332  06b1 81            	ret
5333  06b2               L5612:
5334                     ; 1203 				case LABEL_REGISTER_TWIN_APPLICATION_03:
5334                     ; 1204 					return "registro corte";
5337  06b2 a60a          	ld	a,#low(L3414)
5338  06b4 ae0a          	ld	x,#high(L3414)
5341  06b6 81            	ret
5342  06b7               L7612:
5343                     ; 1206 				case LABEL_REGISTER_TWIN_APPLICATION_04:
5343                     ; 1207 					return "registro pliegue";
5346  06b7 a6f9          	ld	a,#low(L5414)
5347  06b9 aef9          	ld	x,#high(L5414)
5350  06bb 81            	ret
5351  06bc               L1712:
5352                     ; 1209 				case LABEL_REGISTER_TWIN_APPLICATION_05:
5352                     ; 1210 					return "registro perforacion";
5355  06bc a6e4          	ld	a,#low(L7414)
5356  06be aee4          	ld	x,#high(L7414)
5359  06c0 81            	ret
5360  06c1               L3712:
5361                     ; 1212 				case LABEL_REGISTER_TWIN_APPLICATION_06:
5361                     ; 1213 					return "registro recto";
5364  06c1 a6d5          	ld	a,#low(L1514)
5365  06c3 aed5          	ld	x,#high(L1514)
5368  06c5 81            	ret
5369  06c6               L5712:
5370                     ; 1215 				case LABEL_REGISTER_TWIN_APPLICATION_07:
5370                     ; 1216 					return "registro verso";
5373  06c6 a6c6          	ld	a,#low(L3514)
5374  06c8 aec6          	ld	x,#high(L3514)
5377  06ca 81            	ret
5378  06cb               L7712:
5379                     ; 1218 				case LABEL_ENCODER_01_01:
5379                     ; 1219 					return "Encoder";
5382  06cb a68c          	ld	a,#low(L3423)
5383  06cd ae8c          	ld	x,#high(L3423)
5386  06cf 81            	ret
5387  06d0               L1022:
5388                     ; 1221 				case LABEL_ENCODER_01_02:
5388                     ; 1222 					return "1";
5391  06d0 a69e          	ld	a,#low(L7543)
5392  06d2 ae9e          	ld	x,#high(L7543)
5395  06d4 81            	ret
5396  06d5               L3022:
5397                     ; 1224 				case LABEL_ENCODER_02_01:
5397                     ; 1225 					return "Encoder";
5400  06d5 a68c          	ld	a,#low(L3423)
5401  06d7 ae8c          	ld	x,#high(L3423)
5404  06d9 81            	ret
5405  06da               L5022:
5406                     ; 1227 				case LABEL_ENCODER_02_02:
5406                     ; 1228 					return "2";
5409  06da a69c          	ld	a,#low(L1643)
5410  06dc ae9c          	ld	x,#high(L1643)
5413  06de 81            	ret
5414  06df               L7022:
5415                     ; 1230 				case LABEL_SELECT_APPLICATION_01:
5415                     ; 1231 					return "Seleccion";
5418  06df a6bc          	ld	a,#low(L5514)
5419  06e1 aebc          	ld	x,#high(L5514)
5422  06e3 81            	ret
5423  06e4               L1122:
5424                     ; 1233 				case LABEL_SELECT_APPLICATION_02:
5424                     ; 1234 					return "aplicacion";
5427  06e4 a6b1          	ld	a,#low(L7514)
5428  06e6 aeb1          	ld	x,#high(L7514)
5431  06e8 81            	ret
5432  06e9               L3122:
5433                     ; 1236 				case LABEL_SELECT_ENCODER_01:
5433                     ; 1237 					return "Seleccion";
5436  06e9 a6bc          	ld	a,#low(L5514)
5437  06eb aebc          	ld	x,#high(L5514)
5440  06ed 81            	ret
5441  06ee               L5122:
5442                     ; 1239 				case LABEL_SELECT_ENCODER_02:
5442                     ; 1240 					return "Encoder";
5445  06ee a68c          	ld	a,#low(L3423)
5446  06f0 ae8c          	ld	x,#high(L3423)
5449  06f2 81            	ret
5450  06f3               L7122:
5451                     ; 1242 				case LABEL_SH_PN_01_01:
5451                     ; 1243 					return "Marca";
5454  06f3 a6ab          	ld	a,#low(L1614)
5455  06f5 aeab          	ld	x,#high(L1614)
5458  06f7 81            	ret
5459  06f8               L1222:
5460                     ; 1245 				case LABEL_SH_PN_01_02:
5460                     ; 1246 					return "Positiva";
5463  06f8 a6a2          	ld	a,#low(L3614)
5464  06fa aea2          	ld	x,#high(L3614)
5467  06fc 81            	ret
5468  06fd               L3222:
5469                     ; 1248 				case LABEL_SH_PN_02_01:
5469                     ; 1249 					return "Marca";
5472  06fd a6ab          	ld	a,#low(L1614)
5473  06ff aeab          	ld	x,#high(L1614)
5476  0701 81            	ret
5477  0702               L5222:
5478                     ; 1251 				case LABEL_SH_PN_02_02:
5478                     ; 1252 					return "Negativa";
5481  0702 a699          	ld	a,#low(L5614)
5482  0704 ae99          	ld	x,#high(L5614)
5485  0706 81            	ret
5486  0707               L7222:
5487                     ; 1254 				case LABEL_SELECT_SH_PN_01:
5487                     ; 1255 					return "Seleccion";
5490  0707 a6bc          	ld	a,#low(L5514)
5491  0709 aebc          	ld	x,#high(L5514)
5494  070b 81            	ret
5495  070c               L1322:
5496                     ; 1257 				case LABEL_SELECT_SH_PN_02:
5496                     ; 1258 					return "Marca P/N";
5499  070c a68f          	ld	a,#low(L7614)
5500  070e ae8f          	ld	x,#high(L7614)
5503  0710 81            	ret
5504  0711               L3322:
5505                     ; 1260 				case LABEL_TENSION_BASE_VALUE_01:
5505                     ; 1261 					return "Tension";
5508  0711 a687          	ld	a,#low(L1714)
5509  0713 ae87          	ld	x,#high(L1714)
5512  0715 81            	ret
5513  0716               L5322:
5514                     ; 1263 				case LABEL_TENSION_BASE_VALUE_02:
5514                     ; 1264 					return "Inicial";
5517  0716 a67f          	ld	a,#low(L3714)
5518  0718 ae7f          	ld	x,#high(L3714)
5521  071a 81            	ret
5522  071b               L3473:
5523                     ; 1267 			break;			
5525  071b cc0bc2        	jp	L3023
5526  071e               L7322:
5527                     ; 1268 		case PARAM_LANGUAGE_FR: //French
5527                     ; 1269 			switch(a_byIndex)
5529  071e b600          	ld	a,_labelGet$L
5531                     ; 1612 					break;
5533  0720 a173          	cp	a,#115
5534  0722 240b          	jruge	L22
5535  0724 48            	sll	a
5536  0725 97            	ld	x,a
5537  0726 d614ac        	ld	a,(L42+1,x)
5538  0729 88            	push	a
5539  072a d614ab        	ld	a,(L42,x)
5540  072d 88            	push	a
5541  072e 81            	ret
5542  072f               L22:
5543  072f cc0bc2        	jp	L3023
5544  0732               L1422:
5545                     ; 1271 				case LABEL_MODE:
5545                     ; 1272 					return "modalite";
5547  0732 a676          	ld	a,#low(L1024)
5548  0734 ae76          	ld	x,#high(L1024)
5551  0736 81            	ret
5552  0737               L3422:
5553                     ; 1274 				case LABEL_MANUAL:
5553                     ; 1275 					return "manuel";
5556  0737 a66f          	ld	a,#low(L3024)
5557  0739 ae6f          	ld	x,#high(L3024)
5560  073b 81            	ret
5561  073c               L5422:
5562                     ; 1277 				case LABEL_AUTO:
5562                     ; 1278 					return "automatique";
5565  073c a663          	ld	a,#low(L5024)
5566  073e ae63          	ld	x,#high(L5024)
5569  0740 81            	ret
5570  0741               L7422:
5571                     ; 1280 				case LABEL_SPEED:
5571                     ; 1281 					return "vitesse";
5574  0741 a65b          	ld	a,#low(L7024)
5575  0743 ae5b          	ld	x,#high(L7024)
5578  0745 81            	ret
5579  0746               L1522:
5580                     ; 1283 				case LABEL_SPEED_SHORT:
5580                     ; 1284 					return "vit:";
5583  0746 a656          	ld	a,#low(L1124)
5584  0748 ae56          	ld	x,#high(L1124)
5587  074a 81            	ret
5588  074b               L3522:
5589                     ; 1286 				case LABEL_CYLINDER_SIZE:
5589                     ; 1287 					return "taille:";
5592  074b a64e          	ld	a,#low(L3124)
5593  074d ae4e          	ld	x,#high(L3124)
5596  074f 81            	ret
5597  0750               L5522:
5598                     ; 1289 				case LABEL_MT_MIN:
5598                     ; 1290 					return "mt/min";
5601  0750 a6d1          	ld	a,#low(L5223)
5602  0752 aed1          	ld	x,#high(L5223)
5605  0754 81            	ret
5606  0755               L7522:
5607                     ; 1292 				case LABEL_MESSAGE:
5607                     ; 1293 					return "message";
5610  0755 a646          	ld	a,#low(L5124)
5611  0757 ae46          	ld	x,#high(L5124)
5614  0759 81            	ret
5615  075a               L1622:
5616                     ; 1295 				case LABEL_ALARM:
5616                     ; 1296 					return "alarme";
5619  075a a63f          	ld	a,#low(L7124)
5620  075c ae3f          	ld	x,#high(L7124)
5623  075e 81            	ret
5624  075f               L3622:
5625                     ; 1298 				case LABEL_ALARM_ERR_NO_PRINT:
5625                     ; 1299 					return "Pas de signe";
5628  075f a632          	ld	a,#low(L1224)
5629  0761 ae32          	ld	x,#high(L1224)
5632  0763 81            	ret
5633  0764               L5622:
5634                     ; 1301 				case LABEL_ALARM_ERR_LOW_SPEED:
5634                     ; 1302 					return "bas vitesse";
5637  0764 a626          	ld	a,#low(L3224)
5638  0766 ae26          	ld	x,#high(L3224)
5641  0768 81            	ret
5642  0769               L7622:
5643                     ; 1304 				case LABEL_ALARM_ERR_TEST_SH_01:
5643                     ; 1305 					return "Test de";
5646  0769 a61e          	ld	a,#low(L5224)
5647  076b ae1e          	ld	x,#high(L5224)
5650  076d 81            	ret
5651  076e               L1722:
5652                     ; 1307 				case LABEL_ALARM_ERR_TEST_SH_02:
5652                     ; 1308 					return "la tete erreur";
5655  076e a60f          	ld	a,#low(L7224)
5656  0770 ae0f          	ld	x,#high(L7224)
5659  0772 81            	ret
5660  0773               L3722:
5661                     ; 1310 				case LABEL_ALARM_ERR_TEST_ENC_01:
5661                     ; 1311 					return "Test encoder";
5664  0773 a654          	ld	a,#low(L3773)
5665  0775 ae54          	ld	x,#high(L3773)
5668  0777 81            	ret
5669  0778               L5722:
5670                     ; 1313 				case LABEL_ALARM_ERR_TEST_ENC_02:
5670                     ; 1314 					return "erreur";
5673  0778 a608          	ld	a,#low(L1324)
5674  077a ae08          	ld	x,#high(L1324)
5677  077c 81            	ret
5678  077d               L7722:
5679                     ; 1316 				case LABEL_ALARM_ERR_PHASE_AUTO_01:
5679                     ; 1317 					return "Calge automatique";
5682  077d a6f6          	ld	a,#low(L3324)
5683  077f aef6          	ld	x,#high(L3324)
5686  0781 81            	ret
5687  0782               L1032:
5688                     ; 1319 				case LABEL_ALARM_ERR_PHASE_AUTO_02:
5688                     ; 1320 					return "erreur";
5691  0782 a608          	ld	a,#low(L1324)
5692  0784 ae08          	ld	x,#high(L1324)
5695  0786 81            	ret
5696  0787               L3032:
5697                     ; 1322 				case LABEL_ALARM_CYLINDER_TRAVEL_01:
5697                     ; 1323 					return "Dimension du Cylindre (P1)";
5700  0787 a6db          	ld	a,#low(L5324)
5701  0789 aedb          	ld	x,#high(L5324)
5704  078b 81            	ret
5705  078c               L5032:
5706                     ; 1325 				case LABEL_ALARM_CYLINDER_TRAVEL_02:
5706                     ; 1326 					return "inacceptable";
5709  078c a6ce          	ld	a,#low(L7324)
5710  078e aece          	ld	x,#high(L7324)
5713  0790 81            	ret
5714  0791               L7032:
5715                     ; 1328 				case LABEL_ALARM_GATE_WINDOW_01:
5715                     ; 1329 					return "Espace de Lecture (P3)";
5718  0791 a6b7          	ld	a,#low(L1424)
5719  0793 aeb7          	ld	x,#high(L1424)
5722  0795 81            	ret
5723  0796               L1132:
5724                     ; 1331 				case LABEL_ALARM_GATE_WINDOW_02:
5724                     ; 1332 					return "inacceptable";
5727  0796 a6ce          	ld	a,#low(L7324)
5728  0798 aece          	ld	x,#high(L7324)
5731  079a 81            	ret
5732  079b               L3132:
5733                     ; 1334 				case LABEL_ANSWER_OK:
5733                     ; 1335 					return "OK";
5736  079b a656          	ld	a,#low(L7553)
5737  079d ae56          	ld	x,#high(L7553)
5740  079f 81            	ret
5741  07a0               L5132:
5742                     ; 1337 				case LABEL_GENERIC_ALARM_01:
5742                     ; 1338 					return "Alarme";
5745  07a0 a6b0          	ld	a,#low(L3424)
5746  07a2 aeb0          	ld	x,#high(L3424)
5749  07a4 81            	ret
5750  07a5               L7132:
5751                     ; 1340 				case LABEL_GENERIC_ALARM_02:
5751                     ; 1341 					return "ne pas reconnu";
5754  07a5 a6a1          	ld	a,#low(L5424)
5755  07a7 aea1          	ld	x,#high(L5424)
5758  07a9 81            	ret
5759  07aa               L1232:
5760                     ; 1343 				case LABEL_PHASE_OSCILL:
5760                     ; 1344 					return "calage avec oscilloscope";
5763  07aa a688          	ld	a,#low(L7424)
5764  07ac ae88          	ld	x,#high(L7424)
5767  07ae 81            	ret
5768  07af               L3232:
5769                     ; 1346 				case LABEL_PHASE_FAST:
5769                     ; 1347 					return "calage avec rapide correction";
5772  07af a66a          	ld	a,#low(L1524)
5773  07b1 ae6a          	ld	x,#high(L1524)
5776  07b3 81            	ret
5777  07b4               L5232:
5778                     ; 1349 				case LABEL_OSCILLOSCOPE:
5778                     ; 1350 					return "oscilloscope";
5781  07b4 a65d          	ld	a,#low(L3524)
5782  07b6 ae5d          	ld	x,#high(L3524)
5785  07b8 81            	ret
5786  07b9               L7232:
5787                     ; 1352 				case LABEL_REGISTER:
5787                     ; 1353 					return "registre";
5790  07b9 a654          	ld	a,#low(L5524)
5791  07bb ae54          	ld	x,#high(L5524)
5794  07bd 81            	ret
5795  07be               L1332:
5796                     ; 1355 				case LABEL_PHASE_CENTER_01:
5796                     ; 1356 					return "metre au zero";
5799  07be a646          	ld	a,#low(L7524)
5800  07c0 ae46          	ld	x,#high(L7524)
5803  07c2 81            	ret
5804  07c3               L3332:
5805                     ; 1358 				case LABEL_PHASE_CENTER_02:
5805                     ; 1359 					return "erreur";
5808  07c3 a608          	ld	a,#low(L1324)
5809  07c5 ae08          	ld	x,#high(L1324)
5812  07c7 81            	ret
5813  07c8               L5332:
5814                     ; 1361 				case LABEL_PHASE_MANUAL_01:
5814                     ; 1362 					return "calage";
5817  07c8 a63f          	ld	a,#low(L1624)
5818  07ca ae3f          	ld	x,#high(L1624)
5821  07cc 81            	ret
5822  07cd               L7332:
5823                     ; 1364 				case LABEL_PHASE_MANUAL_02:
5823                     ; 1365 					return "manuel";
5826  07cd a66f          	ld	a,#low(L3024)
5827  07cf ae6f          	ld	x,#high(L3024)
5830  07d1 81            	ret
5831  07d2               L1432:
5832                     ; 1367 				case LABEL_PHASE_AUTO_01:
5832                     ; 1368 					return "calage";
5835  07d2 a63f          	ld	a,#low(L1624)
5836  07d4 ae3f          	ld	x,#high(L1624)
5839  07d6 81            	ret
5840  07d7               L3432:
5841                     ; 1370 				case LABEL_PHASE_AUTO_02:
5841                     ; 1371 					return "automatique";
5844  07d7 a663          	ld	a,#low(L5024)
5845  07d9 ae63          	ld	x,#high(L5024)
5848  07db 81            	ret
5849  07dc               L5432:
5850                     ; 1373 				case LABEL_PHASE_OSCILL_01:
5850                     ; 1374 					return "calage";
5853  07dc a63f          	ld	a,#low(L1624)
5854  07de ae3f          	ld	x,#high(L1624)
5857  07e0 81            	ret
5858  07e1               L7432:
5859                     ; 1376 				case LABEL_PHASE_OSCILL_02:
5859                     ; 1377 					return "oscilloscope";
5862  07e1 a65d          	ld	a,#low(L3524)
5863  07e3 ae5d          	ld	x,#high(L3524)
5866  07e5 81            	ret
5867  07e6               L1532:
5868                     ; 1379 				case LABEL_PHASE_FAST_01:
5868                     ; 1380 					return "calage";
5871  07e6 a63f          	ld	a,#low(L1624)
5872  07e8 ae3f          	ld	x,#high(L1624)
5875  07ea 81            	ret
5876  07eb               L3532:
5877                     ; 1382 				case LABEL_PHASE_FAST_02:
5877                     ; 1383 					return "acceleration";
5880  07eb a632          	ld	a,#low(L3624)
5881  07ed ae32          	ld	x,#high(L3624)
5884  07ef 81            	ret
5885  07f0               L5532:
5886                     ; 1385 				case LABEL_CYLINDER_TRAVEL_01:
5886                     ; 1386 					return "dimension";
5889  07f0 a69f          	ld	a,#low(L5063)
5890  07f2 ae9f          	ld	x,#high(L5063)
5893  07f4 81            	ret
5894  07f5               L7532:
5895                     ; 1388 				case LABEL_CYLINDER_TRAVEL_02:
5895                     ; 1389 					return "cylindre";
5898  07f5 a629          	ld	a,#low(L5624)
5899  07f7 ae29          	ld	x,#high(L5624)
5902  07f9 81            	ret
5903  07fa               L1632:
5904                     ; 1391 				case LABEL_ALARM_BOUND_01:
5904                     ; 1392 					return "seuil";
5907  07fa a623          	ld	a,#low(L7624)
5908  07fc ae23          	ld	x,#high(L7624)
5911  07fe 81            	ret
5912  07ff               L3632:
5913                     ; 1394 				case LABEL_ALARM_BOUND_02:
5913                     ; 1395 					return "alarm";
5916  07ff a61d          	ld	a,#low(L1724)
5917  0801 ae1d          	ld	x,#high(L1724)
5920  0803 81            	ret
5921  0804               L5632:
5922                     ; 1397 				case LABEL_GATE_WINDOW_01:
5922                     ; 1398 					return "Etendue";
5925  0804 a615          	ld	a,#low(L3724)
5926  0806 ae15          	ld	x,#high(L3724)
5929  0808 81            	ret
5930  0809               L7632:
5931                     ; 1400 				case LABEL_GATE_WINDOW_02:
5931                     ; 1401 					return "gate";
5934  0809 a643          	ld	a,#low(L5404)
5935  080b ae43          	ld	x,#high(L5404)
5938  080d 81            	ret
5939  080e               L1732:
5940                     ; 1403 				case LABEL_SW_VERSION_01:
5940                     ; 1404 					return "Version";
5943  080e a662          	ld	a,#low(L3333)
5944  0810 ae62          	ld	x,#high(L3333)
5947  0812 81            	ret
5948  0813               L3732:
5949                     ; 1406 				case LABEL_SW_VERSION_02:
5949                     ; 1407 					return "Software";
5952  0813 a66a          	ld	a,#low(L1333)
5953  0815 ae6a          	ld	x,#high(L1333)
5956  0817 81            	ret
5957  0818               L5732:
5958                     ; 1409 				case LABEL_OFFSET_DISTANCE_01:
5958                     ; 1410 					return "Distance";
5961  0818 a60c          	ld	a,#low(L5724)
5962  081a ae0c          	ld	x,#high(L5724)
5965  081c 81            	ret
5966  081d               L7732:
5967                     ; 1412 				case LABEL_OFFSET_DISTANCE_02:
5967                     ; 1413 					return "sur offset";
5970  081d a601          	ld	a,#low(L7724)
5971  081f ae01          	ld	x,#high(L7724)
5974  0821 81            	ret
5975  0822               L1042:
5976                     ; 1415 				case LABEL_TEST_SH_01:
5976                     ; 1416 					return "Test";
5979  0822 a66f          	ld	a,#low(L3263)
5980  0824 ae6f          	ld	x,#high(L3263)
5983  0826 81            	ret
5984  0827               L3042:
5985                     ; 1418 				case LABEL_TEST_SH_02:
5985                     ; 1419 					return "Tete";
5988  0827 a6fc          	ld	a,#low(L1034)
5989  0829 aefc          	ld	x,#high(L1034)
5992  082b 81            	ret
5993  082c               L5042:
5994                     ; 1421 				case LABEL_TEST_ENC_01:
5994                     ; 1422 					return "Test";
5997  082c a66f          	ld	a,#low(L3263)
5998  082e ae6f          	ld	x,#high(L3263)
6001  0830 81            	ret
6002  0831               L7042:
6003                     ; 1424 				case LABEL_TEST_ENC_02:
6003                     ; 1425 					return "encoder";
6006  0831 a620          	ld	a,#low(L5504)
6007  0833 ae20          	ld	x,#high(L5504)
6010  0835 81            	ret
6011  0836               L1142:
6012                     ; 1427 				case LABEL_TEST_OUTPUT_01:
6012                     ; 1428 					return "Test";
6015  0836 a66f          	ld	a,#low(L3263)
6016  0838 ae6f          	ld	x,#high(L3263)
6019  083a 81            	ret
6020  083b               L3142:
6021                     ; 1430 				case LABEL_TEST_OUTPUT_02:
6021                     ; 1431 					return "sorties";
6024  083b a6f4          	ld	a,#low(L3034)
6025  083d aef4          	ld	x,#high(L3034)
6028  083f 81            	ret
6029  0840               L5142:
6030                     ; 1433 				case LABEL_VISUAL_REGISTER_01:
6030                     ; 1434 					return "Visual";
6033  0840 a62a          	ld	a,#low(L1533)
6034  0842 ae2a          	ld	x,#high(L1533)
6037  0844 81            	ret
6038  0845               L7142:
6039                     ; 1436 				case LABEL_VISUAL_REGISTER_02:
6039                     ; 1437 					return "Registre";
6042  0845 a6eb          	ld	a,#low(L5034)
6043  0847 aeeb          	ld	x,#high(L5034)
6046  0849 81            	ret
6047  084a               L1242:
6048                     ; 1439 				case LABEL_VISUAL_OSCILL_01:
6048                     ; 1440 					return "Visual";
6051  084a a62a          	ld	a,#low(L1533)
6052  084c ae2a          	ld	x,#high(L1533)
6055  084e 81            	ret
6056  084f               L3242:
6057                     ; 1442 				case LABEL_VISUAL_OSCILL_02:
6057                     ; 1443 					return "Oscilloscope";
6060  084f a6de          	ld	a,#low(L7034)
6061  0851 aede          	ld	x,#high(L7034)
6064  0853 81            	ret
6065  0854               L5242:
6066                     ; 1445 				case LABEL_JOB_ARCHIVE_01:
6066                     ; 1446 					return "Archives";
6069  0854 a6d5          	ld	a,#low(L1134)
6070  0856 aed5          	ld	x,#high(L1134)
6073  0858 81            	ret
6074  0859               L7242:
6075                     ; 1448 				case LABEL_JOB_ARCHIVE_02:
6075                     ; 1449 					return "Travaux";
6078  0859 a6cd          	ld	a,#low(L3134)
6079  085b aecd          	ld	x,#high(L3134)
6082  085d 81            	ret
6083  085e               L1342:
6084                     ; 1451 				case LABEL_FUNCTIONS:
6084                     ; 1452 					return "Fonctiones";
6087  085e a6c2          	ld	a,#low(L5134)
6088  0860 aec2          	ld	x,#high(L5134)
6091  0862 81            	ret
6092  0863               L3342:
6093                     ; 1454 				case LABEL_PARAMETERS:
6093                     ; 1455 					return "Parameters";
6096  0863 a6f3          	ld	a,#low(L5633)
6097  0865 aef3          	ld	x,#high(L5633)
6100  0867 81            	ret
6101  0868               L5342:
6102                     ; 1457 				case LABEL_TESTS:
6102                     ; 1458 					return "Tests";
6105  0868 a6ed          	ld	a,#low(L7633)
6106  086a aeed          	ld	x,#high(L7633)
6109  086c 81            	ret
6110  086d               L7342:
6111                     ; 1460 				case LABEL_SIMPLE_SETUP:
6111                     ; 1461 					return "setup simple";
6114  086d a6b5          	ld	a,#low(L7134)
6115  086f aeb5          	ld	x,#high(L7134)
6118  0871 81            	ret
6119  0872               L1442:
6120                     ; 1463 				case LABEL_FULL_SETUP:
6120                     ; 1464 					return "setup complet";
6123  0872 a6a7          	ld	a,#low(L1234)
6124  0874 aea7          	ld	x,#high(L1234)
6127  0876 81            	ret
6128  0877               L3442:
6129                     ; 1466 				case LABEL_ALARM_ERR_ACCELERATION:
6129                     ; 1467 					return "Acceleration";
6132  0877 a6c6          	ld	a,#low(L5733)
6133  0879 aec6          	ld	x,#high(L5733)
6136  087b 81            	ret
6137  087c               L5442:
6138                     ; 1469 				case LABEL_ALARM_ERR_DECELERATION:
6138                     ; 1470 					return "Deceleration";
6141  087c a6b9          	ld	a,#low(L7733)
6142  087e aeb9          	ld	x,#high(L7733)
6145  0880 81            	ret
6146  0881               L7442:
6147                     ; 1472 				case LABEL_ALARM_ERR_DOUBLE_MARK:
6147                     ; 1473 					return "double marque";
6150  0881 a699          	ld	a,#low(L3234)
6151  0883 ae99          	ld	x,#high(L3234)
6154  0885 81            	ret
6155  0886               L1542:
6156                     ; 1475 				case LABEL_AUTO_SHORT:
6156                     ; 1476 					return "Auto";
6159  0886 a6a8          	ld	a,#low(L3043)
6160  0888 aea8          	ld	x,#high(L3043)
6163  088a 81            	ret
6164  088b               L3542:
6165                     ; 1478 				case LABEL_MANUAL_SHORT:
6165                     ; 1479 					return "Manuel";
6168  088b a692          	ld	a,#low(L5234)
6169  088d ae92          	ld	x,#high(L5234)
6172  088f 81            	ret
6173  0890               L5542:
6174                     ; 1481 				case LABEL_MODE_LONG:
6174                     ; 1482 					return "circ:";
6177  0890 a696          	ld	a,#low(L7014)
6178  0892 ae96          	ld	x,#high(L7014)
6181  0894 81            	ret
6182  0895               L7542:
6183                     ; 1484 				case LABEL_MODE_TRANS:
6183                     ; 1485 					return "tras:";
6186  0895 a690          	ld	a,#low(L1114)
6187  0897 ae90          	ld	x,#high(L1114)
6190  0899 81            	ret
6191  089a               L1642:
6192                     ; 1487 				case LABEL_MODE_PULL:
6192                     ; 1488 					return "tens:";
6195  089a a68c          	ld	a,#low(L7234)
6196  089c ae8c          	ld	x,#high(L7234)
6199  089e 81            	ret
6200  089f               L3642:
6201                     ; 1490 				case LABEL_SAVE_JOB_01:
6201                     ; 1491 					return "Sauver";
6204  089f a685          	ld	a,#low(L1334)
6205  08a1 ae85          	ld	x,#high(L1334)
6208  08a3 81            	ret
6209  08a4               L5642:
6210                     ; 1493 				case LABEL_SAVE_JOB_02:
6210                     ; 1494 					return "Travail";
6213  08a4 a67d          	ld	a,#low(L3334)
6214  08a6 ae7d          	ld	x,#high(L3334)
6217  08a8 81            	ret
6218  08a9               L7642:
6219                     ; 1496 				case LABEL_LOAD_JOB_01:
6219                     ; 1497 					return "Charge";
6222  08a9 a676          	ld	a,#low(L5334)
6223  08ab ae76          	ld	x,#high(L5334)
6226  08ad 81            	ret
6227  08ae               L1742:
6228                     ; 1499 				case LABEL_LOAD_JOB_02:
6228                     ; 1500 					return "Travail";
6231  08ae a67d          	ld	a,#low(L3334)
6232  08b0 ae7d          	ld	x,#high(L3334)
6235  08b2 81            	ret
6236  08b3               L3742:
6237                     ; 1502 				case LABEL_TWIN_APPLICATION_01_01:
6237                     ; 1503 					return "Controle";
6240  08b3 a66d          	ld	a,#low(L7334)
6241  08b5 ae6d          	ld	x,#high(L7334)
6244  08b7 81            	ret
6245  08b8               L5742:
6246                     ; 1505 				case LABEL_TWIN_APPLICATION_01_02:
6246                     ; 1506 					return "Recto/Verso";
6249  08b8 a666          	ld	a,#low(L3214)
6250  08ba ae66          	ld	x,#high(L3214)
6253  08bc 81            	ret
6254  08bd               L7742:
6255                     ; 1508 				case LABEL_TWIN_APPLICATION_02_01:
6255                     ; 1509 					return "Controle";
6258  08bd a66d          	ld	a,#low(L7334)
6259  08bf ae6d          	ld	x,#high(L7334)
6262  08c1 81            	ret
6263  08c2               L1052:
6264                     ; 1511 				case LABEL_TWIN_APPLICATION_02_02:
6264                     ; 1512 					return "Insetter";
6267  08c2 a668          	ld	a,#low(L5243)
6268  08c4 ae68          	ld	x,#high(L5243)
6271  08c6 81            	ret
6272  08c7               L3052:
6273                     ; 1514 				case LABEL_TWIN_APPLICATION_03_01:
6273                     ; 1515 					return "Controle";
6276  08c7 a66d          	ld	a,#low(L7334)
6277  08c9 ae6d          	ld	x,#high(L7334)
6280  08cb 81            	ret
6281  08cc               L5052:
6282                     ; 1517 				case LABEL_TWIN_APPLICATION_03_02:
6282                     ; 1518 					return "Coupé";
6285  08cc a667          	ld	a,#low(L1434)
6286  08ce ae67          	ld	x,#high(L1434)
6289  08d0 81            	ret
6290  08d1               L7052:
6291                     ; 1520 				case LABEL_TWIN_APPLICATION_04_01:
6291                     ; 1521 					return "Controle";
6294  08d1 a66d          	ld	a,#low(L7334)
6295  08d3 ae6d          	ld	x,#high(L7334)
6298  08d5 81            	ret
6299  08d6               L1152:
6300                     ; 1523 				case LABEL_TWIN_APPLICATION_04_02:
6300                     ; 1524 					return "Pli";
6303  08d6 a663          	ld	a,#low(L3434)
6304  08d8 ae63          	ld	x,#high(L3434)
6307  08da 81            	ret
6308  08db               L3152:
6309                     ; 1526 				case LABEL_TWIN_APPLICATION_05_01:
6309                     ; 1527 					return "Controle";
6312  08db a66d          	ld	a,#low(L7334)
6313  08dd ae6d          	ld	x,#high(L7334)
6316  08df 81            	ret
6317  08e0               L5152:
6318                     ; 1529 				case LABEL_TWIN_APPLICATION_05_02:
6318                     ; 1530 					return "Perforation";
6321  08e0 a648          	ld	a,#low(L3343)
6322  08e2 ae48          	ld	x,#high(L3343)
6325  08e4 81            	ret
6326  08e5               L7152:
6327                     ; 1532 				case LABEL_TWIN_APPLICATION_06_01:
6327                     ; 1533 					return "Controle";
6330  08e5 a66d          	ld	a,#low(L7334)
6331  08e7 ae6d          	ld	x,#high(L7334)
6334  08e9 81            	ret
6335  08ea               L1252:
6336                     ; 1535 				case LABEL_TWIN_APPLICATION_06_02:
6336                     ; 1536 					return "recto";
6339  08ea a646          	ld	a,#low(L3314)
6340  08ec ae46          	ld	x,#high(L3314)
6343  08ee 81            	ret
6344  08ef               L3252:
6345                     ; 1538 				case LABEL_TWIN_APPLICATION_07_01:
6345                     ; 1539 					return "Controle";
6348  08ef a66d          	ld	a,#low(L7334)
6349  08f1 ae6d          	ld	x,#high(L7334)
6352  08f3 81            	ret
6353  08f4               L5252:
6354                     ; 1541 				case LABEL_TWIN_APPLICATION_07_02:
6354                     ; 1542 					return "verso";
6357  08f4 a640          	ld	a,#low(L5314)
6358  08f6 ae40          	ld	x,#high(L5314)
6361  08f8 81            	ret
6362  08f9               L7252:
6363                     ; 1544 				case LABEL_REGISTER_TWIN_APPLICATION_01:
6363                     ; 1545 					return "reperage recto/verso";
6366  08f9 a64e          	ld	a,#low(L5434)
6367  08fb ae4e          	ld	x,#high(L5434)
6370  08fd 81            	ret
6371  08fe               L1352:
6372                     ; 1547 				case LABEL_REGISTER_TWIN_APPLICATION_02:
6372                     ; 1548 					return "reperage insetter";
6375  08fe a63c          	ld	a,#low(L7434)
6376  0900 ae3c          	ld	x,#high(L7434)
6379  0902 81            	ret
6380  0903               L3352:
6381                     ; 1550 				case LABEL_REGISTER_TWIN_APPLICATION_03:
6381                     ; 1551 					return "reperage coupe";
6384  0903 a62d          	ld	a,#low(L1534)
6385  0905 ae2d          	ld	x,#high(L1534)
6388  0907 81            	ret
6389  0908               L5352:
6390                     ; 1553 				case LABEL_REGISTER_TWIN_APPLICATION_04:
6390                     ; 1554 					return "reperage pli";
6393  0908 a620          	ld	a,#low(L3534)
6394  090a ae20          	ld	x,#high(L3534)
6397  090c 81            	ret
6398  090d               L7352:
6399                     ; 1556 				case LABEL_REGISTER_TWIN_APPLICATION_05:
6399                     ; 1557 					return "reperage perforation";
6402  090d a60b          	ld	a,#low(L5534)
6403  090f ae0b          	ld	x,#high(L5534)
6406  0911 81            	ret
6407  0912               L1452:
6408                     ; 1559 				case LABEL_REGISTER_TWIN_APPLICATION_06:
6408                     ; 1560 					return "reperage recto";
6411  0912 a6fc          	ld	a,#low(L7534)
6412  0914 aefc          	ld	x,#high(L7534)
6415  0916 81            	ret
6416  0917               L3452:
6417                     ; 1562 				case LABEL_REGISTER_TWIN_APPLICATION_07:
6417                     ; 1563 					return "reperage verso";
6420  0917 a6ed          	ld	a,#low(L1634)
6421  0919 aeed          	ld	x,#high(L1634)
6424  091b 81            	ret
6425  091c               L5452:
6426                     ; 1565 				case LABEL_ENCODER_01_01:
6426                     ; 1566 					return "Encoder";
6429  091c a68c          	ld	a,#low(L3423)
6430  091e ae8c          	ld	x,#high(L3423)
6433  0920 81            	ret
6434  0921               L7452:
6435                     ; 1568 				case LABEL_ENCODER_01_02:
6435                     ; 1569 					return "1";
6438  0921 a69e          	ld	a,#low(L7543)
6439  0923 ae9e          	ld	x,#high(L7543)
6442  0925 81            	ret
6443  0926               L1552:
6444                     ; 1571 				case LABEL_ENCODER_02_01:
6444                     ; 1572 					return "Encoder";
6447  0926 a68c          	ld	a,#low(L3423)
6448  0928 ae8c          	ld	x,#high(L3423)
6451  092a 81            	ret
6452  092b               L3552:
6453                     ; 1574 				case LABEL_ENCODER_02_02:
6453                     ; 1575 					return "2";
6456  092b a69c          	ld	a,#low(L1643)
6457  092d ae9c          	ld	x,#high(L1643)
6460  092f 81            	ret
6461  0930               L5552:
6462                     ; 1577 				case LABEL_SELECT_APPLICATION_01:
6462                     ; 1578 					return "Selection";
6465  0930 a65c          	ld	a,#low(L7743)
6466  0932 ae5c          	ld	x,#high(L7743)
6469  0934 81            	ret
6470  0935               L7552:
6471                     ; 1580 				case LABEL_SELECT_APPLICATION_02:
6471                     ; 1581 					return "aplication";
6474  0935 a6e2          	ld	a,#low(L3634)
6475  0937 aee2          	ld	x,#high(L3634)
6478  0939 81            	ret
6479  093a               L1652:
6480                     ; 1583 				case LABEL_SELECT_ENCODER_01:
6480                     ; 1584 					return "Selection";
6483  093a a65c          	ld	a,#low(L7743)
6484  093c ae5c          	ld	x,#high(L7743)
6487  093e 81            	ret
6488  093f               L3652:
6489                     ; 1586 				case LABEL_SELECT_ENCODER_02:
6489                     ; 1587 					return "Encoder";
6492  093f a68c          	ld	a,#low(L3423)
6493  0941 ae8c          	ld	x,#high(L3423)
6496  0943 81            	ret
6497  0944               L5652:
6498                     ; 1589 				case LABEL_SH_PN_01_01:
6498                     ; 1590 					return "Marque";
6501  0944 a6db          	ld	a,#low(L5634)
6502  0946 aedb          	ld	x,#high(L5634)
6505  0948 81            	ret
6506  0949               L7652:
6507                     ; 1592 				case LABEL_SH_PN_01_02:
6507                     ; 1593 					return "Positive";
6510  0949 a67d          	ld	a,#low(L7643)
6511  094b ae7d          	ld	x,#high(L7643)
6514  094d 81            	ret
6515  094e               L1752:
6516                     ; 1595 				case LABEL_SH_PN_02_01:
6516                     ; 1596 					return "Marque";
6519  094e a6db          	ld	a,#low(L5634)
6520  0950 aedb          	ld	x,#high(L5634)
6523  0952 81            	ret
6524  0953               L3752:
6525                     ; 1598 				case LABEL_SH_PN_02_02:
6525                     ; 1599 					return "Negatif";
6528  0953 a6d3          	ld	a,#low(L7634)
6529  0955 aed3          	ld	x,#high(L7634)
6532  0957 81            	ret
6533  0958               L5752:
6534                     ; 1601 				case LABEL_SELECT_SH_PN_01:
6534                     ; 1602 					return "Selection";
6537  0958 a65c          	ld	a,#low(L7743)
6538  095a ae5c          	ld	x,#high(L7743)
6541  095c 81            	ret
6542  095d               L7752:
6543                     ; 1604 				case LABEL_SELECT_SH_PN_02:
6543                     ; 1605 					return "Marque P/N";
6546  095d a6c8          	ld	a,#low(L1734)
6547  095f aec8          	ld	x,#high(L1734)
6550  0961 81            	ret
6551  0962               L1062:
6552                     ; 1607 				case LABEL_TENSION_BASE_VALUE_01:
6552                     ; 1608 					return "Tension";
6555  0962 a687          	ld	a,#low(L1714)
6556  0964 ae87          	ld	x,#high(L1714)
6559  0966 81            	ret
6560  0967               L3062:
6561                     ; 1610 				case LABEL_TENSION_BASE_VALUE_02:
6561                     ; 1611 					return "Initial";
6564  0967 a6c0          	ld	a,#low(L3734)
6565  0969 aec0          	ld	x,#high(L3734)
6568  096b 81            	ret
6569  096c               L7714:
6570                     ; 1614 			break;			
6572  096c cc0bc2        	jp	L3023
6573  096f               L5062:
6574                     ; 1615 		default:	//PARAM_LANGUAGE_IT - Italian
6574                     ; 1616 			switch(a_byIndex)
6576  096f b600          	ld	a,_labelGet$L
6578                     ; 1962 					break;
6580  0971 a173          	cp	a,#115
6581  0973 240b          	jruge	L62
6582  0975 48            	sll	a
6583  0976 97            	ld	x,a
6584  0977 d61592        	ld	a,(L03+1,x)
6585  097a 88            	push	a
6586  097b d61591        	ld	a,(L03,x)
6587  097e 88            	push	a
6588  097f 81            	ret
6589  0980               L62:
6590  0980 cc0bbd        	jp	L3513
6591  0983               L7062:
6592                     ; 1618 				case LABEL_MODE:
6592                     ; 1619 					return "modo:";
6594  0983 a6ba          	ld	a,#low(L1044)
6595  0985 aeba          	ld	x,#high(L1044)
6598  0987 81            	ret
6599  0988               L1162:
6600                     ; 1621 				case LABEL_MANUAL:
6600                     ; 1622 					return "manuale";
6603  0988 a6b2          	ld	a,#low(L3044)
6604  098a aeb2          	ld	x,#high(L3044)
6607  098c 81            	ret
6608  098d               L3162:
6609                     ; 1624 				case LABEL_AUTO:
6609                     ; 1625 					return "automatico";
6612  098d a6c4          	ld	a,#low(L7473)
6613  098f aec4          	ld	x,#high(L7473)
6616  0991 81            	ret
6617  0992               L5162:
6618                     ; 1627 				case LABEL_SPEED:
6618                     ; 1628 					return "velocita:";
6621  0992 a6a8          	ld	a,#low(L5044)
6622  0994 aea8          	ld	x,#high(L5044)
6625  0996 81            	ret
6626  0997               L7162:
6627                     ; 1630 				case LABEL_SPEED_SHORT:
6627                     ; 1631 					return "vel:";
6630  0997 a6b5          	ld	a,#low(L3573)
6631  0999 aeb5          	ld	x,#high(L3573)
6634  099b 81            	ret
6635  099c               L1262:
6636                     ; 1633 				case LABEL_CYLINDER_SIZE:
6636                     ; 1634 					return "cilin:";
6639  099c a6a1          	ld	a,#low(L7044)
6640  099e aea1          	ld	x,#high(L7044)
6643  09a0 81            	ret
6644  09a1               L3262:
6645                     ; 1636 				case LABEL_MT_MIN:
6645                     ; 1637 					return "mt/min";
6648  09a1 a6d1          	ld	a,#low(L5223)
6649  09a3 aed1          	ld	x,#high(L5223)
6652  09a5 81            	ret
6653  09a6               L5262:
6654                     ; 1639 				case LABEL_MESSAGE:
6654                     ; 1640 					return "messaggio:";
6657  09a6 a696          	ld	a,#low(L1144)
6658  09a8 ae96          	ld	x,#high(L1144)
6661  09aa 81            	ret
6662  09ab               L7262:
6663                     ; 1642 				case LABEL_ALARM:
6663                     ; 1643 					return "allarme:";
6666  09ab a68d          	ld	a,#low(L3144)
6667  09ad ae8d          	ld	x,#high(L3144)
6670  09af 81            	ret
6671  09b0               L1362:
6672                     ; 1645 				case LABEL_ALARM_ERR_NO_PRINT:
6672                     ; 1646 					return "Mancanza stampa";
6675  09b0 a67d          	ld	a,#low(L5144)
6676  09b2 ae7d          	ld	x,#high(L5144)
6679  09b4 81            	ret
6680  09b5               L3362:
6681                     ; 1648 				case LABEL_ALARM_ERR_LOW_SPEED:
6681                     ; 1649 					return "Velocita' bassa";
6684  09b5 a66d          	ld	a,#low(L7144)
6685  09b7 ae6d          	ld	x,#high(L7144)
6688  09b9 81            	ret
6689  09ba               L5362:
6690                     ; 1651 				case LABEL_ALARM_ERR_TEST_SH_01:
6690                     ; 1652 					return "Test testina";
6693  09ba a660          	ld	a,#low(L1244)
6694  09bc ae60          	ld	x,#high(L1244)
6697  09be 81            	ret
6698  09bf               L7362:
6699                     ; 1654 				case LABEL_ALARM_ERR_TEST_SH_02:
6699                     ; 1655 					return "fallito";
6702  09bf a658          	ld	a,#low(L3244)
6703  09c1 ae58          	ld	x,#high(L3244)
6706  09c3 81            	ret
6707  09c4               L1462:
6708                     ; 1657 				case LABEL_ALARM_ERR_TEST_ENC_01:
6708                     ; 1658 					return "Test encoder";
6711  09c4 a654          	ld	a,#low(L3773)
6712  09c6 ae54          	ld	x,#high(L3773)
6715  09c8 81            	ret
6716  09c9               L3462:
6717                     ; 1660 				case LABEL_ALARM_ERR_TEST_ENC_02:
6717                     ; 1661 					return "fallito";
6720  09c9 a658          	ld	a,#low(L3244)
6721  09cb ae58          	ld	x,#high(L3244)
6724  09cd 81            	ret
6725  09ce               L5462:
6726                     ; 1663 				case LABEL_ALARM_ERR_PHASE_AUTO_01:
6726                     ; 1664 					return "Fasatura automatica";
6729  09ce a644          	ld	a,#low(L5244)
6730  09d0 ae44          	ld	x,#high(L5244)
6733  09d2 81            	ret
6734  09d3               L7462:
6735                     ; 1666 				case LABEL_ALARM_ERR_PHASE_AUTO_02:
6735                     ; 1667 					return "fallita";
6738  09d3 a63c          	ld	a,#low(L7244)
6739  09d5 ae3c          	ld	x,#high(L7244)
6742  09d7 81            	ret
6743  09d8               L1562:
6744                     ; 1669 				case LABEL_ALARM_CYLINDER_TRAVEL_01:
6744                     ; 1670 					return "Sviluppo Cilindro (P1)";
6747  09d8 a625          	ld	a,#low(L1344)
6748  09da ae25          	ld	x,#high(L1344)
6751  09dc 81            	ret
6752  09dd               L3562:
6753                     ; 1672 				case LABEL_ALARM_CYLINDER_TRAVEL_02:
6753                     ; 1673 					return "non accettabile";
6756  09dd a615          	ld	a,#low(L3344)
6757  09df ae15          	ld	x,#high(L3344)
6760  09e1 81            	ret
6761  09e2               L5562:
6762                     ; 1675 				case LABEL_ALARM_GATE_WINDOW_01:
6762                     ; 1676 					return "Ampiezza Gate (P3)";
6765  09e2 a602          	ld	a,#low(L5344)
6766  09e4 ae02          	ld	x,#high(L5344)
6769  09e6 81            	ret
6770  09e7               L7562:
6771                     ; 1678 				case LABEL_ALARM_GATE_WINDOW_02:
6771                     ; 1679 					return "non accettabile";
6774  09e7 a615          	ld	a,#low(L3344)
6775  09e9 ae15          	ld	x,#high(L3344)
6778  09eb 81            	ret
6779  09ec               L1662:
6780                     ; 1681 				case LABEL_ANSWER_OK:
6780                     ; 1682 					return "Nessun problema";
6783  09ec a6f2          	ld	a,#low(L7344)
6784  09ee aef2          	ld	x,#high(L7344)
6787  09f0 81            	ret
6788  09f1               L3662:
6789                     ; 1684 				case LABEL_GENERIC_ALARM_01:
6789                     ; 1685 					return "Allarme  ";
6792  09f1 a6e8          	ld	a,#low(L1444)
6793  09f3 aee8          	ld	x,#high(L1444)
6796  09f5 81            	ret
6797  09f6               L5662:
6798                     ; 1687 				case LABEL_GENERIC_ALARM_02:
6798                     ; 1688 					return "non riconosciuto";
6801  09f6 a6d7          	ld	a,#low(L3444)
6802  09f8 aed7          	ld	x,#high(L3444)
6805  09fa 81            	ret
6806  09fb               L7662:
6807                     ; 1690 				case LABEL_PHASE_OSCILL:
6807                     ; 1691 					return "fasatura con oscilloscopio:";
6810  09fb a6bb          	ld	a,#low(L5444)
6811  09fd aebb          	ld	x,#high(L5444)
6814  09ff 81            	ret
6815  0a00               L1762:
6816                     ; 1693 				case LABEL_PHASE_FAST:
6816                     ; 1694 					return "fasatura a correzione rapida:";
6819  0a00 a69d          	ld	a,#low(L7444)
6820  0a02 ae9d          	ld	x,#high(L7444)
6823  0a04 81            	ret
6824  0a05               L3762:
6825                     ; 1696 				case LABEL_OSCILLOSCOPE:
6825                     ; 1697 					return "oscilloscopio:";
6828  0a05 a68e          	ld	a,#low(L1544)
6829  0a07 ae8e          	ld	x,#high(L1544)
6832  0a09 81            	ret
6833  0a0a               L5762:
6834                     ; 1699 				case LABEL_REGISTER:
6834                     ; 1700 					return "registro:";
6837  0a0a a684          	ld	a,#low(L3544)
6838  0a0c ae84          	ld	x,#high(L3544)
6841  0a0e 81            	ret
6842  0a0f               L7762:
6843                     ; 1702 				case LABEL_PHASE_CENTER_01:
6843                     ; 1703 					return "Azzeramento";
6846  0a0f a678          	ld	a,#low(L5544)
6847  0a11 ae78          	ld	x,#high(L5544)
6850  0a13 81            	ret
6851  0a14               L1072:
6852                     ; 1705 				case LABEL_PHASE_CENTER_02:
6852                     ; 1706 					return "errore";		
6855  0a14 a671          	ld	a,#low(L7544)
6856  0a16 ae71          	ld	x,#high(L7544)
6859  0a18 81            	ret
6860  0a19               L3072:
6861                     ; 1708 				case LABEL_PHASE_MANUAL_01:
6861                     ; 1709 					return "Fasatura";
6864  0a19 a668          	ld	a,#low(L1644)
6865  0a1b ae68          	ld	x,#high(L1644)
6868  0a1d 81            	ret
6869  0a1e               L5072:
6870                     ; 1711 				case LABEL_PHASE_MANUAL_02:
6870                     ; 1712 					return "manuale";		
6873  0a1e a6b2          	ld	a,#low(L3044)
6874  0a20 aeb2          	ld	x,#high(L3044)
6877  0a22 81            	ret
6878  0a23               L7072:
6879                     ; 1714 				case LABEL_PHASE_AUTO_01:
6879                     ; 1715 					return "Fasatura"; 	
6882  0a23 a668          	ld	a,#low(L1644)
6883  0a25 ae68          	ld	x,#high(L1644)
6886  0a27 81            	ret
6887  0a28               L1172:
6888                     ; 1717 				case LABEL_PHASE_AUTO_02:
6888                     ; 1718 					return "automatica"; 	
6891  0a28 a682          	ld	a,#low(L7204)
6892  0a2a ae82          	ld	x,#high(L7204)
6895  0a2c 81            	ret
6896  0a2d               L3172:
6897                     ; 1720 				case LABEL_PHASE_OSCILL_01:
6897                     ; 1721 					return "Fasatura ad"; 	
6900  0a2d a65c          	ld	a,#low(L3644)
6901  0a2f ae5c          	ld	x,#high(L3644)
6904  0a31 81            	ret
6905  0a32               L5172:
6906                     ; 1723 				case LABEL_PHASE_OSCILL_02:
6906                     ; 1724 					return "oscilloscop"; 	
6909  0a32 a6a5          	ld	a,#low(L1133)
6910  0a34 aea5          	ld	x,#high(L1133)
6913  0a36 81            	ret
6914  0a37               L7172:
6915                     ; 1726 				case LABEL_PHASE_FAST_01:
6915                     ; 1727 					return "Fasatura ad"; 	
6918  0a37 a65c          	ld	a,#low(L3644)
6919  0a39 ae5c          	ld	x,#high(L3644)
6922  0a3b 81            	ret
6923  0a3c               L1272:
6924                     ; 1729 				case LABEL_PHASE_FAST_02:
6924                     ; 1730 					return "acceleraz"; 	
6927  0a3c a652          	ld	a,#low(L5644)
6928  0a3e ae52          	ld	x,#high(L5644)
6931  0a40 81            	ret
6932  0a41               L3272:
6933                     ; 1732 				case LABEL_CYLINDER_TRAVEL_01:
6933                     ; 1733 					return "Sviluppo"; 	
6936  0a41 a649          	ld	a,#low(L7644)
6937  0a43 ae49          	ld	x,#high(L7644)
6940  0a45 81            	ret
6941  0a46               L5272:
6942                     ; 1735 				case LABEL_CYLINDER_TRAVEL_02:
6942                     ; 1736 					return "cilindro";
6945  0a46 a657          	ld	a,#low(L7304)
6946  0a48 ae57          	ld	x,#high(L7304)
6949  0a4a 81            	ret
6950  0a4b               L7272:
6951                     ; 1738 				case LABEL_ALARM_BOUND_01:
6951                     ; 1739 					return "Soglia";
6954  0a4b a642          	ld	a,#low(L1744)
6955  0a4d ae42          	ld	x,#high(L1744)
6958  0a4f 81            	ret
6959  0a50               L1372:
6960                     ; 1741 				case LABEL_ALARM_BOUND_02:
6960                     ; 1742 					return "allarme";
6963  0a50 a63a          	ld	a,#low(L3744)
6964  0a52 ae3a          	ld	x,#high(L3744)
6967  0a54 81            	ret
6968  0a55               L3372:
6969                     ; 1744 				case LABEL_GATE_WINDOW_01:
6969                     ; 1745 					return "Ampiezza";
6972  0a55 a631          	ld	a,#low(L5744)
6973  0a57 ae31          	ld	x,#high(L5744)
6976  0a59 81            	ret
6977  0a5a               L5372:
6978                     ; 1747 				case LABEL_GATE_WINDOW_02:
6978                     ; 1748 					return "gate";
6981  0a5a a643          	ld	a,#low(L5404)
6982  0a5c ae43          	ld	x,#high(L5404)
6985  0a5e 81            	ret
6986  0a5f               L7372:
6987                     ; 1750 				case LABEL_SW_VERSION_01:
6987                     ; 1751 					return "Versione";
6990  0a5f a628          	ld	a,#low(L7744)
6991  0a61 ae28          	ld	x,#high(L7744)
6994  0a63 81            	ret
6995  0a64               L1472:
6996                     ; 1753 				case LABEL_SW_VERSION_02:
6996                     ; 1754 					return "Software";
6999  0a64 a66a          	ld	a,#low(L1333)
7000  0a66 ae6a          	ld	x,#high(L1333)
7003  0a68 81            	ret
7004  0a69               L3472:
7005                     ; 1756 				case LABEL_OFFSET_DISTANCE_01:
7005                     ; 1757 					return "Distanza";
7008  0a69 a61f          	ld	a,#low(L1054)
7009  0a6b ae1f          	ld	x,#high(L1054)
7012  0a6d 81            	ret
7013  0a6e               L5472:
7014                     ; 1759 				case LABEL_OFFSET_DISTANCE_02:
7014                     ; 1760 					return "su offset";
7017  0a6e a615          	ld	a,#low(L3054)
7018  0a70 ae15          	ld	x,#high(L3054)
7021  0a72 81            	ret
7022  0a73               L7472:
7023                     ; 1762 				case LABEL_TEST_SH_01:
7023                     ; 1763 					return "Test";
7026  0a73 a66f          	ld	a,#low(L3263)
7027  0a75 ae6f          	ld	x,#high(L3263)
7030  0a77 81            	ret
7031  0a78               L1572:
7032                     ; 1765 				case LABEL_TEST_SH_02:
7032                     ; 1766 					return "testina";
7035  0a78 a60d          	ld	a,#low(L5054)
7036  0a7a ae0d          	ld	x,#high(L5054)
7039  0a7c 81            	ret
7040  0a7d               L3572:
7041                     ; 1768 				case LABEL_TEST_ENC_01:
7041                     ; 1769 					return "Test";
7044  0a7d a66f          	ld	a,#low(L3263)
7045  0a7f ae6f          	ld	x,#high(L3263)
7048  0a81 81            	ret
7049  0a82               L5572:
7050                     ; 1771 				case LABEL_TEST_ENC_02:
7050                     ; 1772 					return "encoder";
7053  0a82 a620          	ld	a,#low(L5504)
7054  0a84 ae20          	ld	x,#high(L5504)
7057  0a86 81            	ret
7058  0a87               L7572:
7059                     ; 1774 				case LABEL_TEST_OUTPUT_01:
7059                     ; 1775 					return "Test";
7062  0a87 a66f          	ld	a,#low(L3263)
7063  0a89 ae6f          	ld	x,#high(L3263)
7066  0a8b 81            	ret
7067  0a8c               L1672:
7068                     ; 1777 				case LABEL_TEST_OUTPUT_02:
7068                     ; 1778 					return "uscite";
7071  0a8c a606          	ld	a,#low(L7054)
7072  0a8e ae06          	ld	x,#high(L7054)
7075  0a90 81            	ret
7076  0a91               L3672:
7077                     ; 1780 				case LABEL_VISUAL_REGISTER_01:
7077                     ; 1781 					return "Visual";
7080  0a91 a62a          	ld	a,#low(L1533)
7081  0a93 ae2a          	ld	x,#high(L1533)
7084  0a95 81            	ret
7085  0a96               L5672:
7086                     ; 1783 				case LABEL_VISUAL_REGISTER_02:
7086                     ; 1784 					return "Registro";
7089  0a96 a60f          	ld	a,#low(L1604)
7090  0a98 ae0f          	ld	x,#high(L1604)
7093  0a9a 81            	ret
7094  0a9b               L7672:
7095                     ; 1786 				case LABEL_VISUAL_OSCILL_01:
7095                     ; 1787 					return "Visual";
7098  0a9b a62a          	ld	a,#low(L1533)
7099  0a9d ae2a          	ld	x,#high(L1533)
7102  0a9f 81            	ret
7103  0aa0               L1772:
7104                     ; 1789 				case LABEL_VISUAL_OSCILL_02:
7104                     ; 1790 					return "Oscilloscop";
7107  0aa0 a615          	ld	a,#low(L5533)
7108  0aa2 ae15          	ld	x,#high(L5533)
7111  0aa4 81            	ret
7112  0aa5               L3772:
7113                     ; 1792 				case LABEL_JOB_ARCHIVE_01:
7113                     ; 1793 					return "Archivio";
7116  0aa5 a6fd          	ld	a,#low(L1154)
7117  0aa7 aefd          	ld	x,#high(L1154)
7120  0aa9 81            	ret
7121  0aaa               L5772:
7122                     ; 1795 				case LABEL_JOB_ARCHIVE_02:
7122                     ; 1796 					return "Lavori";
7125  0aaa a6f6          	ld	a,#low(L3154)
7126  0aac aef6          	ld	x,#high(L3154)
7129  0aae 81            	ret
7130  0aaf               L7772:
7131                     ; 1798 				case LABEL_FUNCTIONS:
7131                     ; 1799 					return "Funzioni";
7134  0aaf a6ed          	ld	a,#low(L5154)
7135  0ab1 aeed          	ld	x,#high(L5154)
7138  0ab3 81            	ret
7139  0ab4               L1003:
7140                     ; 1801 				case LABEL_PARAMETERS:
7140                     ; 1802 					return "Parametri";
7143  0ab4 a6e3          	ld	a,#low(L7154)
7144  0ab6 aee3          	ld	x,#high(L7154)
7147  0ab8 81            	ret
7148  0ab9               L3003:
7149                     ; 1804 				case LABEL_TESTS:
7149                     ; 1805 					return "Tests";
7152  0ab9 a6ed          	ld	a,#low(L7633)
7153  0abb aeed          	ld	x,#high(L7633)
7156  0abd 81            	ret
7157  0abe               L5003:
7158                     ; 1807 				case LABEL_SIMPLE_SETUP:
7158                     ; 1808 					return "setup semplice:";
7161  0abe a6d3          	ld	a,#low(L1254)
7162  0ac0 aed3          	ld	x,#high(L1254)
7165  0ac2 81            	ret
7166  0ac3               L7003:
7167                     ; 1810 				case LABEL_FULL_SETUP:
7167                     ; 1811 					return "setup completo:";
7170  0ac3 a6c3          	ld	a,#low(L3254)
7171  0ac5 aec3          	ld	x,#high(L3254)
7174  0ac7 81            	ret
7175  0ac8               L1103:
7176                     ; 1813 				case LABEL_ALARM_ERR_ACCELERATION:
7176                     ; 1814 					return "Accelerazione";
7179  0ac8 a6b5          	ld	a,#low(L5254)
7180  0aca aeb5          	ld	x,#high(L5254)
7183  0acc 81            	ret
7184  0acd               L3103:
7185                     ; 1816 				case LABEL_ALARM_ERR_DECELERATION:
7185                     ; 1817 					return "Decelerazione";
7188  0acd a6a7          	ld	a,#low(L7254)
7189  0acf aea7          	ld	x,#high(L7254)
7192  0ad1 81            	ret
7193  0ad2               L5103:
7194                     ; 1819 				case LABEL_ALARM_ERR_DOUBLE_MARK:
7194                     ; 1820 					return "Segno doppio";
7197  0ad2 a69a          	ld	a,#low(L1354)
7198  0ad4 ae9a          	ld	x,#high(L1354)
7201  0ad6 81            	ret
7202  0ad7               L7103:
7203                     ; 1822 				case LABEL_AUTO_SHORT:
7203                     ; 1823 					return "Auto";
7206  0ad7 a6a8          	ld	a,#low(L3043)
7207  0ad9 aea8          	ld	x,#high(L3043)
7210  0adb 81            	ret
7211  0adc               L1203:
7212                     ; 1825 				case LABEL_MANUAL_SHORT:
7212                     ; 1826 					return "Manual";
7215  0adc a6cc          	ld	a,#low(L1033)
7216  0ade aecc          	ld	x,#high(L1033)
7219  0ae0 81            	ret
7220  0ae1               L3203:
7221                     ; 1828 				case LABEL_MODE_LONG:
7221                     ; 1829 					return "Long:";
7224  0ae1 a6a2          	ld	a,#low(L5043)
7225  0ae3 aea2          	ld	x,#high(L5043)
7228  0ae5 81            	ret
7229  0ae6               L5203:
7230                     ; 1831 				case LABEL_MODE_TRANS:
7230                     ; 1832 					return "Tras:";
7233  0ae6 a694          	ld	a,#low(L3354)
7234  0ae8 ae94          	ld	x,#high(L3354)
7237  0aea 81            	ret
7238  0aeb               L7203:
7239                     ; 1834 				case LABEL_MODE_PULL:
7239                     ; 1835 					return "Tiro:";
7242  0aeb a68e          	ld	a,#low(L5354)
7243  0aed ae8e          	ld	x,#high(L5354)
7246  0aef 81            	ret
7247  0af0               L1303:
7248                     ; 1837 				case LABEL_SAVE_JOB_01:
7248                     ; 1838 					return "Salva";
7251  0af0 a688          	ld	a,#low(L7354)
7252  0af2 ae88          	ld	x,#high(L7354)
7255  0af4 81            	ret
7256  0af5               L3303:
7257                     ; 1840 				case LABEL_SAVE_JOB_02:
7257                     ; 1841 					return "lavoro";
7260  0af5 a681          	ld	a,#low(L1454)
7261  0af7 ae81          	ld	x,#high(L1454)
7264  0af9 81            	ret
7265  0afa               L5303:
7266                     ; 1843 				case LABEL_LOAD_JOB_01:
7266                     ; 1844 					return "Carica";
7269  0afa a67a          	ld	a,#low(L3454)
7270  0afc ae7a          	ld	x,#high(L3454)
7273  0afe 81            	ret
7274  0aff               L7303:
7275                     ; 1846 				case LABEL_LOAD_JOB_02:
7275                     ; 1847 					return "Lavoro";
7278  0aff a673          	ld	a,#low(L5454)
7279  0b01 ae73          	ld	x,#high(L5454)
7282  0b03 81            	ret
7283  0b04               L1403:
7284                     ; 1849 				case LABEL_TWIN_APPLICATION_01_01:
7284                     ; 1850 					return "Controllo";
7287  0b04 a669          	ld	a,#low(L7454)
7288  0b06 ae69          	ld	x,#high(L7454)
7291  0b08 81            	ret
7292  0b09               L3403:
7293                     ; 1852 				case LABEL_TWIN_APPLICATION_01_02:
7293                     ; 1853 					return "Bianca/Volta";
7296  0b09 a65c          	ld	a,#low(L1554)
7297  0b0b ae5c          	ld	x,#high(L1554)
7300  0b0d 81            	ret
7301  0b0e               L5403:
7302                     ; 1855 				case LABEL_TWIN_APPLICATION_02_01:
7302                     ; 1856 					return "Controllo";
7305  0b0e a669          	ld	a,#low(L7454)
7306  0b10 ae69          	ld	x,#high(L7454)
7309  0b12 81            	ret
7310  0b13               L7403:
7311                     ; 1858 				case LABEL_TWIN_APPLICATION_02_02:
7311                     ; 1859 					return "Ripassaggio";
7314  0b13 a650          	ld	a,#low(L3554)
7315  0b15 ae50          	ld	x,#high(L3554)
7318  0b17 81            	ret
7319  0b18               L1503:
7320                     ; 1861 				case LABEL_TWIN_APPLICATION_03_01:
7320                     ; 1862 					return "Controllo";
7323  0b18 a669          	ld	a,#low(L7454)
7324  0b1a ae69          	ld	x,#high(L7454)
7327  0b1c 81            	ret
7328  0b1d               L3503:
7329                     ; 1864 				case LABEL_TWIN_APPLICATION_03_02:
7329                     ; 1865 					return "Taglio";
7332  0b1d a649          	ld	a,#low(L5554)
7333  0b1f ae49          	ld	x,#high(L5554)
7336  0b21 81            	ret
7337  0b22               L5503:
7338                     ; 1867 				case LABEL_TWIN_APPLICATION_04_01:
7338                     ; 1868 					return "Controllo";
7341  0b22 a669          	ld	a,#low(L7454)
7342  0b24 ae69          	ld	x,#high(L7454)
7345  0b26 81            	ret
7346  0b27               L7503:
7347                     ; 1870 				case LABEL_TWIN_APPLICATION_04_02:
7347                     ; 1871 					return "Piega";
7350  0b27 a643          	ld	a,#low(L7554)
7351  0b29 ae43          	ld	x,#high(L7554)
7354  0b2b 81            	ret
7355  0b2c               L1603:
7356                     ; 1873 				case LABEL_TWIN_APPLICATION_05_01:
7356                     ; 1874 					return "Controllo";
7359  0b2c a669          	ld	a,#low(L7454)
7360  0b2e ae69          	ld	x,#high(L7454)
7363  0b30 81            	ret
7364  0b31               L3603:
7365                     ; 1876 				case LABEL_TWIN_APPLICATION_05_02:
7365                     ; 1877 					return "Perforazione";
7368  0b31 a636          	ld	a,#low(L1654)
7369  0b33 ae36          	ld	x,#high(L1654)
7372  0b35 81            	ret
7373  0b36               L5603:
7374                     ; 1879 				case LABEL_TWIN_APPLICATION_06_01:
7374                     ; 1880 					return "Controllo";
7377  0b36 a669          	ld	a,#low(L7454)
7378  0b38 ae69          	ld	x,#high(L7454)
7381  0b3a 81            	ret
7382  0b3b               L7603:
7383                     ; 1882 				case LABEL_TWIN_APPLICATION_06_02:
7383                     ; 1883 					return "bianca";
7386  0b3b a62f          	ld	a,#low(L3654)
7387  0b3d ae2f          	ld	x,#high(L3654)
7390  0b3f 81            	ret
7391  0b40               L1703:
7392                     ; 1885 				case LABEL_TWIN_APPLICATION_07_01:
7392                     ; 1886 					return "Controllo";
7395  0b40 a669          	ld	a,#low(L7454)
7396  0b42 ae69          	ld	x,#high(L7454)
7399  0b44 81            	ret
7400  0b45               L3703:
7401                     ; 1888 				case LABEL_TWIN_APPLICATION_07_02:
7401                     ; 1889 					return "volta";
7404  0b45 a629          	ld	a,#low(L5654)
7405  0b47 ae29          	ld	x,#high(L5654)
7408  0b49 81            	ret
7409  0b4a               L5703:
7410                     ; 1891 				case LABEL_REGISTER_TWIN_APPLICATION_01:
7410                     ; 1892 					return "registro bianca/volta:";
7413  0b4a a612          	ld	a,#low(L7654)
7414  0b4c ae12          	ld	x,#high(L7654)
7417  0b4e 81            	ret
7418  0b4f               L7703:
7419                     ; 1894 				case LABEL_REGISTER_TWIN_APPLICATION_02:
7419                     ; 1895 					return "registro ripassaggio:";
7422  0b4f a6fc          	ld	a,#low(L1754)
7423  0b51 aefc          	ld	x,#high(L1754)
7426  0b53 81            	ret
7427  0b54               L1013:
7428                     ; 1897 				case LABEL_REGISTER_TWIN_APPLICATION_03:
7428                     ; 1898 					return "registro taglio:";
7431  0b54 a6eb          	ld	a,#low(L3754)
7432  0b56 aeeb          	ld	x,#high(L3754)
7435  0b58 81            	ret
7436  0b59               L3013:
7437                     ; 1900 				case LABEL_REGISTER_TWIN_APPLICATION_04:
7437                     ; 1901 					return "registro piega:";
7440  0b59 a6db          	ld	a,#low(L5754)
7441  0b5b aedb          	ld	x,#high(L5754)
7444  0b5d 81            	ret
7445  0b5e               L5013:
7446                     ; 1903 				case LABEL_REGISTER_TWIN_APPLICATION_05:
7446                     ; 1904 					return "registro perforazione:";
7449  0b5e a6c4          	ld	a,#low(L7754)
7450  0b60 aec4          	ld	x,#high(L7754)
7453  0b62 81            	ret
7454  0b63               L7013:
7455                     ; 1906 				case LABEL_REGISTER_TWIN_APPLICATION_06:
7455                     ; 1907 					return "registro bianca:";
7458  0b63 a6b3          	ld	a,#low(L1064)
7459  0b65 aeb3          	ld	x,#high(L1064)
7462  0b67 81            	ret
7463  0b68               L1113:
7464                     ; 1909 				case LABEL_REGISTER_TWIN_APPLICATION_07:
7464                     ; 1910 					return "registro volta:";
7467  0b68 a6a3          	ld	a,#low(L3064)
7468  0b6a aea3          	ld	x,#high(L3064)
7471  0b6c 81            	ret
7472  0b6d               L3113:
7473                     ; 1912 				case LABEL_ENCODER_01_01:
7473                     ; 1913 					return "Encoder";
7476  0b6d a68c          	ld	a,#low(L3423)
7477  0b6f ae8c          	ld	x,#high(L3423)
7480  0b71 81            	ret
7481  0b72               L5113:
7482                     ; 1915 				case LABEL_ENCODER_01_02:
7482                     ; 1916 					return "1";
7485  0b72 a69e          	ld	a,#low(L7543)
7486  0b74 ae9e          	ld	x,#high(L7543)
7489  0b76 81            	ret
7490  0b77               L7113:
7491                     ; 1918 				case LABEL_ENCODER_02_01:
7491                     ; 1919 					return "Encoder";
7494  0b77 a68c          	ld	a,#low(L3423)
7495  0b79 ae8c          	ld	x,#high(L3423)
7498  0b7b 81            	ret
7499  0b7c               L1213:
7500                     ; 1921 				case LABEL_ENCODER_02_02:
7500                     ; 1922 					return "2";
7503  0b7c a69c          	ld	a,#low(L1643)
7504  0b7e ae9c          	ld	x,#high(L1643)
7507  0b80 81            	ret
7508  0b81               L3213:
7509                     ; 1924 				case LABEL_SELECT_APPLICATION_01:
7509                     ; 1925 					return "Selezione";
7512  0b81 a699          	ld	a,#low(L5064)
7513  0b83 ae99          	ld	x,#high(L5064)
7516  0b85 81            	ret
7517  0b86               L5213:
7518                     ; 1927 				case LABEL_SELECT_APPLICATION_02:
7518                     ; 1928 					return "applicaz.";
7521  0b86 a68f          	ld	a,#low(L7064)
7522  0b88 ae8f          	ld	x,#high(L7064)
7525  0b8a 81            	ret
7526  0b8b               L7213:
7527                     ; 1930 				case LABEL_SELECT_ENCODER_01:
7527                     ; 1931 					return "Selezione";
7530  0b8b a699          	ld	a,#low(L5064)
7531  0b8d ae99          	ld	x,#high(L5064)
7534  0b8f 81            	ret
7535  0b90               L1313:
7536                     ; 1933 				case LABEL_SELECT_ENCODER_02:
7536                     ; 1934 					return "Encoder";
7539  0b90 a68c          	ld	a,#low(L3423)
7540  0b92 ae8c          	ld	x,#high(L3423)
7543  0b94 81            	ret
7544  0b95               L3313:
7545                     ; 1936 				case LABEL_SH_PN_01_01:
7545                     ; 1937 					return "Marca";
7548  0b95 a6ab          	ld	a,#low(L1614)
7549  0b97 aeab          	ld	x,#high(L1614)
7552  0b99 81            	ret
7553  0b9a               L5313:
7554                     ; 1939 				case LABEL_SH_PN_01_02:
7554                     ; 1940 					return "Positiva";
7557  0b9a a6a2          	ld	a,#low(L3614)
7558  0b9c aea2          	ld	x,#high(L3614)
7561  0b9e 81            	ret
7562  0b9f               L7313:
7563                     ; 1942 				case LABEL_SH_PN_02_01:
7563                     ; 1943 					return "Marca";
7566  0b9f a6ab          	ld	a,#low(L1614)
7567  0ba1 aeab          	ld	x,#high(L1614)
7570  0ba3 81            	ret
7571  0ba4               L1413:
7572                     ; 1945 				case LABEL_SH_PN_02_02:
7572                     ; 1946 					return "Negativa";
7575  0ba4 a699          	ld	a,#low(L5614)
7576  0ba6 ae99          	ld	x,#high(L5614)
7579  0ba8 81            	ret
7580  0ba9               L3413:
7581                     ; 1948 				case LABEL_SELECT_SH_PN_01:
7581                     ; 1949 					return "Selezione";
7584  0ba9 a699          	ld	a,#low(L5064)
7585  0bab ae99          	ld	x,#high(L5064)
7588  0bad 81            	ret
7589  0bae               L5413:
7590                     ; 1951 				case LABEL_SELECT_SH_PN_02:
7590                     ; 1952 					return "Segno P/N";
7593  0bae a685          	ld	a,#low(L1164)
7594  0bb0 ae85          	ld	x,#high(L1164)
7597  0bb2 81            	ret
7598  0bb3               L7413:
7599                     ; 1954 				case LABEL_TENSION_BASE_VALUE_01:
7599                     ; 1955 					return "Tiro";
7602  0bb3 a680          	ld	a,#low(L3164)
7603  0bb5 ae80          	ld	x,#high(L3164)
7606  0bb7 81            	ret
7607  0bb8               L1513:
7608                     ; 1957 				case LABEL_TENSION_BASE_VALUE_02:
7608                     ; 1958 					return "Iniziale";
7611  0bb8 a677          	ld	a,#low(L5164)
7612  0bba ae77          	ld	x,#high(L5164)
7615  0bbc 81            	ret
7616  0bbd               L3513:
7617                     ; 1960 				default:
7617                     ; 1961 					return "ERR_IDX";
7620  0bbd a641          	ld	a,#low(L5053)
7621  0bbf ae41          	ld	x,#high(L5053)
7624  0bc1 81            	ret
7625  0bc2               L7734:
7626                     ; 1964 			break;
7628  0bc2               L3023:
7629                     ; 1966 }
7632  0bc2 81            	ret
7672                     ; 1970 BYTE * labelSetupGet(BYTE a_byIndex)
7672                     ; 1971 {
7673                     	switch	.text
7675                     	xref.b	_labelSetupGet$L
7676  0bc3               _labelSetupGet:
7678  0bc3 b700          	ld	_labelSetupGet$L,a
7680                     ; 1972 	switch(parametersGetValue(PARAM_LANGUAGE))
7682  0bc5 a62f          	ld	a,#47
7683  0bc7 cd0000        	call	_parametersGetValue
7686                     ; 1988 			break;
7688  0bca 5d            	tnz	x
7689  0bcb 2647          	jrne	L7264
7690  0bcd a002          	sub	a,#2
7691  0bcf 270b          	jreq	L7164
7692  0bd1 4a            	dec	a
7693  0bd2 2732          	jreq	L5264
7694  0bd4 4a            	dec	a
7695  0bd5 2721          	jreq	L3264
7696  0bd7 4a            	dec	a
7697  0bd8 2710          	jreq	L1264
7698  0bda 2038          	jra	L7264
7699  0bdc               L7164:
7700                     ; 1974 		case PARAM_LANGUAGE_EN: //English
7700                     ; 1975 			return mc_arstrSetupLabelsEN[a_byIndex];
7702  0bdc b600          	ld	a,_labelSetupGet$L
7703  0bde ae17          	ld	x,#23
7704  0be0 42            	mul	x,a
7705  0be1 ab99          	add	a,#low(L347_mc_arstrSetupLabelsEN)
7706  0be3 88            	push	a
7707  0be4 9f            	ld	a,x
7708  0be5 a999          	adc	a,#high(L347_mc_arstrSetupLabelsEN)
7709  0be7 97            	ld	x,a
7710  0be8 84            	pop	a
7713  0be9 81            	ret
7714  0bea               L1264:
7715                     ; 1977 		case PARAM_LANGUAGE_DE: //Deutch
7715                     ; 1978 			return mc_arstrSetupLabelsDE[a_byIndex];
7718  0bea b600          	ld	a,_labelSetupGet$L
7719  0bec ae17          	ld	x,#23
7720  0bee 42            	mul	x,a
7721  0bef ab31          	add	a,#low(L547_mc_arstrSetupLabelsDE)
7722  0bf1 88            	push	a
7723  0bf2 9f            	ld	a,x
7724  0bf3 a931          	adc	a,#high(L547_mc_arstrSetupLabelsDE)
7725  0bf5 97            	ld	x,a
7726  0bf6 84            	pop	a
7729  0bf7 81            	ret
7730  0bf8               L3264:
7731                     ; 1980 		case PARAM_LANGUAGE_ES: //Spanish
7731                     ; 1981 			return mc_arstrSetupLabelsES[a_byIndex];
7734  0bf8 b600          	ld	a,_labelSetupGet$L
7735  0bfa ae17          	ld	x,#23
7736  0bfc 42            	mul	x,a
7737  0bfd ab61          	add	a,#low(L157_mc_arstrSetupLabelsES)
7738  0bff 88            	push	a
7739  0c00 9f            	ld	a,x
7740  0c01 a961          	adc	a,#high(L157_mc_arstrSetupLabelsES)
7741  0c03 97            	ld	x,a
7742  0c04 84            	pop	a
7745  0c05 81            	ret
7746  0c06               L5264:
7747                     ; 1983 		case PARAM_LANGUAGE_FR: //French
7747                     ; 1984 			return mc_arstrSetupLabelsFR[a_byIndex];
7750  0c06 b600          	ld	a,_labelSetupGet$L
7751  0c08 ae17          	ld	x,#23
7752  0c0a 42            	mul	x,a
7753  0c0b abc9          	add	a,#low(L747_mc_arstrSetupLabelsFR)
7754  0c0d 88            	push	a
7755  0c0e 9f            	ld	a,x
7756  0c0f a9c9          	adc	a,#high(L747_mc_arstrSetupLabelsFR)
7757  0c11 97            	ld	x,a
7758  0c12 84            	pop	a
7761  0c13 81            	ret
7762  0c14               L7264:
7763                     ; 1986 		default:  	//PARAM_LANGUAGE_IT - Italian
7763                     ; 1987 			return mc_arstrSetupLabelsIT[a_byIndex];
7766  0c14 b600          	ld	a,_labelSetupGet$L
7767  0c16 ae17          	ld	x,#23
7768  0c18 42            	mul	x,a
7769  0c19 ab01          	add	a,#low(L147_mc_arstrSetupLabelsIT)
7770  0c1b 88            	push	a
7771  0c1c 9f            	ld	a,x
7772  0c1d a901          	adc	a,#high(L147_mc_arstrSetupLabelsIT)
7773  0c1f 97            	ld	x,a
7774  0c20 84            	pop	a
7777  0c21 81            	ret
7778  0c22               L1564:
7779                     ; 1990 }
7782  0c22 81            	ret
7856                     	xdef	_labelSetupGet
7857                     	xdef	_labelGet
7858                     	xref	_parametersGetValue
7859                     	switch	.const
7860  1677               L5164:
7861  1677 496e697a6961  	dc.b	"Iniziale",0
7862  1680               L3164:
7863  1680 5469726f00    	dc.b	"Tiro",0
7864  1685               L1164:
7865  1685 5365676e6f20  	dc.b	"Segno P/N",0
7866  168f               L7064:
7867  168f 6170706c6963  	dc.b	"applicaz.",0
7868  1699               L5064:
7869  1699 53656c657a69  	dc.b	"Selezione",0
7870  16a3               L3064:
7871  16a3 726567697374  	dc.b	"registro volta:",0
7872  16b3               L1064:
7873  16b3 726567697374  	dc.b	"registro bianca:",0
7874  16c4               L7754:
7875  16c4 726567697374  	dc.b	"registro perforazi"
7876  16d6 6f6e653a00    	dc.b	"one:",0
7877  16db               L5754:
7878  16db 726567697374  	dc.b	"registro piega:",0
7879  16eb               L3754:
7880  16eb 726567697374  	dc.b	"registro taglio:",0
7881  16fc               L1754:
7882  16fc 726567697374  	dc.b	"registro ripassagg"
7883  170e 696f3a00      	dc.b	"io:",0
7884  1712               L7654:
7885  1712 726567697374  	dc.b	"registro bianca/vo"
7886  1724 6c74613a00    	dc.b	"lta:",0
7887  1729               L5654:
7888  1729 766f6c746100  	dc.b	"volta",0
7889  172f               L3654:
7890  172f 6269616e6361  	dc.b	"bianca",0
7891  1736               L1654:
7892  1736 506572666f72  	dc.b	"Perforazione",0
7893  1743               L7554:
7894  1743 506965676100  	dc.b	"Piega",0
7895  1749               L5554:
7896  1749 5461676c696f  	dc.b	"Taglio",0
7897  1750               L3554:
7898  1750 526970617373  	dc.b	"Ripassaggio",0
7899  175c               L1554:
7900  175c 4269616e6361  	dc.b	"Bianca/Volta",0
7901  1769               L7454:
7902  1769 436f6e74726f  	dc.b	"Controllo",0
7903  1773               L5454:
7904  1773 4c61766f726f  	dc.b	"Lavoro",0
7905  177a               L3454:
7906  177a 436172696361  	dc.b	"Carica",0
7907  1781               L1454:
7908  1781 6c61766f726f  	dc.b	"lavoro",0
7909  1788               L7354:
7910  1788 53616c766100  	dc.b	"Salva",0
7911  178e               L5354:
7912  178e 5469726f3a00  	dc.b	"Tiro:",0
7913  1794               L3354:
7914  1794 547261733a00  	dc.b	"Tras:",0
7915  179a               L1354:
7916  179a 5365676e6f20  	dc.b	"Segno doppio",0
7917  17a7               L7254:
7918  17a7 446563656c65  	dc.b	"Decelerazione",0
7919  17b5               L5254:
7920  17b5 416363656c65  	dc.b	"Accelerazione",0
7921  17c3               L3254:
7922  17c3 736574757020  	dc.b	"setup completo:",0
7923  17d3               L1254:
7924  17d3 736574757020  	dc.b	"setup semplice:",0
7925  17e3               L7154:
7926  17e3 506172616d65  	dc.b	"Parametri",0
7927  17ed               L5154:
7928  17ed 46756e7a696f  	dc.b	"Funzioni",0
7929  17f6               L3154:
7930  17f6 4c61766f7269  	dc.b	"Lavori",0
7931  17fd               L1154:
7932  17fd 417263686976  	dc.b	"Archivio",0
7933  1806               L7054:
7934  1806 757363697465  	dc.b	"uscite",0
7935  180d               L5054:
7936  180d 74657374696e  	dc.b	"testina",0
7937  1815               L3054:
7938  1815 7375206f6666  	dc.b	"su offset",0
7939  181f               L1054:
7940  181f 44697374616e  	dc.b	"Distanza",0
7941  1828               L7744:
7942  1828 56657273696f  	dc.b	"Versione",0
7943  1831               L5744:
7944  1831 416d7069657a  	dc.b	"Ampiezza",0
7945  183a               L3744:
7946  183a 616c6c61726d  	dc.b	"allarme",0
7947  1842               L1744:
7948  1842 536f676c6961  	dc.b	"Soglia",0
7949  1849               L7644:
7950  1849 5376696c7570  	dc.b	"Sviluppo",0
7951  1852               L5644:
7952  1852 616363656c65  	dc.b	"acceleraz",0
7953  185c               L3644:
7954  185c 466173617475  	dc.b	"Fasatura ad",0
7955  1868               L1644:
7956  1868 466173617475  	dc.b	"Fasatura",0
7957  1871               L7544:
7958  1871 6572726f7265  	dc.b	"errore",0
7959  1878               L5544:
7960  1878 417a7a657261  	dc.b	"Azzeramento",0
7961  1884               L3544:
7962  1884 726567697374  	dc.b	"registro:",0
7963  188e               L1544:
7964  188e 6f7363696c6c  	dc.b	"oscilloscopio:",0
7965  189d               L7444:
7966  189d 666173617475  	dc.b	"fasatura a correzi"
7967  18af 6f6e65207261  	dc.b	"one rapida:",0
7968  18bb               L5444:
7969  18bb 666173617475  	dc.b	"fasatura con oscil"
7970  18cd 6c6f73636f70  	dc.b	"loscopio:",0
7971  18d7               L3444:
7972  18d7 6e6f6e207269  	dc.b	"non riconosciuto",0
7973  18e8               L1444:
7974  18e8 416c6c61726d  	dc.b	"Allarme  ",0
7975  18f2               L7344:
7976  18f2 4e657373756e  	dc.b	"Nessun problema",0
7977  1902               L5344:
7978  1902 416d7069657a  	dc.b	"Ampiezza Gate (P3)",0
7979  1915               L3344:
7980  1915 6e6f6e206163  	dc.b	"non accettabile",0
7981  1925               L1344:
7982  1925 5376696c7570  	dc.b	"Sviluppo Cilindro "
7983  1937 2850312900    	dc.b	"(P1)",0
7984  193c               L7244:
7985  193c 66616c6c6974  	dc.b	"fallita",0
7986  1944               L5244:
7987  1944 466173617475  	dc.b	"Fasatura automatic"
7988  1956 6100          	dc.b	"a",0
7989  1958               L3244:
7990  1958 66616c6c6974  	dc.b	"fallito",0
7991  1960               L1244:
7992  1960 546573742074  	dc.b	"Test testina",0
7993  196d               L7144:
7994  196d 56656c6f6369  	dc.b	"Velocita' bassa",0
7995  197d               L5144:
7996  197d 4d616e63616e  	dc.b	"Mancanza stampa",0
7997  198d               L3144:
7998  198d 616c6c61726d  	dc.b	"allarme:",0
7999  1996               L1144:
8000  1996 6d6573736167  	dc.b	"messaggio:",0
8001  19a1               L7044:
8002  19a1 63696c696e3a  	dc.b	"cilin:",0
8003  19a8               L5044:
8004  19a8 76656c6f6369  	dc.b	"velocita:",0
8005  19b2               L3044:
8006  19b2 6d616e75616c  	dc.b	"manuale",0
8007  19ba               L1044:
8008  19ba 6d6f646f3a00  	dc.b	"modo:",0
8009  19c0               L3734:
8010  19c0 496e69746961  	dc.b	"Initial",0
8011  19c8               L1734:
8012  19c8 4d6172717565  	dc.b	"Marque P/N",0
8013  19d3               L7634:
8014  19d3 4e6567617469  	dc.b	"Negatif",0
8015  19db               L5634:
8016  19db 4d6172717565  	dc.b	"Marque",0
8017  19e2               L3634:
8018  19e2 61706c696361  	dc.b	"aplication",0
8019  19ed               L1634:
8020  19ed 726570657261  	dc.b	"reperage verso",0
8021  19fc               L7534:
8022  19fc 726570657261  	dc.b	"reperage recto",0
8023  1a0b               L5534:
8024  1a0b 726570657261  	dc.b	"reperage perforati"
8025  1a1d 6f6e00        	dc.b	"on",0
8026  1a20               L3534:
8027  1a20 726570657261  	dc.b	"reperage pli",0
8028  1a2d               L1534:
8029  1a2d 726570657261  	dc.b	"reperage coupe",0
8030  1a3c               L7434:
8031  1a3c 726570657261  	dc.b	"reperage insetter",0
8032  1a4e               L5434:
8033  1a4e 726570657261  	dc.b	"reperage recto/ver"
8034  1a60 736f00        	dc.b	"so",0
8035  1a63               L3434:
8036  1a63 506c6900      	dc.b	"Pli",0
8037  1a67               L1434:
8038  1a67 436f7570e900  	dc.b	"Coup",233,0
8039  1a6d               L7334:
8040  1a6d 436f6e74726f  	dc.b	"Controle",0
8041  1a76               L5334:
8042  1a76 436861726765  	dc.b	"Charge",0
8043  1a7d               L3334:
8044  1a7d 547261766169  	dc.b	"Travail",0
8045  1a85               L1334:
8046  1a85 536175766572  	dc.b	"Sauver",0
8047  1a8c               L7234:
8048  1a8c 74656e733a00  	dc.b	"tens:",0
8049  1a92               L5234:
8050  1a92 4d616e75656c  	dc.b	"Manuel",0
8051  1a99               L3234:
8052  1a99 646f75626c65  	dc.b	"double marque",0
8053  1aa7               L1234:
8054  1aa7 736574757020  	dc.b	"setup complet",0
8055  1ab5               L7134:
8056  1ab5 736574757020  	dc.b	"setup simple",0
8057  1ac2               L5134:
8058  1ac2 466f6e637469  	dc.b	"Fonctiones",0
8059  1acd               L3134:
8060  1acd 547261766175  	dc.b	"Travaux",0
8061  1ad5               L1134:
8062  1ad5 417263686976  	dc.b	"Archives",0
8063  1ade               L7034:
8064  1ade 4f7363696c6c  	dc.b	"Oscilloscope",0
8065  1aeb               L5034:
8066  1aeb 526567697374  	dc.b	"Registre",0
8067  1af4               L3034:
8068  1af4 736f72746965  	dc.b	"sorties",0
8069  1afc               L1034:
8070  1afc 5465746500    	dc.b	"Tete",0
8071  1b01               L7724:
8072  1b01 737572206f66  	dc.b	"sur offset",0
8073  1b0c               L5724:
8074  1b0c 44697374616e  	dc.b	"Distance",0
8075  1b15               L3724:
8076  1b15 4574656e6475  	dc.b	"Etendue",0
8077  1b1d               L1724:
8078  1b1d 616c61726d00  	dc.b	"alarm",0
8079  1b23               L7624:
8080  1b23 736575696c00  	dc.b	"seuil",0
8081  1b29               L5624:
8082  1b29 63796c696e64  	dc.b	"cylindre",0
8083  1b32               L3624:
8084  1b32 616363656c65  	dc.b	"acceleration",0
8085  1b3f               L1624:
8086  1b3f 63616c616765  	dc.b	"calage",0
8087  1b46               L7524:
8088  1b46 6d6574726520  	dc.b	"metre au zero",0
8089  1b54               L5524:
8090  1b54 726567697374  	dc.b	"registre",0
8091  1b5d               L3524:
8092  1b5d 6f7363696c6c  	dc.b	"oscilloscope",0
8093  1b6a               L1524:
8094  1b6a 63616c616765  	dc.b	"calage avec rapide"
8095  1b7c 20636f727265  	dc.b	" correction",0
8096  1b88               L7424:
8097  1b88 63616c616765  	dc.b	"calage avec oscill"
8098  1b9a 6f73636f7065  	dc.b	"oscope",0
8099  1ba1               L5424:
8100  1ba1 6e6520706173  	dc.b	"ne pas reconnu",0
8101  1bb0               L3424:
8102  1bb0 416c61726d65  	dc.b	"Alarme",0
8103  1bb7               L1424:
8104  1bb7 457370616365  	dc.b	"Espace de Lecture "
8105  1bc9 2850332900    	dc.b	"(P3)",0
8106  1bce               L7324:
8107  1bce 696e61636365  	dc.b	"inacceptable",0
8108  1bdb               L5324:
8109  1bdb 44696d656e73  	dc.b	"Dimension du Cylin"
8110  1bed 647265202850  	dc.b	"dre (P1)",0
8111  1bf6               L3324:
8112  1bf6 43616c676520  	dc.b	"Calge automatique",0
8113  1c08               L1324:
8114  1c08 657272657572  	dc.b	"erreur",0
8115  1c0f               L7224:
8116  1c0f 6c6120746574  	dc.b	"la tete erreur",0
8117  1c1e               L5224:
8118  1c1e 546573742064  	dc.b	"Test de",0
8119  1c26               L3224:
8120  1c26 626173207669  	dc.b	"bas vitesse",0
8121  1c32               L1224:
8122  1c32 506173206465  	dc.b	"Pas de signe",0
8123  1c3f               L7124:
8124  1c3f 616c61726d65  	dc.b	"alarme",0
8125  1c46               L5124:
8126  1c46 6d6573736167  	dc.b	"message",0
8127  1c4e               L3124:
8128  1c4e 7461696c6c65  	dc.b	"taille:",0
8129  1c56               L1124:
8130  1c56 7669743a00    	dc.b	"vit:",0
8131  1c5b               L7024:
8132  1c5b 766974657373  	dc.b	"vitesse",0
8133  1c63               L5024:
8134  1c63 6175746f6d61  	dc.b	"automatique",0
8135  1c6f               L3024:
8136  1c6f 6d616e75656c  	dc.b	"manuel",0
8137  1c76               L1024:
8138  1c76 6d6f64616c69  	dc.b	"modalite",0
8139  1c7f               L3714:
8140  1c7f 496e69636961  	dc.b	"Inicial",0
8141  1c87               L1714:
8142  1c87 54656e73696f  	dc.b	"Tension",0
8143  1c8f               L7614:
8144  1c8f 4d6172636120  	dc.b	"Marca P/N",0
8145  1c99               L5614:
8146  1c99 4e6567617469  	dc.b	"Negativa",0
8147  1ca2               L3614:
8148  1ca2 506f73697469  	dc.b	"Positiva",0
8149  1cab               L1614:
8150  1cab 4d6172636100  	dc.b	"Marca",0
8151  1cb1               L7514:
8152  1cb1 61706c696361  	dc.b	"aplicacion",0
8153  1cbc               L5514:
8154  1cbc 53656c656363  	dc.b	"Seleccion",0
8155  1cc6               L3514:
8156  1cc6 726567697374  	dc.b	"registro verso",0
8157  1cd5               L1514:
8158  1cd5 726567697374  	dc.b	"registro recto",0
8159  1ce4               L7414:
8160  1ce4 726567697374  	dc.b	"registro perforaci"
8161  1cf6 6f6e00        	dc.b	"on",0
8162  1cf9               L5414:
8163  1cf9 726567697374  	dc.b	"registro pliegue",0
8164  1d0a               L3414:
8165  1d0a 726567697374  	dc.b	"registro corte",0
8166  1d19               L1414:
8167  1d19 726567697374  	dc.b	"registro insetter",0
8168  1d2b               L7314:
8169  1d2b 726567697374  	dc.b	"registro recto/ver"
8170  1d3d 736f00        	dc.b	"so",0
8171  1d40               L5314:
8172  1d40 766572736f00  	dc.b	"verso",0
8173  1d46               L3314:
8174  1d46 726563746f00  	dc.b	"recto",0
8175  1d4c               L1314:
8176  1d4c 506572666f72  	dc.b	"Perforacion",0
8177  1d58               L7214:
8178  1d58 506c69656775  	dc.b	"Pliegue",0
8179  1d60               L5214:
8180  1d60 436f72746500  	dc.b	"Corte",0
8181  1d66               L3214:
8182  1d66 526563746f2f  	dc.b	"Recto/Verso",0
8183  1d72               L1214:
8184  1d72 436f6e74726f  	dc.b	"Control",0
8185  1d7a               L7114:
8186  1d7a 436172676172  	dc.b	"Cargar",0
8187  1d81               L5114:
8188  1d81 54726162616a  	dc.b	"Trabajo",0
8189  1d89               L3114:
8190  1d89 53616c766172  	dc.b	"Salvar",0
8191  1d90               L1114:
8192  1d90 747261733a00  	dc.b	"tras:",0
8193  1d96               L7014:
8194  1d96 636972633a00  	dc.b	"circ:",0
8195  1d9c               L5014:
8196  1d9c 646f626c6520  	dc.b	"doble marca",0
8197  1da8               L3014:
8198  1da8 446563656c65  	dc.b	"Deceleracion",0
8199  1db5               L1014:
8200  1db5 4163656c6572  	dc.b	"Aceleracion",0
8201  1dc1               L7704:
8202  1dc1 736574757020  	dc.b	"setup total",0
8203  1dcd               L5704:
8204  1dcd 736574757020  	dc.b	"setup sencillo",0
8205  1ddc               L3704:
8206  1ddc 506172616d65  	dc.b	"Parametros",0
8207  1de7               L1704:
8208  1de7 66756e63696f  	dc.b	"funciones",0
8209  1df1               L7604:
8210  1df1 54726162616a  	dc.b	"Trabajos",0
8211  1dfa               L5604:
8212  1dfa 417263686976  	dc.b	"Archivo",0
8213  1e02               L3604:
8214  1e02 4f7363696c6f  	dc.b	"Osciloscopio",0
8215  1e0f               L1604:
8216  1e0f 526567697374  	dc.b	"Registro",0
8217  1e18               L7504:
8218  1e18 73616c696461  	dc.b	"salidas",0
8219  1e20               L5504:
8220  1e20 656e636f6465  	dc.b	"encoder",0
8221  1e28               L3504:
8222  1e28 436162657a61  	dc.b	"Cabeza",0
8223  1e2f               L1504:
8224  1e2f 6465206f6666  	dc.b	"de offset",0
8225  1e39               L7404:
8226  1e39 44697374616e  	dc.b	"Distancia",0
8227  1e43               L5404:
8228  1e43 6761746500    	dc.b	"gate",0
8229  1e48               L3404:
8230  1e48 457370616369  	dc.b	"Espacio",0
8231  1e50               L1404:
8232  1e50 756d6272616c  	dc.b	"umbral",0
8233  1e57               L7304:
8234  1e57 63696c696e64  	dc.b	"cilindro",0
8235  1e60               L5304:
8236  1e60 646573617272  	dc.b	"desarrollo",0
8237  1e6b               L3304:
8238  1e6b 6163656c6572  	dc.b	"aceleracion",0
8239  1e77               L1304:
8240  1e77 6f7363696c6f  	dc.b	"osciloscop",0
8241  1e82               L7204:
8242  1e82 6175746f6d61  	dc.b	"automatica",0
8243  1e8d               L5204:
8244  1e8d 707565737461  	dc.b	"puesta a cero",0
8245  1e9b               L3204:
8246  1e9b 726567697374  	dc.b	"registro",0
8247  1ea4               L1204:
8248  1ea4 6f7363696c6f  	dc.b	"osciloscopio",0
8249  1eb1               L7104:
8250  1eb1 466173652063  	dc.b	"Fase con correccio"
8251  1ec3 6e2072617069  	dc.b	"n rapida",0
8252  1ecc               L5104:
8253  1ecc 466173652063  	dc.b	"Fase con oscilosco"
8254  1ede 70696f00      	dc.b	"pio",0
8255  1ee2               L3104:
8256  1ee2 646573636f6e  	dc.b	"desconocido",0
8257  1eee               L1104:
8258  1eee 416c61726d61  	dc.b	"Alarma",0
8259  1ef5               L7004:
8260  1ef5 457370616369  	dc.b	"Espacio de Lectura"
8261  1f07 202850332900  	dc.b	" (P3)",0
8262  1f0d               L5004:
8263  1f0d 6e6f6e206164  	dc.b	"non admisible",0
8264  1f1b               L3004:
8265  1f1b 446573617272  	dc.b	"Desarrollo del Cil"
8266  1f2d 696e64726f20  	dc.b	"indro (P1)",0
8267  1f38               L1004:
8268  1f38 6175746f6d61  	dc.b	"automatica error",0
8269  1f49               L7773:
8270  1f49 4661736500    	dc.b	"Fase",0
8271  1f4e               L5773:
8272  1f4e 6572726f7200  	dc.b	"error",0
8273  1f54               L3773:
8274  1f54 546573742065  	dc.b	"Test encoder",0
8275  1f61               L1773:
8276  1f61 6578706c6f72  	dc.b	"exploradora error",0
8277  1f73               L7673:
8278  1f73 546573742063  	dc.b	"Test cabeza",0
8279  1f7f               L5673:
8280  1f7f 56656c6f6369  	dc.b	"Velocidad lenta",0
8281  1f8f               L3673:
8282  1f8f 46616c746120  	dc.b	"Falta de signo",0
8283  1f9e               L1673:
8284  1f9e 616c61726d61  	dc.b	"alarma",0
8285  1fa5               L7573:
8286  1fa5 6d656e73616a  	dc.b	"mensaje",0
8287  1fad               L5573:
8288  1fad 74616d616e6f  	dc.b	"tamano:",0
8289  1fb5               L3573:
8290  1fb5 76656c3a00    	dc.b	"vel:",0
8291  1fba               L1573:
8292  1fba 76656c6f6369  	dc.b	"velocidad",0
8293  1fc4               L7473:
8294  1fc4 6175746f6d61  	dc.b	"automatico",0
8295  1fcf               L5473:
8296  1fcf 6d6f646f00    	dc.b	"modo",0
8297  1fd4               L7373:
8298  1fd4 416e66616e67  	dc.b	"Anfangs",0
8299  1fdc               L5373:
8300  1fdc 5370616e6e75  	dc.b	"Spannung",0
8301  1fe5               L3373:
8302  1fe5 4d61726b6520  	dc.b	"Marke P/N",0
8303  1fef               L1373:
8304  1fef 4e6567617469  	dc.b	"Negativ",0
8305  1ff7               L7273:
8306  1ff7 506f73697469  	dc.b	"Positiv",0
8307  1fff               L5273:
8308  1fff 4d61726b6500  	dc.b	"Marke",0
8309  2005               L3273:
8310  2005 416e77656e64  	dc.b	"Anwendung",0
8311  200f               L1273:
8312  200f 417573776168  	dc.b	"Auswahl",0
8313  2017               L7173:
8314  2017 52fc          	dc.b	"R",252
8315  2019 636b73656974  	dc.b	"ckseite register",0
8316  202a               L5173:
8317  202a 566f72646572  	dc.b	"Vorder Register",0
8318  203a               L3173:
8319  203a 506572666f72  	dc.b	"Perforation Regist"
8320  204c 657200        	dc.b	"er",0
8321  204f               L1173:
8322  204f 46616c7a2052  	dc.b	"Falz Register",0
8323  205d               L7073:
8324  205d 5363686e6974  	dc.b	"Schnitt Register",0
8325  206e               L5073:
8326  206e 496e73657474  	dc.b	"Insetter Register",0
8327  2080               L3073:
8328  2080 566f72646572  	dc.b	"Vorder/R",252
8329  2089 636b73656974  	dc.b	"ckseite Register",0
8330  209a               L1073:
8331  209a 52fc          	dc.b	"R",252
8332  209c 636b73656974  	dc.b	"ckseite",0
8333  20a4               L7763:
8334  20a4 566f72646572  	dc.b	"Vorder",0
8335  20ab               L5763:
8336  20ab 46616c7a00    	dc.b	"Falz",0
8337  20b0               L3763:
8338  20b0 5363686e6974  	dc.b	"Schnitt",0
8339  20b8               L1763:
8340  20b8 566f72646572  	dc.b	"Vorder/Ruckseite",0
8341  20c9               L7663:
8342  20c9 537465756572  	dc.b	"Steuerung",0
8343  20d3               L5663:
8344  20d3 6c6164656e00  	dc.b	"laden",0
8345  20d9               L3663:
8346  20d9 417262656974  	dc.b	"Arbeit",0
8347  20e0               L1663:
8348  20e0 737065696368  	dc.b	"speichern",0
8349  20ea               L7563:
8350  20ea 5370616e2e00  	dc.b	"Span.",0
8351  20f0               L5563:
8352  20f0 7175657200    	dc.b	"quer",0
8353  20f5               L3563:
8354  20f5 6c616e67733a  	dc.b	"langs:",0
8355  20fc               L1563:
8356  20fc 6d616e2e00    	dc.b	"man.",0
8357  2101               L7463:
8358  2101 646f7070656c  	dc.b	"doppel Marke",0
8359  210e               L5463:
8360  210e 52fc          	dc.b	"R",252
8361  2110 63686c617566  	dc.b	"chlauf",0
8362  2117               L3463:
8363  2117 486f63686c61  	dc.b	"Hochlauf",0
8364  2120               L1463:
8365  2120 766f6c6c7374  	dc.b	"vollstandig Setup",0
8366  2132               L7363:
8367  2132 6c6569636874  	dc.b	"leicht Setup",0
8368  213f               L5363:
8369  213f 506172616d65  	dc.b	"Parametern",0
8370  214a               L3363:
8371  214a 46756e6b7469  	dc.b	"Funktionen",0
8372  2155               L1363:
8373  2155 417262656974  	dc.b	"Arbeiten",0
8374  215e               L7263:
8375  215e 417263686976  	dc.b	"Archiv",0
8376  2165               L5263:
8377  2165 41757367616e  	dc.b	"Ausgangen",0
8378  216f               L3263:
8379  216f 5465737400    	dc.b	"Test",0
8380  2174               L1263:
8381  2174 6f6666736574  	dc.b	"offset",0
8382  217b               L7163:
8383  217b 456e74666572  	dc.b	"Entfernung",0
8384  2186               L5163:
8385  2186 546f7200      	dc.b	"Tor",0
8386  218a               L3163:
8387  218a 576569746500  	dc.b	"Weite",0
8388  2190               L1163:
8389  2190 4c696d697400  	dc.b	"Limit",0
8390  2196               L7063:
8391  2196 7a796c696e64  	dc.b	"zylinder",0
8392  219f               L5063:
8393  219f 64696d656e73  	dc.b	"dimension",0
8394  21a9               L3063:
8395  21a9 62657363686c  	dc.b	"beschleunigung",0
8396  21b8               L1063:
8397  21b8 45696e737465  	dc.b	"Einstellung a",0
8398  21c6               L7753:
8399  21c6 6175746f6d61  	dc.b	"automatisch",0
8400  21d2               L5753:
8401  21d2 45696e737465  	dc.b	"Einstellung",0
8402  21de               L3753:
8403  21de 4665686c6572  	dc.b	"Fehler",0
8404  21e5               L1753:
8405  21e5 4e756c6c6569  	dc.b	"Nulleinstel.",0
8406  21f2               L7653:
8407  21f2 4f737a696c6c  	dc.b	"Oszilloskop",0
8408  21fe               L5653:
8409  21fe 45696e737465  	dc.b	"Einstellung Verbes"
8410  2210 736572756e67  	dc.b	"serung stromschene"
8411  2222 6c6c6500      	dc.b	"lle",0
8412  2226               L3653:
8413  2226 45696e737465  	dc.b	"Einstellung mit de"
8414  2238 6d204f737a69  	dc.b	"m Oszilloskop",0
8415  2246               L1653:
8416  2246 6e6963687420  	dc.b	"nicht anerkannt",0
8417  2256               L7553:
8418  2256 4f4b00        	dc.b	"OK",0
8419  2259               L5553:
8420  2259 546f72205765  	dc.b	"Tor Weite (P3)",0
8421  2268               L3553:
8422  2268 6e6963687420  	dc.b	"nicht akzeptabel",0
8423  2279               L1553:
8424  2279 466f726d6174  	dc.b	"Format Zylinder (P"
8425  228b 312900        	dc.b	"1)",0
8426  228e               L7453:
8427  228e 45696e737465  	dc.b	"Einstellung Irrtum",0
8428  22a1               L5453:
8429  22a1 4175746f6d61  	dc.b	"Automatische",0
8430  22ae               L3453:
8431  22ae 49727274756d  	dc.b	"Irrtum",0
8432  22b5               L1453:
8433  22b5 456e636f6465  	dc.b	"Encoder test",0
8434  22c2               L7353:
8435  22c2 746573742049  	dc.b	"test Irrtum",0
8436  22ce               L5353:
8437  22ce 4c6573656b6f  	dc.b	"Lesekopf",0
8438  22d7               L3353:
8439  22d7 6c616e677361  	dc.b	"langsam Geschwindi"
8440  22e9 676b65697400  	dc.b	"gkeit",0
8441  22ef               L1353:
8442  22ef 447275636b20  	dc.b	"Druck fehlt",0
8443  22fb               L7253:
8444  22fb 4e6163687269  	dc.b	"Nachricht",0
8445  2305               L5253:
8446  2305 67726f737365  	dc.b	"grosse:",0
8447  230d               L3253:
8448  230d 47657363683a  	dc.b	"Gesch:",0
8449  2314               L1253:
8450  2314 476573636877  	dc.b	"Geschwindigkeit",0
8451  2324               L7153:
8452  2324 6175746f6d61  	dc.b	"automatik",0
8453  232e               L5153:
8454  232e 6d616e75656c  	dc.b	"manuell",0
8455  2336               L3153:
8456  2336 42657374696d  	dc.b	"Bestimmung",0
8457  2341               L5053:
8458  2341 4552525f4944  	dc.b	"ERR_IDX",0
8459  2349               L3053:
8460  2349 76616c756500  	dc.b	"value",0
8461  234f               L1053:
8462  234f 54656e73696f  	dc.b	"Tension base",0
8463  235c               L7743:
8464  235c 53656c656374  	dc.b	"Selection",0
8465  2366               L5743:
8466  2366 502f4e204d61  	dc.b	"P/N Mark",0
8467  236f               L3743:
8468  236f 4e6567617469  	dc.b	"Negative",0
8469  2378               L1743:
8470  2378 4d61726b00    	dc.b	"Mark",0
8471  237d               L7643:
8472  237d 506f73697469  	dc.b	"Positive",0
8473  2386               L5643:
8474  2386 73656c656374  	dc.b	"selection",0
8475  2390               L3643:
8476  2390 4170706c6963  	dc.b	"Application",0
8477  239c               L1643:
8478  239c 3200          	dc.b	"2",0
8479  239e               L7543:
8480  239e 3100          	dc.b	"1",0
8481  23a0               L5543:
8482  23a0 4261636b7369  	dc.b	"Backside register:",0
8483  23b3               L3543:
8484  23b3 46726f6e7473  	dc.b	"Frontside register"
8485  23c5 3a00          	dc.b	":",0
8486  23c7               L1543:
8487  23c7 506572666f72  	dc.b	"Perforation regist"
8488  23d9 65723a00      	dc.b	"er:",0
8489  23dd               L7443:
8490  23dd 57656220666f  	dc.b	"Web folding regist"
8491  23ef 65723a00      	dc.b	"er:",0
8492  23f3               L5443:
8493  23f3 43757474696e  	dc.b	"Cutting-off regist"
8494  2405 65723a00      	dc.b	"er:",0
8495  2409               L3443:
8496  2409 696e73657474  	dc.b	"insetter register:",0
8497  241c               L1443:
8498  241c 46726f6e742f  	dc.b	"Front/Backside reg"
8499  242e 69737465723a  	dc.b	"ister:",0
8500  2435               L7343:
8501  2435 4261636b7369  	dc.b	"Backside",0
8502  243e               L5343:
8503  243e 46726f6e7473  	dc.b	"Frontside",0
8504  2448               L3343:
8505  2448 506572666f72  	dc.b	"Perforation",0
8506  2454               L1343:
8507  2454 57656220666f  	dc.b	"Web folding",0
8508  2460               L7243:
8509  2460 43757474696e  	dc.b	"Cutting",0
8510  2468               L5243:
8511  2468 496e73657474  	dc.b	"Insetter",0
8512  2471               L3243:
8513  2471 6170706c6963  	dc.b	"application",0
8514  247d               L1243:
8515  247d 46726f6e742f  	dc.b	"Front/Back",0
8516  2488               L7143:
8517  2488 4c6f616400    	dc.b	"Load",0
8518  248d               L5143:
8519  248d 4a6f6200      	dc.b	"Job",0
8520  2491               L3143:
8521  2491 5361766500    	dc.b	"Save",0
8522  2496               L1143:
8523  2496 54656e733a00  	dc.b	"Tens:",0
8524  249c               L7043:
8525  249c 5472616e3a00  	dc.b	"Tran:",0
8526  24a2               L5043:
8527  24a2 4c6f6e673a00  	dc.b	"Long:",0
8528  24a8               L3043:
8529  24a8 4175746f00    	dc.b	"Auto",0
8530  24ad               L1043:
8531  24ad 446f75626c65  	dc.b	"Double Mark",0
8532  24b9               L7733:
8533  24b9 446563656c65  	dc.b	"Deceleration",0
8534  24c6               L5733:
8535  24c6 416363656c65  	dc.b	"Acceleration",0
8536  24d3               L3733:
8537  24d3 66756c6c2073  	dc.b	"full setup:",0
8538  24df               L1733:
8539  24df 73696d706c65  	dc.b	"simple setup:",0
8540  24ed               L7633:
8541  24ed 546573747300  	dc.b	"Tests",0
8542  24f3               L5633:
8543  24f3 506172616d65  	dc.b	"Parameters",0
8544  24fe               L3633:
8545  24fe 46756e637469  	dc.b	"Functions",0
8546  2508               L1633:
8547  2508 617263686976  	dc.b	"archive",0
8548  2510               L7533:
8549  2510 4a6f627300    	dc.b	"Jobs",0
8550  2515               L5533:
8551  2515 4f7363696c6c  	dc.b	"Oscilloscop",0
8552  2521               L3533:
8553  2521 526567697374  	dc.b	"Register",0
8554  252a               L1533:
8555  252a 56697375616c  	dc.b	"Visual",0
8556  2531               L7433:
8557  2531 4f7574707574  	dc.b	"Outputs",0
8558  2539               L5433:
8559  2539 7465737400    	dc.b	"test",0
8560  253e               L3433:
8561  253e 686561642074  	dc.b	"head test",0
8562  2548               L1433:
8563  2548 5363616e6e69  	dc.b	"Scanning ",0
8564  2552               L7333:
8565  2552 64697374616e  	dc.b	"distance",0
8566  255b               L5333:
8567  255b 4f6666736574  	dc.b	"Offset",0
8568  2562               L3333:
8569  2562 56657273696f  	dc.b	"Version",0
8570  256a               L1333:
8571  256a 536f66747761  	dc.b	"Software",0
8572  2573               L7233:
8573  2573 776964746800  	dc.b	"width",0
8574  2579               L5233:
8575  2579 4761746500    	dc.b	"Gate",0
8576  257e               L3233:
8577  257e 626f756e6400  	dc.b	"bound",0
8578  2584               L1233:
8579  2584 416c61726d00  	dc.b	"Alarm",0
8580  258a               L7133:
8581  258a 73697a6500    	dc.b	"size",0
8582  258f               L5133:
8583  258f 43796c696e64  	dc.b	"Cylinder",0
8584  2598               L3133:
8585  2598 466173742063  	dc.b	"Fast correct",0
8586  25a5               L1133:
8587  25a5 6f7363696c6c  	dc.b	"oscilloscop",0
8588  25b1               L7033:
8589  25b1 506861736520  	dc.b	"Phase with",0
8590  25bc               L5033:
8591  25bc 4175746f6d61  	dc.b	"Automatic",0
8592  25c6               L3033:
8593  25c6 706861736500  	dc.b	"phase",0
8594  25cc               L1033:
8595  25cc 4d616e75616c  	dc.b	"Manual",0
8596  25d3               L7723:
8597  25d3 726573657400  	dc.b	"reset",0
8598  25d9               L5723:
8599  25d9 4572726f7200  	dc.b	"Error",0
8600  25df               L3723:
8601  25df 726567697374  	dc.b	"register:",0
8602  25e9               L1723:
8603  25e9 6f7363696c6c  	dc.b	"oscilloscope:",0
8604  25f7               L7623:
8605  25f7 666173742063  	dc.b	"fast correction ph"
8606  2609 6173653a00    	dc.b	"ase:",0
8607  260e               L5623:
8608  260e 706861736520  	dc.b	"phase with oscillo"
8609  2620 73636f70653a  	dc.b	"scope:",0
8610  2627               L3623:
8611  2627 6e6f6e207265  	dc.b	"non recognized",0
8612  2636               L1623:
8613  2636 416c61726d20  	dc.b	"Alarm  ",0
8614  263e               L7523:
8615  263e 4e6f2070726f  	dc.b	"No problem",0
8616  2649               L5523:
8617  2649 476174652028  	dc.b	"Gate (P3)",0
8618  2653               L3523:
8619  2653 6e6f6e206163  	dc.b	"non acceptable",0
8620  2662               L1523:
8621  2662 43796c696e64  	dc.b	"Cylinder size (P1)",0
8622  2675               L7423:
8623  2675 6661696c6564  	dc.b	"failed",0
8624  267c               L5423:
8625  267c 4175746f6d61  	dc.b	"Automatic Phase",0
8626  268c               L3423:
8627  268c 456e636f6465  	dc.b	"Encoder",0
8628  2694               L1423:
8629  2694 746573742066  	dc.b	"test failed",0
8630  26a0               L7323:
8631  26a0 5363616e6e69  	dc.b	"Scanning Head",0
8632  26ae               L5323:
8633  26ae 4c6f77207370  	dc.b	"Low speed",0
8634  26b8               L3323:
8635  26b8 4e6f20707269  	dc.b	"No print",0
8636  26c1               L1323:
8637  26c1 616c61726d3a  	dc.b	"alarm:",0
8638  26c8               L7223:
8639  26c8 6d6573736167  	dc.b	"message:",0
8640  26d1               L5223:
8641  26d1 6d742f6d696e  	dc.b	"mt/min",0
8642  26d8               L3223:
8643  26d8 73697a653a00  	dc.b	"size:",0
8644  26de               L1223:
8645  26de 7370643a00    	dc.b	"spd:",0
8646  26e3               L7123:
8647  26e3 73706565643a  	dc.b	"speed:",0
8648  26ea               L5123:
8649  26ea 6175746f6d61  	dc.b	"automatic",0
8650  26f4               L3123:
8651  26f4 6d616e75616c  	dc.b	"manual",0
8652  26fb               L1123:
8653  26fb 6d6f64653a00  	dc.b	"mode:",0
8673                     	end
