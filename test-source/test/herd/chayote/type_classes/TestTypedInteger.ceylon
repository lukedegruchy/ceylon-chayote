import ceylon.test {
    test,
    assertEquals,
    assertFalse
}

import herd.chayote.type_classes {
    TypedInteger
}

test
void testTypedInteger() {
    class MyInteger(Integer baseValue) extends TypedInteger(baseValue) {}
    class MyInteger2(Integer baseValue) extends TypedInteger(baseValue) {}
    
    value myInteger = MyInteger(59);
    
    assertEquals(myInteger.baseValue, 59);
    assertEquals(myInteger.name, "MyInteger");

    value myInteger2 = MyInteger2(59);
    
    assertFalse(myInteger == myInteger2);
}