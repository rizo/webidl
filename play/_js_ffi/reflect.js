
// Provides: stdweb_ffi_fun_call (const, shallow)
function stdweb_ffi_fun_call(f, xs) {
  return f.apply(null, xs)
}
// Provides: stdweb_ffi_meth_call (mutable, const, shallow)
function stdweb_ffi_meth_call(obj, prop, xs) {
  return obj[prop].apply(obj, xs);
}

// Provides: stdweb_console_log
function stdweb_console_log(x) {
  console.log(x);
}
