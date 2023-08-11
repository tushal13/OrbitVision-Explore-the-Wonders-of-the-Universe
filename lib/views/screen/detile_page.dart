import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:orbitvision/Controller/homepage_controller.dart';
import 'package:orbitvision/utility/planet_list.dart';
import 'package:provider/provider.dart';

class DetailePage extends StatefulWidget {
  const DetailePage({super.key});

  @override
  State<DetailePage> createState() => _DetailePageState();
}

class _DetailePageState extends State<DetailePage> {
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
              SizedBox(
                height: 250,
                child: Image.asset(SolarSystem[pro.currentIndex].imageUrl),
              ),
              Text(
                'Distance From Sun : ${SolarSystem[pro.currentIndex].distanceFromSun} AU',
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
                    color: pro.dominantColor,
                    fontWeight: FontWeight.w200,
                    decorationColor: pro.dominantColor),
              ),
              Expanded(
                child: AnimationList(
                  duration: 3000,
                  reBounceDepth: 12.0,
                  children: [
                    Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                          color: pro.dominantColor!.withOpacity(0.7),
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 07,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(9),
                                    height: 50,
                                    width: 50,
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.speed,
                                          color: Colors.white,
                                          size: 35,
                                        )),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          pro.dominantColor!.withOpacity(0.2),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(2, 2),
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            spreadRadius: 0.9,
                                            blurRadius: 0.5)
                                      ],
                                    )),
                                const SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Text(
                                      'Average Orbital Speed',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Light',
                                          shadows: [
                                            BoxShadow(
                                                offset: Offset(2, 2),
                                                color: Colors.black,
                                                spreadRadius: 0.9,
                                                blurRadius: 0.9)
                                          ],
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "${SolarSystem[pro.currentIndex].orbitalSpeed} km/s",
                                      style: TextStyle(
                                          fontSize: 20,
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
                                    Spacer(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                          color: pro.dominantColor!.withOpacity(0.7),
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 07,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(9),
                                    height: 50,
                                    width: 50,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.blur_circular_outlined,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          pro.dominantColor!.withOpacity(0.2),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(2, 2),
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            spreadRadius: 0.9,
                                            blurRadius: 0.5)
                                      ],
                                    )),
                                const SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Text(
                                      'Surface Area',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Light',
                                          shadows: [
                                            BoxShadow(
                                                offset: Offset(2, 2),
                                                color: Colors.black,
                                                spreadRadius: 0.9,
                                                blurRadius: 0.9)
                                          ],
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "${SolarSystem[pro.currentIndex].surfacearea}",
                                      style: TextStyle(
                                          fontSize: 20,
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
                                    Spacer(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                          color: pro.dominantColor!.withOpacity(0.7),
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 07,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(9),
                                    height: 50,
                                    width: 50,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.access_time,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          pro.dominantColor!.withOpacity(0.2),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(2, 2),
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            spreadRadius: 0.9,
                                            blurRadius: 0.5)
                                      ],
                                    )),
                                const SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Text(
                                      "Orbital Year's",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Light',
                                          shadows: [
                                            BoxShadow(
                                                offset: Offset(2, 2),
                                                color: Colors.black,
                                                spreadRadius: 0.9,
                                                blurRadius: 0.9)
                                          ],
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "${SolarSystem[pro.currentIndex].orbitalPeriod} years",
                                      style: TextStyle(
                                          fontSize: 20,
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
                                    Spacer(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                          color: pro.dominantColor!.withOpacity(0.7),
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 07,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(9),
                                    height: 50,
                                    width: 50,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.motion_photos_on_outlined,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          pro.dominantColor!.withOpacity(0.2),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(2, 2),
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            spreadRadius: 0.9,
                                            blurRadius: 0.5)
                                      ],
                                    )),
                                const SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Text(
                                      "Moon's",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Light',
                                          shadows: [
                                            BoxShadow(
                                                offset: Offset(2, 2),
                                                color: Colors.black,
                                                spreadRadius: 0.9,
                                                blurRadius: 0.9)
                                          ],
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "${SolarSystem[pro.currentIndex].satellites}",
                                      style: TextStyle(
                                          fontSize: 20,
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
                                    Spacer(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                          color: pro.dominantColor!.withOpacity(0.7),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 07,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(9),
                                    height: 50,
                                    width: 50,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.description_outlined,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          pro.dominantColor!.withOpacity(0.2),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(2, 2),
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            spreadRadius: 0.9,
                                            blurRadius: 0.5)
                                      ],
                                    )),
                                const SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Descriptione",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Light',
                                          shadows: [
                                            BoxShadow(
                                                offset: Offset(2, 2),
                                                color: Colors.black,
                                                spreadRadius: 0.9,
                                                blurRadius: 0.9)
                                          ],
                                          color: Colors.white),
                                    ),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: 300),
                                      child: Text(
                                        "${SolarSystem[pro.currentIndex].descriptione}",
                                        style: TextStyle(
                                            fontSize: 16,
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
                                      height: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
