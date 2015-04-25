import ceylon.test {
    test,
    assertEquals,
    assertNotEquals
}

import herd.chayote.value_classes {
    TypedClass
}

shared class Gorfle(String name) {}

shared abstract class TypedGorfle<ThisType>(Gorfle baseValue) 
        extends TypedClass<Gorfle,ThisType>(baseValue) {}

test
void testTypedClass() {
    class MyGorfle1(Gorfle baseValue) extends TypedGorfle<MyGorfle1>(baseValue) {}
    class MyGorfle2(Gorfle baseValue) extends TypedGorfle<MyGorfle2>(baseValue) {}
    
    value gorfle = Gorfle("myGorfle");
    value myGorfle1 = MyGorfle1(gorfle);
    value myGorfle2 = MyGorfle2(gorfle);
    
    assertEquals(myGorfle1.baseValue, gorfle);
    assertEquals(myGorfle1.name, "MyGorfle1");
    assertEquals(myGorfle1.baseValue, myGorfle2.baseValue);
    assertNotEquals(myGorfle1, myGorfle2);
}