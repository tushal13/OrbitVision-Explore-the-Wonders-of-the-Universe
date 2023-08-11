import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class HomepageController extends ChangeNotifier {
  PaletteGenerator? _paletteGenerator;
  Color? dominantColor;

  int _currentIndex = 0;
  int _tabIndex = 0;

  HomepageController() {
    currentIndex = 0;
    tabIndex = 0;
  }

  int get currentIndex => _currentIndex;
  int get tabIndex => _tabIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  set tabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  updateDominantColor(String imageUrl) async {
    final imageProvider = AssetImage(imageUrl);
    _paletteGenerator = await PaletteGenerator.fromImageProvider(
      imageProvider,
      maximumColorCount: 20,
    );
    if (_paletteGenerator != null) {
      dominantColor = _paletteGenerator!.dominantColor?.color;
      notifyListeners();
    }
  }
}
