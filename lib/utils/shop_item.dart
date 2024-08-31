// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class ShopItem extends StatelessWidget {
  final String imageUrl;
  final String shopName;
  final String shopDescription;
  final String locationMap;
  final int likes;
  final int followers;

  const ShopItem({
    Key? key,
    required this.imageUrl,
    required this.shopName,
    required this.shopDescription,
    required this.locationMap,
    required this.likes,
    required this.followers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/shop_page'),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      // padding: EdgeInsets.all(4),
                      color: Colors.orange,
                      child: Image.network(
                        imageUrl, // URL de l'image
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shopName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis, 
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        shopDescription,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis, 
                        softWrap: false,
                         maxLines: 1,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        locationMap,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            likes.toString() + " " + "Likes ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.people, color: Colors.blue),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            followers.toString() + "k " + "Followers",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Icon(Icons.more_horiz),
            ],
          ),
        ),
      ),
    );
  }
}
