import ceylon.test {
    test,
    assertEquals,
    assertNull
}

import com.vasileff.ceylon.xmath.long {
    longNumber
}

import herd.chayote.format {
    formatAndPadAsBits,
    formatAndPadAsHex,
    formatAndPadAsHexNoUnderscores
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
    formatBitsCommonLong();

    assertFormatBitsLong($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000,
                         "0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000");
}

native ("js")
test
shared void testFormatBitsLong() {
    formatBitsCommonLong();

    assertFormatBitsLong($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000,
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
shared void testFormatAndPadHexLong();

native("jvm")
test
shared void testFormatAndPadHexLong() {
    formatAndPadHexCommonLong();

    assertFormatAndPadHexLong(#7fffffffffffffff, "7fff_ffff_ffff_ffff");
}

native("js")
test
shared void testFormatAndPadHexLong() {
    formatAndPadHexCommonLong();

    assertFormatAndPadHexLong(#7fffffffffffffff, null);
}

native
test
shared void testFormatAndPadHexLongNoUnderscores();

native("jvm")
test
shared void testFormatAndPadHexLongNoUnderscores() {
    formatAndPadHexCommonLongNoUnderscores();

    assertFormatAndPadHexLongNoUnderscores(#7fffffffffffffff, 4, "7fffffffffffffff");
}

native("js")
test
shared void testFormatAndPadHexLongNoUnderscores() {
    formatAndPadHexCommonLongNoUnderscores();

    assertFormatAndPadHexLongNoUnderscores(#7fffffffffffffff, 4, null);
}

void formatAndPadHexCommon() {
    assertFormatAndPadHex(#ffff, "ffff");
    assertFormatAndPadHex(#ffff_ffff, "ffff_ffff");
    assertFormatAndPadHex(#05a_6c1b_ffff, "005a_6c1b_ffff");
    assertFormatAndPadHex(500000, "0007_a120");
}

void formatAndPadHexCommonLong() {
    assertFormatAndPadHexLong(#ffff, "ffff");
    assertFormatAndPadHexLong(#ffff_ffff, "ffff_ffff");
    assertFormatAndPadHexLong(#05a_6c1b_ffff, "005a_6c1b_ffff");
    assertFormatAndPadHexLong(500000, "0007_a120");
}

void formatAndPadHexCommonLongNoUnderscores() {
    assertFormatAndPadHexLongNoUnderscores(#12345, 2, "012345");
    assertFormatAndPadHexLongNoUnderscores(#12345, 3, "012345");
    assertFormatAndPadHexLongNoUnderscores(#12345, 4, "00012345");
    assertFormatAndPadHexLongNoUnderscores(#12345, 5, "12345");
    assertFormatAndPadHexLongNoUnderscores(#12345, 6, "012345");
    assertFormatAndPadHexLongNoUnderscores(#12345, 7, "0012345");
    assertFormatAndPadHexLongNoUnderscores(#ffff, 4, "ffff");
    assertFormatAndPadHexLongNoUnderscores(#ffff_ffff, 4,"ffffffff");
    assertFormatAndPadHexLongNoUnderscores(#05a_6c1b_ffff, 4,"005a6c1bffff");
    assertFormatAndPadHexLongNoUnderscores(500000, 4,"0007a120");
}

void formatBitsCommon() {
    assertFormatBits($0000_0100, "0100");
    assertFormatBits($1000_0000, "1000_0000");
    assertFormatBits($0100_0000, "0100_0000");
    assertFormatBits($0001_0000_0000, "0001_0000_0000");
    assertFormatBits($0010_0000_0000_0000, "0010_0000_0000_0000");
    assertFormatBits($1010_0101_0000_0000, "1010_0101_0000_0000");
}

void formatBitsCommonLong() {
    assertFormatBitsLong($0000_0100, "0100");
    assertFormatBitsLong($1000_0000, "1000_0000");
    assertFormatBitsLong($0100_0000, "0100_0000");
    assertFormatBitsLong($0001_0000_0000, "0001_0000_0000");
    assertFormatBitsLong($0010_0000_0000_0000, "0010_0000_0000_0000");
    assertFormatBitsLong($1010_0101_0000_0000, "1010_0101_0000_0000");
}

void assertFormatAndPadHex(Integer int, String? equalTo) {
    assertEquals(formatAndPadAsHex(int), equalTo);
}

void assertFormatAndPadHexLong(Integer int, String? equalTo) {
    if (isOverflowOnPlatform(int)) {
        assertNull(equalTo);
    } else {
        assertEquals(formatAndPadAsHex(longNumber(int)), equalTo);
    }
}

void assertFormatAndPadHexLongNoUnderscores(Integer int, Integer toPad, String? equalTo) {
    if (isOverflowOnPlatform(int)) {
        assertNull(equalTo);
    } else {
        assertEquals(formatAndPadAsHexNoUnderscores(longNumber(int), toPad), equalTo);
    }
}

void assertFormatBits(Integer bits, String? equalTo) {
    assertEquals(formatAndPadAsBits(bits), equalTo);
}

void assertFormatBitsLong(Integer bits, String? equalTo) {
    if (isOverflowOnPlatform(bits)) {
        assertNull(equalTo);
    } else {
        assertEquals(formatAndPadAsBits(longNumber(bits)), equalTo);
    }
}
