import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Hash "mo:base/Hash";
import Result "mo:base/Result";
import Nat "mo:base/Nat";

actor {

//Challenge 1 : Create an actor in main.mo and declare the following types.
//TokenIndex of type Nat.
//Error which is a variant type with multiples tags :

    type TokenIndex = Nat;
    type Error = {
        #syntax;
        #run_time;
        #linker;
        #logical;
        #semantic;
        #authoriation
    };

//Challenge 2 : Declare an HashMap called registry with Key of type TokenIndex and value of type Principal.
//This will keeep track of which principal owns which TokenIndex.

    private stable var r : [(TokenIndex, Principal)] = [];
    private let registry = HashMap.fromIter<TokenIndex, Principal>(r.vals(), r.size(), Nat.equal, Hash.hash);

//Challenge 3 : Declare a variable of type Nat called nextTokenIndex, initialized at 0 that will keep track of the number of minted NFTs.
//Write a function called mint that takes no argument.
//This function should :
//Returns a result of type Result and indicate an error in case the caller is anonymous.

    stable var nextTokenIndex: TokenIndex = 0;

    public shared({caller}) func mint(): async Result.Result<(), Error> {
        return if (Principal.isAnonymous(caller)) {
            #err(#authoriation);
        } else {
            registry.put(nextTokenIndex, caller);
            nextTokenIndex+=1;
            #ok();
        }
    };

//If the user is authenticated : associate the current TokenIndex with the caller (use the HashMap we've created) and increase nextTokenIndex.
//Challenge 4 : Write a function called transfer that takes two arguments :
    //to of type Principal.
    //tokenIndex of type Nat.
    //This function will transfer ownership of tokenIndex to the specified principal. You will check for eventuals errors and returns a result of type Result.

    public shared({caller}) func transfer(to: Principal, index: TokenIndex): async Result.Result<(), Error> {
        return if (Principal.isAnonymous(caller)) {
            #err(#authoriation);
        } else {
            registry.put(tokenIndex, to);
            nextTokenIndex+=1;
            #ok();
        }
    };

//Challenge 5 : Write a function called balance that takes no arguments but returns a list of tokenIndex owned by the called.

    public shared ({caller}) func balance() : async Result.Result<(), [TokenIndex]> {
      if(Principal.isAnonymous(caller)){
          return #err(#authoriation);
      } else {
          let arr : [TokenIndex] = [];
          for ((i, value) in registry.entries()) {
              let token : Nat = i;
              arr := Array.append(arr, [token]);
          };
          return arr;
      };
  };

};