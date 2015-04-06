Ceylon Chayote
====================

Various utility classes and methods for Ceylon.  These are intended to all be written in native Ceylon,
with no dependency on JDK-specific modules.
---------------------

 Format Integers as either hex or bits Strings with padding and underscores to make them more readable.

        print(formatAndPadAsBits(30));

 &gt; <b>0001_1110</b>

        print(formatAndPadAsHex(500000); 

 &gt; <b>0007_a120</b>

 Functions to return immutable collections succinctly:

        List<String> anImmutableList = immutableList{\"one\",\"two\",\"three\"};

        Set<Integer> anImmutableSet = immutableSet{1,2,3};

        Map<String,Integer> anImmutableMap = immutableMap{\"one\"->1,\"two\"->2,\"three\"->3};

 Helper functions for equals() and hash:

        hashes(myObject.myInteger,myObject.myString);

 &gt; <b>1312847</b>

        equalsWith(myObject.myInteger,otherObject.myInteger);

 &gt; <b>true</b> or <b>false</b>

        equalsWithMultiple([myObject.myInteger,otherObject.myInteger], 
                           [myObject.myString,otherObject.myString]);

 &gt; <b>true</b> or <b>false</b>
                       
Functions to translate Integers into Sequences of Bytes

        integerToBytes(941226);

 &gt; <b>[0, 0, 0, 0, 0, $1110.byte, $0101_1100.byte, $1010_1010.byte]</b>

        integerToBytesNoZeros(941226);
 &gt; <b>[$1110.byte, $0101_1100.byte, $1010_1010.byte]</b>
 
Support left and right bit rotation on [[Integer]]s.
 
        rotateLeft($1010_0101, 4);
 &gt; <b>$1010_0101_0000</b>

         rotateRight($1010_0101, 4);
 &gt; <b>$0101_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1010</b>

Current version: 0.0.6

Version history:
- 0.0.1:  Format Integers as bits and hex.
- 0.0.2:  Functions for immutable Lists, Sets, and Maps
- 0.0.3:  Helper functions for equals() and hash
- 0.0.4:  Functions to translate Integers into Sequences of Bytes and move unit tests to separate source folder
- 0.0.5:  Refactor module to herd.chayote to simplify project structure and to qualify for Herd module inclusion
        according to required criteria.
- 0.0.6:  Functions to left and right bit rotate on Integers.  Add properly formatted module, package, and function 
        documentation.