import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../res/style/color.dart';
class AppUpdateScreen extends StatefulWidget {
  const AppUpdateScreen({super.key});

  @override
  State<AppUpdateScreen> createState() => _AppUpdateScreenState();
}

class _AppUpdateScreenState extends State<AppUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আপডেট',style: TextStyle(color: Colors.white)),
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