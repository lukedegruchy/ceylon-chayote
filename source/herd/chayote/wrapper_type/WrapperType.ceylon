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

"Root of the hierarchy of wrapped types.  Allows for numerous possible subclasses to act as wrapper classes for commonly
 used classes to add extra typing context.  See [[WrapperTypeComparable]] and [[WrappedInteger]] for examples of subclasses.
 For example, a subclass of [[WrappedInteger]] can declare a ReferenceNumber class as a subclass that will only be
 comparable to other ReferenceNumber classes. Otherwise identical base values of different WrappedInteger subclasses
 will not be considered equal according to equals().
 "
shared abstract class WrapperType<ValueType>("Underlying value wrapped by the [[WrapperType]]"
                                            shared ValueType baseValue)
        given ValueType satisfies Object {

    "[[Type]] associated with the [[WrapperType]]"
    shared Type<> classType => type(this);

    "Display name of the type (ex TypedString is \"TypedString\""
    shared String name => displayNameForType(classType);

    shared actual default Boolean equals(Object other) {
        if (is WrapperType<ValueType> other) {
            if (classType== other.classType) {
                return equalsWith(baseValue, other.baseValue);
            }
        }

        return false;
    }

    shared actual default Integer hash => hashes(baseValue);

    shared actual default String string => helpString(name, "baseValue"->baseValue);
}
