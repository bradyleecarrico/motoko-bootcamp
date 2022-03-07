import Prim "mo:⛔";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";

actor{

//Challenge 1 : Write a function nat_to_nat8 that converts a Nat n to a Nat8. Make sure that your function never trap.

    public func nat_to_nat8(n : Nat) : async Nat8 {
        return Prim.natToNat8(n);
    };

//Challenge 2 : Write a function max_number_with_n_bits that takes a Nat n and returns the
//maximum number than can be represented with only n-bits.

    //I'm going to assume unsigend integers
    public func max_number_with_n_bits(n : Nat) : async Nat {
        return (2 ** n) - 1;
    };

//Challenge 3 : Write a function decimal_to_bits that takes a Nat n and returns a Text corresponding to the binary representation of this number.
//Note : decimal_to_bits(255) -> "11111111".


    public func decimal_to_bits(n : Nat) : async Text {
        //let buf : Buffer.Buffer<Nat> = Buffer.Buffer(0);
        var my_string : Text = "";
        var m = n; //convert to mutable

        while (m > 0){
            my_string := Text.concat(Nat.toText(m%2), my_string);
            m := m/2;
        };

        return my_string;
    };

//Challenge 4 : Write a function capitalize_character that takes a Char c and returns the capitalized version of it.

    public func capitalize_character(c : Char) : async Char {
        return Char.fromNat32(Char.toNat32(c) - 32);
    };

//Challenge 5 : Write a function capitalize_text that takes a Text t and returns the capitalized version of it.

    public func capitalize_text(t : Text) : async Text {
        var word : Text = "";
        for(char in t.chars()){
            word := Text.concat(word, Char.toText(Char.fromNat32(Char.toNat32(char) - 32)));
        };
        return word;
    };

//Challenge 6 : Write a function is_inside that takes two arguments : a Text t and a Char c and
//returns a Bool indicating if c is inside t .

    public func is_inside(t : Text, c : Char) : async Bool {
        for(char in t.chars()){
            if (char == c) {
                return true;
            };
        };
        return false;
    };

//Challenge 7 : Write a function trim_whitespace that takes a text t and returns the trimmed version of t.
//Note : Trim means removing any leading and trailing spaces from the text : trim_whitespace(" Hello ") -> "Hello".

    public func trim_whitespace(t : Text) : async Text {
        return Text.trim(t, #char(' '));
    };

//Challenge 8 : Write a function duplicated_character that takes a Text t and
//returns the first duplicated character in t converted to Text. 
//Note : The function should return the whole Text if there is no duplicate character : 
//duplicated_character("Hello") -> "l" & duplicated_character("World") -> "World".

    public func duplicated_character(t : Text) : async Text {
        let arr : [var Char] = Array.init<Char>(t.size(), ' ');
        var index = 0;
        for(char in t.chars()){
            arr[index] := char;
            index += 1;
        };
        
        var i = 0;
        while (i < t.size()){
            var j = i + 1;
            while (j < t.size()){
                if (arr[i] == arr[j]){
                    return Char.toText(arr[i]);
                };
                j += 1;
            };
            i += 1;
        };

        return t;
    }; 

//Challenge 9 : Write a function size_in_bytes that takes Text t and returns the number of bytes this text takes when encoded as UTF-8.

    public func size_in_bytes(t: Text) : async Nat {
        return (Text.encodeUtf8(t)).size();
    };

//Challenge 10 :
    //Watch this video on bubble sort.
    //Implement a function bubble_sort that takes an array of natural numbers and returns the sorted array.

    public func bubble_sort(a : [Nat]) : async [Nat] {
        
        let array : [var Nat] = Array.thaw(a);
    
        var i : Nat = 0;
        while (i < array.size()){
            var j : Nat = i + 1;
            while (j < array.size()){
                if (array[j] < array[i]) {
                    let temp = array[j];
                    array[j] := array[i];
                    array[i] := temp;
                };
                j += 1;
            };
            i += 1;
        };

        return Array.freeze(array);

    };

};