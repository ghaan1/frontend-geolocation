import 'package:frontend_geolocation/data/network/restaurant_remote/restaurant_remote.dart';
import 'package:frontend_geolocation/model/restaurant/restauran_model.dart';

enum ListRestauranStatus { iddle, loading, success, error }

class LandingState {
  var status = ListRestauranStatus.iddle;

  var restaurantRepository = RestaurantRepository();
  var restaurants = <RestaurantModel>[];
  LandingState() {
    // constructor
  }
}