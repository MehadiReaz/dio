import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/style/color.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('অ্যাপ সম্পর্কে',style: TextStyle(color: Colors.white)),
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
