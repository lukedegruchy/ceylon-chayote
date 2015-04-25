"Wrapper types for commonly used types to add unique typing.  Example, in contexts where several 
 Integer variables are used for different concepts such as AccountNumber, ReferenceNumber, etc
 
 Examples:
       class AccountNumber(Integer baseValue) extends TypedInteger<AccountNumber>(baseValue) {}
       class ReferenceNumber(Integer baseValue) extends TypedInteger<ReferenceNumber>(baseValue) {}
 
       value accountNum1 = AccountNumber(\"1\");
       value accountNum2 = AccountNumber(\"2\");
 
       value refNum1 = ReferenceNumber(\"1\");
       value refNum2 = ReferenceNumber(\"2\");
       
       assertFalse(accountNum1.equals(accountNum2);
       assertFalse(accountNum1.equals(referenceNum1);
       assertFalse(referenceNum2.equals(accountNum2);
       
 Any time one wishes to simply wrap around a given custom class without supporting comparison, one
 should simply extends [[TypedClass]].  If one wishes to make use of [[Comparable]], then one should
 extends [[TypedClassComparable]].
 
 An example of [[TypedClassComparable]] is [[TypedString]]
 "
shared package herd.chayote.value_classes;
