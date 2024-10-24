import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:frontend_geolocation/model/restaurant/restauran_model.dart';
import 'package:frontend_geolocation/presentation/home/landing/detail/detail_restaurant_provider.dart';
import 'package:frontend_geolocation/presentation/home/landing/detail/detail_restaurant_screen.dart';

class ListFoodCard extends StatelessWidget {
  final RestaurantModel restaurantItems;
  final Function refreshParent;

  const ListFoodCard({
    Key? key,
    required this.restaurantItems,
    required this.refreshParent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) =>
                DetailRestaurantScreen(id: '${restaurantItems.id}'),
          ),
        ).then((_) {
          refreshParent();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 0),
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.network(
                  'https://restaurant-api.dicoding.dev/images/small/${restaurantItems.pictureId}',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Center(
              child: Text(
                '${restaurantItems.name}',
                style: const TextStyle(
                  color: Color(0xFF302F2C),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 1,
                ),
              ),
            ),
            // const SizedBox(height: 1),
            Center(
              child: Text(
                '${restaurantItems.city}',
                style: const TextStyle(
                  color: Color(0xFFFFC532),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
