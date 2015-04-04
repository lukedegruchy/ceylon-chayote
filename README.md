Ceylon Chayote
====================

Various utility classes and methods for Ceylon:
---------------------

* Format Integers as either hex or bits Strings with padding and underscores to make them more readable.
    print(formatAndPadAsBits(30));
        >>> 0001_1110
    print(formatAndPadAsHex(30));
        >>> 001e

* Functions to return immutable collections succinctly:
    List<String> anImmutableList = immutableList{"one","two","three"};
    Set<Integer> anImmutableSet = immutableSet{1,2,3};
    Map<String,Integer> anImmutableMap = immutableMap{"one"->1,"two"->2,"three"->3};

* Helper functions for equals() and hash:
    hashes(myObject.myInteger,myObject.myString)   >>> 1312847
    equalsWith(myObject.myInteger,otherObject.myInteger)  >>>> true or false
    equalsWithMultiple([myObject.myInteger,otherObject.myInteger],
                       [myObject.myString,otherObject.myString])  >>>> true or false
                       
* Functions to translate Integers into Sequences of Bytes
    integerToBytes(941226) >> [0, 0, 0, 0, 0, $1110.byte, $0101_1100.byte, $1010_1010.byte]
    integerToBytesNoZeros(941226) >> [$1110.byte, $0101_1100.byte, $1010_1010.byte]

Current version: 0.0.4

Version history:
0.0.1:  Format Integers as bits and hex.
0.0.2:  Functions for immutable Lists, Sets, and Maps
0.0.3:  Helper functions for equals() and hash
0.0.4:  Functions to translate Integers into Sequences of Bytes and move unit tests to separate source folder