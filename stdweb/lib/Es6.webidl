
interface Window {
    static USVString decodeURI(USVString encodedURI);
    static USVString decodeURIComponent(USVString encodedURIComponent);
    static USVString encodeURI(USVString uri);
    static USVString encodeURIComponent(USVString uriComponent);
    static DOMString escape(DOMString value);
    static DOMString unescape(DOMString value);
    static any eval(DOMString value);

    //static attribute float Infinity;
    //static attribute any NaN;
    //static attribute any undefined;
};

callback Getter = any();
callback Setter = undefined(any value);

dictionary PropertyDescriptor {
  boolean configurable;
  boolean enumerable;
  any value;
  boolean? writable;
  Getter? get;
  Setter? set;
};

// Object
//
// https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object-objects
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object
// https://github.com/zloirock/core-js?tab=readme-ov-file#ecmascript-object
// https://github.com/microsoft/TypeScript/blob/79a851426c514a12a75b342e8dd2460ee6615f73/src/lib/es5.d.ts#L110
interface Object {
  constructor(optional any value);

  // Properties of the Object Constructor
  // https://tc39.es/ecma262/#sec-properties-of-the-object-constructor
  static Object assign(Object target, Object... sources);
  static Object create(
    Object proto,
    optional record<DOMString, PropertyDescriptor> props
  );
  static undefined defineProperties(Object obj, record<DOMString, PropertyDescriptor> props);
  static undefined defineProperty(Object obj, (DOMString or symbol) prop, PropertyDescriptor descriptor);
  static sequence<sequence<Object>> entries(Object obj);
  static undefined freeze(Object obj);
  static Object fromEntries(sequence<sequence<Object>> iterable);
  static PropertyDescriptor? getOwnPropertyDescriptor(Object obj, (DOMString or symbol) prop);
  static sequence<PropertyDescriptor> getOwnPropertyDescriptors(Object obj);
  static sequence<DOMString> getOwnPropertyNames(Object obj);
  static sequence<symbol> getOwnPropertySymbols(Object obj);
  static Object? getPrototypeOf(Object obj);
  static boolean is(Object value1, Object value2);
  static boolean isExtensible(Object obj);
  static boolean isFrozen(Object obj);
  static boolean isSealed(Object obj);
  static sequence<DOMString> keys(Object obj);
  static undefined preventExtensions(Object obj);

  // NOTE: prototype is missing
  // https://tc39.es/ecma262/#sec-object.prototype

  static undefined seal(object obj);
  static undefined setPrototypeOf(Object obj, object prototype);
  static sequence<any> values(Object obj);

  // Properties of the Object Prototype Object
  // https://tc39.es/ecma262/#sec-properties-of-the-object-prototype-object
  boolean hasOwnProperty((symbol or DOMString) prop);
  boolean isPrototypeOf(Object obj);
  boolean propertyIsEnumerable(DOMString prop);
  DOMString toLocaleString(
    (DOMString or sequence<DOMString>) locales,
    optional any options
  );
  DOMString toString();
  Object valueOf();
};


// Function
//
// https://tc39.es/ecma262/#sec-function-constructor
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function
interface Function {
  constructor(DOMString... params, DOMString body);
  any apply(Function thisArg, sequence<any> argArray);
  Function bind(Function thisArg, any... args);
  any call(Function thisArg, any... args);
  DOMString toString();
  readonly attribute unsigned long length;
  readonly attribute DOMString name;
};


// Boolean
//
// https://tc39.es/ecma262/#sec-boolean-objects
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean
interface Boolean {
  constructor(optional boolean value);
  DOMString toString();
  boolean valueOf();
};


// Symbol
//
// https://tc39.es/ecma262/#sec-symbol-objects
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol
interface Symbol {
  constructor(optional DOMString description);
  static Symbol for(DOMString key);
  static DOMString keyFor(DOMString sym);
  static readonly attribute boolean hasInstance;
  static readonly attribute boolean isConcatSpreadable;
  static readonly attribute sequence<symbol> iterator;
  static readonly attribute sequence<DOMString> match;
  static readonly attribute DOMString replace;
  static readonly attribute unsigned long search;
  static readonly attribute Function species;
  static readonly attribute sequence<DOMString> split;
  static readonly attribute object toPrimitive;
  static readonly attribute DOMString toStringTag;
  static readonly attribute object unscopables;
  DOMString toString();
  object valueOf();
};


