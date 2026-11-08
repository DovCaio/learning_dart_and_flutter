import 'package:generic/generic.dart' as generic;

class Box<T> {
  T value;
  Box(this.value);
}

class ApiResponse<T> {
  //This is how we use
  final T data;
  final int statusCode;

  ApiResponse({required this.data, required this.statusCode});
}

class Pair<K, V> {
  final K key;
  final V value;

  Pair(this.key, this.value);
}

T firstElement<T>(List<T> items) {
  return items.first;
}

abstract class Identifiable {
  String get id;
}

// we limite the type
class Repository<T extends Identifiable> {
  void printId(T item) {
    print(item.id);
  }
}

typedef Json = Map<String, dynamic>;

void main(List<String> arguments) {
  final Box<int> box = Box(100);
  int value = box.value;
  print(value);

  final ApiResponse<String> nameResponse = ApiResponse(
    data: 'Caio',
    statusCode: 200,
  );

  final ApiResponse<List<String>> namesResponse = ApiResponse(
    data: ['Caio', 'João'],
    statusCode: 200,
  );

  final pair = Pair<String, int>('age', 25);

  final number = firstElement<int>([10, 20, 30]);

  final name = firstElement<String>(['Caio', 'João']);

  Json transaction = {'description': 'Mercado', 'amount': 120.50};
}
