"General numeric functions.

 Determine whether an [[Integer]] has too many (or too few in the case of negative) bits on a Ceylon platform (JVM or JS)

        print(isOverflowOnPlatform($0010_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000));

 &gt; <b>false</b> (JVM)

 &gt; <b>true</b> (JS)
"
shared package herd.chayote.numeric;
