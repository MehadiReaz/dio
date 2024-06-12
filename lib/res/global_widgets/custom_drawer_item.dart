import 'package:flutter/material.dart';
import '../style/font_family/text_font_family.dart';

Widget customDrawerItem({String? text,}) {
  return Padding(
    padding: EdgeInsets.only(top: 20, left: 20,),
    child: InkWell(
      child: Text(
        text!,
        style: textStyle(textColor: Colors.white),
      ),
    ),
  );
}
