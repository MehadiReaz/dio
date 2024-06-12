import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/controllers/profile_controller.dart';
import 'package:smart_hrm/views/profile/components/body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Image.asset(
              'assets/icons/profile.png',
              height: 30,
            ),
          ),
        ],
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Body()),
    );
  }
}
