import 'package:demo_flutter/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  const InputField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 3),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.gradient1, width: 3),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
