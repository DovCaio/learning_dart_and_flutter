import 'package:flutter/material.dart';
import 'package:zefinha_perfumes_loja/models/product.dart';

class ProductEditScreen extends StatefulWidget {
  final Product product;

  const ProductEditScreen({super.key, required this.product});

  @override
  State<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _brandController;
  late final TextEditingController _volumeController;
  late final TextEditingController _priceController;
  late final TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.product.name);

    _brandController = TextEditingController(text: widget.product.brand);

    _volumeController = TextEditingController(
      text: widget.product.volume.toString(),
    );

    _priceController = TextEditingController(
      text: widget.product.price.toString(),
    );

    _quantityController = TextEditingController(
      text: widget.product.quantity.toString(),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _volumeController.dispose();
    _priceController.dispose();
    _quantityController.dispose();

    super.dispose();
  }

  void _editProduct() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar produto')),
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
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o nome do produto';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _brandController,
                decoration: const InputDecoration(
                  labelText: 'Marca',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe a marca do produto';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _volumeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Volume (ml)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      int.tryParse(value) == null ||
                      int.parse(value) <= 0) {
                    return 'Informe um volume válido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _priceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Preço',
                  prefixText: 'R\$ ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final price = double.tryParse(
                    value?.replaceAll(',', '.') ?? '',
                  );

                  if (price == null || price <= 0) {
                    return 'Informe um preço válido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantidade em estoque',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final quantity = int.tryParse(value ?? '');

                  if (quantity == null || quantity < 0) {
                    return 'Informe uma quantidade válida';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _editProduct,
                child: const Text('Salvar alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
