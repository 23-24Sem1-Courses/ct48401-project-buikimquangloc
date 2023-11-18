import '../../models/product.dart';

// Danh sách các sản phẩm

class ProductManager {
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
      isFavorite: true,
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
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      name: 'Vegetarian Food 5',   
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5f75b104e69a376e522869b9/1623520579055-3A2LDQ6PO81B7VVRIH0M/RED_0167.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      name: 'Vegetarian Food 6',   
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5f75b104e69a376e522869b9/1623520579055-3A2LDQ6PO81B7VVRIH0M/RED_0167.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      name: 'Vegetarian Food 7',   
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5f75b104e69a376e522869b9/1623520579055-3A2LDQ6PO81B7VVRIH0M/RED_0167.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      name: 'Vegetarian Food 8',   
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5f75b104e69a376e522869b9/1623520579055-3A2LDQ6PO81B7VVRIH0M/RED_0167.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      name: 'Vegetarian Food 9',   
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5f75b104e69a376e522869b9/1623520579055-3A2LDQ6PO81B7VVRIH0M/RED_0167.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      name: 'Vegetarian Food 10',   
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5f75b104e69a376e522869b9/1623520579055-3A2LDQ6PO81B7VVRIH0M/RED_0167.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      name: 'Vegetarian Food 11',   
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5f75b104e69a376e522869b9/1623520579055-3A2LDQ6PO81B7VVRIH0M/RED_0167.jpg',
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      name: 'Vegetarian Food 12',   
      description: 'I am feedbacked',
      price: 8.20,
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5f75b104e69a376e522869b9/1623520579055-3A2LDQ6PO81B7VVRIH0M/RED_0167.jpg',
      isFavorite: false,
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
}
