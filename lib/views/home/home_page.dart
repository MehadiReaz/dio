// ignore_for_file: camel_case_types, unnecessary_const, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smart_hrm/controllers/attendence_log_controller.dart';
import 'package:smart_hrm/controllers/notification_service_controller.dart';
import 'package:badges/badges.dart' as badges;
import 'package:smart_hrm/res/global_widgets/custom_drawer_item.dart';
import 'package:smart_hrm/views/add_out_work02/add_out_work02.dart';
import 'package:smart_hrm/views/attendance/employee_attendance/attendance_screen.dart';
import 'package:smart_hrm/views/leave_history/leave_history_screen.dart';
import '../../res/global_widgets/custom_container.dart';
import '../leave/leave_screen.dart';
import '../profile/profile_screen.dart';
import '../short_leave/sort_leave_screen.dart';
import 'components/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //variable section start
  bool showPlusImage = true; // Flag to determine whether to show the plus image
  bool showPlusImage2 = true; // Flag to determine whether to show the plus image
  String? areaName;
  double? latitude;
  double? longitude;
  final controller = Get.put(AttendanceLogController());
  final notify = Get.put(NotificationServiceController());
  // LocationData? currentLocation; // location fetch variable
  // String ?areaName;
  DateTime now1 = DateTime.now();
  String current_time = (DateFormat.jm().format(DateTime.now()));
  var scaffoldKey = GlobalKey<ScaffoldState>();
  //variable section end

  //show in attendance function start
  showInAttendanceDialog(BuildContext context) {
    // set up the button
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () async {
        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Loading..."),
                ],
              ),
            );
          },
        );

        try {
          // Perform asynchronous tasks
          await getCurrentLocation();
          setState(() {
            showPlusImage = false;
          });
          await controller.attendenceLog(
              'in', areaName!, latitude!, longitude!);

          // Close the loading dialog on success
          Navigator.pop(context); // Close the loading dialog
          Navigator.pop(context); // Close the main dialog
        } catch (e) {
          // Handle errors here
          print("Error: $e");
          // Close the loading dialog on error
          Navigator.pop(context);
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Today in Attendance"),
      content: Text("Time: ${(DateFormat.jm().format(DateTime.now()))} "),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  //show in attendance function end

  //get current location function start
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;

      print('Latitute: $latitude');
      print('Longitute: $longitude');

      // Use geocoding to get the area name from latitude and longitude
      List<Placemark> placemarks = await placemarkFromCoordinates(
          latitude!, longitude!,
          localeIdentifier:
              "en"); // You can change the locale identifier as needed

      if (placemarks.isNotEmpty) {
        areaName = placemarks[0].locality ?? 'Unknown Area';
        print('Area Name: $areaName');
        // You can use the 'areaName' as needed in your application
      } else {
        print('Unable to determine the area name.');
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }
  //get current location function end

  //show out attendance function start
  showoutAttendanceDialog(BuildContext context) {
    // set up the button
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () async {
        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Loading..."),
                ],
              ),
            );
          },
        );

        try {
          // Perform asynchronous tasks
          await getCurrentLocation();
          setState(() {
            showPlusImage2 = false;
          });
          await controller.attendenceLog(
              'out', areaName!, latitude!, longitude!);

          // Close the loading dialog on success
          Navigator.pop(context); // Close the loading dialog
          Navigator.pop(context); // Close the main dialog
        } catch (e) {
          // Handle errors here
          print("Error: $e");
          // Close the loading dialog on error
          Navigator.pop(context);
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Today Out Attendance"),
      content: Text("Time: ${(DateFormat.jm().format(DateTime.now()))} "),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  //show out attendance function end

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      key: scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.68,
        child: Drawer(
          backgroundColor: Colors.blue.withOpacity(0.9),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/icons/smart.png', width: 100),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "SMART",
                        style: GoogleFonts.solway(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: " HRM",
                            style: GoogleFonts.solway(
                                fontSize: 17,
                                color: const Color(0xFFED0A72),
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  )
                ],
              )),
              InkWell(
                  onTap: () {
                    Get.to(() => ProfileScreen());
                  },
                  child: customDrawerItem(text: 'Profile')),
              InkWell(
                  onTap: () {
                    Get.to(() => AttendanceReportScreen());
                  },
                  child: customDrawerItem(text: 'Attendance')),
              customDrawerItem(text: 'Pay Slip'),
              customDrawerItem(text: 'Create Leave'),
              InkWell(
                  onTap: () => LeaveHistoryScreen(),
                  child: customDrawerItem(text: 'Leave History')),
              customDrawerItem(text: 'Pending Appl. Approvals'),
              customDrawerItem(text: 'Leave Application'),
              customDrawerItem(text: 'Create Short Leave'),
              customDrawerItem(text: 'Leave History'),
              customDrawerItem(text: 'Pending S.Leave'),
              customDrawerItem(text: 'Live Calling'),
              customDrawerItem(text: 'HR Load'),
              customDrawerItem(text: 'Employee Tracking'),
              // SizedBox(
              //   height: 10,
              // ),
              Divider(
                color: Colors.white24,
              ),
              customDrawerItem(text: 'Share App'),
              // SizedBox(
              //   height: 10,
              // ),
              Divider(
                color: Colors.white24,
              ),
              customDrawerItem(text: 'Logout'),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              print('Drawer is clicked');
              scaffoldKey.currentState?.openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: Image.asset(
              'assets/icons/menu.png',
              color: Colors.white,
              width: 25,
            )
            ),
        title: RichText(
          text: TextSpan(
              text: "SMART",
              style: GoogleFonts.solway(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: " HRM",
                  style: GoogleFonts.solway(
                      fontSize: 17,
                      color: const Color(0xFFED0A72),
                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
        centerTitle: false,
        actions: [
          // Center(
          //   child: badges.Badge( // Wrap your IconButton with Badge widget
          //     badgeContent: Text(
          //       '0',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //     badgeAnimation: badges.BadgeAnimation.scale(
          //       animationDuration: Duration(seconds: 1),
          //       colorChangeAnimationDuration: Duration(milliseconds: 600),
          //       loopAnimation: false,
          //       curve: Curves.fastOutSlowIn,
          //       colorChangeAnimationCurve: Curves.easeInCubic,
          //     ),
          //     child: IconButton(
          //       onPressed: () {
          //         setState(() {
          //           notify.notificationToggle();
          //         });
          //       },
          //       splashRadius: 20,
          //       icon: Icon(
          //         notify.isNotificationOpened.value
          //             ? Icons.keyboard_arrow_down
          //             : Icons.notifications,
          //         color: Colors.black87,
          //         size: 29,
          //       ),
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              setState(() {
                notify.notificationToggle();
              });
              // Get.to(LeaveApprovalPage());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: badges.Badge(
                badgeContent: Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                child: Icon(
                  notify.isNotificationOpened.value
                      ? Icons.expand_more
                      : Icons.notifications,
                  size: 25,
                  color: Colors.white,
                ),
                badgeAnimation: badges.BadgeAnimation.scale(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    loopAnimation: false,
                    colorChangeAnimationCurve: Curves.easeInCubic),
              ),
            ),
          )
        ],
        backgroundColor: Colors.blue,
        elevation: notify.isNotificationOpened.value ? 8 : 0,
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(notify.isNotificationOpened.value ? 200 : 0),
          child: Container(
            height: notify.isNotificationOpened.value ? 200 : 0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.to(ProfileScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 200, 194, 194)
                            .withOpacity(0.2),
                        spreadRadius: 10,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Row-
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              foregroundImage:
                                  AssetImage('assets/icons/profile.png'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Azizul Hakim',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                  Text('Mobile Application Developer'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),

                        //last 2 line text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Emplyoee Id: 535536272"),
                            Text("Email: smartsoftware@gmail.com"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //today in attendance section start
                  InkWell(
                    onTap: () => showInAttendanceDialog(context),
                    child: Container(
                      // alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .47,
                      height: MediaQuery.of(context).size.height * .1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 200, 194, 194)
                                .withOpacity(0.2),
                            spreadRadius: 10,
                            blurRadius: 5,
                            // offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (showPlusImage)
                            Image.asset(
                              'assets/icons/plus.png',
                              height: 28,
                              // width: 7,
                            ),
                          if (!showPlusImage)
                            Text(
                                "Time: ${(DateFormat.jm().format(DateTime.now()))} "),
                          // Text(DateFormat.jm().format(DateTime.now())),
                          // Text(DateFormat('kk:mm:ss').format(now1)),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "Today In Attendance",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //today in attendance section end
                  SizedBox(
                    width: 5,
                  ),
                  //take out attendance section start
                  InkWell(
                    onTap: () => showoutAttendanceDialog(context),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .47,
                      height: MediaQuery.of(context).size.height * .1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 200, 194, 194)
                                .withOpacity(0.2),
                            spreadRadius: 10,
                            blurRadius: 5,
                            // offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (showPlusImage2)
                            Image.asset(
                              'assets/icons/plus.png',
                              height: 28,
                              // width: 7,
                            ),
                          if (!showPlusImage2)
                            Text(
                                "Time: ${(DateFormat.jm().format(DateTime.now()))} "),
                          // Text(DateFormat.jm().format(DateTime.now())),
                          // Text(DateFormat('kk:mm:ss').format(now1)),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "Today out Attendance",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //take out attendance section start
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () => Get.to(() => LeaveScreen()),
                    child: customContainer(
                        icon: 'assets/icons/leave.png',
                        title: 'Leave',
                        subtitle: ''),
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () => Get.to(() => SortLeaveScreen()),
                    child: customContainer(
                        icon: 'assets/icons/sort_leave.png',
                        title: 'shortLeave',
                        subtitle: ''),
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () => Get.to(() => OutWork()),
                    child: customContainer(
                        icon: 'assets/icons/employee.png',
                        title: 'Out Work',
                        subtitle: ''),
                  ))
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     //leave
              //     InkWell(
              //       onTap: () {
              //         Get.to(() => LeaveScreen());
              //       },
              //       child: Container(
              //         width: MediaQuery.of(context).size.width * .274,
              //         height: 150,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //           boxShadow: [
              //             BoxShadow(
              //               color: const Color.fromARGB(255, 200, 194, 194)
              //                   .withOpacity(0.2),
              //               spreadRadius: 10,
              //               blurRadius: 5,
              //               // offset: const Offset(2, 2),
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Image.asset(
              //               'assets/icons/leave.png',
              //               height: 60,
              //               // width: 7,
              //             ),
              //             const SizedBox(
              //               height: 4,
              //             ),
              //             const Text(
              //               "Leave", //icon thakbe
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //
              //     //shortleave
              //     GestureDetector(
              //       onTap: () {
              //         // Navigator.of(context).push(MaterialPageRoute(
              //         //     builder: (context) => shortLeave()));
              //       },
              //       child: Container(
              //         alignment: Alignment.center,
              //         width: MediaQuery.of(context).size.width * .27,
              //         height: 150,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //           boxShadow: [
              //             BoxShadow(
              //               color: const Color.fromARGB(255, 200, 194, 194)
              //                   .withOpacity(0.2),
              //               spreadRadius: 10,
              //               blurRadius: 5,
              //               // offset: const Offset(2, 2),
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Image.asset(
              //               'assets/icons/sort_leave.png',
              //               height: 60,
              //               // width: 7,
              //             ),
              //             const SizedBox(
              //               height: 4,
              //             ),
              //             const Text(
              //               "Sort Leave", //icon thakbe
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //
              //     //Out Work section start
              //     InkWell(
              //       onTap: () {
              //         Get.to(() => OutWork());
              //       },
              //       child: Container(
              //         alignment: Alignment.center,
              //         width: MediaQuery.of(context).size.width * .27,
              //         height: 150,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //           boxShadow: [
              //             BoxShadow(
              //               color: const Color.fromARGB(255, 200, 194, 194)
              //                   .withOpacity(0.2),
              //               spreadRadius: 10,
              //               blurRadius: 5,
              //               // offset: const Offset(2, 2),
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Image.asset(
              //               'assets/icons/employee.png',
              //               height: 60,
              //               // width: 7,
              //             ),
              //             const SizedBox(
              //               height: 4,
              //             ),
              //             const Text(
              //               "Out Work", //icon thakbe
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     //Out work section end
              //   ],
              // ),

              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () => Get.to(() => AttendanceReportScreen()),
                    child: customContainer(
                        icon: 'assets/icons/attendance.png',
                        title: 'Attendance',
                        subtitle: 'Report'),
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () => Get.to(() => print('notice clicked')),
                    child: customContainer(
                        icon: 'assets/icons/bell.png',
                        title: 'Notice',
                        subtitle: 'Subtitle'),
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () => Get.to(() => print('daily work clicked')),
                    child: customContainer(
                        icon: 'assets/icons/daily_work.png',
                        title: 'Daily Work',
                        subtitle: 'Subtitle'),
                  ))
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     //attendance section start
              //     InkWell(
              //       onTap: () => Get.to(() => AttendanceReportScreen()),
              //       child: Container(
              //         width: MediaQuery.of(context).size.width * .274,
              //         height: 150,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //           boxShadow: [
              //             BoxShadow(
              //               color: const Color.fromARGB(255, 200, 194, 194)
              //                   .withOpacity(0.2),
              //               spreadRadius: 10,
              //               blurRadius: 5,
              //               // offset: const Offset(2, 2),
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Image.asset(
              //               'assets/icons/attendance.png',
              //               height: 60,
              //               // width: 7,
              //             ),
              //             const SizedBox(
              //               height: 4,
              //             ),
              //             const Text(
              //               "Attendance", //icon thakbe
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //             const Text(
              //               "Report", //icon thakbe
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     //attendance section end
              //
              //     //Notice section start
              //     Container(
              //       alignment: Alignment.center,
              //       width: MediaQuery.of(context).size.width * .27,
              //       height: 150,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(10),
              //         boxShadow: [
              //           BoxShadow(
              //             color: const Color.fromARGB(255, 200, 194, 194)
              //                 .withOpacity(0.2),
              //             spreadRadius: 10,
              //             blurRadius: 5,
              //             // offset: const Offset(2, 2),
              //           ),
              //         ],
              //       ),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Image.asset(
              //             'assets/icons/bell.png',
              //             height: 60,
              //             // width: 7,
              //           ),
              //           const SizedBox(
              //             height: 4,
              //           ),
              //           const Text(
              //             "Notice", //icon thakbe
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //           const Text(
              //             "Subtitile", //icon thakbe
              //           ),
              //         ],
              //       ),
              //     ),
              //     //Notice section end
              //
              //     //Daily Work section start
              //     Container(
              //       alignment: Alignment.center,
              //       width: MediaQuery.of(context).size.width * .27,
              //       height: 150,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(10),
              //         boxShadow: [
              //           BoxShadow(
              //             color: const Color.fromARGB(255, 200, 194, 194)
              //                 .withOpacity(0.2),
              //             spreadRadius: 10,
              //             blurRadius: 5,
              //             // offset: const Offset(2, 2),
              //           ),
              //         ],
              //       ),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Image.asset(
              //             'assets/icons/daily_work.png',
              //             height: 60,
              //
              //             // width: 7,
              //           ),
              //           const SizedBox(
              //             height: 4,
              //           ),
              //           const Text(
              //             "Daily Work", //icon thakbe
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //           const Text(
              //             "Subtitile", //icon thakbe
              //           ),
              //         ],
              //       ),
              //     )
              //     //Daily Work section end
              //   ],
              // ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}