// Number
//
// https://tc39.es/ecma262/#sec-number-constructor-number-value
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number
interface Number {
  constructor(optional long value);

  // Static methods
  static boolean isFinite(any number);
  static boolean isInteger(any number);
  // FIXME: rename
  static boolean isNaN(any number);
  static boolean isSafeInteger(any number);
  static float parseFloat(DOMString str);
  static long parseInt(DOMString str, unsigned long radix);

  // Static properties
  const double EPSILON = 2.2204460492503130808472633361816e-16;
  const unsigned long long MAX_SAFE_INTEGER = 9007199254740991;
  const double MAX_VALUE = 1.7976931348623157e308;
  const long long MIN_SAFE_INTEGER = -9007199254740991;
  const double MIN_VALUE = 5e-324;
  const float NAN = NaN;
  const float NEGATIVE_INFINITY = -Infinity;
  const float POSITIVE_INFINITY = Infinity;

  // Instance methods
  DOMString toExponential(unsigned long fractionDigits);
  DOMString toFixed(unsigned long fractionDigits);
  DOMString toLocaleString(
    (DOMString or sequence<DOMString>) locales,
    optional any options
  );
  DOMString toPrecision(unsigned long precision);
  DOMString toString(unsigned long radix);
  object valueOf();
};


// BigInt
//
// https://tc39.es/ecma262/#sec-bigint-objects
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt
interface BigInt {
  constructor((DOMString or long or boolean or BigInt) value);

  // Static methods
  long asIntN(unsigned long bits, BigInt bigint);
  unsigned long asUintN(unsigned long bits, BigInt bigint);

  // Instance methods
  DOMString toLocaleString(
    (DOMString or sequence<DOMString>) locales,
    optional any options
  );
  DOMString toString(unsigned long radix);
  object valueOf();
};


// Math
//
// https://tc39.es/ecma262/#sec-math-object
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math
namespace Math {
  readonly attribute double E;
  readonly attribute double LN10;
  readonly attribute double LN2;
  readonly attribute double LOG10E;
  readonly attribute double LOG2E;
  readonly attribute double PI;
  readonly attribute double SQRT1_2;
  readonly attribute double SQRT2;
  float abs(float x);
  float acos(float x);
  float acosh(float x);
  float asin(float x);
  float asinh(float x);
  float atan(float x);
  float atanh(float x);
  float atan2(float y, float x);
  float cbrt(float x);
  float ceil(float x);
  float clz32(float x);
  float cos(float x);
  float cosh(float x);
  float exp(float x);
  float expm1(float x);
  float floor(float x);
  float fround(float x);
  float hypot(float value1, float value2, float... values);
  float imul(float x, float y);
  float log(float x);
  float log1p(float x);
  float log10(float x);
  float log2(float x);
  float max(float value1, float value2, float... values);
  float min(float value1, float value2, float... values);
  float pow(float x, float y);
  float random();
  float round(float x);
  float sign(float x);
  float sin(float x);
  float sinh(float x);
  float sqrt(float x);
  float tan(float x);
  float tanh(float x);
  float trunc(float x);
};


// Date
//
interface Date {
  constructor(optional (long or DOMString or Date) value);
  constructor(
    long year,
    long month,
    optional long date,
    optional long hours,
    optional long minutes,
    optional long seconds,
    optional long ms
  );
  static Date now();
  static Date parse(DOMString string);
  static unsigned long UTC(
    long year,
    long month,
    optional long date,
    optional long hours,
    optional long minutes,
    optional long seconds,
    optional long ms
  );
  short getDate();
  short getDay();
  unsigned long getFullYear();
  short getHours();
  unsigned long getMilliseconds();
  unsigned short getMinutes();
  short getMonth();
  unsigned long getSeconds();
  object getTime();
  short getTimezoneOffset();
  short getUTCDate();
  short getUTCDay();
  unsigned long getUTCFullYear();
  short getUTCHours();
  unsigned long getUTCMilliseconds();
  unsigned short getUTCMinutes();
  short getUTCMonth();
  unsigned long getUTCSeconds();
  unsigned long setDate(long date);
  unsigned long setFullYear(
    long year,
    optional long month,
    optional long date
  );
  unsigned long setHours(
    long hour,
    optional long min,
    optional long sec,
    optional long ms
  );
  unsigned long setMilliseconds(long ms);
  unsigned long setMinutes(long min, optional long sec, optional long ms);
  unsigned long setMonth(long month, optional long date);
  unsigned long setSeconds(long sec, optional long ms);
  unsigned long setTime(long time);
  unsigned long setUTCDate(long date);
  unsigned long setUTCFullYear(
    long year,
    optional long month,
    optional long date
  );
  unsigned long setUTCHours(
    long hour,
    optional long min,
    optional long sec,
    optional long ms
  );
  unsigned long setUTCMilliseconds(long ms);
  unsigned long setUTCMinutes(
    long min,
    optional long sec,
    optional long ms
  );
  unsigned long setUTCMonth(long month, optional long date);
  unsigned long setUTCSeconds(long sec, optional long ms);
  DOMString toDateString();
  DOMString toISOString();
  DOMString toJSON();
  DOMString toLocaleDateString(
    optional DOMString locales,
    optional object options
  );
  DOMString toLocaleString(
    optional DOMString locales,
    optional object options
  );
  DOMString toLocaleTimeString(
    optional DOMString locales,
    optional object options
  );
  DOMString toString();
  DOMString toTimeString();
  DOMString toUTCString();
  unsigned long valueOf();
};


