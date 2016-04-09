"Various utility classes and methods for Ceylon.  These are intended to all be written in native Ceylon,
 with no dependency on JDK-specific modules.

  Format [[Integer]]s or [[com.vasileff.ceylon.integer64::Integer64]]s as either hex or bits Strings with padding and underscores to make them more readable.

        print(formatAndPadAsBits(30));

 &gt; <b>0001_1110</b>

        print(formatAndPadAsHex(500000);

 &gt; <b>0007_a120</b>

 Determine whether an [[Integer] has too many (or too few in the case of negative) bits on a Ceylon platform (JVM or JS)

        print(isOverflowOnPlatform($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000));

 &gt; <b>false</b> (JVM)

 &gt; <b>true</b> (JS)

 Helper functions for equals() and hash:

        hashes(myObject.myInteger,myObject.myString);

 &gt; <b>1312847</b>

        equalsWith(myObject.myInteger,otherObject.myInteger);

 &gt; <b>true</b> or <b>false</b>

        equalsWithMultiple([myObject.myInteger,otherObject.myInteger],
                           [myObject.myString,otherObject.myString]);

 &gt; <b>true</b> or <b>false</b>

 Functions to translate [[Integer]]s or [[com.vasileff.ceylon.integer64::Integer64]]s into Sequences of Bytes

        integerToBytes(941226);

 &gt; <b>[0, 0, 0, 0, 0, $1110.byte, $0101_1100.byte, $1010_1010.byte]</b>

        integerToBytesNoZeros(941226);
 &gt; <b>[$1110.byte, $0101_1100.byte, $1010_1010.byte]</b>

  Convenience function: helpString() to help output class string attributes.

        helpString(\"Thing\",  \"Name\"->\"FirstThing\", \"Number\"->1, \"Optional\"->null);
 &gt; <b>\"Thing:{Name=FirstThing,Number=1,Optional=null}\"</b>

 Wrapper types for commonly used types to add unique typing.  Example, in contexts where several
 Integer variables are used for different concepts such as AccountNumber, ReferenceNumber, etc

 Examples:
       class AccountNumber(Integer baseValue) extends WrappedInteger(baseValue) {}
       class ReferenceNumber(Integer baseValue) extends WrappedInteger(baseValue) {}

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
module herd.chayote "0.0.14" {
    import ceylon.collection "1.2.2";
    shared import ceylon.buffer "1.2.2";
    // TODO:  switch to ceylon.xmath when this is integrated into the Ceylon SDK
    shared import com.vasileff.ceylon.integer64 "1.0.2";
}
