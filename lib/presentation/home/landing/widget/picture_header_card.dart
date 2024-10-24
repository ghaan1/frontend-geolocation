import 'package:flutter/material.dart';
import 'package:frontend_geolocation/model/restaurant/restauran_model.dart';

class PictureHeaderCard extends StatelessWidget {
  final RestaurantModel restaurantModel;
  const PictureHeaderCard({
    super.key,
    required this.restaurantModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 300,
      child: Image.network(
        'https://restaurant-api.dicoding.dev/images/small/${restaurantModel.pictureId}',
        fit: BoxFit.fill,
      ),
    );
  }
}
