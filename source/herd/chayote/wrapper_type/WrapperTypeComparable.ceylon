"A [[WrapperType]] variant that supports subclasses that are [[Comparable]] and its associated attributes and functions.
 One example is [[WrappedString]]"
shared abstract class WrapperTypeComparable<ValueType>(ValueType baseValue)
        extends WrapperType<ValueType>(baseValue)
        satisfies Comparable<WrapperTypeComparable<ValueType>>
        given ValueType satisfies Comparable<ValueType> {

    shared actual Comparison compare(WrapperTypeComparable<ValueType> other)
            => baseValue.compare(other.baseValue);
}