"Support left and right bit rotation on [[Integer]]s.
 
        rotateLeft($1010_0101, 4);
 &gt; <b>$1010_0101_0000</b>

         rotateRight($1010_0101, 4);
 &gt; <b>$0101_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1010</b>
 
 "

by("Luke deGruchy")

shared package herd.chayote.integer;
