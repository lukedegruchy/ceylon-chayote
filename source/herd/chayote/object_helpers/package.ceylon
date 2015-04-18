"Contains helper functions for equals() and hash:

        hashes(myObject.myInteger,myObject.myString);

 &gt; <b>1312847</b>

        equalsWith(myObject.myInteger,otherObject.myInteger);

 &gt; <b>true</b> or <b>false</b>

        equalsWithMultiple([myObject.myInteger,otherObject.myInteger], 
                           [myObject.myString,otherObject.myString]);

 &gt; <b>true</b> or <b>false</b>
 
        helpString(\"Thing\",  \"Name\"->\"FirstThing\", \"Number\"->1, \"Optional\"->null);
 &gt; <b>\"Thing:{Name=FirstThing,Number=1,Optional=null}\"</b>
"

by("Luke deGruchy")

shared package herd.chayote.object_helpers;
