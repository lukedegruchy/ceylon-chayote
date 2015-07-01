"A [[TypedClass]] variant that supports subclasses that are [[Comparable]] and support prop.  One example of [[TypedString]]"
shared abstract class TypedClassComparable<ValueType>(ValueType baseValue)
        extends TypedClass<ValueType>(baseValue) 
        satisfies Comparable<TypedClassComparable<ValueType>>
        given ValueType satisfies Comparable<ValueType> {
    
    shared actual Comparison compare(TypedClassComparable<ValueType> other) 
            => baseValue.compare(other.baseValue);
}