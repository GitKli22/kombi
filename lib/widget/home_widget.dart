// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:combi/utils/actus.dart';
import 'package:combi/utils/shop_item.dart';
import 'package:combi/utils/status.dart';
import 'package:combi/widget/preference_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget homeWidget(context) {
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        expandedHeight: 200,
        floating: true,
        pinned: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.blue[800],
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var top = constraints.biggest.height;
            return FlexibleSpaceBar(
              centerTitle: false, // Ensures the title is not centered
              titlePadding:
                  EdgeInsetsDirectional.only(start: 20.0, bottom: 20.0),
              title: top == MediaQuery.of(context).padding.top + kToolbarHeight
                  ? Container(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Combi",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                IconButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, '/cart_page'),
                                  icon: const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : null, // Affiche le titre seulement quand plié
              background: Container(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Combi",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Notification
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, '/cart_page'),
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        // search bar
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Actus",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Icon(
                            //   Icons.more_horiz,
                            //   color: Colors.white,
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start, // Aligner les éléments au début
                                  children: [
                                    Actus(
                                      imageName: "assets/images/chocolate.jpg",
                                      isSeen: false,
                                      statusNum: 3,
                                    ),
                                    SizedBox(width: 6),
                                    Actus(
                                      imageName: "assets/images/hamburger.jpg",
                                      isSeen: false,
                                      statusNum: 6,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          },
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start, // Aligner les éléments au début
                                  children: [
                                    PreferenceEltWidget(Icons.shopping_cart),
                                    PreferenceEltWidget(
                                        Icons.food_bank_outlined),
                                    PreferenceEltWidget(Icons.store),

                                    // PreferenceEltWidget(Icons.more_horiz),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    '/perference_page'); // Remplacez '/your_next_screen' par la route de l'écran cible
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        8), // Ajoutez du padding si nécessaire
                                child: Row(
                                  children: [
                                    Text(
                                      "Plus",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.more_horiz),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    ListView(
                      primary:
                          false, // Important to avoid scrolling issues within another scrollable
                      shrinkWrap: true, // Important for proper measuring
                      children: [
                        ShopItem(
                          imageUrl: "assets/images/fernand_telecom.jpg",
                          shopName: "Fernand telecom",
                          shopDescription:
                              "Vente des téléphones et produits divers ",
                          locationMap: "A 200 métre de vous",
                          likes: 500,
                          followers: 2,
                        ),
                        ShopItem(
                          imageUrl: "assets/images/fernand_telecom.jpg",
                          shopName: "Fernand telecom",
                          shopDescription:
                              "Vente des téléphones et produits divers ",
                          locationMap: "A 200 métre de vous",
                          likes: 500,
                          followers: 2,
                        ),
                        ShopItem(
                          imageUrl: "assets/images/fernand_telecom.jpg",
                          shopName: "Fernand telecom",
                          shopDescription:
                              "Vente des téléphones et produits divers ",
                          locationMap: "A 200 métre de vous",
                          likes: 500,
                          followers: 2,
                        ),

                        ShopItem(
                          imageUrl: "assets/images/akezou.jpg",
                          shopName: "Akezou store ",
                          shopDescription: "Vente des téléphones  ",
                          locationMap: "A 210 métre de vous",
                          likes: 300,
                          followers: 1,
                        ),
                        ShopItem(
                          imageUrl: "assets/images/future-baber.jpg",
                          shopName: "Future Baber ",
                          shopDescription:
                              "Vente des téléphones et produits divers ",
                          locationMap: "A 200 métre de vous",
                          likes: 500,
                          followers: 2,
                        ),
                        ShopItem(
                          imageUrl: "assets/images/africa_food.jpg",
                          shopName: "AFRICAN FOOD BY EMY",
                          shopDescription:
                              "Vente des téléphones et produits divers ",
                          locationMap: "A 200 métre de vous",
                          likes: 500,
                          followers: 2,
                        ),
                        // Repeat for other exercises...
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