// String
//
// https://tc39.es/ecma262/#sec-string-objects
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
interface String {
  constructor(any value);
  static DOMString fromCharCode(DOMString... codeUnits);
  static DOMString fromCodePoint(DOMString... codePoints);
  static DOMString raw(DOMString template, DOMString... substitutions);
  DOMString charAt(unsigned long long pos);
  DOMString charCodeAt(unsigned long long pos);
  DOMString codePointAt(unsigned long long pos);
  DOMString concat(DOMString... strings);
  boolean endsWith(
    DOMString searchString,
    optional unsigned long long endPosition
  );
  boolean includes(
    DOMString searchString,
    optional unsigned long long position
  );
  long long indexOf(
    DOMString searchString,
    optional unsigned long long position
  );
  long long lastIndexOf(
    DOMString searchString,
    optional unsigned long long position
  );
  long localeCompare(
    object that,
    optional DOMString locales,
    optional object options
  );
  object match(object regexp);
  DOMString normalize(optional DOMString form);
  DOMString padEnd(unsigned long long maxLength, DOMString fillString);
  DOMString padStart(unsigned long long maxLength, DOMString fillString);
  DOMString repeat(unsigned long long count);
  DOMString replace(object searchValue, object replaceValue);
  object search(object regexp);
  DOMString slice(unsigned long long start, unsigned long long end);
  sequence<DOMString> split(DOMString separator, unsigned long long limit);
  boolean startsWith(DOMString searchString, optional long long position);
  DOMString substring(unsigned long long start, unsigned long long end);
  DOMString toLocaleLowerCase(optional DOMString locales);
  DOMString toLocaleUpperCase(optional DOMString locales);
  DOMString toLowerCase();
  DOMString toString();
  DOMString toUpperCase();
  DOMString trim();
  object valueOf();
};


// RegExp
//
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp
interface RegExp {
  constructor((DOMString or RegExp) pattern, optional DOMString flags);
  sequence<DOMString> exec(DOMString string);
  readonly attribute DOMString flags;
  readonly attribute boolean global;
  readonly attribute boolean ignoreCase;
  readonly attribute boolean multiline;
  readonly attribute DOMString source;
  readonly attribute boolean sticky;
  boolean test(DOMString s);
  DOMString toString();
  attribute boolean unicode;
};

// Indexed collections

// Array
//
// https://tc39.es/ecma262/#sec-array-objects
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array
interface Array {
  constructor();
  constructor(unsigned long len);
  constructor(T... args);
  static Array from(any items, optional object mapfn, optional any thisArg);
  static boolean isArray(any arg);
  static Array of(any... items);
  Array concat(any... arguments);
  object copyWithin(long target, optional long start, optional long end);
  object entries();
  boolean every(object callbackfn, optional any thisArg);
  object fill(object value, optional long start, optional long end);
  Array filter(object callbackfn, optional any thisArg);
  undefined find(object predicate, optional any thisArg);
  long findIndex(object predicate, optional any thisArg);
  undefined forEach(object callbackfn, optional any thisArg);
  boolean includes(any searchElement, unsigned long fromIndex);
  long indexOf(any searchElement, optional long fromIndex);
  DOMString join(DOMString separator);
  object keys();
  long lastIndexOf(any searchElement, optional long fromIndex);
  Array map(any fn, optional any thisArg);
  any pop();
  unsigned long push(any... items);
  object reduce(object callbackfn, optional any initialValue);
  object reduceRight(object callbackfn, optional any initialValue);
  object reverse();
  any shift();
  Array slice(long start, long end);
  boolean some(object callbackfn, optional any thisArg);
  undefined sort(object comparefn);
  Array splice(unsigned long start, unsigned long deleteCount, any... items);
  DOMString toLocaleTimeString(
    optional DOMString locales,
    optional object options
  );
  DOMString toString();
  unsigned long unshift(any... items);
  object values();
  attribute unsigned long length;
};


