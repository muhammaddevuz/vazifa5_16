import 'package:go_router/go_router.dart';
import 'package:vazifa_16/view/screens/category_screens.dart';
import 'package:vazifa_16/view/screens/mobile_main_screen.dart';
import 'package:vazifa_16/view/screens/product_detail_screen.dart';

class AppRouter {
  final GoRouter _router;

  AppRouter()
      : _router = GoRouter(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => MobileMainScreen(),
            ),
            GoRoute(
              path: '/category/:id',
              builder: (context, state) {
                final categoryId = state.pathParameters['id']!;
                final categoryName =
                    state.uri.queryParameters['name'] ?? 'Default Name';
                return CategoryScreen(
                  categoryId: categoryId,
                  categoryName: categoryName,
                );
              },
            ),
            // GoRoute(
            //   path: '/product/:id',
            //   builder: (context, state) {
            //     final productId = state.pathParameters['id']!;
            //     return ProductDetailScreen(productId: productId);
            //   },
            // ),
            GoRoute(
              path: '/product/:id',
              builder: (context, state) {
                final productId = state.pathParameters['id']!;
                return ProductDetailScreen(productId: productId);
              },
            ),
          ],
        );

  GoRouter get router => _router;
}
