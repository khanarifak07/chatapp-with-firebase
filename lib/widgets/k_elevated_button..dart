import 'package:chatapp_firebase/constants/colors.dart';
import 'package:flutter/material.dart';

class KElevatedButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  const KElevatedButton({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            backgroundColor: AppColors.primaryColor),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
