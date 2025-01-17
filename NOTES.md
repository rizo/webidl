# NOTES

- https://developer.mozilla.org/en-US/docs/MDN/Writing_guidelines/Howto/Write_an_API_reference/Information_contained_in_a_WebIDL_file
- https://github.com/w3c/webref
- https://github.com/w3c/webref/blob/main/ed/idl/dom.idl
- stringifier operations have been removed from the spec:
  - https://github.com/whatwg/webidl/pull/941
- https://hachyderm.io/@sunfish/111890572964266770
- https://github.com/tc39/proposal-idl
- https://www.chromium.org/blink/webidl/
- https://github.com/tc39/proposal-idl
- https://github.com/whatwg/webidl/labels/jsidl
- https://github.com/whatwg/webidl/issues/485
- https://github.com/w3ctag/jsidl
- https://github.com/jmdyck/ecmaspeak-py


## Principles

1. Prioritize OCaml patterns and types when possible.
  - This might add additional conversion overhead, but substantially simplifies working with the bindings.
  - For users who want to fully reduce conversion overhead it is possible to use the low-level FFI API.
  - In the future we could provide a secondary generator tht prioritizes Js values.


## Webidl

- https://hacks.mozilla.org/2020/04/fuzzing-with-webidl/

## Typescript

- https://github.com/jsiebern/re-typescript

## WASM

- https://blog.yoshuawuyts.com/rethinking-wit-as-a-machine-format/
- https://github.com/wasi-gfx/webidl-wit
- https://hachyderm.io/@sunfish/111890572964266770


## Implementation

### Callbacks

Represented as modules with type `t` containing the function type.


### Callback interfaces

Represented as modules with type `t` containing the function type.

Bindings for the callback interfaces currently do not strictly follow the spec
since the function is always represented as a type and not as an interface
member.

For example, in the following interface declaration `EventListener` is a callback interface.

```
interface EventTarget {
  undefined addEventListener
    DOMString type,
    EventListener? callback,
    optional (AddEventListenerOptions or boolean) options = {}
  );
}
```

And here is the definition of the `EventListener` interface:

```
callback interface EventListener {
  undefined handleEvent(Event event);
};
```

In practice, this means that both a callback function with type `Event.t ->
undefined` and an object with a `handleEvent` method are accepted as valid
values for `EventListener`.

But we only implement the function version of this. Using the function is
more flexible since, if needed, the body of the function can either directly
implement the required logic, or, delegate the work to any object/method.


## Notes for public documentation

- The super type represents the inheritence hierarchy for a given class.


## Notes on type constraints

- The type constraints in the signatures only allow values with a valid
  and native JavaScript runtime representation. For exmaple: `int Jx.array
  Jx.promise` does not require conversion because, the type is already
  a valid native JavaScript value. Note that `int` has the same runtime
  representation in both JavaScript and OCaml. On the other hand, if the runtime
  reperesentations differ, a JavaScript object should be passed instead.
  - The only exception to this rule are functions/callbacks.

## Inheritence

- If a purely structural approach is followed in the codegen, we wan't be able to ensure full type compatibility. This is because the inheritence information of some types might not be available in the compilation scope. If there's a return type `T`, we might not know the base classes of `T` because it's defined in a different scope.
- Interface methods might refer to callback types that are not in scope. It should be possible to convert a function into an opaque callback type to resolve these incompatibilities. For example, `Event_listener` should have a `val make : t -> [<Event_listener] Js.t` to allow the function to lifted to an opaque, structural js type.

## OOP

- Call a method on an instance of a class.
- Extend base class.
- Call base class method on a derived class instance.
- Create a list of instances with a common base class.
- Downcast an instance to a base class.
- Dynamic safe upcast.
- Static unsafe upcast.

## Goals

- Bindings should avoid wrapping and aim to represent the datastructure and FFI calls as natively as possible.
- Creating hetrogenous JS objects should be easy.
  - `Jx.obj [ ("foo", Jx.string "abc"); ("n", Jx.int 42); ]`
- Allow representing object inheritence.
- Implicit obj to any conversion.


## Default values

- Default arguments can be passed using two different methods:
  1. Passing undefined values to the JS API: this implies exposing the undefined
     argument in the ML API (either as `Option.t` or as `Undefined.t`). The JS
     API will implicitly use the default value defined in the spec.
  2. Explicitly encoding and passing the default value defined in the spec.
     - This avoids the need for boxing in the ML API. 
     - This "overrides" the JS API default values (with the same value).
     - Could this lead to inconsistent behaviour? That is, what if the JS API
       handles `undefined` and an explicit default value differently? The assumption is
       that the JS API uses the default value described in the spec.
    - What if the default values, for whatever unlikely reason, diverge?
    - Are there differences in default values between browsers?
      - If so, in a way we ensure higher degree of consistency...

