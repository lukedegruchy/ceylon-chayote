"Subclass of [[TypedClass]] for [[Integer]]s."
shared abstract class TypedInteger<ThisType>(Integer baseValue) 
        extends TypedClass<Integer,ThisType>(baseValue) 
        given ThisType satisfies TypedInteger<ThisType> {}
