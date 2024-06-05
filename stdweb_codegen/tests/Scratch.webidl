typedef double T;

interface A {
  undefined b1(boolean x);
  undefined f1(float x);
  undefined s1(DOMString x);
  undefined t1(T x);
  undefined a1(any x);
  undefined bn1(boolean? x);
  undefined tn1(T? x);
  //undefined u1((boolean or DOMString) x);
  //undefined u2((boolean? or DOMString) x);
  //undefined u3((boolean or DOMString)? x);

  undefined bo1(optional boolean x);
  undefined bo2(optional boolean x = false);
  undefined bo3(optional boolean? x);
  undefined bo4(optional boolean? x = null);
  undefined bo5(optional boolean? x = false);
  undefined to1(optional T x);
  undefined to2(optional T? x);
  undefined to3(optional T? x = null);
  undefined ao1(optional any x);
  undefined ao2(optional any x = true);
  undefined ao3(optional any x = null);
  undefined ou1(optional (boolean or DOMString) x);
  undefined ou2(optional (boolean? or DOMString) x = null);
  undefined ou3(optional (boolean or DOMString)? x);
  undefined ou4(optional (boolean or DOMString)? x = null);
  undefined ou5(optional (boolean or DOMString)? x = "abc");
};

