import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final double borderRadius;
  const TextFieldComponent({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.borderRadius = 10.0,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
