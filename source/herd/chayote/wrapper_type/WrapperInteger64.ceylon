import com.vasileff.ceylon.integer64 {
    Integer64
}

"Subclass of [[WrapperType]] for [[com.vasileff.ceylon.integer64::Integer64]]s."
shared abstract class WrappedInteger64(Integer64 baseValue)
        extends WrapperType<Integer64>(baseValue) {}
