import 'package:flutter/material.dart';
import '../../../utils/font_size.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.width,
      this.height,
      this.fontSize,
      this.isValidated = true,
      this.textStyle,
      this.padding,
      this.buttonColor})
      : super(key: key);

  final String text;
  final Function onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  Color? buttonColor;

  final bool isValidated;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: buttonColor != null
          ? buttonColor!.withOpacity(0.6)
          : Colors.blue.withOpacity(0.6),
      elevation: 0,
      padding: padding,
      minWidth: width,
      height: height ?? 115,
      color: buttonColor != null ? buttonColor! : Colors.blue,
      onPressed: isValidated ? () => onPressed() : null,
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? AppFontSize.f16,
                fontFamily: "CapitalBank",
              ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
