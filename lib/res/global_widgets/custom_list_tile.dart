import 'package:flutter/material.dart';
import 'package:smart_hrm/res/style/font_family/text_font_family.dart';

Widget customLisTile({required String title, required Icon trailing}) {
  return ListTile(title: Text(title,style: textStyle(textColor: Colors.blue),), trailing: trailing);
}
