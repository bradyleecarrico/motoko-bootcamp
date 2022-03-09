import Array "mo:base/Array";
import Prim "mo:⛔";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Option "mo:base/Option"

actor {

//Challenge 1 : Write a private function swap that takes 3 parameters : a mutable array , 
//an index j and an index i and returns the same array but where value at index i and index j have been swapped.

    private func swap(a1 : [Nat], i : Nat, j: Nat) : [Nat] {
        let a2 : [var Nat] = Array.thaw(a1);
        let temp = a1[i];
        a2[i] := a2[j];
        a2[j] := temp;
        return Array.freeze(a2);
    };

    //since function is private, we need a getter
    public func call_swap(a1 : [Nat], i : Nat, j: Nat) : async [Nat] {
        return swap(a1, i, j);
    };

//Challenge 2 : Write a function init_count that takes a Nat n and returns an array [Nat] where value is
//equal to it's corresponding index.

    //Note : init_count(5) -> [0,1,2,3,4].
    //Note 2 : Do not use Array.append.

    public func init_count(n : Nat) : async [Nat] {
        let a = Array.init<Nat>(n, 0);

        var num = 0;
        while (num < n){
            a[num] := num;
            num += 1;
        };

        return Array.freeze(a);
    };

//Challenge 3 : Write a function seven that takes an array [Nat] and returns "Seven is found" if one digit of ANY number is 8.
//Otherwise this function will return "Seven not found".

    public func seven( a : [Nat]) : async Text {

        for (elem in a.vals()){
            let w = Nat.toText(elem);
            if(Text.contains(w, #char('8'))){
                return "Seven is found";
            };
        };
        
        return "Seven not found";

    };

//Challenge 4 : Write a function nat_opt_to_nat that takes two parameters : n of type ?Nat and m of type Nat . 
//This function will return the value of n if n is not null and if n is null it will default to the value of m.

     public func nat_opt_to_nat( n : ?Nat, m :Nat ) : async Nat {

        switch(n){
            case(null){
                return m;
            };
            case(?something){
                return something;
            };
        };

    };

//Challenge 5 : Write a function day_of_the_week that takes a Nat n and returns a Text value corresponding to the day. If n doesn't correspond to any day it will return null .

    //day_of_the_week (1) -> "Monday".
    //day_of_the_week (7) -> "Sunday".
    //day_of_the_week (12) -> null.

    public func day_of_the_week( n : Nat ) : async ?Text {
        var t : ?Text = null;
        switch(n){
            case(1){
                return ?"Monday";
            };
            case(2){
                return ?"Tuesday";
            };
            case(3){
                return ?"Wednesday";
            };
            case(4){
                return ?"Thursday";
            };
            case(5){
                return ?"Friday";
            };
            case(6){
                return ?"Saturday";
            };
            case(7){
                return ?"Sunday";
            };
            case(_){
                return t;
            };
        };
        return t;
    };

//Challenge 6 : Write a function populate_array that takes an array [?Nat] and returns an array [Nat] where all null values have been replaced by 0.
    //Note : Do not use a loop.

    public func populate_array(array : [?Nat]) : async [Nat] {

        let f = func (n : Nat) : Nat {
            return (Option.get<Nat>(array[n], 0));
        };

        return Array.tabulate<Nat>(array.size(), f);
    };

//Challenge 7 : Write a function sum_of_array that takes an array [Nat] and returns the sum of a values in the array.
    //Note : Do not use a loop.

    public func sum_of_array(array : [Nat]) : async Nat {
        return Array.foldLeft(array, 0, Nat.add);
    };

//Challenge 8 : Write a function squared_array that takes an array [Nat] and returns a new array where each value has been squared.
    //Note : Do not use a loop.

    public func squared_array(array: [Nat]) : async [Nat] {
        return Array.map<Nat, Nat>(array, func(i) {return i**2;});
    };

//Challenge 9 : Write a function increase_by_index that takes an array [Nat] and returns a new array where each number has been increased by it's corresponding index.
    //Note : increase_by_index [1, 4, 8, 0] -> [1 + 0, 4 + 1 , 8 + 2 , 0 + 3] = [1,5,10,3]
    //Note 2 : Do not use a loop.

    public func increase_by_index(array: [Nat]) : async [Nat] {
        return Array.mapEntries<Nat, Nat>(array, func(i, j) {return i + j;});
    };


//Challenge 10 : Write a higher order function contains<A> that takes 3 parameters : an array [A] , 
//a of type A and a function f that takes a tuple of type (A,A) and returns a boolean.
//This function should return a boolean indicating whether or not a is present in the array.

    public func contains(array: [Nat], num: Nat): async Bool {
        return contains_private<Nat>(array, num, func(i: Nat, j: Nat) {i == j});
    };

    func contains_private<A>(array: [A], a: A, f: (A, A) -> Bool): Bool {
        return Option.isSome(Array.find<A>(array, func(i: A){ f(i, a)})) ;
    };

};