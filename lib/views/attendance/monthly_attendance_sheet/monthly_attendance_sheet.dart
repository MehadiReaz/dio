import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:smart_hrm/controllers/attendence_report_controller.dart';
import 'package:smart_hrm/res/style/font_family/text_font_family.dart';

class AttendanceSheet extends StatefulWidget {
  const AttendanceSheet({super.key});

  @override
  State<AttendanceSheet> createState() => _AttendanceSheetState();
}

class _AttendanceSheetState extends State<AttendanceSheet> {
  // Future<MonthlyAttendance> mAttendanceList = [];
  final controller = Get.put(AttendanceReportController());
  var selectedDate;
  var month = 1;
  var year = 2024;
  final dateController = TextEditingController();


  // showMonth() async {
  //   final selected = await showMonthPicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2050),
  //   );
  //   return selected;
  // }

  @override
  Widget build(BuildContext context) {
    controller.getProfile();
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
          'Attendance Sheet',
          style: textStyle(textColor: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Select Month"),
                Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black45,
                          width: 1,
                        )),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        showMonthPicker(
                          context: context,
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime(DateTime.now().year + 1),
                          initialDate: DateTime.now(),
                        ).then((value) {
                          if (value != null) {
                            print('Selected month: ${value.month}');
                            print('Selected year: ${value.year}');

                            setState(() {
                              month = value.month;
                              year = value.year;

                            });

                          }
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            '$year' + '-' + '$month',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.deepOrange,
                          )
                        ],
                      ),
                    )),
              ],
            ),
            // Container(
            //     height: 40,
            //     color: Colors.white,
            //     padding: EdgeInsets.symmetric(horizontal: 16),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           'Select Date',
            //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //         ),
            //         SizedBox(
            //           width: 16,
            //         ),
            //         Text(
            //           selectedDate.toString(),
            //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //         ),
            //         Icon(
            //           Icons.keyboard_arrow_down,
            //           color: Colors.deepOrange,
            //         )
            //       ],
            //     )),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                //date field started
                DataTable(
                  columns: const [
                    DataColumn(label: Text("Date")),
                  ],
                  rows: List.generate(
                      controller
                          .profileModel.value.data?.attendances?.length ??
                          0,
                          (index) => DataRow(cells: [
                        DataCell(Text(controller.profileModel.value.data!
                            .attendances![index].date
                            .toString()))
                      ])),
                  headingRowColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 182, 193, 243)),
                ),

                //others field
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        headingRowColor:
                        MaterialStateProperty.all(Colors.green),
                        dataRowColor:
                        MaterialStateProperty.all(Colors.green.shade100),
                        columns: const [
                          DataColumn(label: Text("Day")),
                          DataColumn(label: Text("Shift Name")),
                          DataColumn(label: Text("In Time")),
                          DataColumn(label: Text("Out Time")),
                          DataColumn(label: Text("Worked Hour")),
                          DataColumn(label: Text("Over Hour")),
                          DataColumn(label: Text("Late Hour")),
                          DataColumn(label: Text("Early Hour")),
                          DataColumn(label: Text("Remarks")),
                        ],
                        rows: List.generate(
                            controller.profileModel.value.data?.attendances
                                ?.length ??
                                0, (index) {
                          return DataRow(cells: [
                            DataCell(Text(controller.profileModel.value.data!
                                .attendances![index].day
                                .toString())),
                            DataCell(Text(controller.profileModel.value.data!
                                .attendances![index].shiftName
                                .toString())),
                            DataCell(Text(controller.profileModel.value.data!
                                .attendances![index].inTime
                                .toString())),
                            DataCell(Text(controller.profileModel.value.data!
                                .attendances![index].outTime
                                .toString())),
                            DataCell(Text(controller.profileModel.value.data!
                                .attendances![index].workedHour
                                .toString())),
                            DataCell(Text(controller.profileModel.value.data!
                                .attendances![index].overTime
                                .toString())),
                            DataCell(Text(controller.profileModel.value.data!
                                .attendances![index].lateTime
                                .toString())),
                            DataCell(Text(controller.profileModel.value.data!
                                .attendances![index].earlyTime
                                .toString())),
                            DataCell(Text(controller.profileModel.value.data!
                                .attendances![index].remark
                                .toString())),
                          ]);
                        })),
                  ),
                ),

                ///
                ///
                ///
                ///
              ],
            ),
            // InkWell(
            //   onTap: () {
            //     showMonth();
            //     // showDatePicker(
            //     //     context: context,
            //     //     initialDate: DateTime.now(),
            //     //     firstDate: DateTime.now(),
            //     //     lastDate: DateTime.now(),
            //     //     initialDatePickerMode: DatePickerMode.year,
            //     //     selectableDayPredicate: (DateTime date) {
            //     //       return date.month == DateTime.now().month &&
            //     //           date.year == DateTime.now().year;
            //     //     });
            //   },
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       Text("Select Month"),
            //       Container(
            //           margin: EdgeInsets.all(5),
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               border: Border.all(
            //                 color: Colors.black45,
            //                 width: 1,
            //               )),
            //           padding: EdgeInsets.symmetric(horizontal: 16),
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               Icon(
            //                 Icons.calendar_month,
            //                 size: 16,
            //               ),
            //               SizedBox(
            //                 width: 16,
            //               ),
            //               Text(
            //                 selectedDate.toString(),
            //                 style: TextStyle(
            //                     fontSize: 16, fontWeight: FontWeight.bold),
            //               ),
            //               Icon(
            //                 Icons.keyboard_arrow_down,
            //                 color: Colors.deepOrange,
            //               )
            //             ],
            //           )),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 5,
            ),
            // Row(
            //   children: [
            //     DataTable(
            //       columns: [
            //         const DataColumn(label: Text("Date")),
            //       ],
            //       rows: List.generate(
            //           32,
            //           (index) =>
            //               DataRow(cells: [DataCell(Text("$index: Company"))])),
            //       headingRowColor: MaterialStateProperty.all(
            //           Color.fromARGB(255, 182, 193, 243)),
            //     ),
            //     Expanded(
            //       child: SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: DataTable(
            //             headingRowColor:
            //                 MaterialStateProperty.all(Colors.green),
            //             dataRowColor:
            //                 MaterialStateProperty.all(Colors.green.shade100),
            //             columns: [
            //               const DataColumn(label: Text("Day")),
            //               const DataColumn(label: Text("Shift Name")),
            //               const DataColumn(label: Text("In Time")),
            //               const DataColumn(label: Text("Out Time")),
            //               const DataColumn(label: Text("Worked Hour")),
            //               const DataColumn(label: Text("Over Hour")),
            //               const DataColumn(label: Text("Late Hour")),
            //               const DataColumn(label: Text("Early Hour")),
            //               const DataColumn(label: Text("Remarks")),
            //             ],
            //             rows: List.generate(32, (index) {
            //               return DataRow(cells: [
            //                 DataCell(Text('$index : Day')),
            //                 DataCell(Text('$index : Shift Name')),
            //                 DataCell(Text('$index : In Time')),
            //                 DataCell(Text('$index : Out Time')),
            //                 DataCell(Text('$index : Worked Hour')),
            //                 DataCell(Text('$index : Over Hour')),
            //                 DataCell(Text('$index : Late Hour')),
            //                 DataCell(Text('$index : Early Hour')),
            //                 DataCell(Text('$index : Remarks')),
            //               ]);
            //             })),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
