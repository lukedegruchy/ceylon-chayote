import ceylon.test {
    test,
    assertEquals,
    fail
}

import com.vasileff.ceylon.integer64 {
    zero,
    Integer64,
    integer64
}

import herd.chayote.bytes {
    integerToBytes,
    integer64ToBytes,
    integerToBytesNoZeros,
    integer64ToBytesNoZeros
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
shared void testinteger64ToBytes();

native("jvm")
test
shared void testinteger64ToBytes() {
    assertInteger64ToBytes(integer64($0101_1100_1010_1010), [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0101_1100.byte, $1010_1010.byte]);
    assertInteger64ToBytes(integer64($1110_0101_1100_1010_1010), [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertInteger64ToBytes(integer64($0), [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte]);
}

native("js")
test
shared void testinteger64ToBytes() {
    assertInteger64ToBytes(integer64($0101_1100_1010_1010), [$0.byte, $0.byte, $0101_1100.byte, $1010_1010.byte]);
    assertInteger64ToBytes(integer64($1110_0101_1100_1010_1010), [$0.byte, $1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertInteger64ToBytes(zero, [$0.byte, $0.byte, $0.byte, $0.byte]);
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
shared void testinteger64ToBytesNoLeadingZeros();

native("jvm")
test
shared void testinteger64ToBytesNoLeadingZeros() {
    assertInteger64ToBytesNoZeros(integer64($0101_1100_1010_1010), [$0101_1100.byte, $1010_1010.byte]);
    assertInteger64ToBytesNoZeros(integer64($1110_0101_1100_1010_1010), [$1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertInteger64ToBytesNoZeros(zero, [$0.byte]);
}

native("js")
test
shared void testinteger64ToBytesNoLeadingZeros() {
    assertInteger64ToBytesNoZeros(integer64($0101_1100_1010_1010), [$0101_1100.byte, $1010_1010.byte]);
    assertInteger64ToBytesNoZeros(integer64($1110_0101_1100_1010_1010), [$1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertInteger64ToBytesNoZeros(zero, [$0.byte]);
}

void assertIntegerToBytes(Integer bits, Byte[] bytes) {
    assertEquals(integerToBytes(bits),bytes);
}

void assertInteger64ToBytes(Integer64? bits, Byte[] bytes) {
    if (exists existingBits = bits) {
        assertEquals(integer64ToBytes(existingBits),bytes);
    } else {
        fail("Integer literal is too large to fit into platform's capacity.");
    }
}

void assertIntegerToBytesNoZeros(Integer bits, Byte[] bytes) {
    assertEquals(integerToBytesNoZeros(bits),bytes);
}

void assertInteger64ToBytesNoZeros(Integer64? bits, Byte[] bytes) {
    if (exists existingBits = bits) {
        assertEquals(integer64ToBytesNoZeros(existingBits),bytes);
    } else {
        fail("Integer literal is too large to fit into platform's capacity.");
    }
}