import ceylon.collection {
    HashSet,
    ArrayList,
    HashMap
}
import ceylon.test {
    test,
    assertEquals
}
import lukedegruchy.ceylon.chayote.collections {
    immutableMap,
    immutableList,
    immutableSet
}

test
void testImmutableList() {
    value mutableList = ArrayList{"one","two","three"};
    
    value myImmutableList = immutableList(mutableList.sequence());
    
    mutableList.add("four");
    
    assertEquals(myImmutableList.sequence(), ["one","two","three"]);
    assertEquals(myImmutableList, immutableList{"one","two","three"});

    mutableList.remove("two");

    assertEquals(myImmutableList.sequence(), ["one","two","three"]);
    assertEquals(myImmutableList, immutableList{"one","two","three"});
}

test
void testImmutableSet() {
    value mutableSet = HashSet{1,2,3};
    
    value myImmutableSet = immutableSet(mutableSet.sequence());
    
    mutableSet.add(4);
    
    assertEquals(myImmutableSet.sequence(), [1,2,3]);
    assertEquals(myImmutableSet, immutableSet{1,2,3});

    mutableSet.remove(2);

    assertEquals(myImmutableSet.sequence(), [1,2,3]);
    assertEquals(myImmutableSet, immutableSet{1,2,3});
}

test
void testImmutableMap() {
    value mutableMap = HashMap{"one"->1,"two"->2,"three"->3};
    
    value myImmutableMap = immutableMap(mutableMap.sequence());
    
    mutableMap.put("four",4);
    
    assertEquals(myImmutableMap.sequence(), ["one"->1,"two"->2,"three"->3]);
    assertEquals(myImmutableMap, immutableMap{"one"->1,"two"->2,"three"->3});

    mutableMap.remove("four");

    assertEquals(myImmutableMap.sequence(), ["one"->1,"two"->2,"three"->3]);
    assertEquals(myImmutableMap, immutableMap{"one"->1,"two"->2,"three"->3});
}