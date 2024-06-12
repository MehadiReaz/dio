import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveHistoryScreen extends StatefulWidget {
  const LeaveHistoryScreen({super.key});

  @override
  State<LeaveHistoryScreen> createState() => _LeaveHistoryScreenState();
}

class _LeaveHistoryScreenState extends State<LeaveHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 3,
        title: const Text(
          'Leave History',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const LeaveHistoryScreen());
              },
              padding: const EdgeInsets.all(10),
              splashRadius: 20,
              icon: const Icon(
                Icons.filter_list,
                color: Colors.white,
              )),
        ],
      ),
      body: const Center(
        child: Text('Leave history screen'),
      ),
    );
  }
}
