"Subclass of [[TypedClassComparable]] for [[String]]s.  Supports operations on [[List]]s of [[Character]]s."
shared abstract class TypedString(String baseValue) 
        extends TypedClassComparable<String>(baseValue)
        satisfies List<Character> {
    
    shared actual Boolean equals(Object other) => 
        (super of TypedClass<String>).equals(other);
    
    shared actual Integer hash => (super of TypedClass<String>).hash;
    
    shared actual String string => (super of TypedClass<String>).string;
    
    shared actual String span(Integer from, Integer to) => baseValue.span(from, to);
    
    shared actual Integer? lastIndex => baseValue.lastIndex;
    
    shared actual Character? getFromFirst(Integer index) => baseValue.getFromFirst(index);
}
