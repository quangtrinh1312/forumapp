import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Color? backgroundColor;
  final Border? border;
  const PostComponent({
    super.key,
    this.controller,
    this.hintText,
    this.backgroundColor, this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: const BorderRadius.all(Radius.circular(5.0))),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)),
      ),
    );
  }
}
