// TODO:  How to find size in bytes?

Integer numberOfBytesInInteger = 8;

shared [Byte+] integerToBytesNoZeros(Integer integer) {
    value bytes = integerToBytes(integer).filter(not<Byte>((byte) => byte == 0.byte)).sequence();
    
    assert(nonempty bytes);
    
    return bytes;
}

shared [Byte+] integerToBytes(Integer integer) 
    => [for (index in numberOfBytesInInteger..1) integer.rightLogicalShift((index-1) * 8).byte];