// TypedArray
//
// https://tc39.es/ecma262/#sec-typedarray-objects
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray
interface TypedArray {
  static object from(object source, optional object mapfn, optional any thisArg);
  static object of(any... items);
  attribute object buffer;
  attribute unsigned long byteLength;
  attribute unsigned long byteOffset;
  object copyWithin(object target, unsigned long start, optional unsigned long end);
  object entries();
  boolean every(object callbackfn, optional any thisArg);
  object fill(object value, optional long start, optional long end);
  object filter(object callbackfn, optional any thisArg);
  undefined find(object predicate, optional any thisArg);
  long findIndex(object predicate, optional any thisArg);
  undefined forEach(object callbackfn, optional any thisArg);
  boolean includes(any searchElement, unsigned long fromIndex);
  long indexOf(any searchElement, optional long fromIndex);
  DOMString join(DOMString separator);
  object keys();
  long lastIndexOf(any searchElement, optional long fromIndex);
  attribute unsigned long length;
  object map(object callbackfn, optional any thisArg);
  object reduce(object callbackfn, optional any initialValue);
  object reduceRight(object callbackfn, optional any initialValue);
  object reverse();
  undefined set(Array array, optional long offset);
  undefined set(object typedArray, optional long offset);
  object slice(long start, long end);
  boolean some(object callbackfn, optional any thisArg);
  undefined sort(object comparefn);
  object subarray(optional long begin, optional long end);
  DOMString toLocaleString();
  DOMString toString();
  object values();
  attribute unsigned long BYTES_PER_ELEMENT;
};


// Int8Array
//
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array
interface Int8Array {
  constructor();
  constructor(any... argList);
  constructor(unsigned long length);
  constructor(Int8Array array);
  constructor(object obj);
  constructor(object buffer, optional long byteOffset, optional unsigned long byteLength);
};
// TODO: TypedArray isn't a mixin
Int8Array includes TypedArray;


// Uint8Array
//
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array
interface Uint8Array {
  constructor();
  constructor(any... argList);
  constructor(unsigned short length);
  constructor(Uint8Array array);
  constructor(object obj);
  constructor(object buffer, optional unsigned short byteOffset, optional unsigned short byteLength);
};
Uint8Array includes TypedArray;


// Uint8ClampedArray
//
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray
interface Uint8ClampedArray {
  constructor();
  constructor(any... argList);
  constructor(unsigned short length);
  constructor(Uint8ClampedArray array);
  constructor(object obj);
  constructor(object buffer, optional unsigned short byteOffset, optional unsigned short byteLength);
};
Uint8ClampedArray includes TypedArray;


// Int16Array
//
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array
interface Int16Array {
  constructor();
  constructor(any... argList);
  constructor(unsigned long length);
  constructor(Int16Array array);
  constructor(object obj);
  constructor(object buffer, optional long byteOffset, optional unsigned long byteLength);
};
Int16Array includes TypedArray;


// Uint16Array
//
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array
interface Uint16Array {
  constructor();
  constructor(any... argList);
  constructor(unsigned short length);
  constructor(Uint16Array array);
  constructor(object obj);
  constructor(object buffer, optional unsigned short byteOffset, optional unsigned short byteLength);
};
Uint16Array includes TypedArray;


// Int32Array
//
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array
interface Int32Array {
  constructor();
  constructor(any... argList);
  constructor(unsigned long length);
  constructor(Int32Array array);
  constructor(object obj);
  constructor(object buffer, optional long byteOffset, optional unsigned long byteLength);
};
Int32Array includes TypedArray;

// Uint32Array
//
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array
interface Uint32Array {
  constructor();
  constructor(any... argList);
  constructor(unsigned long length);
  constructor(Uint32Array array);
  constructor(object obj);
  constructor(object buffer, optional unsigned long byteOffset, optional unsigned long byteLength);
};
Uint32Array includes TypedArray;


