del sim200.map
asm -li sim200.asm
lyn sim200.obj,sim200.cod;
asm sim200.asm -sym -fi=sim200.map
obsend sim200,f,sim200.hex,intel
