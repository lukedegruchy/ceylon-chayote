import ceylon.test {
    test,
    assertEquals
}

import com.vasileff.ceylon.xmath.long {
    Long,
    longNumber,
    zero
}

import herd.chayote.bytes {
    integerToBytes,
    longToBytes,
    integerToBytesNoZeros,
    longToBytesNoZeros
}

// TODO:  File bug for unshared unit test failing in JavaScript with weird error
// TODO:  File bug for unshared native function failing in JavaScript with weird error

native
test
shared void testIntegerToBytes();

native("jvm")
test
shared void testIntegerToBytes() {
    assertIntegerToBytes($0101_1100_1010_1010, [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0101_1100.byte, $1010_1010.byte]);
    assertIntegerToBytes($1110_0101_1100_1010_1010, [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertIntegerToBytes($0, [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte]);
}

native("js")
test
shared void testIntegerToBytes() {
    assertIntegerToBytes($0101_1100_1010_1010, [$0.byte, $0.byte, $0101_1100.byte, $1010_1010.byte]);
    assertIntegerToBytes($1110_0101_1100_1010_1010, [$0.byte, $1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertIntegerToBytes($0, [$0.byte, $0.byte, $0.byte, $0.byte]);
}

native
test
shared void testLongToBytes();

native("jvm")
test
shared void testLongToBytes() {
    assertLongToBytes(longNumber($0101_1100_1010_1010), [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0101_1100.byte, $1010_1010.byte]);
    assertLongToBytes(longNumber($1110_0101_1100_1010_1010), [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertLongToBytes(longNumber($0), [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte]);
}

native("js")
test
shared void testLongToBytes() {
    assertLongToBytes(longNumber($0101_1100_1010_1010), [$0.byte, $0.byte, $0101_1100.byte, $1010_1010.byte]);
    assertLongToBytes(longNumber($1110_0101_1100_1010_1010), [$0.byte, $1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertLongToBytes(zero, [$0.byte, $0.byte, $0.byte, $0.byte]);
}

native
test
shared void testIntegerToBytesNoLeadingZeros();

native("jvm")
test
shared void testIntegerToBytesNoLeadingZeros() {
    assertIntegerToBytesNoZeros($0101_1100_1010_1010, [$0101_1100.byte, $1010_1010.byte]);
    assertIntegerToBytesNoZeros($1110_0101_1100_1010_1010, [$1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertIntegerToBytesNoZeros(0, [$0.byte]);
}

native("js")
test
shared void testIntegerToBytesNoLeadingZeros() {
    assertIntegerToBytesNoZeros($0101_1100_1010_1010, [$0101_1100.byte, $1010_1010.byte]);
    assertIntegerToBytesNoZeros($1110_0101_1100_1010_1010, [$1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertIntegerToBytesNoZeros(0, [$0.byte]);
}

native
test
shared void testLongToBytesNoLeadingZeros();

native("jvm")
test
shared void testLongToBytesNoLeadingZeros() {
    assertLongToBytesNoZeros(longNumber($0101_1100_1010_1010), [$0101_1100.byte, $1010_1010.byte]);
    assertLongToBytesNoZeros(longNumber($1110_0101_1100_1010_1010), [$1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertLongToBytesNoZeros(zero, [$0.byte]);
}

native("js")
test
shared void testLongToBytesNoLeadingZeros() {
    assertLongToBytesNoZeros(longNumber($0101_1100_1010_1010), [$0101_1100.byte, $1010_1010.byte]);
    assertLongToBytesNoZeros(longNumber($1110_0101_1100_1010_1010), [$1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertLongToBytesNoZeros(zero, [$0.byte]);
}

void assertIntegerToBytes(Integer bits, Byte[] bytes) {
    assertEquals(integerToBytes(bits),bytes);
}

void assertLongToBytes(Long bits, Byte[] bytes) {
    assertEquals(longToBytes(bits),bytes);
}

void assertIntegerToBytesNoZeros(Integer bits, Byte[] bytes) {
    assertEquals(integerToBytesNoZeros(bits),bytes);
}

void assertLongToBytesNoZeros(Long bits, Byte[] bytes) {
    assertEquals(longToBytesNoZeros(bits),bytes);
}