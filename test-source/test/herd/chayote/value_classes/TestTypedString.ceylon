import ceylon.test {
    test,
    assertEquals,
    assertNotEquals,
    assertFalse,
    assertTrue
}

import herd.chayote.value_classes {
    TypedString
}

test
void testTypedString() {
    class MyString1(String baseValue) extends TypedString(baseValue) {}
    class MyString2(String baseValue) extends TypedString(baseValue) {}
    
    value bob1 = MyString1("bob");
    
    assertEquals(bob1.baseValue, "bob");
    assertEquals(bob1.name, "MyString1");
    
    value bob2 = MyString1("bob");
    
    assertEquals(bob2, bob1);
    assertEquals(bob2.hash, bob1.hash);
    assertEquals(bob1.compare(bob2), equal);
    
    value car = MyString1("car");
    
    assertNotEquals(car, bob1);
    assertNotEquals(car.hash, bob1.hash);
    assertEquals(bob1.compare(car), smaller);
    
    assertTrue(bob1 == bob2);
    assertFalse(car == bob2);
    assertFalse(bob1 == car);

    value bob3 = MyString2("bob");

    assertEquals(bob1, bob2);
    assertNotEquals(bob1, bob3);
    assertNotEquals(bob2, bob3);
}