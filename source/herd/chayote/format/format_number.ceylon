import com.vasileff.ceylon.integer64 {
    one,
    zero,
    Integer64,
    formatInteger64
}

import herd.chayote.numeric {
    isOverflowOnPlatform
}

"Given an [[Integer]], return a [[String]] with the integer formatted as Bits in a human readable format,
 inclding separating out each set of 4 bits with underscores and prepending lending zeros to pad each
 set to 4 characters.

 ex:  formatAndPadAsBits(30) >>> 0001_1110"
shared String? formatAndPadAsBits(Integer|Integer64 number)
    => formatAndPad(number,formatAsBits);

"Given an [[Integer]] | [[com.vasileff.ceylon.integer64::Integer64]], return a [[String]] with the integer formatted
 as hex in a human readable format, including separating out each set of 4 hex characters with underscores and
 prepending lending zeros to pad each set to 4 characters.

 ex:   formatAndPadAsHex(500000) >>> 0007_a120"
shared String? formatAndPadAsHex(Integer|Integer64 number)
    => formatAndPad(number,formatAsHex);

"Given an [[Integer]] | [[com.vasileff.ceylon.integer64::Integer64]], return a [[String]] with the integer formatted
 as hex in a human readable format, including prepending lending zeros to pad each set to 4 characters.

 ex:   formatAndPadAsHex(500000, 4) >>> 0007a120"
shared String? formatAndPadAsHexNoUnderscores(Integer|Integer64 number, Integer toPad)
    => formatAndPadNoUnderscores(number,formatAsHex, toPad);

"Given an [[Integer]] | [[com.vasileff.ceylon.integer64::Integer64]], return a [[String]] with the integer formatted
 as specified by the parameterized function of type String(Integer|Integer64).  The result of the function will be formatted
 in a human readable format including separating out each set of 4 hex characters with underscores and prepending
 lending zeros to pad each set to 4 characters."
shared String? formatAndPad(Integer|Integer64 number, String formatNumber(Integer|Integer64 toFormat))
    => formatAndPadBase(number, formatNumber, addUnderscores);

"Given an [[Integer]] | [[com.vasileff.ceylon.integer64::Integer64]], return a [[String]] with the integer formatted
 as specified by the parameterized function of type String(Integer|Integer64).  The result of the function will be formatted
 in a human readable format and prepending lending zeros to pad each set to 4 characters."
shared String? formatAndPadNoUnderscores(Integer|Integer64 number,
                                         String formatNumber(Integer|Integer64 toFormat),
                                         Integer toPad)
    => formatAndPadBase(number, formatNumber, String.string, toPad);

String? formatAndPadBase(Integer|Integer64 number,
                         String formatNumber(Integer|Integer64 toFormat),
                         String(String) processPadded,
                         Integer toPad=4)
    => if (is Integer number, isOverflowOnPlatform(number))
       then null
       else processPadded(padString(formatNumber(number), toPad));

String padString(String string, Integer toPad=4) {
    value modulo = string.size % toPad;

    if (modulo == 0) {
        return string;
    }

    value spanTo = string.spanTo(modulo -1);
    value spanFrom = string.spanFrom(modulo);

    return spanTo.padLeading(toPad, '0') + spanFrom;
}

String addUnderscores(String string)
    => String(string.reversed.interpose('_', 4)).reversed;

String formatAsHex(Integer|Integer64 number)
    => switch (number)
        case (is Integer) formatInteger(number, 16)
        case (is Integer64) formatInteger64(number, 16);

String formatAsBits(Integer|Integer64 number)
    => let (numbersToUse = getNumberToUse([number]))
            formatBits(numbersToUse, "");

String formatBits([Integer|Integer64*] numbersToUse, String formattedBits) {
    if (exists numberToUse = numbersToUse.first,
               notZero(numberToUse)) {

        // TODO:  This is nasty but since Binary is invariant there seems to be no other way
        Integer|Integer64 numberToUseAndOne;
        switch (numberToUse)
            case (is Integer) {
                numberToUseAndOne = numberToUse.and(1);
            }
            case (is Integer64) {
                numberToUseAndOne = numberToUse.and(one);
            }

        return formatBits(numbersToUse.rest,
                          numberToUseAndOne.string + formattedBits);
    }

    return formattedBits;
}

[Integer|Integer64*] getNumberToUse([Integer|Integer64*] numbersToUse)
    => if (exists lastNumber = numbersToUse.last,
                  notZero(lastNumber))
        then getNumberToUse(numbersToUse.withTrailing(lastNumber.rightLogicalShift(1)).sequence())
        else numbersToUse;

Boolean notZero(Integer|Integer64 number)
    => number != 0 && number != zero;
