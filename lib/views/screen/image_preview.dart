import 'package:flutter/material.dart';
import 'package:orbitvision/Controller/api_controller.dart';
import 'package:provider/provider.dart';

class IMAGEPREVIEW extends StatelessWidget {
  const IMAGEPREVIEW({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    List data = Provider.of<Apicontroller>(context).data;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.network(
          '${data[index]['largeImageURL']}',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
