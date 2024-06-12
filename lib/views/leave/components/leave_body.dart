// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'leave_form.dart';

class LeaveBody extends StatelessWidget {
  const LeaveBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //leave form start
                const LeaveForm(),
                //leave form end
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
