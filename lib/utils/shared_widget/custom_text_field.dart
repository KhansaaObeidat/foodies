import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final void Function(String)? onSubmitted;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.suffixIcon,
      this.maxLength,
      this.inputFormatters,
     required this.onSubmitted,
      superkey});

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: inputFormatters,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLength: maxLength,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xffF4F8FB),
        hintText: hintText,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
