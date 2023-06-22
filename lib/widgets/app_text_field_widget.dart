import 'package:flutter/material.dart';

import '../utils/app_colors.dart';


class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.readOnly,
    this.maxLines,
    this.textInputType, this.obscureText,
  });

  final TextEditingController controller;
  final String hintText;
  final Function(String?) validator;
  final bool? readOnly, obscureText;
  final int? maxLines;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          filled: false,
          hintText: hintText,
          hintStyle: const TextStyle(color: greyColor),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ))),
    );
  }
}