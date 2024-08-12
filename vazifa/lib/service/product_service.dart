import 'package:vazifa_16/model/category.dart';
import 'package:vazifa_16/model/product.dart';

class ProductService {
  List<Category> getCategories() {
    return [
      Category(id: '0', name: 'All Category'),
      Category(id: '1', name: 'Phones'),
      Category(id: '2', name: 'Cars'),
      Category(id: '3', name: 'Clothes'),
    ];
  }

  List<Product> getProducts() {
    return [
      Product(
        id: '1',
        name: 'Samsung S5',
        imageUrl:
            'https://e7.pngegg.com/pngimages/913/374/png-clipart-samsung-galaxy-s7-samsung-galaxy-s9-android-telephone-samsung-gadget-mobile-phone.png',
        price: 199.99,
        description:
            'A high-tech smart watch with multiple features and health monitoring.',
        categoryId: '1',
      ),
      Product(
        id: '2',
        name: 'Iphone 12',
        imageUrl:
            'https://olmaliqsavdo.uz/storage/photos/all_users/Davronbek/Iphone/iphone%2014%20purple.png',
        price: 199.99,
        description:
            'A high-tech smart watch with multiple features and health monitoring.',
        categoryId: '1',
      ),
      Product(
        id: '3',
        name: 'Samsung A32',
        imageUrl:
            'https://olcha.uz/image/700x700/products/2022-02-17/smartfon-samsung-galaxy-a72-256gb-8-gb-belyy-37320-0.png',
        price: 199.99,
        description:
            'A high-tech smart watch with multiple features and health monitoring.',
        categoryId: '1',
      ),
      Product(
        id: '4',
        name: 'Honor A9',
        imageUrl:
            'https://assets.asaxiy.uz/product/items/desktop/9cf81d8026a9018052c429cc4e56739b2024011715304742302FD0Q557p18.png.webp',
        price: 199.99,
        description:
            'A high-tech smart watch with multiple features and health monitoring.',
        categoryId: '1',
      ),
      Product(
        id: '5',
        name: 'Buggati',
        imageUrl:
            'https://i.pinimg.com/originals/ac/e6/3b/ace63b2f6ccd29c7e567e070089fcd5b.png',
        price: 59999.99,
        description:
            'A fast and luxurious sports car with all the latest technology.',
        categoryId: '2',
      ),
      Product(
        id: '6',
        name: 'Buggati',
        imageUrl:
            'https://i.pinimg.com/736x/c1/b4/ed/c1b4ed5cbbe5ee462849828ef8fe01e3.jpg',
        price: 59999.99,
        description:
            'A fast and luxurious sports car with all the latest technology.',
        categoryId: '2',
      ),
      Product(
        id: '7',
        name: 'Designer Tuxedo',
        imageUrl:
            'https://images.unsplash.com/photo-1554415707-6e8cfc93fe23?ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60',
        price: 249.99,
        description:
            'A stylish designer tuxedo, ideal for formal events and weddings.',
        categoryId: '3',
      ),
      Product(
        id: '8',
        name: 'Modern Recliner Chair',
        imageUrl:
            'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60',
        price: 499.99,
        description: 'A comfortable recliner chair with a sleek modern design.',
        categoryId: '3',
      ),
    ];
  }
}
