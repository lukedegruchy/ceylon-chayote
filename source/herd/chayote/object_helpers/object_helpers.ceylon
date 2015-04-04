"Ensure all pairs of Type are compared with [[equalsWith]] and this function returns false at the first 
 pair where [[equalsWith]] returns false"
shared Boolean equalsWithMulitple<in Type>({[Type,Type]+} equalityPairs) 
        => equalityPairs.every((pair) => equalsWith(pair[0],pair[1]));

"Ensure two values of Type are compared for equality according to the == test.  Ensure that if both values are
 null that this function returns true."
shared Boolean equalsWith<in Type>(Type obj1, Type obj2) {
    if (exists obj1, exists obj2) {
        return obj1 == obj2;
    }
    return obj1 exists == obj2 exists;
}

"Build a hash value seeded with a prime value for all passed values of Type."
shared Integer hashes<in Type>(Type* objects) {
    value prime = 31;
    
    return objects.map((obj) => obj?.hash else 0) 
            .fold(1)((result,hash) => (result*prime) + hash);
}