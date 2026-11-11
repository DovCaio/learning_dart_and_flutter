import 'package:flutter/material.dart';
import 'package:zefinha_perfumes_loja/screens/product_details_screen.dart';
import 'package:zefinha_perfumes_loja/screens/product_form_screen.dart';

import '../models/product.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final List<Product> products = [
    Product(
      id: '1',
      name: 'Malbec',
      brand: 'O Boticário',
      volume: 100,
      price: 159.90,
      quantity: 12,
    ),
    Product(
      id: '2',
      name: 'Egeo Dolce',
      brand: 'O Boticário',
      volume: 90,
      price: 129.90,
      quantity: 8,
    ),
    Product(
      id: '3',
      name: 'Kaiak',
      brand: 'Natura',
      volume: 100,
      price: 119.90,
      quantity: 5,
    ),
    Product(
      id: '4',
      name: '212 VIP',
      brand: 'Carolina Herrera',
      volume: 80,
      price: 499.90,
      quantity: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zefinha Perfumes"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.shopping_bag)),
                  title: Text(product.name),
                  subtitle: Text('${product.brand} * ${product.volume} ml'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(product: product),
                      ),
                    );
                  },
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'R\$ ${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductFormScreen()),
          );
        },
        tooltip: 'Cadastrar produto',
        child: const Icon(Icons.add),
      ),
    );
  }
}
