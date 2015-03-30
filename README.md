# ceylon-chayote

Various utility classes and methods for Ceylon:

1) Format Integers as either hex or bits Strings with padding and underscores to make them more readable.
    print(formatAndPadAsBits(30));
        >>> 0001_1110
    print(formatAndPadAsHex(30));
        >>> 001e