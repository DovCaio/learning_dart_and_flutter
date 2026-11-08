import 'package:oo/oo.dart' as oo;

class User {
  String name;
  int age;

  // formal parameter initialization
  User(
    this.name,
    this.age,
  ); // a constructor initialize the atributes in that way
}

class Transaction {
  String description;
  double amount;

  Transaction({
    required this.description,
    required this.amount,
  }); //Multiple constructors

  Transaction.income({required this.description, required this.amount});

  Transaction.expense({required this.description, required this.amount});

  void display() {
    print('$description R\$ $amount');
  }
}

class Rectangle {
  final double width;
  final double height;
  final double area;

  Rectangle(this.width, this.height) : area = width * height; //Late
}

class User2 {
  late String name; //Say to dart that the name gonna be initialized late

  void initialize() {
    name = 'Caio';
  }
}

class BankAccount {
  double _balance = 0; //Private

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError('Invalid amount');
    }

    _balance += amount;
  }
}

class Product {
  double price;

  Product(this.price);

  double get discountedPrice => price * 0.9; //Getter

  set updatePrice(double value) {
    //Setter
    if (value < 0) {
      throw ArgumentError('Price cannot be negative');
    }

    price = value;
  }
}

class Animal {
  void makeSound() {
    print('Animal sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Woof!');
  }
}

abstract class Payment {
  void process();
}

class PixPayment extends Payment {
  @override
  void process() {
    print('Processing Pix payment');
  }
}

class CreditCardPayment extends Payment {
  @override
  void process() {
    print('Processing credit card payment');
  }
}

mixin Timestamped {
  DateTime get createdAt => DateTime.now();
}

class Transaction2 with Timestamped {
  //Can use createAt()
  final String description;

  Transaction2(this.description);
}

class Logger {
  void log(String message) {
    print(message);
  }
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print('[CONSOLE] $message');
  }
}

class User3 {
  final String name;

  User3._(this.name);

  factory User3(String name) {
    if (name.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }

    return User3._(name);
  }
}

void main(List<String> arguments) {
  final transaction = Transaction(description: "A transaction", amount: 100);

  final salary = Transaction.income(description: 'Salário', amount: 5000);

  final rent = Transaction.expense(description: 'Aluguel', amount: 1200);

  transaction.display();

  final rectancle = Rectangle(1, 2);
  print(rectancle.area);
}
