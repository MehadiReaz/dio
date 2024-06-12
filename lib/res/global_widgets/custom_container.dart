
import 'package:flutter/material.dart';

Widget customContainer({ required String icon, required String title, String ? subtitle}) {
  return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      icon,
                      height: 50,
                    ),
                  )),
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
              Text(
                subtitle!,
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.0,
                ),
                textAlign: TextAlign.center,
              ),
            ]),
      ));
}