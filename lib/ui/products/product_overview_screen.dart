import 'package:ct484_project/ui/cart/cart_manager.dart';
import 'package:ct484_project/ui/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/app_drawer.dart';
import 'product_grid.dart';
import 'top_right_badge.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
enum FilterOptions { favorites, all }
class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  // ignore: unused_field
  var _showOnlyFavorites = false;

  final List<String> imageUrls = [
    'https://finestservices.com.sg/wordpress/wp-content/uploads/2021/07/vegan-food-supplier-singapore-622x350.jpg',
    'https://media-cldnry.s-nbcnews.com/image/upload/t_focal-600x300,f_auto,q_auto:best/newscms/2019_02/1400161/marco-borges-food-today-main-190108-03',
    'https://cdn.foodline.sg/size/PageImage/Caterer/3-Treasures-Vegetarian/16964_original.jpg/600x300-cover.jpg',
    'https://media-cldnry.s-nbcnews.com/image/upload/t_focal-600x300,f_auto,q_auto:best/newscms/2022_13/1859298/taco_beauty_1.jpeg',
    'https://i.pinimg.com/736x/e9/86/06/e98606ec9dfda4c3bd63a7393ca27633.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VFood'),
        actions: <Widget>[
          buildMenu(),
          buildCartIcon(),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Container(
            height: 222, // Chiều cao của slideshow
            child: ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              onPageChanged: (value) {
                print('Page changed: $value');
              },
            
              autoPlayInterval: 2500, 
              isLoop: true, 
              children: imageUrls.map((url) {
                return Image.network(
                  url,
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ProductGrid(_showOnlyFavorites),
          ),
        ],
      ),
    );
  }

  Widget buildMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if (selectedValue == FilterOptions.favorites) {
            _showOnlyFavorites = true;
          } else {
            _showOnlyFavorites = false;
          }
        });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text("Only Favorites"),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('show only all'),
        ),
      ],
    );
  }

  Widget buildCartIcon() {
    return Consumer<CartManager>(
      builder: (ctx, cartManager, child) {
        return TopRightBadge(
          data: cartManager.productCount,
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.of(ctx).pushNamed(CartScreen.routeName);
            },
          ),
        );
      },
    );
  }
}