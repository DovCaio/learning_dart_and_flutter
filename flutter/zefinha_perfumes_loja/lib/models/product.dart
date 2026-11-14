class Product {
  final int id;
  final String name;
  final String brand;
  final int volume;
  final double price;
  final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.volume,
    required this.price,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      brand: json["brand"],
      volume: json['volume'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'volume': volume,
      'price': price,
      'quantity': quantity,
    };
  }
}

class ProductMinimized {
  final int id;
  final String name;
  final String brand;
  final double price;

  ProductMinimized({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
  });

  factory ProductMinimized.fromJson(Map<String, dynamic> json) {
    return ProductMinimized(
      id: json['id'],
      name: json["name"],
      brand: json['brand'],
      price: json['price'],
    );
  }
}
