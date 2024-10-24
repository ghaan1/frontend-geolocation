import 'package:flutter/material.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';

class LinePercentage extends StatelessWidget {
  final double percentage;
  final double width;
  final Color backgroundColor;
  final Color color;

  const LinePercentage({
    super.key,
    required this.percentage,
    required this.width,
    this.backgroundColor = AppColor.white,
    this.color = AppColor.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          width: width,
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          width: (percentage / 100) * width,
          height: 5,
        ),
      ],
    );
  }
}
