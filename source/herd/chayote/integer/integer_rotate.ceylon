"Given an [[Integer]] for the object of the bit rotation and an [[Integer]] for the number of bits to shift,
 shift the Integer left by the number of bits.  Any bitss shifted all the way left beyond 64 bits will be moved
 to the far right and then further shifted left.  If the number of bits to shift is negative then it is equivalent
 to calling [[rotateRight]] by the equivalent positive number of bits to shift.
 
 ex:
         rotateLeft($1010_0101, 4);
 &gt; <b>$1010_0101_0000</b>
 "
shared Integer rotateLeft(Integer toRotate, Integer shift)
    => toRotate.leftLogicalShift(shift).or((toRotate.rightLogicalShift(runtime.integerSize - shift)));

"Given an [[Integer]] for the object of the bit rotation and an [[Integer]] for the number of bits to shift,
 shift the Integer right by the number of bits.  Any bits shifted all the way right beyond 64 bits will be moved
 to the far left and then further shifted right.  If the number of bits to shift is negative then it is equivalent
 to calling [[rotateLeft]] by the equivalent positive number of bits to shift.

 
 ex:
         rotateRight($1010_0101, 4);
 &gt; <b>$0101_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1010</b>
 "
shared Integer rotateRight(Integer toRotate, Integer shift)
    => toRotate.rightLogicalShift(shift).or((toRotate.leftLogicalShift(runtime.integerSize - shift)));

