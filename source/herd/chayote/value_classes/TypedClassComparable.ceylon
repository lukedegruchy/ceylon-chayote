"A [[TypedClass]] variant that supports subclasses that are [[Comparable]] and support prop.  One example of [[TypedString]]"
shared abstract class TypedClassComparable<ValueType,ThisType>(ValueType baseValue)
        extends TypedClass<ValueType,ThisType>(baseValue) 
        satisfies Comparable<TypedClassComparable<ValueType,ThisType>>
        given ThisType satisfies TypedClassComparable<ValueType,ThisType> 
        given ValueType satisfies Comparable<ValueType> {
    
    shared actual Comparison compare(TypedClassComparable<ValueType,ThisType> other) 
            => baseValue.compare(other.baseValue);
}