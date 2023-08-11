import 'package:flutter/material.dart';
import 'helpers/api_helper.dart';

class Apicontroller extends ChangeNotifier {
  List data = [];

  Apicontroller() {
    Search();
  }

  Search({
    String val = "solar system",
  }) async {
    data = await ApiHelper.apiHelper.getWallpapers(
          query: val,
        ) ??
        [];
    notifyListeners();
    return 0;
  }
}
