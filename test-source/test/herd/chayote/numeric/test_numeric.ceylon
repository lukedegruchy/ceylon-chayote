import ceylon.test {
    test,
    assertFalse,
    assertTrue
}

import herd.chayote.numeric {
    isOverflowOnPlatform
}
native
test
shared void testFormatBits();

native ("jvm")
test
shared void testFormatBits() {
    assertFalse(isOverflowOnPlatform($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000));
}

native ("js")
test
shared void testFormatBits() {
    assertTrue(isOverflowOnPlatform($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000));
}