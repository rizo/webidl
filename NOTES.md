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

