import 'package:flutter/material.dart';
import 'landing_state.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LandingProvider extends ChangeNotifier {
  final state = LandingState();

  Future<void> getListProjects() async {
    state.status = ListRestauranStatus.loading;

    var result = await state.restaurantRepository.getRestaurants();
    result.fold((err) {
      state.status = ListRestauranStatus.error;
      Fluttertoast.showToast(msg: err.message ?? '');
    }, (res) {
      state.status = ListRestauranStatus.success;
      state.restaurants = res.data ?? [];
      notifyListeners();
    });
  }
}
