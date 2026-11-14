import 'package:flutter/material.dart';
import 'package:zefinha_perfumes_loja/models/product.dart';
import 'package:zefinha_perfumes_loja/service/product_service.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final ProductService productService = ProductService();

  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _volumeController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _volumeController.dispose();
    _priceController.dispose();
    _quantityController.dispose();

    super.dispose();
  }

  Future<void> _saveProduct() async {
    if (_formKey.currentState!.validate()) {
      Product product = Product(
        id: '1',
        name: _nameController.text,
        brand: _brandController.text,
        volume: int.parse(_volumeController.text),
        price: double.parse(_priceController.text),
        quantity: int.parse(_quantityController.text),
      );

      try {
        await productService.postProduct(product);

        if (!mounted) return;
        Navigator.pop(context);
      } catch (error) {
        debugPrint('Erro ao cadastrar produto: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar produto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome do perfume',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome do produto';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _brandController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe a marca do produto";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Marca',

                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _volumeController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe o volumen do produto";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Volume (ml)',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _priceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe o valor do produto";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Preço',
                  prefixText: 'R\$ ',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe a quantidade do produto";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Quantidade em estoque',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _saveProduct,
                child: const Text('Cadastrar produto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
