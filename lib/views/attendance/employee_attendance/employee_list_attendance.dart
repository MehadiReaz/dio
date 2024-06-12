import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_hrm/local/prefs.dart';
import 'package:smart_hrm/models/employee_list_attendance_model.dart';
import 'package:smart_hrm/res/style/font_family/text_font_family.dart';


class NewEmployeeAttendanceList extends StatefulWidget {
  const NewEmployeeAttendanceList({super.key});

  @override
  State<NewEmployeeAttendanceList> createState() =>
      _NewEmployeeAttendanceListState();
}

class _NewEmployeeAttendanceListState extends State<NewEmployeeAttendanceList> {


  //get employee attendance list function start
  Future<EmployeeAttendance> getEmployeeAttendanceList() async {
    final response = await http.get(
      Uri.parse("https://demo2.hrmsoftwarebd.com/api/hrm/employees").replace(queryParameters: {
        "token":  MySharedPref.getToken("token".obs).toString(),
        "company_id": "1",
      }),
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return EmployeeAttendance.fromJson(data);
    } else {
      return EmployeeAttendance.fromJson(data);
    }
  }

  //get employee attendance list function end

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
          'Employee Attendance List',
          style: textStyle(textColor: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getEmployeeAttendanceList(),
                  builder: (context, AsyncSnapshot<EmployeeAttendance> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: const EdgeInsets.all(4),
                                width: size.width,
                                height: (size.height) * .25,
                                child: Material(
                                  elevation: 10,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      const CircleAvatar(
                                                        radius: 30,
                                                        backgroundImage: AssetImage(
                                                            'assets/icons/profile.png'),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data!.data![index].name
                                                            .toString(),
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        softWrap: false,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ),
                                                      Text(
                                                        snapshot.data!.data![index]
                                                            .employeeFullId
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.black
                                                                .withOpacity(0.5),
                                                            fontWeight:
                                                                FontWeight.w300),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                            const VerticalDivider(
                                                color: Colors.black12,thickness: 0.5,),
                                            Expanded(
                                                flex: 3,
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "IN",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.5),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300),
                                                                ),
                                                                const SizedBox(
                                                                  height: 2,
                                                                ),
                                                                const Text(
                                                                  "11:28 AM",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "OUT",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.5),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                const Text(
                                                                  "N/A",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                    const Divider(
                                                      color: Colors.black12,thickness: 0.5,
                                                    ),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "No. of Breaks",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.5),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  "0",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                      "Breaks",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Colors
                                                                              .black
                                                                              .withOpacity(
                                                                                  0.5),
                                                                          fontWeight:
                                                                              FontWeight.w300),
                                                                    ),
                                                                    Text(
                                                                      'Duration',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Colors
                                                                              .black
                                                                              .withOpacity(
                                                                                  0.5),
                                                                          fontWeight:
                                                                              FontWeight.w300),
                                                                    )
                                                                  ],
                                                                ),
                                                                const Text(
                                                                  "00:00",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.black12,thickness: 0.5,
                                      ),
                                      Expanded(
                                        //khabar braeak

                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                                onPressed: () {},
                                                child: const Text("Make Call")),
                                            TextButton(
                                                onPressed: () {},
                                                child:
                                                    const Text("View Location")),
                                          ],
                                        ),
                                        flex: 1,
                                      )
                                    ],
                                  ),
                                ));
                          });
                    } else {
                      return Center(
                          child: const CircularProgressIndicator(
                            color: Colors.blue,
                          ));
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
