import 'package:flutter/material.dart';

class BaseController extends ChangeNotifier{
   int selectedIndex = 0;

  void onTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}