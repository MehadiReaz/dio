import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    this.text,
    this.press,
    this.color
  });
  final String ?text;
  final Function() ?press;
  final Color ?color;

  @override
  Widget build(BuildContext context) {

    ///change this code flatButton
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
