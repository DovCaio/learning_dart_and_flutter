import 'package:collections/collections.dart' as collections;

void main(List<String> arguments) {
  //Lists
  List<String> categories = ["Fruits", "Vegetables", "Dairy"];

  print(categories);
  print(categories[0]);
  categories.add("Meat");
  print(categories);
  categories.remove("Dairy");
  print(categories);
  categories.removeAt(0);
  print(categories);

  print(categories.contains("Meat"));
  print(categories.indexOf("Meat"));
  print(categories.length);
  print(categories.isEmpty);
  print(categories.isNotEmpty);
  print(categories.reversed);
  print(categories.sublist(0, 2));
  print(categories.join(", "));
  print(categories.toSet());
  print(categories.first);
  print(categories.last);

  //Sets - works like a list, but does not allow duplicate values and does not maintain the order of the elements.

  Set<String> categoriesSet = {"Fruits", "Vegetables", "Dairy"};

  print(categoriesSet);

  //Maps - works like a dictionary, where each element has a key and a value.

  Map<String, String> categoriesMap = {
    "Fruits": "Fruits are a great source of vitamins and minerals.",
    "Vegetables": "Vegetables are a great source of fiber and vitamins.",
    "Dairy": "Dairy products are a great source of calcium and protein.",
  };

  print(categoriesMap);
  print(categoriesMap["Fruits"]);
  categoriesMap["Meat"] = "Meat is a great source of protein.";
  print(categoriesMap);
  categoriesMap.remove("Dairy");
  print(categoriesMap);
  categoriesMap.removeWhere((key, value) => key == "Vegetables");
  print(categoriesMap);
  print(categoriesMap.containsKey("Meat"));
  print(categoriesMap.containsValue("Meat is a great source of protein."));

  //Whe have a lot of methods to manipulate collections, like map, where, reduce, fold, etc. We can use them to manipulate collections in a functional way.

  //Spread operator - allows us to spread the elements of a collection into another collection.

  final List<String> categories2 = ["Fruits", "Vegetables", "Dairy"];
  final List<String> categories3 = ["Meat", "Fish", "Eggs"];

  final List<String> allCategories = [...categories2, ...categories3];
  print(allCategories);

  //Null aware spread

  List<int>? values;

  final result = [1, ...?values, 2];
  print(result);
}
