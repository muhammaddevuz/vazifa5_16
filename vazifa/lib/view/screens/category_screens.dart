import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vazifa_16/model/product.dart';
import 'package:vazifa_16/service/product_service.dart';


class CategoryScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  CategoryScreen({required this.categoryId, required this.categoryName});

  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    List<Product> products = _productService
        .getProducts()
        .where((product) => product.categoryId == categoryId)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          Product product = products[index];
          return GestureDetector(
            onTap: () {
              context.go('/product/${product.id}');
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      product.name,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
