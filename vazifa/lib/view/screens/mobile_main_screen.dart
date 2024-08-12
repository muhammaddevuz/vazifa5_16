import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vazifa_16/model/category.dart';
import 'package:vazifa_16/model/product.dart';
import 'package:vazifa_16/service/product_service.dart';
import 'package:vazifa_16/view/widgets/custom_drawer_widget.dart';
import 'package:vazifa_16/view/widgets/product_list.dart';

class MobileMainScreen extends StatefulWidget {
  MobileMainScreen({super.key});

  @override
  _MobileMainScreenState createState() => _MobileMainScreenState();
}

class _MobileMainScreenState extends State<MobileMainScreen> {
  final ProductService _productService = ProductService();
  String? _selectedCategoryId;
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _allProducts = _productService.getProducts();
    _filteredProducts = _allProducts;
    _searchController.addListener(_filterProducts);
  }

  void _filterProducts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProducts = _allProducts
          .where((product) => product.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categories = _productService.getCategories();
    List<Product> products = _selectedCategoryId == null
        ? _filteredProducts
        : _filteredProducts
            .where((product) => product.categoryId == _selectedCategoryId)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/brand_app_bar_text.svg',
            ),
            SizedBox(width: 10.w),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person_3_outlined)),
        ],
      ),
      drawer: CustomDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.r),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 20.h,
                  color: Colors.black,
                ),
                controller: _searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search, size: 35, color: Colors.grey),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Row(
                  children: categories.map(
                    (category) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategoryId =
                                category.id == '1' ? null : category.id;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          margin: EdgeInsets.only(right: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: _selectedCategoryId == category.id ||
                                    (_selectedCategoryId == null &&
                                        category.id == '1')
                                ? Colors.grey.shade400
                                : Colors.grey.shade300,
                          ),
                          child: Text(
                            category.name,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deals and offers',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.h,
                            ),
                          ),
                          Text(
                            'Electronic equipments',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.h,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '13',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.h,
                                  ),
                                ),
                                Text(
                                  'Hour',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '34',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.h,
                                  ),
                                ),
                                Text(
                                  'Min',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '56',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.h,
                                  ),
                                ),
                                Text(
                                  'Sec',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 200.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: buildProductListOffers(products),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(
                'Home and outdoor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.h,
                ),
              ),
            ),
            Container(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: buildProductList(
                        products
                            .where((product) => product.categoryId == '3')
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(
                'Consumer electronics',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.h,
                ),
              ),
            ),
            Container(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: buildProductList(
                        products
                            .where((product) => product.categoryId == '1')
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(
                'Recommended items',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.h,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: buildProductListVertical(products),
            ),
          ],
        ),
      ),
    );
  }
}
