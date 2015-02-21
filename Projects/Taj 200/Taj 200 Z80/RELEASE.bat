echo off
del "U:\roberto.maiocchi\file x eprom\file in uso\TAJ 200\T200_*.HEX" /q
del "U:\roberto.maiocchi\file x eprom\file in uso\TAJ 200\T200_*.MSA" /q
del "U:\roberto.maiocchi\file x eprom\archivio\Taj 200\T200_%1.HEX" /q
del "U:\roberto.maiocchi\file x eprom\archivio\Taj 200\T200_%1.MSA" /q

copy "D:\Projects\Zelo\Taj 200\Taj 200 Z80\bin\TAJ200.a01" "U:\roberto.maiocchi\file x eprom\file in uso\TAJ 200\T200_%1.HEX"
copy "D:\Projects\Zelo\Taj 200\Taj 200 Z80\TAJ200.msa" "U:\roberto.maiocchi\file x eprom\file in uso\TAJ 200\T200_%1.MSA"
copy "D:\Projects\Zelo\Taj 200\Taj 200 Z80\bin\TAJ200.a01" "U:\roberto.maiocchi\file x eprom\archivio\Taj 200\T200_%1.HEX"
copy "D:\Projects\Zelo\Taj 200\Taj 200 Z80\TAJ200.msa" "U:\roberto.maiocchi\file x eprom\archivio\Taj 200\T200_%1.MSA"

del "U:\walter.avanzi\Backup\T200_%1.rar"
"C:\Program Files\WinRAR\rar.exe" a "U:\walter.avanzi\Backup\T200_%1.rar" "D:\Projects\Zelo\Taj 200\Taj 200 Z80\*.msa"

echo on

EXPLORER "U:\roberto.maiocchi\file x eprom\file in uso\TAJ 200"
EXPLORER "U:\walter.avanzi\Backup"