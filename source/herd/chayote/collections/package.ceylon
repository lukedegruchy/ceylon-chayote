" Contains functions to return immutable collections succinctly:
        
        List<String> anImmutableList = immutableList{\"one\",\"two\",\"three\"};
                                                       
        Set<Integer> anImmutableSet = immutableSet{1,2,3};
                                                       
        Map<String,Integer> anImmutableMap = immutableMap{\"one\"->1,\"two\"->2,\"three\"->3};

 "

by("Luke deGruchy")
shared package herd.chayote.collections;
