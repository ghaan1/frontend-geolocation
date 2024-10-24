import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'detail_restaurant_state.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final state = DetailRestaurantState();
  

  void getProgressDetail(String id) async {
    var result = await state.restaurantRepository.getRestaurantDetail(
      id: id,
    );
    result.fold((err) {
      Fluttertoast.showToast(msg: err.message ?? '');
    }, (res) {
      state.restaurantModel = res.data;
      notifyListeners();
    });
  }
}
