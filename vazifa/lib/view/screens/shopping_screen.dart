// import 'package:flutter/material.dart';
// import 'package:vazifa_16/model/product.dart';

// class ShoppingCartScreen extends StatelessWidget {
//   final Product product;
//   final int quantity;

//   ShoppingCartScreen({required this.product, required this.quantity});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Shopping Cart',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: 1,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: ListTile(
//                     leading: Image.network(product.imageUrl, fit: BoxFit.cover),
//                     title: Text(product.name),
//                     subtitle: Text(
//                         '\$${product.price.toStringAsFixed(2)} x $quantity'),
//                     trailing: Text(
//                         '\$${(product.price * quantity).toStringAsFixed(2)}'),
//                   ),
//                 );
//               },
//             ),
//             Spacer(),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('Proceed to Checkout'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:vazifa_16/model/product.dart';

class ShoppingCartScreen extends StatelessWidget {
  final Product product;
  final int quantity;

  ShoppingCartScreen({required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shopping Cart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Image.network(product.imageUrl, fit: BoxFit.cover),
                title: Text(product.name),
                subtitle:
                    Text('\$${product.price.toStringAsFixed(2)} x $quantity'),
                trailing:
                    Text('\$${(product.price * quantity).toStringAsFixed(2)}'),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle checkout or purchase
              },
              child: Text('Proceed to Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
