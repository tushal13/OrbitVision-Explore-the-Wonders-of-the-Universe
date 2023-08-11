import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:orbitvision/Controller/homepage_controller.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';

import '../../utility/planet_list.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController _Controller;
  late Animation opacity;
  late Animation position;
  int CurrentIndex = 4;

  @override
  void initState() {
    Provider.of<HomepageController>(context, listen: false).updateDominantColor(
        SolarSystem[Provider.of<HomepageController>(context, listen: false)
                .currentIndex]
            .imageUrl);

    _Controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _Controller,
        curve: Interval(0.0, 0.3),
      ),
    );

    position = Tween(begin: 5.0, end: 10.0).animate(
      CurvedAnimation(
        parent: _Controller,
        curve: Interval(0.8, 1.0),
      ),
    );

    _Controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final planet = SolarSystem[CurrentIndex];
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/img.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Transform.translate(
            offset: Offset(0, position.value),
            child: Opacity(
              opacity: opacity.value,
              child: Container(
                alignment: Alignment(-0.8, -0.6),
                child: Image.asset(
                  'assets/image/Astronaut.png',
                  height: 210,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 32),
            alignment: Alignment(-1, 0.6),
            child: Text(
              'OrbitVision',
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 32),
            alignment: Alignment(-1, 0.7),
            child: Text(
              "Let's Explore The Outer Space",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w100),
            ),
          ),
          Container(
            alignment: Alignment(0, 0.9),
            child: SliderButton(
              action: () {
                Navigator.of(context).pushNamed('Home');
              },
              height: 60,
              width: 280,
              backgroundColor: Colors.blue.shade300,
              buttonColor: Colors.blue,
              icon: Icon(Icons.arrow_forward_ios_rounded),
              label: Text(
                'Slide to Start...',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Light',
                  color: Colors.white,
                  wordSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              dismissible: true,
              alignLabel: Alignment.center,
            ),
          )
        ],
      ),
    );
  }
}
