"Given an [[Integer]], return a [[String]] with the integer formatted as Bits in a human readable format,
 inclding separating out each set of 4 bits with underscores and prepending lending zeros to pad each
 set to 4 characters.

 ex:  formatAndPadAsBits(30) >>> 0001_1110"
shared String formatAndPadAsBits(Integer integer)
    => formatAndPad(integer,formatAsBits);

"Given an [[Integer]], return a [[String]] with the integer formatted as hex in a human readable format,
 inclding separating out each set of 4 hex characters with underscores and prepending lending zeros to pad each
 set to 4 characters.

 ex:   formatAndPadAsHex(500000) >>> 0007_a120"
shared String formatAndPadAsHex(Integer integer) 
    => formatAndPad(integer,formatAsHex);

"Given an [[Integer]], return a [[String]] with the integer formatted as specified by the parameterized 
 function of type String(Integer).  The result of the function will be formatted in a human readable format 
 including separating out each set of 4 hex characters with underscores and prepending lending zeros to 
 pad each set to 4 characters. "
shared String formatAndPad(Integer integer, String formatAndPadInteger(Integer toFormat)) 
    => padStringTo4(String(formatAndPadInteger(integer)
                                .reversed
                                .interpose('_', 4))
                    .reversed);

String padStringTo4(String string) {
    {String*} split = string.split((ch) => ch == '_', false, false);
    
    assert(exists first=split.first);
    
    return first.padLeading(4, '0') + "".join(split.rest);
}

String formatAsHex(Integer int) => formatInteger(int, 16);

String formatAsBits(Integer integer) {
    variable Integer numberToUse = integer;
    StringBuilder stringBuilder = StringBuilder();
    
    while (numberToUse != 0) {
        Integer index = numberToUse.and(1);
        
        stringBuilder.prepend(index.string);
        
        numberToUse = numberToUse.rightLogicalShift(1);
    }
    
    return stringBuilder.string;
}
