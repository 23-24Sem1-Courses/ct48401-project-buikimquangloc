import 'ui/cart/cart_manager.dart';
import 'ui/orders/order_manager.dart';
import 'ui/screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
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
        ChangeNotifierProvider(
          create: (context) => AuthManager(),
        ),
      ],
      child: Consumer<AuthManager>(
        builder: (context, authManager, child) {
          return MaterialApp(
              home: authManager.isAuth
                  ? const ProductsOverviewScreen()
                  : FutureBuilder(
                      future: authManager.tryAutoLogin(),
                      builder: (context, snapshot) {
                        return snapshot.connectionState ==
                                ConnectionState.waiting
                            ? const SplashScreen()
                            : const AuthScreen();
                      },
                    ),
              routes: {
                CartScreen.routeName: (context) => const CartScreen(),
                OrderScreen.routeName: (context) => OrderScreen(),
                UserProductScreen.routeName: (context) => UserProductScreen(),
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
              });
        },
      ),
    );
  }
}
