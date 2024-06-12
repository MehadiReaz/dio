import 'package:flutter/material.dart';
import 'package:smart_hrm/views/short_leave/components/sort_leave_form.dart';

class ShortLeaveBody extends StatelessWidget {
  const ShortLeaveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 4), // 4%
                Image.asset('assets/icons/sort_leave.png',height: 100,),
                const Text(
                  "Short leave application",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                const SortLeaveForm(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
