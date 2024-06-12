import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_hrm/utils/routes/app_routes.dart';
import 'package:smart_hrm/views/home/home_page_copy.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Navigate to getStarted screen after 2 second
  @override
  void initState() {
    keep();
    super.initState();
  }

  keep() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? baseUrl = prefs.getString('baseUrl');
    Timer(
      const Duration(seconds: 2),
      () => baseUrl != null
          ? Get.to(HomeScreenCopy())
          : Get.offNamed(AppRoute.getstartedscreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Image.asset(
            'assets/icons/smart.png',
            width: size.width * .35,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
