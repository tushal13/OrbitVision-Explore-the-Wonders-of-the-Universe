import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:orbitvision/utility/planet_list.dart';

class ThreeDView extends StatefulWidget {
  const ThreeDView({super.key});

  @override
  State<ThreeDView> createState() => _ThreeDViewState();
}

class _ThreeDViewState extends State<ThreeDView> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/Baground.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText('Planet : ${SolarSystem[index].name}',
                      speed: const Duration(milliseconds: 200),
                      textStyle: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'PMedium',
                          shadows: [
                            BoxShadow(
                                offset: Offset(2, 2),
                                color: Colors.black,
                                spreadRadius: 0.9,
                                blurRadius: 0.9)
                          ],
                          color: Colors.white))
                ], isRepeatingAnimation: false),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Type : ${SolarSystem[index].Planet}',
                      textStyle: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'PMedium',
                          shadows: [
                            BoxShadow(
                                offset: Offset(2, 2),
                                color: Colors.black,
                                spreadRadius: 0.9,
                                blurRadius: 0.9)
                          ],
                          color: Colors.white),
                    ),
                  ],
                  isRepeatingAnimation: false,
                )
              ],
            ),
          ),
          const Spacer(),
          ModelViewer(
            src: '${SolarSystem[index].file}',
            autoRotate: true,
            autoPlay: true,
            loading: Loading.lazy,
          ),
        ],
      ),
    );
  }
}
