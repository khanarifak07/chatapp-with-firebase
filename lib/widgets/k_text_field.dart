import 'package:flutter/material.dart';

class KTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscure;
  final TextEditingController controller;

  const KTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.obscure = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff0055ac))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff0055ac), width: 2)),
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: const Color(0xff0055ac),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff0055ac)),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