// TODO: BigInt64Array
// TODO: BigUint64Array


// Float32Array
//
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array
interface Float32Array {
  constructor();
  constructor(any... argList);
  constructor(unsigned long length);
  constructor(Float32Array array);
  constructor(object obj);
  constructor(object buffer, optional long byteOffset, optional unsigned long byteLength);
};
Float32Array includes TypedArray;


// Float64Array
//
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array
interface Float64Array {
  constructor();
  constructor(any... argList);
  constructor(unsigned long length);
  constructor(Float64Array array);
  constructor(object obj);
  constructor(object buffer, optional long byteOffset, optional unsigned long byteLength);
};
Float64Array includes TypedArray;


// Keyed collections

// Map
interface Map {
  constructor(optional object iterable);
  undefined clear();
  boolean delete(any key);
  object entries();
  undefined forEach(object callbackfn, optional any thisArg);
  undefined get(any key);
  boolean has(any key);
  object keys();
  Map set(any key, any value);
  attribute unsigned long size;
  object values();
};

// Set
interface Set {
  constructor(optional Iterator input);
  object add(any value);
  undefined clear();
  boolean delete(any value);
  object entries();
  undefined forEach(object callbackfn, optional any thisArg);
  boolean has(any value);
  object keys();
  attribute unsigned long long size;
  object values();
};

// WeakMap
interface WeakMap {
  constructor(optional object iterable);
  boolean delete(any key);
  undefined get(any key);
  boolean has(any key);
  WeakMap set(any key, any value);
};

// WeakSet
interface WeakSet {
  constructor(optional object iterable);
  WeakSet add(any value);
  boolean delete(any value);
  boolean has(any value);
};


// Structured data

// ArrayBuffer
interface ArrayBuffer {
  constructor(unsigned long length);
  static boolean isView(any arg);
  attribute unsigned long byteLength;
  // TODO
  //ArrayBuffer slice(unsigned long start, unsigned long end);
};

// SharedArrayBuffer
interface SharedArrayBuffer {
  constructor(unsigned long length);
  attribute unsigned long byteLength;
  SharedArrayBuffer slice(unsigned long start, unsigned long end);
};

// DataView
interface DataView {
  constructor(object buffer, optional long byteOffset, optional unsigned long byteLength);
  attribute object buffer;
  attribute unsigned long byteLength;
  attribute unsigned long byteOffset;
  float getFloat32(float byteOffset, optional boolean littleEndian);
  double getFloat64(double byteOffset, optional boolean littleEndian);
  // TODO
  //byte getInt8(byte byteOffset);
  short getInt16(short byteOffset, optional boolean littleEndian);
  long getInt32(long byteOffset, optional boolean littleEndian);
  // TODO
  //octet getUint8(octet byteOffset);
  unsigned short getUint16(unsigned short byteOffset, optional boolean littleEndian);
  unsigned long getUint32(unsigned long byteOffset, optional boolean littleEndian);
  undefined setFloat32(float byteOffset, float value, optional boolean littleEndian);
  undefined setFloat64(double byteOffset, double value, optional boolean littleEndian);
  // TODO
  //undefined setInt8(byte byteOffset, byte value, optional boolean littleEndian);
  undefined setInt16(short byteOffset, short value, optional boolean littleEndian);
  undefined setInt32(long byteOffset, long value, optional boolean littleEndian);
  // TODO
  //undefined setUint8(octet byteOffset, octet value, optional boolean littleEndian);
  undefined setUint16(unsigned short byteOffset, unsigned short value, optional boolean littleEndian);
  undefined setUint32(unsigned long byteOffset, unsigned long value, optional boolean littleEndian);
};

