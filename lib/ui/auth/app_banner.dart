import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 80.0,
      ),
      transform: Matrix4.identity()..translate(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 104, 234, 163),
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Color.fromARGB(66, 231, 37, 37),
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Text(
        ' V.Food',
        style: TextStyle(
          color: Theme.of(context).textTheme.titleLarge?.color,
          fontSize: 70,
          fontFamily: 'Anton',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
