import 'package:flutter/material.dart';
import 'ui/screens.dart';

void main() {
  runApp(const VFood());
}

class VFood extends StatelessWidget {
  const VFood({Key? key}) : super(key: key); // Sửa constructor của MyApp
  @override
  Widget build(BuildContext context) {
    return const MaterialApp( // Thêm MaterialApp để có thể sử dụng Scaffold
      home: SafeArea(
        child: ProductsOverviewScreen(),
      ),
    );
  }
}