// TODO
// Atomics
//interface Atomics {
//  static unsigned long add((Int8Array or Uint8Array or Int16Array or Uint16Array or Int32Array or //Uint32Array) typedArray, unsigned long index, unsigned long value);
//  static unsigned long and((Int8Array or Uint8Array or Int16Array or Uint16Array or Int32Array or //Uint32Array) typedArray, unsigned long index, unsigned long value);
//  static unsigned long compareExchange((Int8Array or Uint8Array or Int16Array or Uint16Array or //Int32Array or Uint32Array) typedArray, unsigned long index, unsigned long expectedValue, unsigned //long replacementValue);
//  static unsigned long exchange((Int8Array or Uint8Array or Int16Array or Uint16Array or Int32Array //or Uint32Array) typedArray, unsigned long index, unsigned long value);
//  static boolean isLockFree(unsigned long size);
//  static unsigned long load((Int8Array or Uint8Array or Int16Array or Uint16Array or Int32Array or //Uint32Array) typedArray, unsigned long index);
//  static unsigned long or_((Int8Array or Uint8Array or Int16Array or Uint16Array or Int32Array or //Uint32Array) typedArray, unsigned long index, unsigned long value);
//  static unsigned long store((Int8Array or Uint8Array or Int16Array or Uint16Array or Int32Array or //Uint32Array) typedArray, unsigned long index, unsigned long value);
//  static unsigned long sub((Int8Array or Uint8Array or Int16Array or Uint16Array or Int32Array or //Uint32Array) typedArray, unsigned long index, unsigned long value);
//  // TODO
//  //static DOMString wait(Int32Array typedArray, unsigned long index, unsigned long value, optional //float timeout);
//  static unsigned long wake(Int32Array typedArray, unsigned long index, unsigned long count);
//  static unsigned long xor((Int8Array or Uint8Array or Int16Array or Uint16Array or Int32Array or //Uint32Array) typedArray, unsigned long index, unsigned long value);
//};

// JSON
interface JSON {
  static object parse(DOMString text, optional object reviver);
  DOMString stringify(object value, optional object replacer, optional object space);
};


// Managing memory

// WeakRef
// FinalizationRegistry


// Control abstraction objects

// Iterator
interface Iterator {
};

// AsyncIterator
// Promise
interface Promise {
  constructor(object executor);
  static Promise<any> all(object iterable);
  static Promise<any> race(object iterable);
  static Promise<any> reject(object r);
  static Promise<any> resolve(object x);
  object catch(object onRejected);
  Promise<any> then(object onFulfilled, object onReject);
};

// GeneratorFunction
// AsyncGeneratorFunction
// Generator
// AsyncGenerator
// AsyncFunction


// Reflection

// Reflect
interface Reflect {
  static object apply(object target, any thisArgument, sequence<any> argumentList);
  static object defineProperty(object target, DOMString propertyKey, sequence<any> argumentList);
  static object deleteProperty(object target, DOMString propertyKey);
  static object get(object target, DOMString propertyKey, optional object reciever);
  static PropertyDescriptor getOwnPropertyDescriptor(object target, DOMString propertyKey);
  static object getPrototypeOf(object target);
  static boolean has(object target, DOMString propertyKey);
  static boolean isExtensible(object target);
  static object ownKeys(object target);
  static object preventExtensions(object target);
  static object set(object target, DOMString propertyKey, any V, optional object reciever);
  static object setPrototypeOf(object target, object proto);
};

// Proxy
interface Proxy {
  constructor(object target, object handler);
  static object revocable(object target, object handler);
};


// Internationalization

// Intl
//
// https://tc39.es/ecma402
namespace Intl {
  readonly attribute Collator Collator;
  readonly attribute object DateTimeFormat;
  readonly attribute object NumberFormat;
  sequence<DOMString> getCanonicalLocales(sequence<DOMString> locales);
};

// https://tc39.es/ecma402/#collator-objects
interface Collator {
  constructor(
    optional (DOMString or sequence<DOMString>) locales,
    optional CollatorInit options
  );
  static sequence<DOMString> supportedLocalesOf(
    (DOMString or sequence<DOMString>) locales,
    optional SupportedLocalesOptions options
  );
  boolean compare(DOMString string1, DOMString string2);
  CollatorOptions resolvedOptions();
};

dictionary CollatorOptions {
  DOMString locale;
  CollatorUsage usage;
  CollatorSensitivity sensitivity;
  boolean ignorePunctuation;
  DOMString collation;
  boolean numeric;
  CollatorCase caseFirst;
};

enum CollatorSensitivity {
  "base",
  "accent",
  "case",
  "variant"
};

enum CollatorCase {
  "upper",
  "lowe",
  "false"
};

enum CollatorLocaleMatcher {
  "lookup",
  "best fit"
};

enum CollatorUsage {
  "sort",
  "search"
};

dictionary CollatorInit {
  CollatorUsage usage;
  CollatorLocaleMatcher localeMatcher;
  DOMString collation;
  boolean numeric;
  CollatorCase caseFirst;
  CollatorSensitivity sensitivity;
  boolean ignorePunctuation;
};

dictionary SupportedLocalesOptions {
  CollatorLocaleMatcher localeMatcher;
};
