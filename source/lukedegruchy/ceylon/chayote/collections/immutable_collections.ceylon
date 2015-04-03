import ceylon.collection {
    HashSet,
    unmodifiableSet,
    unmodifiableMap,
    HashMap,
    unmodifiableList,
    ArrayList
}

// TODO:  Documentation
shared List<Type> immutableList<Type>({Type*} elements) given Type satisfies Object {
    return unmodifiableList(ArrayList{ elements=elements; });
}

// TODO:  Documentation
shared Set<Type> immutableSet<Type>({Type*} elements) given Type satisfies Object {
    return unmodifiableSet(HashSet{ elements=elements; });
}

// TODO:  Documentation
shared Map<Key,Item> immutableMap<Key,Item>({<Key->Item>*} entries) 
        given Key satisfies Object 
        given Item satisfies Object 
    => unmodifiableMap(HashMap{ entries=entries; });
