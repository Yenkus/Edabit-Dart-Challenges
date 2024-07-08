import 'dart:io';

void main() {
  // Testing records

  // instance of Identity
  Identity identity = Identity(name: 'Damien', age: 23, gender: Gender.male);

  // creating a dart variable
  final recordVariable = (String, int, Gender);

  // store a list of record of the identity of persons broken down to patterns
  // final record = (:name, :age, :gender);

  // function that returns a record pattern of the identity
  (String name, int age, Gender gender) printIdentity(
    Identity idCard,
  ) {
    var Identity(:name, :age, :gender) = idCard;
    print("name: $name, age: $age")
    return (name, age, gender);
  }

  final Foo myFoo = Foo(one: 1, two: 'two');
  var Foo(:one, :two) = myFoo;
  print("one: $one, two: $two");
}

class Foo {
  var one;
  var two;
  Foo({this.one, this.two});
}

class Identity {
  String name;
  int age;
  Gender gender;

  Identity({required this.name, required this.age, required this.gender});
}

enum Gender { male, female }
