import com.vasileff.ceylon.xmath.long {
    XLong=Long
}

"Subclass of [[TypedClass]] for [[com.vasileff.ceylon.xmath.long::Long]]s."
shared abstract class TypedLong(XLong baseValue)
        extends TypedClass<XLong>(baseValue) {}
