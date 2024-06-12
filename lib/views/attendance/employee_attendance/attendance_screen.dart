import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/res/global_widgets/custom_container.dart';
import 'package:smart_hrm/res/style/font_family/text_font_family.dart';
import 'package:smart_hrm/views/attendance/monthly_attendance_sheet/monthly_attendance_sheet.dart';
import 'package:smart_hrm/views/company_list/company_list_screen.dart';

class AttendanceReportScreen extends StatelessWidget {
  const AttendanceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Attendance Report',
          style: textStyle(textColor: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () => Get.to(() => CompanyListScreen()),
                  child: customContainer(
                      icon: 'assets/icons/attendance.png',
                      title: 'Emp Attendance',
                      subtitle: 'Attendance'),
                )),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: InkWell(
                  onTap: () => Get.to(() => print('my attendance')),
                  child: customContainer(
                      icon: 'assets/icons/employee.png',
                      title: 'My Attendance',
                      subtitle: 'Attendance'),
                )),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () => Get.to((() => AttendanceSheet())),
                  child: customContainer(
                      icon: 'assets/icons/daily_work.png',
                      title: 'Monthly',
                      subtitle: ' Attendance'),
                ))
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () => Get.to(() => print('Location')),
                  child: customContainer(
                      icon: 'assets/icons/location.png',
                      title: 'Emp Tracking',
                      subtitle: 'Location Tracking'),
                )),
                Expanded(child: Text('')),
                Expanded(child: Text('')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
