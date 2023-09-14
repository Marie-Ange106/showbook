import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Widget? child;
  final VoidCallback? onPressed;
  final Function()? onTap;
  final Color? bgColor;
  final Color borderColor;
  final Color? textColor;
  final bool enable;
  final bool haveTop;
  final bool loading;
  final Color? loadingColor;
  final double height;
  final double? width;
  final double? fontSize;
  final Icon? icon;
  const ButtonWidget({
    Key? key,
    this.child,
    required this.text,
    this.onPressed,
    this.enable = true,
    this.bgColor,
    required this.borderColor,
    this.textColor,
    this.loading = false,
    this.haveTop = true,
    required this.height,
    this.width,
    required this.fontSize,
    this.loadingColor,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
