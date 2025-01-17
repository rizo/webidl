
// --- Types ---

interface T1 {};

interface Types1 {
    // Undefined
    attribute undefined u1;

    // Object
    attribute object obj1;

    // Any
    attribute any a1;

    // Boolean
    attribute boolean bl1;

    // Byte
    attribute byte bt1;

    // Octet
    attribute octet oc1;

    // Number
    attribute short n1;
    attribute unsigned short n2;
    attribute long n3;
    attribute unsigned long n4;
    attribute long long n5;
    attribute unsigned long long n6;
    attribute float n7;
    attribute unrestricted float n8;
    attribute unrestricted double n9;

    // Bigint
    attribute bigint bi1;

    // String
    attribute ByteString s1;
    attribute DOMString s2;
    attribute USVString s3;

    // Symbol
    attribute symbol sy1;

    // TODO: string aliases

    // Custom
    attribute T1 c1;
    attribute T2 c2;
    attribute T_missing c3;

    // Nullable
    attribute object? nul1;
    attribute long? nul2;
    attribute double? nul3;
    attribute bigint? nul4;
    attribute DOMString? nul5;
    attribute T1? nul6;
    attribute T_missing? nul7;

    // Sequence
    attribute sequence<Promise<double>> s2;
    attribute sequence<Promise<DOMString>> s3;

    // Record
    attribute record<DOMString, short> r1;
    attribute record<DOMString, sequence<Promise<boolean>>> r2;

    // Promise
    attribute Promise<long> p1;
    attribute Promise<double> p2;
    attribute Promise<undefined> p3;
    attribute Promise<sequence<double>> p4;
    attribute Promise<Promise<double>> p5;

    // FrozenArray
    attribute FrozenArray<long> fa1;

    // Callback
    attribute Cb1 cb1;

    // Union
    attribute (long or short) u1;
    attribute (long or long or long) u2;
    attribute (long or DOMString) u3;
    attribute (DOMString or short) u4;
    attribute (short or sequence<short>) u5;
    attribute (DOMString or short or sequence<Promise<T1>>) u6;
    attribute (short or Cb1) u7;

    // Funcs
    static undefined f1();
    static any f2();
    static any f3(short a, short b, short c);
    static any f4(boolean a, sequence<Promise<DOMString>> b);
    static Promise<long> f5(sequence<long> x);
    static any f6(Cb1 cb);
    static any f7(Cb1? cb);
    static any f8((Cb1 or boolean) a);
    static any f9((Cb1? or DOMString) a);
    static Cb1 f10();

    // Iterable
    iterable<DOMString>;
    iterable<DOMString, long>;
    // async iterable<DOMString>;
    // async iterable<DOMString, long>;
};

interface T2 {};

callback Cb1 = DOMString (short? a, boolean b);

// --- Attributes ---

interface Attr1 {
  attribute unsigned short a1;
  attribute float a2;
  attribute boolean a3;
  attribute DOMString a4;
  attribute Attr2 a5;
  attribute Attr3? a6;
  attribute sequence<DOMString> a7;
};

interface Attr2 { };
interface Attr3 { };


// --- Operations ---

interface Ops1 {
    double f1();
    double f2(long x, long y);
    T1 f3(T1 x);
    undefined f4();
    undefined f5(DOMString x, boolean y, optional DOMString a = "A", optional boolean b = false);
};


// --- Callback functions

interface A3 {
    attribute ACallback event1;
    attribute ACallback? event2;
    //attribute AnyCallback event3;
};

callback ACallback = undefined (T1? a, long b);
// [FIXME] Syntax error at ?
// callback AnyCallback = any? ();

// -- Enums ---

interface A4 {
    attribute ScrollBehavior behavior;
};

enum ScrollBehavior { "auto", "instant", "smooth" };
// [FIXME] Generates invalid idents
enum StyleEnum { "", "first-value", "SECOND-VALUE" };


// --- Partials ---

interface A5 {
    attribute long x;
};

[Constructor(long a)]
partial interface A5 {
    attribute long y;
    const long z = 5;
    undefined f();
};

interface A7 {
    undefined g();
};


// --- Dictionaries ---

dictionary D1 {
    boolean a = true;
};

dictionary D2 {
    boolean a = true;
    required long b;
};


// --- Partial dictionaries ---

partial dictionary PD1 {
    boolean b = false;
};


partial namespace N1 {
    readonly attribute long y;
};

namespace N2 {
    readonly attribute long x;
    undefined f();
};


// --- Typedef ---

typedef (Int8Array or Int16Array or Int32Array or
         Uint8Array or Uint16Array or Uint32Array or Uint8ClampedArray or
         BigInt64Array or BigUint64Array or
         Float16Array or Float32Array or Float64Array or DataView) ArrayBufferView;


// TODO

callback interface EventListener {
  undefined handleEvent(Event event);
};


interface EventTarget {
  undefined addEventListener(DOMString type, EventListener? callback, optional (AddEventListenerOptions or boolean) options = {});
};

// Filter callback
interface NodeList {
    sequence<Node> filter((NodeFilter? or DOMString) by);
    sequence<Node> filterByFunc(NodeFilter func);
    sequence<Node> filterByFuncNullable(NodeFilter? func);
    sequence<Node> filterByName(DomString name);
};

callback interface NodeFilter {
    boolean filter(Node node);
};
