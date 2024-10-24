import 'package:flutter/cupertino.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';
import 'package:frontend_geolocation/core/theme/app_font.dart';

class CustomBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const CustomBadge({
    super.key,
    required this.text,
    this.color = AppColor.primary,
    this.textColor = AppColor.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Text(
        text,
        style: textSmallSemiBold.copyWith(color: textColor),
      ),
    );
  }
}
