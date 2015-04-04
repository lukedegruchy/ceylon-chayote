import ceylon.test {
    test,
    assertEquals
}
import herd.chayote.format {
    formatAndPadAsBits,
    formatAndPadAsHex
}

test
void testFormatBits() {
    void assertMe(Integer bits, String equalTo) {
        assertEquals(formatAndPadAsBits(bits),equalTo);
    }
    
    assertMe($0000_0100, "0100");
    assertMe($1000_0000, "1000_0000");
    assertMe($0100_0000, "0100_0000");
    assertMe($0001_0000_0000, "0001_0000_0000");
    assertMe($0010_0000_0000_0000, "0010_0000_0000_0000");
}

test
void testFormatAndPadHex() {
    void assertMe(Integer int, String equalTo) {
        assertEquals(formatAndPadAsHex(int),equalTo);
    }
    
    assertMe(#ffff, "ffff");
    assertMe(#ffff_ffff, "ffff_ffff");
    assertMe(#05a_6c1b_ffff, "005a_6c1b_ffff");
    assertMe(500000, "0007_a120");
}
