module {

    public type Animal = {
    specie : Text;
    energy : Nat;
    };

    public func animal_sleep ( a : Animal) : Animal {
        a.energy = a.energy + 10;
        return a;
    };

};