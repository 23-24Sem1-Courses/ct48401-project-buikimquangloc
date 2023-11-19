
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_product_screen.dart';
import 'user_product_list_tile.dart';
import 'product_manager.dart';
import '../shared/app_drawer.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user_product';

  const UserProductScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final productManager = ProductManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products'),
        actions: <Widget>[
          AddButton(context),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async => print('refresh'),
        child: UserProductListView(productManager),
      ),
    );
  }

  Widget UserProductListView(ProductManager productManager) {
    return Consumer<ProductManager>(
      builder: (context, productManager, child) {
        return ListView.builder(
          itemCount: productManager.itemCount,
          itemBuilder: (context, i) => Column(
            children: [
              UserProductListTile(
                productManager.items[i],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget AddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
        );
      },
    );
  }
}

