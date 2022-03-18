import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";

actor {
    private stable var favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    public shared({caller}) func add_favorite_number(n: Nat) : async Text {
        switch(favoriteNumber.get(caller)) {
            case (null) {
                favoriteNumber.put(caller, n);
                return "You've successfully registered your number";
            };
            case (?nat) {
                return "You've already registered your number";
            };
        };
    };

    public shared({caller}) func update_favorite_number(n : Nat) {
        favoriteNumber.put(caller, n);
    };

    public shared({caller}) func delete_favorite_number(n : Nat) {
        favoriteNumber.remove(caller);
    };
}