
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../models/product.dart';

// Danh sách các sản phẩm

class ProductManager with ChangeNotifier {
  final List<Product> items = [
    Product(
      id: 'p1',
      name: 'Vegetarian Food 1',
      description: 'I am enjoy.',
      price: 8.20,
      imageUrl:
          'https://images.chinahighlights.com/allpicture/2017/10/015430cd96d3447a9e7d2a2c_cut_800x500_61.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      name: 'Vegetarian Food 2',
      description: 'I like it.',
      price: 8.20,
      imageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/19/1f/2c/0a/photo6jpg.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p3',
      name: 'Vegetarian Food 3',
      description: 'I feel delicios.',
      price: 8.20,
      imageUrl:
          'https://images.radio-canada.ca/v1/alimentation/recette/16x9/sandiwch-vietnamien-banh-mi.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p4',
      name: 'Vegetarian Food 4',
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5f75b104e69a376e522869b9/1623520579055-3A2LDQ6PO81B7VVRIH0M/RED_0167.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p5',
      name: 'Vegetarian Food 5',
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://mytanfeet.com/wp-content/uploads/2022/06/vegetarian-costa-rican-food.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p6',
      name: 'Vegetarian Food 6',
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://www.slimmingworld.co.uk/wp-content/uploads/2020/09/lentilognese-slimming-world-blog.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p7',
      name: 'Vegetarian Food 7',
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/15/88/8d/01/vegan-burger.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p8',
      name: 'Vegetarian Food 8',
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://media.post.rvohealth.io/wp-content/uploads/2021/08/healthy-eating-food-sweet-potato-kale-bowl-grain-vegan-1296x728-header-800x728.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p9',
      name: 'Vegetarian Food 9',
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://www.bucketlisttummy.com/wp-content/uploads/2020/09/vegan-spinach-pasta-recipe.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p10',
      name: 'Vegetarian Food 10',
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.hindustantimes.com/img/2021/09/21/550x309/Vegan_food_products_to_get_their_own_FSSAI-launched_logo._Check_how_it_will_look_1632230924969_1632230925248.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p11',
      name: 'Vegetarian Food 11',
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.prismic.io/netmums/a1a9f034-7b4e-4ad4-83c1-97527784f2bc_vegan+diet+when+pregnant.jpg',
      isFavorite: false,
    ),
    Product(
      id: '12',
      name: 'Vegetarian Food 12',
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.immediate.co.uk/production/volatile/sites/30/2018/06/Vegan-salad-bowl-499145d.jpg',
      isFavorite: true,
    ),
  ];

  int get itemCount {
    return items.length;
  }

  List<Product> get item {
    return [...items];
  }

  List<Product> get favoriteItems {
    return items.where((item) => item.isFavorite).toList();
  }

  Product? findById(String id) {
    try {
      return items.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }

  void addProduct(Product product) {
    items.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
  }

  void updateProduct(Product product) {
    final index = items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      items[index] = product;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Product product) {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
  }

  void deleteProduct(String id) {
    final index = items.indexWhere((item) => item.id == id);
    items.removeAt(index);
    notifyListeners();
  }

  
}
