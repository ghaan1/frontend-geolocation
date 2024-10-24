import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_geolocation/model/food/food_model.dart';

class PopularFoodCard extends StatelessWidget {
  final FoodItem foodItem;
  final Function refreshParent;

  const PopularFoodCard({
    Key? key,
    required this.foodItem,
    required this.refreshParent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   CupertinoPageRoute(
        //     builder: (context) => DetailFoodScreen(foodItem: foodItem),
        //   ),
        // ).then((_) {
        //   refreshParent();
        // });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 150,
              width: 200,
              child: Image.asset(
                foodItem.imagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
