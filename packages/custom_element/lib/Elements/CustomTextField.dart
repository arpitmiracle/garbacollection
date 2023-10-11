import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:custom_element/custom_elements.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.controller,
    this.radius = 5,
    this.keyboardType,
    this.borderColor = CustomColors.borderColor,
    this.fillColor =    CustomColors.white,
    this.boderWidth = 1,
    this.outPadding = 0,
    this.fontSize,
    this.contentPadding,
    this.maxLength,
    this.counter = false,
    this.hint = '',
    this.hintStyle,
    this.obscureText = false,
    this.textAlign,
    this.enabled,
    this.onChange,
    this.validator,
    this.displayError = false,
    this.height,
    this.errorTextStyle,
    this.border,
    this.filled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.textInputAction,
    this.isDense = false,
    this.readOnly = false,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  double radius;
  Color borderColor;
  bool displayError;
  Color fillColor;
  double boderWidth;
  bool? enabled;
  double? height;
  double? fontSize;
  double outPadding;
  EdgeInsets? contentPadding;
  int? maxLength;
  bool counter;
  bool obscureText;
  String hint;
  TextStyle? hintStyle;
  TextInputType? keyboardType;
  TextAlign? textAlign;
  TextStyle? errorTextStyle;
  List<TextInputFormatter>? inputFormatter;
  int? maxLines;
  Function(String)? onChange;
  String? Function(String?)? validator;
  InputBorder? border;
  bool filled;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextStyle? style;
  bool isDense;
  bool readOnly;
  TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(outPadding),
      child: SizedBox(
        height: height,
        child: TextFormField(
          style: style ?? CustomStyles.textStyle(fontSize: fontSize),
          controller: controller,
          expands: false,
          cursorColor: CustomColors.primary,
          inputFormatters: inputFormatter,
          maxLines: maxLines,
          onChanged: onChange,
          enabled: enabled,
          keyboardType: keyboardType,
          readOnly: readOnly,
          textInputAction: textInputAction,
          autofocus: false,
          textAlign: textAlign ?? TextAlign.start,
          obscureText: obscureText,
          validator: validator,
          maxLength: maxLength,
          decoration: InputDecoration(
              filled: filled,
              counterText:  counter ? null : '',
              contentPadding: contentPadding,
              fillColor: fillColor,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              enabledBorder: border ?? OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor,
                      width: boderWidth),
                  borderRadius: BorderRadius.circular(radius)),
              disabledBorder: border ?? OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor.withOpacity(0.2),
                      width: boderWidth),
                  borderRadius: BorderRadius.circular(radius)),
              focusedBorder: border ?? OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor,
                      width: boderWidth),
                  borderRadius: BorderRadius.circular(radius)),
              border: border ?? OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.text)),
              // errorText: '',
              errorStyle:  displayError ? errorTextStyle ?? CustomStyles.textStyle(fontSize: 10.sp) : TextStyle(fontSize: 0),
              hintText: hint,
              isDense: isDense,
              hintStyle: hintStyle
          ),
        ),
      ),
    );
  }
}
