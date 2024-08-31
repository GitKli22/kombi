// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      // ignore: prefer_const_constructors
      child: Center(
        child: Text(
          'Yes I am a Flutter Developer',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}