// TODO:  Documentation
shared Boolean isIntegerTooLargeOrTooSmall(Integer integer)
    => integer.largerThan(runtime.maxIntegerValue) || integer.smallerThan(runtime.minIntegerValue);