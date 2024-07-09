void main() {
  // defining a named record
  ({int a, int b}) pair = (a: 1, b: 2);

  switch (pair) {
    // case (int x, int y):
    //   print("X: $x and Y: $y");
    case (int a, int b):
      print("A: $a and b: $b");
  }

  /*
  
  M A T C H I N G

  */
  const a = 'aa';
  const b = 'ba';
  const c = 'ca';
  var obj = [c, b, a];

  switch (obj) {
    // List pattern [c,b,a] matches obj first if obj is a list with three fields
    // then if its fields match the constant subpatterns 'c', 'b', and 'a'
    case [c, b, a]:
      print("a: $a, b: $b, c: $c");
  }

  /*
  
  D E S T R U C T U R E

  */
  var numList = [1, 2, 3];
  // List pattern [a,b,c] destructure the three element from the numList...

  var [a1, b1, c1] = numList;
  // ... and assigns them to new variables.
  print("Destructure the list and add it's values ${a1 + b1 + c1}");

  List listt = [a, numList];
  switch (listt) {
    // case followed by pattern
    case ['aa' || 'ba', var nmlst]:
      print(nmlst);
  }

  /*
   
  Variable Declaration

  */
  // declares new variable w, e, and r
  var (w, [e, r]) = ('Str', [1, 2]);
}
