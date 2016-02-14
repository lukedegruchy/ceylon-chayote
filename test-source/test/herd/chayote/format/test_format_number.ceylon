import ceylon.test {
    test,
    assertEquals,
    assertNull
}

import com.vasileff.ceylon.integer64 {
    integer64
}

import herd.chayote.format {
    formatAndPadAsBits,
    formatAndPadAsHex,
    formatAndPadAsHexNoUnderscores
}

native
test
shared void testFormatBits();

native ("jvm")
test
shared void testFormatBits() {
    formatBitsCommon();

    assertFormatBits($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000,
                     "0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000");
}

native ("js")
test
shared void testFormatBits() {
    formatBitsCommon();

    assertFormatBits($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000,
                     null);
}

native
shared void testFormatBitsLong();

native("jvm")
test
shared void testFormatBitsLong() {
    formatBitsCommonInteger64();

    assertFormatBitsInteger64($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000,
                              "0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000");
}

native ("js")
test
shared void testFormatBitsLong() {
    formatBitsCommonInteger64();

    assertFormatBitsInteger64($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000,
                              null);
}

native
shared void testFormatAndPadHex();

native("jvm")
test
shared void testFormatAndPadHex() {
    formatAndPadHexCommon();

    assertFormatAndPadHex(#7fffffffffffffff, "7fff_ffff_ffff_ffff");
}

native("js")
test
shared void testFormatAndPadHex() {
    formatAndPadHexCommon();

    assertFormatAndPadHex(#7fffffffffffffff, null);
}

native
test
shared void testFormatAndPadHexInteger64();

native("jvm")
test
shared void testFormatAndPadHexInteger64() {
    formatAndPadHexCommonInteger64();

    assertFormatAndPadHexInteger64(#7fffffffffffffff, "7fff_ffff_ffff_ffff");
}

native("js")
test
shared void testFormatAndPadHexInteger64() {
    formatAndPadHexCommonInteger64();

    assertFormatAndPadHexInteger64(#7fffffffffffffff, null);
}

native
test
shared void testFormatAndPadHexInteger64NoUnderscores();

native("jvm")
test
shared void testFormatAndPadHexInteger64NoUnderscores() {
    formatAndPadHexCommonInteger64NoUnderscores();

    assertFormatAndPadHexInteger64NoUnderscores(#7fffffffffffffff, 4, "7fffffffffffffff");
}

native("js")
test
shared void testFormatAndPadHexInteger64NoUnderscores() {
    formatAndPadHexCommonInteger64NoUnderscores();

    assertFormatAndPadHexInteger64NoUnderscores(#7fffffffffffffff, 4, null);
}

void formatAndPadHexCommon() {
    assertFormatAndPadHex(#ffff, "ffff");
    assertFormatAndPadHex(#ffff_ffff, "ffff_ffff");
    assertFormatAndPadHex(#05a_6c1b_ffff, "005a_6c1b_ffff");
    assertFormatAndPadHex(500000, "0007_a120");
}

void formatAndPadHexCommonInteger64() {
    assertFormatAndPadHexInteger64(#ffff, "ffff");
    assertFormatAndPadHexInteger64(#ffff_ffff, "ffff_ffff");
    assertFormatAndPadHexInteger64(#05a_6c1b_ffff, "005a_6c1b_ffff");
    assertFormatAndPadHexInteger64(500000, "0007_a120");
}

void formatAndPadHexCommonInteger64NoUnderscores() {
    assertFormatAndPadHexInteger64NoUnderscores(#12345, 2, "012345");
    assertFormatAndPadHexInteger64NoUnderscores(#12345, 3, "012345");
    assertFormatAndPadHexInteger64NoUnderscores(#12345, 4, "00012345");
    assertFormatAndPadHexInteger64NoUnderscores(#12345, 5, "12345");
    assertFormatAndPadHexInteger64NoUnderscores(#12345, 6, "012345");
    assertFormatAndPadHexInteger64NoUnderscores(#12345, 7, "0012345");
    assertFormatAndPadHexInteger64NoUnderscores(#ffff, 4, "ffff");
    assertFormatAndPadHexInteger64NoUnderscores(#ffff_ffff, 4,"ffffffff");
    assertFormatAndPadHexInteger64NoUnderscores(#05a_6c1b_ffff, 4,"005a6c1bffff");
    assertFormatAndPadHexInteger64NoUnderscores(500000, 4,"0007a120");
}

void formatBitsCommon() {
    assertFormatBits($0000_0100, "0100");
    assertFormatBits($1000_0000, "1000_0000");
    assertFormatBits($0100_0000, "0100_0000");
    assertFormatBits($0001_0000_0000, "0001_0000_0000");
    assertFormatBits($0010_0000_0000_0000, "0010_0000_0000_0000");
    assertFormatBits($1010_0101_0000_0000, "1010_0101_0000_0000");
}

void formatBitsCommonInteger64() {
    assertFormatBitsInteger64($0000_0100, "0100");
    assertFormatBitsInteger64($1000_0000, "1000_0000");
    assertFormatBitsInteger64($0100_0000, "0100_0000");
    assertFormatBitsInteger64($0001_0000_0000, "0001_0000_0000");
    assertFormatBitsInteger64($0010_0000_0000_0000, "0010_0000_0000_0000");
    assertFormatBitsInteger64($1010_0101_0000_0000, "1010_0101_0000_0000");
}

void assertFormatAndPadHex(Integer int, String? equalTo) {
    assertEquals(formatAndPadAsHex(int), equalTo);
}

void assertFormatAndPadHexInteger64(Integer int, String? equalTo) {
    if (exists intAs64 = integer64(int)) {
        assertEquals(formatAndPadAsHex(intAs64), equalTo);
    }
    else {
        assertNull(equalTo);
    }
}

void assertFormatAndPadHexInteger64NoUnderscores(Integer int, Integer toPad, String? equalTo) {
    if (exists intAs64 = integer64(int)) {
        assertEquals(formatAndPadAsHexNoUnderscores(intAs64, toPad), equalTo);
    }
    else {
        assertNull(equalTo);
    }
}

void assertFormatBits(Integer bits, String? equalTo) {
    assertEquals(formatAndPadAsBits(bits), equalTo);
}

void assertFormatBitsInteger64(Integer bits, String? equalTo) {
    if (exists intAs64 = integer64(bits)) {
        assertEquals(formatAndPadAsBits(intAs64), equalTo);
    }
    else {
        assertNull(equalTo);
    }
}
