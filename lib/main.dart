import 'ui/cart/cart_manager.dart';
import 'ui/orders/order_manager.dart';
import 'ui/screens.dart'; // Thêm các import cần thiết tại đây
import 'package:provider/provider.dart';
void main() {
  runApp(const VFood());
}

class VFood extends StatelessWidget {
  const VFood({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderManager(),
        ),
      ],
      child: MaterialApp(
        home: const ProductsOverviewScreen(),
        routes: {
          CartScreen.routeName: (context) => const CartScreen(),
          OrderScreen.routeName: (context) => const OrderScreen(),
          UserProductScreen.routeName: (context) => const UserProductScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == EditProductScreen.routeName) {
            final productId = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (ctx) {
              return EditProductScreen(
                productId != null
                ? ctx.read<ProductManager>().findById(productId)
                : null,
              );
              },
            );
          }
          return null;
        }
      ),
    );
  }
}
