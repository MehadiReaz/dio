// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar ({
  String? title,
  IconButton ? leadingIcon,
  IconButton ? actionIcon,
}) {
  return AppBar(
    leading: leadingIcon,
    title: Text('data'),
    actions: [
    ],
  );
}