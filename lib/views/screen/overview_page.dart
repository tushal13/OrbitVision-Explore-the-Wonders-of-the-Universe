import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:orbitvision/Controller/api_controller.dart';
import 'package:orbitvision/Controller/homepage_controller.dart';
import 'package:orbitvision/utility/planet_list.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageController>(builder: (context, pro, _) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.95),
                pro.dominantColor ?? Colors.black,
              ],
              begin: Alignment(0, -0.57),
              end: Alignment(0, 0.55),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${SolarSystem[pro.currentIndex].name}',
                      style: TextStyle(
                        color: pro.dominantColor,
                        fontFamily: 'RBold',
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      '${SolarSystem[pro.currentIndex].slogen}',
                      style: TextStyle(
                          color: pro.dominantColor,
                          fontSize: 14,
                          fontFamily: 'Light'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Container(
                  height: 270,
                  alignment: Alignment(0, 0),
                  child: Image.asset(
                    SolarSystem[pro.currentIndex].image,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('3D', arguments: pro.currentIndex);
                      },
                      child: Text(
                        '< 360 Overview 👁 ',
                        style: TextStyle(
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
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pro.tabIndex = 1;
                        });
                      },
                      child: Text(
                        'Details >>',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Light',
                          shadows: [
                            BoxShadow(
                                offset: Offset(2, 2),
                                color: Colors.black,
                                spreadRadius: 0.9,
                                blurRadius: 0.5)
                          ],
                          color: pro.dominantColor!.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<HomepageController>(
                builder: (context, carouselProvider, _) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Center(
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: carouselProvider.currentIndex.toDouble(),
                          end: carouselProvider.currentIndex.toDouble(),
                        ),
                        duration: const Duration(milliseconds: 500),
                        builder: (context, value, _) {
                          return DotsIndicator(
                            dotsCount: SolarSystem.length,
                            position: value,
                            decorator: DotsDecorator(
                                size: const Size.square(8.0),
                                activeSize: const Size(18.0, 8.0),
                                activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                activeColor: Colors.white,
                                color: Colors.grey.shade700),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      scrollPhysics: BouncingScrollPhysics(),
                      onPageChanged: (index, reason) {
                        setState(() {
                          pro.currentIndex = index;
                          print(pro.currentIndex);
                          pro.updateDominantColor(
                              SolarSystem[pro.currentIndex].imageUrl);

                          Provider.of<Apicontroller>(context, listen: false)
                              .Search(val: SolarSystem[pro.currentIndex].name);
                        });
                      },
                    ),
                    items: SolarSystem.map((planet) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            height: 70,
                            planet.imageUrl,
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      );
    });
  }
}
