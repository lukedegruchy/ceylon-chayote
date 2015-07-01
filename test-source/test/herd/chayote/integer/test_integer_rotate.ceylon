import ceylon.test {
    test,
    assertEquals
}

import herd.chayote.integer {
    rotateLeft,
    rotateRight
}

test
void testRotateLeft() {
    void assertMe(Integer toRotate, Integer rotateBy, Integer expectedResult) {
        assertEquals(rotateLeft(toRotate, rotateBy), expectedResult);
    }
    
    assertMe($1010_0101, 4, $1010_0101_0000);
    assertMe($1010_0101, 8, $1010_0101_0000_0000);
    assertMe($1010_0101, -4, $0101_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1010);
    assertMe($1010_0101, -8, $1010_0101_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000);
}

test
void testRotateRight() {
    void assertMe(Integer toRotate, Integer rotateBy, Integer expectedResult) {
        assertEquals(rotateRight(toRotate, rotateBy), expectedResult);
    }

    assertMe($1010_0101, 4, $0101_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1010);
    assertMe($1010_0101, 8, $1010_0101_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000);
    assertMe($1010_0101, -4, $1010_0101_0000);
    assertMe($1010_0101, -8, $1010_0101_0000_0000);
}