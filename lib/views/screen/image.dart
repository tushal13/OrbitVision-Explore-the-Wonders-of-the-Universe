import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:orbitvision/Controller/api_controller.dart';
import 'package:provider/provider.dart';

import '../../Controller/homepage_controller.dart';
import '../../utility/planet_list.dart';

class IMAGEPAGE extends StatefulWidget {
  const IMAGEPAGE({super.key});

  @override
  State<IMAGEPAGE> createState() => _IMAGEPAGEState();
}

class _IMAGEPAGEState extends State<IMAGEPAGE> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Consumer<HomepageController>(builder: (context, pro, _) {
      List data = Provider.of<Apicontroller>(context).data;
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.95),
                pro.dominantColor ?? Colors.black,
              ],
              begin: Alignment(0, 0),
              end: Alignment(0, 0.55),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  Image.asset(
                    '${SolarSystem[pro.currentIndex].image}',
                    height: 100,
                    width: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Text(
                            '${SolarSystem[pro.currentIndex].name}',
                            style: TextStyle(
                              color: pro.dominantColor,
                              fontFamily: 'RBold',
                              fontSize: 28,
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Text(
                            '${SolarSystem[pro.currentIndex].slogen}',
                            style: TextStyle(
                                color: pro.dominantColor,
                                fontSize: 14,
                                fontFamily: 'Light'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Expanded(
                child: AnimationLimiter(
                  child: GridView.count(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    padding: EdgeInsets.all(width / 60),
                    crossAxisCount: 3,
                    children: List.generate(
                      30,
                      (int index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: Duration(milliseconds: 500),
                          columnCount: 3,
                          child: ScaleAnimation(
                            duration: Duration(milliseconds: 1100),
                            curve: Curves.fastLinearToSlowEaseIn,
                            scale: 2,
                            child: FadeInAnimation(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('Image', arguments: index);
                                },
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    child: Image.network(
                                      '${data[index]['largeImageURL']}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(
                                      bottom: width / 30,
                                      left: width / 60,
                                      right: width / 60),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 40,
                                        spreadRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
