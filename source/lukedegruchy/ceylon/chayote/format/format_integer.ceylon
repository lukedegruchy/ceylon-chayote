// TODO:  Documentation
shared String formatAndPadAsBits(Integer integer)
    => formatAndPad(integer,formatAsBits);

// TODO:  Documentation
shared String formatAndPadAsHex(Integer integer) 
    => formatAndPad(integer,formatAsHex);

shared void run() {
    print(formatAndPadAsBits(30));
    print(formatAndPadAsHex(30));
}

// TODO:  Documentation
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
