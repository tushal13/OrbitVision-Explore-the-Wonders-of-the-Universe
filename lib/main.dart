import 'package:flutter/material.dart';
import 'package:orbitvision/Controller/api_controller.dart';
import 'package:orbitvision/Controller/homepage_controller.dart';
import 'package:orbitvision/views/screen/3D_View.dart';
import 'package:orbitvision/views/screen/Splesh_screen.dart';
import 'package:orbitvision/views/screen/detile_page.dart';
import 'package:orbitvision/views/screen/image_preview.dart';
import 'package:provider/provider.dart';

import 'views/screen/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomepageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Apicontroller(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppName',
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Medium',
          colorScheme: ColorScheme.light(
            primary: Colors.purple,
            secondary: Colors.lightBlue.shade400,
            brightness: Brightness.light,
          )),
      routes: {
        '/': (context) => SpleshScreen(),
        '3D': (context) => const ThreeDView(),
        'Detail': (context) => const DetailePage(),
        'Home': (context) => const HOMEPAGE(),
        'Image': (context) => const IMAGEPREVIEW(),
      },
    );
  }
}
