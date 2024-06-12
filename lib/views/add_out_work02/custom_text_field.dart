import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget {
  final String labelText;
  final TextEditingController textEditingController;
  // final bool showErrorText;
  const CustomTextField1({
    super.key,
    required this.labelText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 0),
        child: TextField(
          controller: textEditingController,
          autofocus: false,
          cursorColor: Colors.black45,
          decoration: InputDecoration(
            labelStyle: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 15,
            ),
            labelText: labelText,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(25.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(25.0),
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
          ),
        ));
  }
}