import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Function()? onPressed;
  //final VoidCallBack? onPress;
  final double borderSize;
  final Color? color;
  final Color? textColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  const ButtonComponent({
    super.key,
    this.onPressed,
    this.borderSize = 5.0,
    this.color,
    this.textColor,
    this.border,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: color,
              border: border,
              borderRadius: borderRadius ??
                  BorderRadius.all(Radius.circular(borderSize))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
