import ceylon.language.meta.model {
    Type,
    ClassOrInterface,
    UnionType,
    IntersectionType,
    nothingType
}

"For any given [[Type]], return the name of its [[ceylon.language.meta.declaration::ClassOrInterfaceDeclaration]]
 irrespective of whether it's a [[ClassOrInterface]], [[UnionType]], [[IntersectionType]], or [[nothingType]]"
throws(`class AssertionError`, "All variants of [[Type]] are not accounted for by this method.")
shared String displayNameForType<in MyType>(Type<MyType> theType) {
    if (is ClassOrInterface<MyType> theType) {
        // TODO:  Remove split '$' when this is resolved:
        // https://github.com/ceylon/ceylon.language/issues/668 
        String declarationName = theType.declaration.name;
        return declarationName.split((Character ch) => '$' == ch)
                .sequence()
                [0] else declarationName;
    } else if (is UnionType<MyType> theType) {
        return "|".join(theType.caseTypes.map(displayNameForType<MyType>));
    } else if (is IntersectionType<MyType> theType) {
        return "&".join(theType.satisfiedTypes.map(displayNameForType<Anything>));
    } else if (nothingType == theType) {
        return "nothingType";
    }
    
    // This should never happen because the above if/else if block should exhaust all possible
    // subtypes/instances of [[Type]].  However, if Type is extended in the future, this could
    // be an issue.
    throw AssertionError("Did not account for this instance of Type: ``theType``");
}