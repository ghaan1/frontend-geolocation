import 'package:flutter/material.dart';
import 'package:frontend_geolocation/core/theme/app_font.dart';

class Label extends StatelessWidget {
  final String text;
  final bool isRequired;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight; // Nullable fontWeight parameter

  const Label({
    super.key,
    required this.text,
    this.isRequired = false,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.padding,
    this.fontWeight, // Add fontWeight to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Row(
        children: [
          Text(
            text,
            style: textSmall.copyWith(fontWeight: fontWeight), // Use fontWeight if provided
          ),
          if (isRequired)
            Text(' *', style: textSmall.copyWith(color: Colors.red)),
        ],
      ),
    );
  }
}
