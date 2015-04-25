"Subclass of [[TypedClass]] for [[Float]]s."
shared abstract class TypedFloat<ThisType>(Float baseValue)
        extends TypedClass<Float,ThisType>(baseValue) 
        given ThisType satisfies TypedFloat<ThisType> {}