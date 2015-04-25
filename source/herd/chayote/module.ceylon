"Various utility classes and methods for Ceylon.  These are intended to all be written in native Ceylon,
 with no dependency on JDK-specific modules.

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
 
  Convenience function: helpString() to help output class string attributes.
 
        helpString(\"Thing\",  \"Name\"->\"FirstThing\", \"Number\"->1, \"Optional\"->null);
 &gt; <b>\"Thing:{Name=FirstThing,Number=1,Optional=null}\"</b>

 Wrapper types for commonly used types to add unique typing.  Example, in contexts where several 
 Integer variables are used for different concepts such as AccountNumber, ReferenceNumber, etc
 
 Examples:
       class AccountNumber(Integer baseValue) extends TypedInteger<AccountNumber>(baseValue) {}
       class ReferenceNumber(Integer baseValue) extends TypedInteger<ReferenceNumber>(baseValue) {}
 
       value accountNum1 = AccountNumber(\"1\");
       value accountNum2 = AccountNumber(\"2\");
 
       value refNum1 = ReferenceNumber(\"1\");
       value refNum2 = ReferenceNumber(\"2\");
       
       assertFalse(accountNum1.equals(accountNum2);
       assertFalse(accountNum1.equals(referenceNum1);
       assertFalse(referenceNum2.equals(accountNum2);
"

by("Luke deGruchy")
license("Apache Software License")
module herd.chayote "0.0.8" {
    import ceylon.collection "1.1.0";
}
