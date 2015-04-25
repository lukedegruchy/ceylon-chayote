"Subclass of [[TypedClass]] for [[Byte]]s."
shared abstract class TypedByte<ThisType>(Byte baseValue)
        extends TypedClass<Byte,ThisType>(baseValue) 
        given ThisType satisfies TypedByte<ThisType> {}
