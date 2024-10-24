import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';
import 'package:frontend_geolocation/core/theme/app_font.dart';

class Edittext extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final TextInputType? inputType;
  final String? hint;
  final String? initialValue;
  final int maxLines;
  final bool enabled;
  final bool obscureText;
  final EdgeInsetsGeometry? margin;
  final Widget? suffix;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const Edittext({
    super.key,
    this.controller,
    this.onTap,
    this.inputType,
    this.hint,
    this.initialValue,
    this.maxLines = 1,
    this.enabled = true,
    this.obscureText = false,
    this.margin,
    this.suffix,
    this.prefix,
    this.inputFormatters,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          enabled: enabled && onTap == null,
          obscureText: obscureText,
          keyboardType: inputType,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          validator: validator,
          initialValue: initialValue,
          style: TextStyle(
            color: enabled || onTap != null ? Colors.black : AppColor.greyDark,
          ),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefix,
            suffixIcon: suffix,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 45,
            ),
            hintStyle: textRegular.copyWith(color: AppColor.grey),
            contentPadding: EdgeInsets.only(
              left: 16.0,
              right: suffix != null ? 0 : 16.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 1.5, color: AppColor.greyLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 1.5, color: AppColor.greyLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 1.5, color: AppColor.greyLight),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 1.5, color: AppColor.greyLight),
            ),
            filled: true,
            fillColor:
                enabled || onTap != null ? Colors.white : AppColor.greyLight,
          ),
        ),
      ),
    );
  }
}
