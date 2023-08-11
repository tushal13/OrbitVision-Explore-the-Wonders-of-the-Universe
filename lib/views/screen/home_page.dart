import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:orbitvision/Controller/homepage_controller.dart';
import 'package:orbitvision/utility/planet_list.dart';
import 'package:orbitvision/views/screen/detile_page.dart';
import 'package:orbitvision/views/screen/image.dart';
import 'package:provider/provider.dart';

import 'overview_page.dart';

class HOMEPAGE extends StatefulWidget {
  const HOMEPAGE({super.key});

  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}

class _HOMEPAGEState extends State<HOMEPAGE> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<HomepageController>(context, listen: false).updateDominantColor(
        SolarSystem[Provider.of<HomepageController>(context, listen: false)
                .currentIndex]
            .image);
  }

  final List tabs = [
    "Overview",
    "in-Depth",
    "image",
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageController>(builder: (context, pro, _) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    pro.dominantColor ?? Colors.black,
                  ],
                  begin: Alignment(0, -0.55),
                  end: Alignment(0, 0.55),
                ),
              ),
            ),
            IndexedStack(
              index: pro.tabIndex,
              children: [
                OverviewPage(),
                DetailePage(),
                IMAGEPAGE(),
              ],
            ),
            Align(
              alignment: Alignment(0, -0.55),
              child: Container(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == pro.tabIndex;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          pro.tabIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          margin: EdgeInsets.only(left: 30),
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 1,
                            ),
                            color: Colors.transparent,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              " ${tabs[index]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: isSelected ? 'RBold' : 'Light',
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
          ],
        ),
      );
    });
  }
}
