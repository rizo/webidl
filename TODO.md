- [ ] Unescape: `where_`, `_any`.
- [ ] allow remapping webidl types to higher-level types.
- [x] Add `constructor` syntax https://webidl.spec.whatwg.org/#idl-constructors.
- [ ] Partial interfaces
- [ ] Partial dictionaries
- [ ] Empty stringifier.
- [ ] ~~Implement `Dates[]` syntax.~~
  - Deprecated? Find reference.
- [ ] Translate `(t or undefined)` to `t Js.undefined`.
- [ ] `Js.any` alias for `Js.t`
- [ ] Should getters for "optional" dict members be `Js.nullable`?
- [ ] Consider inlining callback interface types.
- [ ] Add of_string (option) to enums.
- [ ] Union typedefs should expose abstract constructors
- [ ] Add "safe" of_any that returns option to interfaces.
- [ ] Flatten nested unions.
- [ ] Rename regular_operation.type to return.
- [ ] Does Js.any need to include at least Nullable? See CustomEvent.detail.
- [ ] How do we introspect the type ``event:[ `Event | `String ] Js.t -> _``.
- [ ] Normalize overloaded functions to unions?
  - See: https://www.chromium.org/developers/web-idl-interfaces/#union-types
- [ ] If structural types are used, add aliases.
- [ ] fail on `bool` and other ambiguous types.
- [ ] better naming higiene (e.g. `this`).
- [ ] Add of/to super conv
- [ ] Fix:

```
type t = [< `Event | `String ] Js.t -> string -> int -> int -> Js.any -> Js.any
```

- [ ] Better enums: https://github.com/binast/binjs-ref/blob/4261ca204354423faa1c5e4236dff5e93b20a09d/spec/es6.webidl#L16
- [ ] Better tracking of type variables for union types. We need to consult the types ctx.
- [ ] Unresolved includes are not reported.
- [ ] Consider turning ``[ `Object ] Js.t`` into `'a Js.t`.
- [ ] Optimization: check constant strings and use `string_ascii` js codecs.
- [ ] Should Js container values be allowed to hold OCaml values when used in the Encode/Decode context?
- [ ] Warn on `void` and assume `undefined`.
- [ ] Aliases for `string`, `int`, etc.
