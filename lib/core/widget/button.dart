import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_geolocation/core/enum/color_style.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;
  final bool disable;
  final bool visible;
  final bool filled;
  final double fontSize;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const Button({
    super.key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.disable = false,
    this.visible = true,
    this.filled = true,
    this.fontSize = 16,
    this.margin,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return visible
        ? Container(
            width: double.maxFinite,
            margin: margin,
            child: MaterialButton(
              elevation: 0,
              padding: padding,
              onPressed: disable || isLoading ? null : onPressed,
              disabledColor: AppColor.greyLight,
              color: disable || isLoading
                  ? AppColor.greyLight
                  : filled
                      ? AppColor.primary
                      : Colors.white,
              textColor: disable || isLoading
                  ? AppColor.grey
                  : filled
                      ? Colors.white
                      : AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  width: 1,
                  color: disable || isLoading
                      ? AppColor.greyLight
                      : AppColor.primary,
                ),
              ),
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CupertinoActivityIndicator(
                        color: AppColor.primary,
                      ),
                    )
                  : Text(
                      label,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          )
        : Container();
  }
}
