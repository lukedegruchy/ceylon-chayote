import ceylon.language.meta {
    type
}
import ceylon.language.meta.model {
    Type
}

import herd.chayote.object_helpers {
    helpString,
    hashes,
    equalsWith
}

"Root of the hierarchy of typed classes.  Allows for numerous possible subclasses to act as wrapper classes for commonly
 used classes to add extra typing information.  See [[TypedClassComparable]] and [[TypedInteger]] for examples of subclasses.
 For example, a subclass of [[TypedInteger]] can declare a ReferenceNumber class as a subclass that will only be 
 comparable to other ReferenceNumber classes, otherwise identical base values of different TypedInteger subclasses
 will not be considered equal according to equals().
 "
shared abstract class TypedClass<ValueType>(shared ValueType baseValue) 
        given ValueType satisfies Object {
    
    shared Type classType => type(this);
    shared String name => displayNameForType(classType);
    
    shared actual default Boolean equals(Object other) {
        if (is TypedClass<ValueType> other) {
            if (classType== other.classType) {
                return equalsWith(baseValue, other.baseValue);
            }
        }
        
        return false;
    }
    
    shared actual default Integer hash => hashes(baseValue);
    
    shared actual default String string => helpString(name, "baseValue"->baseValue);
}
