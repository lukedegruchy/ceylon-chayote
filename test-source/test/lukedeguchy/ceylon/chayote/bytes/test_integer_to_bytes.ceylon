import ceylon.test {
    test,
    assertEquals
}
import lukedegruchy.ceylon.chayote.bytes {
    integerToBytesNoZeros
}

// TODO:  add more tests
test
void testIntegerToBytes() {
    void assertMe(Integer bits, Byte[] bytes) {
        assertEquals(integerToBytesNoZeros(bits),bytes);
    }
    
    assertMe($0101_1100_1010_1010, [$0101_1100.byte, $1010_1010.byte]);
    assertMe($1110_0101_1100_1010_1010, [$1110.byte, $0101_1100.byte, $1010_1010.byte]);
}