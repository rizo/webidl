interface Args {
  undefined f_any(any a);
  undefined f_symbol(symbol a);
  undefined f_undefined(undefined a);
  undefined f_promise(Promise<boolean> a);
  undefined f_named(Foo a);
  undefined f_sequence(sequence<Foo> a);
  undefined simple(DOMString a, unsigned short b, boolean c);
  undefined variadic_simple(DOMString... nodes);
  undefined union_simple((Node or TrustedScript or DOMString) node);
  undefined variadic_union((Node or TrustedScript or DOMString)... nodes);
};
