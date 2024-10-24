import 'package:flutter/material.dart';
import 'navigation_state.dart';

class NavigationProvider extends ChangeNotifier {
  final state = NavigationState();

  void changeActiveMenu(int menu) {
    state.active = menu;
    notifyListeners();
  }
}
