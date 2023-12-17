import 'package:demo_flutter/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;

  SocialButton({Key? key, required this.iconPath, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: SvgPicture.asset(
          iconPath,
          width: 25,
          color: AppColors.whiteColor,
        ),
        label: Text(label,
            style: const TextStyle(color: AppColors.whiteColor, fontSize: 17)),
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 30),
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: AppColors.borderColor, width: 3),
                borderRadius: BorderRadius.circular(10))));
  }
}
