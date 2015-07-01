Integer numBitsInByte = 8;
Integer numBytesInInteger = runtime.integerAddressableSize / numBitsInByte;

"Given an [[Integer]] return a [[Sequence]] of [[Byte]]s with any leading 0 bytes removed."
shared [Byte*] integerToBytesNoZeros(Integer integer) 
    => binaryToBytesNoZeros(integer, Integer.byte);

"Given an [[Integer]] return a [[Sequence]] of [[Byte]]s including any leading 0 bytes up to max number of bytes.
 
 The max number of bytes in an Integer is driven off [[runtime.integerAddressableSize]], which in the JVM
 is 64 and node.js is 32."
shared [Byte+] integerToBytes(Integer integer) 
    => binaryToBytes<Integer>(integer, Integer.byte);

"Given an [[Binary]] and a function to return a [[Byte]] from that [[Binary]], 
 return a [[Sequence]] of [[Byte]]s with any leading 0 bytes removed."
shared [Byte+] binaryToBytesNoZeros<Number>(Binary<Number> binary, Byte(Number) toByte) 
        given Number satisfies Binary<Number> {
    value firstBytes = binaryToBytes(binary, toByte);
    
    if (firstBytes.every((byte) => byte == 0.byte)) {
        return [$0.byte];
    }
    
    value bytes = 
        binaryToBytes(binary, toByte)
            .skipWhile((byte) => byte == 0.byte)
            .sequence();

    assert(nonempty bytes);
    
    return bytes;
}

"Given a [[Binary]] and a function to return a [[Byte]] from that [[Binary]], return a [[Sequence]] 
 of [[Byte]]s including any leading 0 bytes up to max number of bytes.
 
 The max number of bytes in an Integer is driven off [[runtime.integerAddressableSize]], which in the JVM
 is 64 and node.js is 32."
shared [Byte+] binaryToBytes<Number>(Binary<Number> binary, Byte(Number) toByte) 
        given Number satisfies Binary<Number> 
    => [for (index in numBytesInInteger..1) toByte(binary.rightLogicalShift((index-1) * numBitsInByte))];
