" Contains functions to translate Integers into Sequences of Bytes
      integerToBytes(941226) 
 &gt; <b>[0, 0, 0, 0, 0, $1110.byte, $0101_1100.byte, $1010_1010.byte]</b>

        integerToBytesNoZeros(941226);

 &gt; <b>[$1110.byte, $0101_1100.byte, $1010_1010.byte]</b>
 
 "

by("Luke deGruchy")

shared package herd.chayote.bytes;
