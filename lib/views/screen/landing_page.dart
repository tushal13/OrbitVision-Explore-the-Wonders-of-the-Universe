import 'package:animated_text_kit/animated_text_kit.dart';
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
  late Animation opacity2;
  late Animation opacity3;
  late Animation position;

  @override
  void initState() {
    Provider.of<HomepageController>(context, listen: false).updateDominantColor(
        SolarSystem[Provider.of<HomepageController>(context, listen: false)
                .currentIndex]
            .imageUrl);

    _Controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..forward();

    opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _Controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );
    opacity2 = Tween(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _Controller,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    opacity3 = Tween(begin: 0.9, end: 1.0).animate(_Controller);

    _Controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/img.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            top: 1,
            left: 105,
            right: 1,
            bottom: 20,
            child: Opacity(
              opacity: opacity3.value,
              child: Container(
                alignment: Alignment(0.0, 0.3),
                child: SizedBox(
                  height: 260,
                  child: ModelViewer(
                    src: '${SolarSystem[2].file}',
                    disableZoom: true,
                    autoPlay: true,
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            builder: (context, child) {
              return Opacity(
                opacity: opacity.value,
                child: Container(
                  alignment: Alignment(-0.8, -0.6),
                  child: Image.asset(
                    'assets/image/Astronaut.png',
                    height: 210,
                  ),
                ),
              );
            },
            animation: _Controller,
          ),
          Container(
            padding: const EdgeInsets.only(left: 32),
            alignment: Alignment(-1, 0.6),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  speed: Duration(milliseconds: 300),
                  'OrbitVision',
                  textStyle: TextStyle(
                      fontFamily: 'RBold', fontSize: 35, color: Colors.white),
                ),
              ],
              isRepeatingAnimation: false,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 32),
            alignment: Alignment(-1, 0.7),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Let's Explore The Outer Space",
                  speed: Duration(milliseconds: 150),
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Light',
                      color: Colors.white,
                      fontWeight: FontWeight.w100),
                ),
              ],
              isRepeatingAnimation: false,
            ),
          ),
          AnimatedBuilder(
              animation: _Controller,
              builder: (context, child) {
                return Opacity(
                  opacity: opacity.value,
                  child: Container(
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
                  ),
                );
              })
        ],
      ),
    );
  }
}
