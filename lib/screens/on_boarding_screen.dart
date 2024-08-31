// ignore_for_file: prefer_const_constructors



import 'package:combi/intro_screen/intro_page_1.dart';
import 'package:combi/intro_screen/intro_page_2.dart';
import 'package:combi/intro_screen/intro_page_3.dart';
import 'package:combi/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (value) => {
            setState(() {
              onLastPage = value == 2;
            })
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                    onTap: () => {_controller.jumpToPage(2)},
                    child: Text('Skip')),
                // page indicator
                SmoothPageIndicator(controller: _controller, count: 3),
                // next
                onLastPage
                    ? GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => AuthGate()))
                            },
                        child: Text('Done'))
                    : GestureDetector(
                        onTap: () => {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn)
                            },
                        child: Text('Next')),
              ],
            ))
      ],
    ));
  }
}
