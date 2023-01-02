import 'package:base_setup/utils/font_size.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.controller,
    this.hintText = "",
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.hintStyle,
    this.textStyle,
    this.formKey,
    this.validator,
    this.onEditingComplete,
    this.focusNode,
    this.maxLines,
    this.minLines,
    this.inputAction,
    this.autofocus,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.onChanged,
    this.cursorColor,
    this.maxLength,
    this.textCapitalization,
    this.borderColor,
    this.labelColor,
    this.minLength,
    this.label,
  }) : super(key: key);

  final String hintText;
  final Color? borderColor;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Function? onTap;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Function(String)? validator;
  final Function? onEditingComplete;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? inputAction;
  final bool? autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final GlobalKey<FormState>? formKey;
  final TextCapitalization? textCapitalization;
  final int? minLength;
  final Color? labelColor;
  final Color? cursorColor;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 17,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: textStyle ?? _textStyle(),
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      maxLength: maxLength,
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        hintText: hintText.isNotEmpty ? hintText : "",
        contentPadding: const EdgeInsets.only(top: 8, bottom: 8),
        hintStyle: hintStyle ?? _hintStyle(),
        label: label,
        prefixIcon: prefix != null
            ? Align(
                widthFactor: 1,
                heightFactor: 1,
                alignment: Alignment.centerLeft,
                child: prefix,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 10,
          minHeight: 10,
        ),
        suffixIcon: Align(
          widthFactor: 1,
          heightFactor: 1,
          alignment: Alignment.centerRight,
          child: suffix,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 10,
          minHeight: 10,
        ),
        counterText: "",
      ),
      textInputAction: inputAction ?? TextInputAction.done,
      readOnly: readOnly,
      autofocus: autofocus == null ? false : autofocus!,
      onTap: () => onTap == null ? null : onTap!(),
      validator: validator == null ? null : (val) => validator!(val!),
      onEditingComplete:
          onEditingComplete != null ? () => onEditingComplete!() : null,
      onChanged: onChanged != null ? (value) => onChanged!(value) : null,
      onFieldSubmitted:
          onFieldSubmitted != null ? (value) => onFieldSubmitted!(value) : null,
      focusNode: focusNode,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: AppFontSize.f15,
    );
  }

  TextStyle _hintStyle() {
    return TextStyle(
      color: const Color(0xffB5B5B5),
      fontSize: AppFontSize.f18,
      fontWeight: FontWeight.w400,
    );
  }
}
