// ignore_for_file: prefer_const_constructors

import 'package:combi/pages/home_page.dart';
import 'package:combi/theme/dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/my_app_bar.dart';
import '../components/my_cart_button.dart';
import '../components/my_drawer.dart';
import '../components/my_product_tile.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyAppBar(
        title: 'Shop',
        actions: [
          // cart button
          MyCartButton()
        ],
      ),
      body: ListView(
        children: [
          // title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: Row(
              children: [
                Text(
                  "Fernand Telecom",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),    // subtitle
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0, bottom: 0),
            child: Text(
              "Vente des téléphones et produits divers",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0, bottom: 0),
            child: Text(
              "Douala, Cameroun",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0, bottom: 0),
            child: Text(
              "Toujour ouvert",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.successColor),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0, bottom: 0),
            child: Text(
              "Tel: 695 00 00 00",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0, bottom: 0),
            child: Text(
              "à 100 métres et a 20 min de vous",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          // product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                // get each individual product from shop
                final product = products[index];

                // return as a tile
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action du bouton flottant
          // Par exemple, naviguer vers une nouvelle page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(initialIndex: 3), // Commence à l'index 2 (shopWidget)
            ),
          );
        },
        elevation: 8.0, 
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const Icon(Icons.message),
      ),
    );
  }
}
