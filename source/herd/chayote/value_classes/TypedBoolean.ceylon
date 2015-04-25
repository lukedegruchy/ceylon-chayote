"Subclass of [[TypedClass]] for [[Boolean]]s."
shared abstract class TypedBoolean<ThisType>(Boolean baseValue) 
        extends TypedClass<Boolean,ThisType>(baseValue) 
        given ThisType satisfies TypedBoolean<ThisType> {}
