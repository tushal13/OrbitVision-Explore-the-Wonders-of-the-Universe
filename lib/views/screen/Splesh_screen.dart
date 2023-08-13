import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:orbitvision/utility/planet_list.dart';
import 'package:orbitvision/views/screen/home_page.dart';
import 'package:orbitvision/views/screen/landing_page.dart';
import 'package:provider/provider.dart';

import '../../Controller/homepage_controller.dart';

class SpleshScreen extends StatefulWidget {
  @override
  _SpleshScreenState createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen>
    with TickerProviderStateMixin {
  double fontSize = 2;
  double containerSize = 1.5;
  double textOpacity = 0.0;
  double containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation = Tween<double>(begin: 30, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        containerSize = 2;
        containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        Navigator.pushReplacement(context, PageTransition(LandingPage()));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: h / fontSize),
              AnimatedOpacity(
                  duration: Duration(milliseconds: 1000),
                  opacity: textOpacity,
                  child: Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          speed: Duration(milliseconds: 130),
                          'ORBIT VISION',
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RBold',
                            fontSize: 22,
                          ),
                        ),
                      ],
                      isRepeatingAnimation: false,
                    ),
                  )),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: containerOpacity,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: w / containerSize,
                  width: w / containerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0.5, 1),
                          color: Colors.white,
                          spreadRadius: 0.2,
                          blurRadius: 1)
                    ],
                  ),
                  child: Image.asset('assets/image/Splash.png')),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 6000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
