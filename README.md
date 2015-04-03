# ceylon-chayote

Various utility classes and methods for Ceylon:

1) Format Integers as either hex or bits Strings with padding and underscores to make them more readable.
    print(formatAndPadAsBits(30));
        >>> 0001_1110
    print(formatAndPadAsHex(30));
        >>> 001e

2) Functions to return immutable collections succinctly:
    List<String> anImmutableList = immutableList{"one","two","three"};
    Set<Integer> anImmutableSet = immutableSet{1,2,3};
    Map<String,Integer> anImmutableMap = immutableMap{"one"->1,"two"->2,"three"->3};

Current version: 0.0.2

Version history:
0.0.1:  Format Integers as bits and hex.
0.0.2:  Functions for immutable Lists, Sets, and Maps