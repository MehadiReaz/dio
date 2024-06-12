import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController textEditingController;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.textEditingController,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
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
            // icon: ,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
          ),
        ));
  }
}