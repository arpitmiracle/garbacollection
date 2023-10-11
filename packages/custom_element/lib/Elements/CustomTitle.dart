import 'package:flutter/material.dart';
import 'package:custom_element/custom_elements.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  double? fontSize;
  Color? fontColor;
  FontWeight? fontWeight;
  int? maxLines;
  TextOverflow? overflow;

  CustomTitle({required this.title, this.fontSize,this.fontColor,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: CustomStyles.textStyle(
            fontSize: fontSize ?? (16.sp),
            fontColor: fontColor ?? Colors.white,
            fontWeight: fontWeight ?? FontWeight.bold
        )
      //TextStyle(color: uiColors.title, fontSize:  animate ?? false ? size.value : tempsize),
    );
  }
}
