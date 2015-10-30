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
 
 Convenience function: helpString() to help output class string attributes.

        helpString("Thing",  "Name"->"FirstThing", "Number"->1, "Optional"->null);
 &gt; <b>"Thing:{Name=FirstThing,Number=1,Optional=null}"</b>
 
 Wrapper types for commonly used types to add unique typing.  Example, in contexts where several 
 Integer variables are used for different concepts such as AccountNumber, ReferenceNumber, etc
 
 Examples:

       class AccountNumber(Integer baseValue) extends TypedInteger(baseValue) {}
       class ReferenceNumber(Integer baseValue) extends TypedInteger(baseValue) {}
 
       value accountNum1 = AccountNumber(\"1\");
       value accountNum2 = AccountNumber(\"2\");
 
       value refNum1 = ReferenceNumber(\"1\");
       value refNum2 = ReferenceNumber(\"2\");
       
       assertFalse(accountNum1.equals(accountNum2);
       assertFalse(accountNum1.equals(referenceNum1);
       assertFalse(referenceNum2.equals(accountNum2);
        
Current version: 0.0.11

Version history:
- 0.0.1:  Format Integers as bits and hex.
- 0.0.2:  Functions for immutable Lists, Sets, and Maps
- 0.0.3:  Helper functions for equals() and hash
- 0.0.4:  Functions to translate Integers into Sequences of Bytes and move unit tests to separate source folder
- 0.0.5:  Refactor module to herd.chayote to simplify project structure and to qualify for Herd module inclusion
          according to required criteria.
- 0.0.6:  Functions to left and right bit rotate on Integers.  Add properly formatted module, package, and function 
          documentation.
- 0.0.7:  Fix bug with integerToBytes not returning correct results on JavaScript. Fix bug with formatAndPadAsBits and 
          formatAndPadAsHex not returning correct results in JavaScript.  Add helpString as a string(toString()) helper 
          method. Fix documentation.
- 0.0.8:  Introduce wrapper classes that subclass [[TypedClass]] and [[TypedClassComparable]].
- 0.0.9:  Simplify wrapper classes by removing an extra generic type parameter.  Remove erroneous documentation about 
          un-introduced Integer bit rotation feature.
- 0.0.10  Rename value_classes package to type_classes and introduce general Binary to [Byte] conversion functions.
- 0.0.11  Update to Ceylon 1.2.0.  Minor changes to leverage new language features.  Eliminate Integer rotation as there's 
          no way to make it work reliably on the JavaScript runtime.