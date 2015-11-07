"Contains functions to format Integers as either hex or bits Strings with padding and underscores to
 make them more readable.

        print(formatAndPadAsBits(30));

 &gt; <b>0001_1110</b>

        print(formatAndPadAsHex(500000);

 &gt; <b>0007_a120</b>

         print(formatAndPadAsHexNoUnderscores(500000, 4));

 &gt; <b>0007a120</b>
"

by("Luke deGruchy")

shared package herd.chayote.format;
