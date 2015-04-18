import ceylon.test {
    test,
    assertEquals
}
import herd.chayote.format {
    formatAndPadAsBits,
    formatAndPadAsHex
}

// TODO:  Use new feature in https://github.com/ceylon/ceylon-spec/issues/500 and 
// https://github.com/ceylon/ceylon-spec/issues/499  to run jvm and javascript specific unit
// tests when it becomes available

test
void testFormatBits() {
    void assertMe(Integer bits, String? equalTo) {
        assertEquals(formatAndPadAsBits(bits),equalTo);
    }
    
    assertMe($0000_0100, "0100");
    assertMe($1000_0000, "1000_0000");
    assertMe($0100_0000, "0100_0000");
    assertMe($0001_0000_0000, "0001_0000_0000");
    assertMe($0010_0000_0000_0000, "0010_0000_0000_0000");
    assertMe($1010_0101_0000_0000, "1010_0101_0000_0000");
    
    if (runtime.integerAddressableSize == 64) {
        assertMe($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000, 
            "0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000");
    } else {
        assertMe($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000, 
            null);
    }
}

test
void testFormatAndPadHex() {
    void assertMe(Integer int, String? equalTo) {
        assertEquals(formatAndPadAsHex(int),equalTo);
    }
    
    assertMe(#ffff, "ffff");
    assertMe(#ffff_ffff, "ffff_ffff");
    assertMe(#05a_6c1b_ffff, "005a_6c1b_ffff");
    assertMe(500000, "0007_a120");
    
    if (runtime.integerAddressableSize == 64) {
        assertMe(#7fffffffffffffff, "7fff_ffff_ffff_ffff");
    } else {
        assertMe(#7fffffffffffffff, null);
    }
}
