import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/controllers/leave_controller.dart';
import 'package:smart_hrm/views/leave/components/leave_body.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  LeaveController controller = Get.put(LeaveController());
  @override
  Widget build(BuildContext context) {
    controller.leaveCheckSetting();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Create Leave Application",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(
              'assets/icons/leavehistory.png',
              width: 22,
              color: Colors.white,
            ),
          )
        ],
      ),
      // body:controller.checkSettingModel.value.data?.authorityInfo!=null? Body(): Center(child: Text('Your Leave Approval Settings Is Not Created Yet!')),
      body: Obx(() {
        if (controller.checkSettingModel.value.data?.authorityInfo != null) {
          return LeaveBody();
        } else {
          return Center(
              child: Text('Your Leave Approval Settings Is Not Created Yet!'));
        }
      }),
      // body: LeaveBody(),

    );
  }
}
