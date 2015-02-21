ECHO OFF
.\az80.exe TAJ200.msa TAJ200.lst TAJ200.a01
CLS
.\az80.exe TAJ200.msa
rem PAUSE
.\xlink -cz80 .\TAJ200 -o .\TAJ200.a01
del /q .\bin 
move .\TAJ200.a01 .\bin\TAJ200.a01
move .\TAJ200.r01 .\bin\TAJ200.r01
copy .\bin\TAJ200.a01 T:\TAJ200\TAJ200.a01
copy .\bin\TAJ200.r01 T:\TAJ200\TAJ200.r01
ECHO ON