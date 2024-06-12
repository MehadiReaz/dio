import 'package:flutter/material.dart';

class TodayAttendance extends StatelessWidget {
  const TodayAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return todayAttendance(context);
  }
}

Widget todayAttendance(BuildContext context) {
  return Row(
    children: [
      Expanded(
          child: InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        // child: checkBox(context, checkIN),
                        child: const Text('Today IN Attendance'));
                  })
              // child: buildTodayAttendance(
              //     'Today IN Attendance', data.attendInTime)
              )),
      const SizedBox(
        width: 10,
      ),
      Expanded(
          child: InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        // child: checkBox(context, checkIN),
                        child: const Text('Today OUT Attendance'));
                  })
              // child: buildTodayAttendance(
              //     'Today IN Attendance', data.attendInTime)
              )),
    ],
  );
}
