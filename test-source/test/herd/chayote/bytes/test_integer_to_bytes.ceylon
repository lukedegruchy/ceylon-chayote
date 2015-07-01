import ceylon.test {
    test,
    assertEquals
}

import herd.chayote.bytes {
    integerToBytesNoZeros,
    integerToBytes
}

// TODO:  add more tests
test
void testIntegerToBytes() {
    void assertMe(Integer bits, Byte[] bytes) {
        assertEquals(integerToBytes(bits),bytes);
    }
    
    if (runtime.integerAddressableSize == 64) {
        assertMe($0101_1100_1010_1010, [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0101_1100.byte, $1010_1010.byte]);
        assertMe($1110_0101_1100_1010_1010, [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $1110.byte, $0101_1100.byte, $1010_1010.byte]);
        assertMe($0, [$0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte, $0.byte]);
    } else {
        assertMe($0101_1100_1010_1010, [$0.byte, $0.byte, $0101_1100.byte, $1010_1010.byte]);
        assertMe($1110_0101_1100_1010_1010, [$0.byte, $1110.byte, $0101_1100.byte, $1010_1010.byte]);
        assertMe($0, [$0.byte, $0.byte, $0.byte, $0.byte]);
    }
}

test
void testIntegerToBytesNoLeadingZeros() {
    void assertMe(Integer bits, Byte[] bytes) {
        assertEquals(integerToBytesNoZeros(bits),bytes);
    }
    
    assertMe($0101_1100_1010_1010, [$0101_1100.byte, $1010_1010.byte]);
    assertMe($1110_0101_1100_1010_1010, [$1110.byte, $0101_1100.byte, $1010_1010.byte]);
    assertMe(0, [$0.byte]);
}