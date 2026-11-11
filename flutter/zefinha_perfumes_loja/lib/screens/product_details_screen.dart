import 'package:flutter/material.dart';
import 'package:zefinha_perfumes_loja/models/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  static const Color primaryColor = Color(0xFF7051A3);
  static const Color backgroundColor = Color(0xFFF8F6FA);

  String get formattedPrice {
    return 'R\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Detalhes do produto',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem ilustrativa do produto
            _buildProductImage(),

            const SizedBox(height: 28),

            // Marca
            Text(
              product.brand.toUpperCase(),
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 8),

            // Nome
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF292331),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              '${product.volume} ml',
              style: const TextStyle(fontSize: 15, color: Colors.black54),
            ),

            const SizedBox(height: 24),

            // Preço
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Preço de venda',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formattedPrice,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Informações do estoque',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF292331),
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _buildStockCard(
                    icon: Icons.inventory_2_outlined,
                    label: 'Quantidade',
                    value: '${product.quantity}',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStockCard(
                    icon: Icons.water_drop_outlined,
                    label: 'Volume',
                    value: '${product.volume} ml',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Status do estoque
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: product.quantity > 0
                    ? const Color(0xFFE8F5E9)
                    : const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(
                    product.quantity > 0
                        ? Icons.check_circle_outline
                        : Icons.warning_amber_rounded,
                    color: product.quantity > 0 ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      product.quantity > 0
                          ? 'Produto disponível em estoque'
                          : 'Produto sem estoque disponível',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: product.quantity > 0
                            ? Colors.green.shade800
                            : Colors.red.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Botão de edição
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implementaremos a edição posteriormente.
                },
                icon: const Icon(Icons.edit_outlined),
                label: const Text('Editar produto'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEDE5F7), Color(0xFFDCD0EF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
            right: 25,
            child: Icon(
              Icons.auto_awesome,
              color: Colors.white.withValues(alpha: 0.8),
              size: 35,
            ),
          ),
          const Icon(Icons.spa_outlined, color: primaryColor, size: 100),
          Positioned(
            bottom: 18,
            child: Text(
              product.name,
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStockCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primaryColor, size: 25),
          const SizedBox(height: 14),
          Text(
            label,
            style: const TextStyle(color: Colors.black54, fontSize: 13),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
