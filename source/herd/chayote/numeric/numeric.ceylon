"Determine whether an [Integer] has too many (or too few in the case of negative) bits on a Ceylon platform (JVM or JS)"
shared Boolean isOverflowOnPlatform(Integer int)
    => ! runtime.minIntegerValue <= int <= runtime.maxIntegerValue;