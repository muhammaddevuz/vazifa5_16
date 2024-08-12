import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vazifa_16/model/product.dart';
import 'package:vazifa_16/service/product_service.dart';
import 'package:vazifa_16/view/screens/mobile_main_screen.dart';
import 'package:vazifa_16/view/screens/shopping_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  ProductDetailScreen({required this.productId});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductService _productService = ProductService();
  late Product _product;
  List<Product> _relatedProducts = [];
  int _quantity = 1;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadProductDetails();
  }

  void _loadProductDetails() {
    final allProducts = _productService.getProducts();
    _product = allProducts.firstWhere(
      (product) => product.id == widget.productId,
      orElse: () => throw Exception('Product not found'),
    );

    _relatedProducts = allProducts.where((product) {
      return product.categoryId == _product.categoryId &&
          product.id != _product.id;
    }).toList();
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _addToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ShoppingCartScreen(product: _product, quantity: _quantity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_product.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => MobileMainScreen())),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(_product.imageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 30,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _product.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  InkWell(
                    onTap: _addToCart,
                    child: Container(
                      width: 315.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                      child: Center(
                        child: Text(
                          'Send inquiry',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? Colors.red : Colors.grey,
                      size: 35,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Related Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Container(
                height: 220.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _relatedProducts.length,
                  itemBuilder: (context, index) {
                    final product = _relatedProducts[index];
                    return Container(
                      height: 220.h,
                      width: 150,
                      margin: EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(product.imageUrl, fit: BoxFit.cover),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              product.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child:
                                Text('\$${product.price.toStringAsFixed(2)}'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
