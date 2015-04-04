Integer numberOfBytesInInteger = 8;

"Given an [[Integer]] return a [[Sequence]] of [[Byte]]s with any leading 0 bytes removed."
shared [Byte+] integerToBytesNoZeros(Integer integer) {
    value bytes = integerToBytes(integer).filter(not<Byte>((byte) => byte == 0.byte)).sequence();
    
    assert(nonempty bytes);
    
    return bytes;
}

"Given an [[Integer]] return a [[Sequence]] of [[Byte]]s including any leading 0 bytes up to 8 bytes."
shared [Byte+] integerToBytes(Integer integer) 
    => [for (index in numberOfBytesInInteger..1) integer.rightLogicalShift((index-1) * 8).byte];
