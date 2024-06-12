import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/style/color.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('প্রাইভেসি পলিসি',style: TextStyle(color: Colors.white)),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}