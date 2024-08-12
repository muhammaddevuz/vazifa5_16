import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vazifa_16/model/product.dart';

Widget buildProductList(List<Product> products) {
  if (products.isEmpty) {
    return Center(child: Text('No products available.'));
  }

  return GridView.builder(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];
      return GestureDetector(
        onTap: () {
          context.go('/product/${product.id}');
        },
        child: Container(
          padding: EdgeInsets.all(15.r),
          height: 160.h,
          width: 100.w,
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          )),
          child: Container(
            height: 140.h,
            width: 80.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    product.imageUrl,
                    // fit: BoxFit.cover,
                    // height: 100.h,
                    // width: double.infinity,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Form USD \$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget buildProductListVertical(List<Product> products) {
  if (products.isEmpty) {
    return Center(child: Text('No products available.'));
  }

  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 20.h,
      crossAxisSpacing: 20.w,
      childAspectRatio: 3 / 4,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];
      return GestureDetector(
        onTap: () {
          context.go('/product/${product.id}');
        },
        child: Container(
          height: 140.h,
          width: 80.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  product.imageUrl,
                  // fit: BoxFit.cover,
                  // width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildProductListOffers(List<Product> products) {
  if (products.isEmpty) {
    return Center(child: Text('No products available.'));
  }

  return GridView.builder(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];
      return GestureDetector(
        onTap: () {
          context.go('/product/${product.id}');
        },
        child: Container(
          padding: EdgeInsets.all(15.r),
          height: 160.h,
          width: 100.w,
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          )),
          child: Container(
            height: 140.h,
            width: 80.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 40.w),
                        Expanded(
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red.shade100,
                      ),
                      child: Center(
                        child: Text(
                          '-25%',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
