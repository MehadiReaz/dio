import 'package:flutter/cupertino.dart';

TextStyle textStyle(
    {double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? textColor}) {
  return TextStyle(
    fontFamily: 'TiroBangla-Italic',
    fontSize: fontSize,
    color: textColor,
    fontWeight: fontWeight,
    decoration: textDecoration,
  );
}
