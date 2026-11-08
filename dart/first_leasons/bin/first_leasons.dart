import 'package:first_leasons/first_leasons.dart' as first_leasons;

void main(List<String> arguments) {
  print("Olá! Mundo!");

  //Variables and inferencies

  var name = "Caio"; //Without type declaration, the type is inferred from the value assigned to it.
  var age = 23;
  var balance = 1000.50;

  print(name);
  print(age);
  print(balance);

  String name2 =
      "Caio"; //With type declaration, the type is explicitly defined.
  int age2 = 23;
  double balance2 = 1000.50;

  print(name2);
  print(age2);
  print(balance2);

  //Constants

  const pi = 3.14; //Constant value that cannot be changed at runtime, but can be assigned at compile time, its like javascript.
  final double pi2 = 3.14; //Final value that can be set at runtime but cannot be changed afterwards.

  print(pi);
  print(pi2);

  //Dinnamic type and Object type

  dynamic dynamicVariable =
      "Hello"; //Dynamic type can change its type at runtime.
  dynamicVariable = 10; //Now the type is int.
  print(dynamicVariable);

  Object objectVariable = "Hello"; //Object type can hold any type of value, and mantain the type of the value assigned to it, but cannot change its type at runtime.
  objectVariable = 10;
  print(objectVariable);

  print(objectVariable is String); //Check if the variable is of type String.
  print(objectVariable is int); //Check if the variable is of type int.
  print(dynamicVariable is String); //Check if the variable is of type String.
  print(dynamicVariable is int); //Check if the variable is of type int.

  //Interpolation of string

  String name3 = "Caio";
  int age3 = 23;

  print(
    'My name is ${name3} and I am ${age3} years old.',
  ); //Interpolation of string using $variableName.

  //Integer division

  int a = 10;
  int b = 3;

  print(a ~/ b); //Integer division using ~/ operator.

  //If statement

  bool expression = 1 < 2;

  if (expression) {
    print("The expression is true.");
  } else {
    print("The expression is false.");
  }

  //Switch statement

  String fruit = "banana";

  switch (fruit) {
    case "banana":
      print("The fruit is banana.");
      break;
    case "apple":
      print("The fruit is apple.");
      break;
    default:
      print("The fruit is not banana or apple.");
  }

  //For loop

  for (int i = 0; i < 5; i++) {
    print(i);
  }

  int i = 0;
  while (i < 5) {
    print(i);
    i++;
  }

  do {
    print(i);
    i++;
  } while (i < 5);

  List<String> fruits = ["banana", "apple", "orange"];
  for (String fruit in fruits) {
    if (fruit == "banana") {
      continue; //Skip the current iteration if the fruit is banana.
    }
    if (fruit == "orange") {
      break; //Break the loop if the fruit is orange.
    }
    print(fruit);
  }

  //Functions

  int result = sum(10, 20);
  print(result);

  bool greaterThan(int a, int b) => a > b; //Arrow function, same as a regular function that returns true if a is greater than b.

  print(greaterThan(10, 20));

  print(lessThan(a: a, b: b));

  print(isEven(10));
  print(isOdd(10));

  executeFunction(() {
    print("Hello from the function passed as parameter.");
  });
}

int sum(int a, int b) {
  return a + b;
}

int lessThan({required int a, required int b}) {
  return a < b ? 1 : 0; //Ternary operator, returns 1 if a is less than b, otherwise returns 0.
}

bool isEven([int? number]) {
  if (number == null) {
    return false; //Returns false if the number is null.
  }
  return number % 2 ==
      0; //Returns true if the number is even, otherwise returns false.
}

bool isOdd([int? number = 0]) {
  if (number == null) {
    return false; //Returns false if the number is null.
  }
  return number % 2 !=
      0; //Returns true if the number is odd, otherwise returns false.
}

void executeFunction(Function function) {
  function(); //Execute the function passed as parameter.
}
