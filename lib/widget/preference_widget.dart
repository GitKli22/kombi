
import 'package:flutter/material.dart';

Widget PreferenceEltWidget(IconData icon) {
  return Container(
    padding: EdgeInsets.all(8), // Padding autour de l'icône
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey), // Bordure grise
      borderRadius: BorderRadius.circular(12), // Coins arrondis
    ),
    child: Icon(icon),
  );
}