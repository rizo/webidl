// https://www.w3.org/respec/examples/webidl-contiguous.html#introduction
[Constructor]
interface Dahut : Mammal {
  const unsigned short LEVROGYROUS = 0;
  const unsigned short DEXTROGYROUS = 1;
  readonly attribute DOMString chirality;
  attribute unsigned long age;
  Dahut turnAround(float angle, boolean fall);
  unsigned long trip();
  void yell([AllowAny] unsigned long volume,
            [TreatNullAs=EmptyString] DOMString sentence);
};


// https://www.w3.org/respec/examples/webidl-contiguous.html#interfaces
interface SuperStar {};
[Something, Constructor()] interface SuperStar {};
interface SuperStar : HyperStar {};
partial interface SuperStar {};
// [FIXME] Syntax error near "interface"
// callback interface SuperStar {};
interface DocInterface {};
interface DocIsNotCaseSensitive {};
interface UndocInterface {};


// https://www.w3.org/respec/examples/webidl-contiguous.html#constructors
[
  Something,
  Constructor
  // [FIXME] Syntax error near "Promise"
  // Constructor(boolean bar, sequence<double> foo, Promise<double> blah)
]
interface SuperStar {};

[Constructor] interface SuperStar {};


// https://www.w3.org/respec/examples/webidl-contiguous.html#constants
interface ConstTest {
  // 1
  const boolean test = true;
  // 2
  const byte bite = 8;
  // 3
  const octet eight = 7;
  // 4
  const short small = 42;
  // 5
  const unsigned short shortish = 250;
  // 6
  const long notSoLong = 99999;
  // 7
  const unsigned long somewhatLong = 9999999;
  // 8
  const long long veryLong = 9999999999999;
  // 9
  const unsigned long long soLong = 99999999999999999;
  // 10
  const float ationDevice = 4.2;
  // 11
  const unrestricted float buoy = 4.2222222222;
  // 12
  const double twice = 4.222222222;
  // 13
  const unrestricted double rambaldi = 47.0;
  // 16
  const short inf = Infinity;
  // 17
  const short mininf = -Infinity;
  // 18
  const short cheese = NaN;
  // 18
  [Something] const short extAttr = NaN;
};


// https://www.w3.org/respec/examples/webidl-contiguous.html#attributes
interface AttrBasic {
  // 1
  attribute DOMString regular;
  // 2
  readonly attribute DOMString ro;
  // 2.2
  readonly attribute DOMString _readonly;
  // 2.5
  inherit attribute DOMString in;
  // 2.7
  stringifier attribute DOMString st;
  // 3
  [Something] readonly attribute DOMString ext;
  // 3.5
  // [FIXME]
  // attribute Date[] dates;
  attribute sequence<Date> dates;
  // 4.0
  attribute Promise<DOMString> operation;

};


// https://www.w3.org/respec/examples/webidl-contiguous.html#operations
interface MethBasic {
  // 1
  void basic();
  // 2
  [Something] void ext();
  // 3
  unsigned long long ull(short s);
  // 3.5
  SuperStar? ull();
  // 4
  // Parameters:
  // one: 4.1
  // ext: 4.1
  // maybe: 4.2
  // shorts: 4.3
  // hypercubes: 4.3
  // defaulted: 4.3
  // defaulted2: 4.3
  // variable: 4.last
  // [FIXME] Syntax error near []
  // SuperStar[][][][] paramed(SuperStar[][]?[] one, [ExtAttrs] ByteString? ext, optional short maybe, short[] shorts, short[][][][] hypercubes, optional short defaulted = 3.5, optional DOMString defaulted2 = "one", short... variable);
};


// https://www.w3.org/respec/examples/webidl-contiguous.html#serializer
interface SerializerMap {
  attribute DOMString foo;
  attribute DOMString bar;
  // [FIXME] Syntax error near =
  // serializer = { foo, bar };
};


// https://www.w3.org/respec/examples/webidl-contiguous.html#comments
interface SuperStar {
  // This is a comment
  // over two lines.
};


// dictionary SuperStar {};
dictionary SuperStar {};
dictionary SuperStar : HyperStar {};
dictionary SuperStar {
  // 1
  DOMString value;
  // 2
  DOMString? nullable;
  // 3
  [Something]float ext;
  // 4
  unsigned long long longLong;
  // 5
  boolean test = true;
  // 7
  byte little = 2;
  // 8
  byte big = Infinity;
  // 9
  byte cheese = NaN;
  // 10
  DOMString blah = "blah blah";
};
dictionary DictDocTest {
  DOMString dictDocField;
  DOMString? otherField;
  long undocField;
};


// https://www.w3.org/respec/examples/webidl-contiguous.html#exceptions
// [FIXME] Syntax error
// exception SuperStar {};
// exception SuperStar : HyperStar {};
// exception ExFields {
//   // 1
//   [Something]const SuperStar value = 42;
//   // 2
//   SuperStar? message;
//   // 3
//   sequence<SuperStar> floats;
//   // 4
//   SuperStar[][] numbers;
//   // 5
//   Promise<SuperStar> stars;
// };


// https://www.w3.org/respec/examples/webidl-contiguous.html#enumerations
enum EnumBasic {
  // 1
  "one",
  // 2
  "two",
  // 3
  "three",
  // 4
  // [FIXME] Results in invalid identifier
  //"white space"
};


// https://www.w3.org/respec/examples/webidl-contiguous.html#callbacks
callback SuperStar = void();
callback CbLessBasic = unsigned long long?(optional any value);


// https://www.w3.org/respec/examples/webidl-contiguous.html#typedefs
typedef DOMString string;
typedef [Something] unsigned long long? tdLessBasic;

