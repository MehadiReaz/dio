import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/res/global_widgets/custom_list_tile.dart';

import '../../res/style/font_family/text_font_family.dart';
import '../attendance/employee_attendance/employee_list_attendance.dart';

class CompanyListScreen extends StatelessWidget {
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
          'Company/Organization/Branch',
          style: textStyle(textColor: Colors.white),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(()=> NewEmployeeAttendanceList());
            },
            child: customLisTile(
                title: 'smart software branch 1',
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.blue,
                )),
          ),
          Divider(
            color: Colors.black26,
            thickness: 0.2,
          ),
          InkWell(
            onTap: () {
              print('clicked branch 2');
            },
            child: customLisTile(
                title: 'smart software branch 2',
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.blue,
                )),
          ),
          Divider(
            color: Colors.black26,
            thickness: 0.2,
          ),
          InkWell(
            onTap: () {
              print('clicked branch 3');
            },
            child: customLisTile(
                title: 'smart software branch 3',
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.blue,
                )),
          ),
          Divider(
            color: Colors.black26,
            thickness: 0.2,
          ),
          InkWell(
            onTap: () {
              print('clicked branch 4');
            },
            child: customLisTile(
                title: 'smart software branch 4',
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.blue,
                )),
          ),
          Divider(
            color: Colors.black26,
            thickness: 0.2,
          ),
          InkWell(
            onTap: () {
              print('clicked branch 5');
            },
            child: customLisTile(
                title: 'smart software branch 5',
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.blue,
                )),
          ),
          Divider(
            color: Colors.black26,
            thickness: 0.2,
          ),
          InkWell(
            onTap: () {
              print('clicked branch 6');
            },
            child: customLisTile(
                title: 'smart software branch 6',
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.blue,
                )),
          ),
          Divider(
            color: Colors.black26,
            thickness: 0.2,
          )
        ],
      ),
    );
  }
}
