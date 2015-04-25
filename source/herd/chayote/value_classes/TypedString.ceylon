"Subclass of [[TypedClassComparable]] for [[String]]s.  Supports operations on [[List]]s of [[Character]]s."
shared abstract class TypedString<ThisType>(String baseValue) 
        extends TypedClassComparable<String,ThisType>(baseValue)
        satisfies List<Character> 
        given ThisType satisfies TypedString<ThisType> {
    
    shared actual Boolean equals(Object other) => 
        (super of TypedClass<String,ThisType>).equals(other);
    
    shared actual Integer hash => (super of TypedClass<String,ThisType>).hash;
    
    shared actual String string => (super of TypedClass<String,ThisType>).string;
    
    shared actual String span(Integer from, Integer to) => baseValue.span(from, to);
    
    shared actual Integer? lastIndex => baseValue.lastIndex;
    
    shared actual Character? getFromFirst(Integer index) => baseValue.getFromFirst(index);
}
