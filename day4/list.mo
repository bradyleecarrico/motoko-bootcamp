import List "mo:base/List";

module {

    //7
    public func is_null<T>(l : List<T>) : Bool {
        switch (l) {
        case (null) {
            return true;
        };
        case (_) { 
            return false;
        };
        };
    };

    //8
    public func find_last<T>(l : List<T>) : ?T {
        switch l {
            case (null) {
                return null;
            };
            case (?(x, null)) {
                return ?x;
            };
            case (?(_, t)) {
                return find_last<T>(t);
            };
        };
    };

    //9
    public func size<T>(l : L.List<T>) : Nat {
        var list_size : Nat = 0;
        var x : L.List<T> = l;

        label i while (1) {
            switch (x) {
                case(null) {
                    break i;
                };
                case(?(y, _)){
                    list_size = list_size + 1;
                    x := y;
                };
            };
        };
        return (size);
    };

    //10
    public func get<T>(l : List<T>, n : Nat) : ?T {
        switch (l, n) {
            case (null, _) {
                return null;
            };
            case ((?(h, t)), 0) {
                return ?h;
            };
            case ((?(_, t)), _) {
                return get<T>(t, n - 1);
            };
        };
    };

    //11
    public func reverse<T>(l : List<T>) : List<T> {
        func rev(l : List<T>, r : List<T>) : List<T> {
            switch l {
                case (null) { 
                    return r;
                };
                case (?(x, y)) {
                    return rev(y, ?(x, r));
                };
            };
        };
        rev(l, null);
    };

}