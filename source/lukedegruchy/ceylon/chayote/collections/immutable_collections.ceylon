import ceylon.collection {
    HashSet,
    unmodifiableSet,
    unmodifiableMap,
    HashMap,
    unmodifiableList,
    ArrayList
}

"Given an [[Iterable]] of elements of Type, produce an immutable [[List]] containing those elements.  
 Ensure that modifying the underlying [[Iterable]] does not modify the immutable [[List]]"
shared List<Type> immutableList<Type>({Type*} elements) given Type satisfies Object {
    return unmodifiableList(ArrayList{ elements=elements; });
}

"Given an [[Iterable]] of elements of Type, produce an immutable [[Set]] containing those elements.  
 Ensure that modifying the underlying [[Iterable]] does not modify the immutable [[Set]]"
shared Set<Type> immutableSet<Type>({Type*} elements) given Type satisfies Object {
    return unmodifiableSet(HashSet{ elements=elements; });
}

"Given an [[Iterable]] of elements of Key->Item, produce an immutable [[Map]] containing those elements.  
 Ensure that modifying the underlying [[Iterable]] does not modify the immutable [[Set]]"
shared Map<Key,Item> immutableMap<Key,Item>({<Key->Item>*} entries) 
        given Key satisfies Object 
        given Item satisfies Object 
    => unmodifiableMap(HashMap{ entries=entries; });
