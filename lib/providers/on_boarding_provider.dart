import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class OnBoardingProvider extends ChangeNotifier {
  final SwiperController _swiperController = SwiperController();
  int _currentIndex = 0;

  SwiperController get swiperConroller => _swiperController;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void next() {
    if (_currentIndex != 4) {
      _swiperController.next();
    }
  }
}
