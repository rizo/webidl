
// --- Types ---

interface A1 {
    attribute ByteString s1;
    attribute DOMString s2;
    attribute USVString s3;
    attribute String s4;
    attribute CSSOMString s5;
    attribute DOMString? nullableString;

    attribute object obj;
    attribute object? nullableObject;
    attribute UnknownType value;

    //attribute A<long>? child;
    //attribute long[] intArray;
    //attribute long[][] intArray2D;
    //attribute sequence<long> intSequence;

    //attribute Promise<void> promise;
    //attribute FrozenArray<long> readArray;
    //attribute record<DOMString, long> rec;

    //sequence<long> f(sequence<long> x);
    //A<long> g(A<long> x);
    any h();
};


// --- Operations ---

interface A2 {
    double f1();
    double f2(long x, long y);
    A f3(A x);
    void f4();
};


// --- Callback functions

interface A3 {
    attribute ACallback event1;
    attribute ACallback? event2;
    attribute AnyCallback event3;
};

callback ACallback = void (A? a, long b);
// [FIXME] Syntax error at ?
// callback AnyCallback = any? ();


// -- Enums ---

interface A4 {
    attribute ScrollBehavior behavior;
};

enum ScrollBehavior { "auto", "instant", "smooth" };
// [FIXME] Generates invalid idents
// enum StyleEnum { "", "first-value", "SECOND-VALUE" };


// --- Partials ---

interface A5 {
    attribute long x;
};

[Constructor(long a)]
partial interface A5 {
    attribute long y;
    const long z = 5;
    void f();
};

interface A7 {
    void g();
};

dictionary D1 {
    boolean a = true;
};

partial dictionary D2 {
    boolean b = false;
};

//partial namespace N1 {
//    readonly attribute long y;
//}

//namespace N2 {
//    readonly attribute long x;
//    void f();
//}


// --- Typedef ---

typedef (Int8Array or Int16Array or Int32Array or
         Uint8Array or Uint16Array or Uint32Array or Uint8ClampedArray or
         BigInt64Array or BigUint64Array or
         Float16Array or Float32Array or Float64Array or DataView) ArrayBufferView;
