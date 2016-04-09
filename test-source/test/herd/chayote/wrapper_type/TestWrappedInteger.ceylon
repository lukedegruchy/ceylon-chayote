import ceylon.test {
    test,
    assertEquals,
    assertFalse
}

import herd.chayote.wrapper_type {
    WrappedInteger
}

test
void testWrappedInteger() {
    class MyInteger(Integer baseValue) extends WrappedInteger(baseValue) {}
    class MyInteger2(Integer baseValue) extends WrappedInteger(baseValue) {}

    value myInteger = MyInteger(59);

    assertEquals(myInteger.baseValue, 59);
    assertEquals(myInteger.name, "MyInteger");

    value myInteger2 = MyInteger2(59);

    assertFalse(myInteger == myInteger2);
}