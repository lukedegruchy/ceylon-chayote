import ceylon.test {
    test,
    assertTrue,
    assertFalse,
    assertEquals
}
import herd.chayote.object_helpers {
    hashes,
    equalsWith,
    equalsWithMulitple,
    helpString
}

test
void testEqualsWithMultiple() {
    assertTrue(equalsWithMulitple({[1,1],["one","one"]}));
    assertFalse(equalsWithMulitple({[1,2],["one","one"]}));
    assertFalse(equalsWithMulitple({[1,1],["one","two"]}));
    assertFalse(equalsWithMulitple({[1,"one"],["one","one"]}));
    assertFalse(equalsWithMulitple({[1,1],["one",1]}));
}

test
void testEqualsWith() {
    assertTrue(equalsWith(1,1));
    assertTrue(equalsWith("one","one"));
    assertFalse(equalsWith("one","two"));
    assertFalse(equalsWith(1,2));
    assertFalse(equalsWith(1,"one"));
}

test
void testHashes() {
    assertEquals(hashes(1), 32);
    assertEquals(hashes(2), 33);
    assertEquals(hashes("one"),110213);
    assertEquals(hashes("two"),115307);
    assertEquals(hashes(1,"one"), 111174);
    assertEquals(hashes(1,2), 994);
    assertEquals(hashes("one","two"), 3531879);
}

test
void testHelpString() {
    void assertMe(String expectedString, String className, <String->Anything>* keyValues) {
        assertEquals(helpString(className, *keyValues), expectedString);
    }
    
    assertMe("Nothing:{}","Nothing");
    assertMe("Thing:{Name=FirstThing,Number=1,Optional=null}",
            "Thing", 
            "Name"->"FirstThing", 
            "Number"->1, 
            "Optional"->null);
}