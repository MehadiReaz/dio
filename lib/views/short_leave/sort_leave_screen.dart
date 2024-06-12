import 'package:flutter/material.dart';

import 'components/sort_leave_body.dart';

class SortLeaveScreen extends StatelessWidget {
  const SortLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Short Leave",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('go to short leave');
              },
              splashRadius: 20,
              icon: const Icon(
                Icons.list,
                color: Colors.white,
              ))
        ],
      ),
      body: const ShortLeaveBody(),
    );
  }
}
