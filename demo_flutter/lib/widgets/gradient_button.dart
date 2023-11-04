import 'package:demo_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  const GradientButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            AppColors.gradient1,
            AppColors.gradient2,
            AppColors.gradient3
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          borderRadius: BorderRadius.circular(7)),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: const Text('Sign In',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
      ),
    );
  }
}
