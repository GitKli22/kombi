// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyCartButton extends StatelessWidget {
  const MyCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.search,
          color: Colors.black,
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/cart_page'),
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
