"Wrapper types for commonly used types to add unique typing.  Example, in contexts where several 
 Integer variables are used for different concepts such as AccountNumber, ReferenceNumber, etc
 
 Examples:
       class AccountNumber(Integer baseValue) extends TypedInteger(baseValue) {}
       class ReferenceNumber(Integer baseValue) extends TypedInteger(baseValue) {}
 
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
 
 Also, there is a displayNameForType function that will output the declaration name for a type for all four possibilities,
 recursively if necessary:
 
 - [[ceylon.language.meta.model::ClassOrInterface]]
 - [[ceylon.language.meta.model::UnionType]]
 - [[ceylon.language.meta.model::IntersectionType]]
 - [[ceylon.language.meta.model::nothingType]]
 
        displayNameForType(`String`)
        
 &gt; <b>String</b>

        displayNameForType(`String|Integer`)
 
 &gt; <b>String|Integer</b>
 "
shared package herd.chayote.value_classes;
