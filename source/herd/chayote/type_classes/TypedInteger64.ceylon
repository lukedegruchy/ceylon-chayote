import com.vasileff.ceylon.integer64 {
    Integer64
}

"Subclass of [[TypedClass]] for [[com.vasileff.ceylon.integer64::Integer64]]s."
shared abstract class TypedInteger64(Integer64 baseValue)
        extends TypedClass<Integer64>(baseValue) {}
