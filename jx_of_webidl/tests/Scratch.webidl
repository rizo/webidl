interface A {
  undefined f0(boolean arg1, DOMString arg2, float arg3);
  undefined f1((boolean or DOMString) arg);
  undefined f2((Node or boolean or DOMString) arg1, float arg2);
  undefined f3((Node or boolean or DOMString)? arg1, float arg2, (boolean or float) arg3);
  undefined f4((Node or boolean? or DOMString) arg);
};

interface Node {
  
};
