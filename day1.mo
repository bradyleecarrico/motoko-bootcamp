import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";


actor {

//Challenge 1 : Write a function add that takes two natural numbers n and m and returns the sum.

  public func add(num1 : Nat, num2 : Nat) : async Nat {
    return num1 + num2;
  };

//Challenge 2 : Write a function square that takes a natural number n and returns the area of a square of length n.

  public func square(num1 : Nat) : async Nat {
    return num1 * num1;
  };

//Challenge 3 : Write a function days_to_second that takes a number of days n and returns the number of seconds.

  public func days_to_second(n : Int) : async Int {
    return n * 86400;
  };

//Challenge 4 : Write two functions increment_counter & clear_counter .

  stable var counter = 0;

    //Getter function for counter (for testing purposes)
  public query func getter() : async Nat {
    return counter;
  };  

  //increment_counter returns the incremented value of counter by n.
  public func increment_counter(n : Nat) : async () {
    counter += n;
  };

  //clear_counter sets the value of counter to 0.
  public func clear_counter() : async () {
    counter := 0;
  };

//Challenge 5 : Write a function divide that takes two natural numbers n and m and returns a boolean indicating if y divides x.

  public func divide(n : Nat, m : Nat) : async Bool {
    return n % m == 0;
  };

//Challenge 6 : Write a function is_even that takes a natural number n and returns a boolean indicating if n is even.

  public func is_even(n : Nat) : async Bool {
    if (n == 0) {
      return true;
    };
    return n % 2 == 0;
  };

//Challenge 7 : Write a function sum_of_array that takes an array of natural numbers and returns the sum.
//This function will returns 0 if the array is empty.

  public func sum_of_array(n : [Nat]) : async Nat {
    var sum : Nat = 0;

    for (value in n.vals()){
      sum += value;
    };

    return sum;
  };
  //note to self: test in command line using
    // dfx canister call day_1 sum_of_array '(vec {1;2;5})'

//Challenge 8 : Write a function maximum that takes an array of natural numbers and returns the
//maximum value in the array. This function will returns 0 if the array is empty.
  public func maximum(n : [Nat]) : async Nat {
    var max : Nat = 0;

    for (value in n.vals()){
      if (value > max) {
        max := value;
      };
    };

    return max;
  };

//Challenge 9 : Write a function remove_from_array that takes 2 parameters : 
//an array of natural numbers and a natural number n and returns a new array where all occurences
//of n have been removed (order should remain unchanged).

  public func remove_from_array(array : [Nat], number : Nat) : async [Nat] {
    let ans : Buffer.Buffer<Nat> = Buffer.Buffer(0);

    for (value in array.vals()){
      if (value != number){
        ans.add(value);
      };
    };

    return ans.toArray();
  };

//Challenge 10 :
  //Watch this video on selection sort.
  //Implement a function selection_sort that takes an array of natural numbers and returns the sorted array .

  public func selection_sort(a : [Nat]) : async [Nat] {    
    let array : [var Nat] = Array.thaw(a);
    
    var i : Nat = 0;
    while (i < array.size()){
      var min : Nat = i;
      var j : Nat = i + 1;
      while (j < array.size()){
        if (array[j] < array[min]) {
          min := j;
        };
        j += 1;
      };

      if (min != i) {
        var temp : Nat = array[i];
        array[i] := array[min];
        array[min] := temp;
      };

      i += 1;
    };

    return Array.freeze(array);
  }

};