Integer numBitsInByte = 8;
Integer numBytesInInteger = runtime.integerAddressableSize / numBitsInByte;

"Given an [[Integer]] return a [[Sequence]] of [[Byte]]s with any leading 0 bytes removed."
shared [Byte+] integerToBytesNoZeros(Integer integer) {
    value bytes = integerToBytes(integer).filter(not<Byte>((byte) => byte == 0.byte)).sequence();
    
    assert(nonempty bytes);
    
    return bytes;
}


"Given an [[Integer]] return a [[Sequence]] of [[Byte]]s including any leading 0 bytes up to max number of bytes.
 
 The max number of bytes in an Integer is driven off [[runtime.integerAddressableSize]], which in the JVM
 is 64 and node.js is 32."
shared [Byte+] integerToBytes(Integer integer) 
    => [for (index in numBytesInInteger..1) integer.rightLogicalShift((index-1) * numBitsInByte).byte];
