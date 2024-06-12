import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../res/style/color.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue.shade400,
        drawer:  IntrinsicHeight(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.primaryColor),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: RichText(
                          text: TextSpan(
                              text: "SMART",
                              style: GoogleFonts.solway(
                                  fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
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
                      //
                      // AutoSizeText(
                      //   AppConfig.appName,
                      //   style: const TextStyle(fontSize: 12),
                      //   // maxLines: 2,
                      //   textAlign: TextAlign.center,
                      // ),
                      // child: Text(
                      //   "Snake Bite",
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ),
                  ),
                  accountEmail: const AutoSizeText(
                    "support@hrm.com",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),

                  // Text(
                  //   "support@snakebite.com",
                  //   style: TextStyle(color:AppColors.primaryColor,),
                  // ),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  otherAccountsPictures: [],
                ),
                ListTile(
                  onTap: () {
                    // Get.offAll(() => const HomeScreen());
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                    Get.back();
                  },
                  title: const AutoSizeText(
                    'হোম',
                    style: TextStyle(fontSize: 10, color: Colors.black),
                    maxLines: 2,
                  ),


                  // Text(
                  //   'Home',
                  //   style: TextStyle(fontWeight: FontWeight.normal),
                  // ),
                  leading: Icon(
                    Icons.home,
                    color: AppColors.primaryColor,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),

                ListTile(
                  onTap: () {
                    // const AboutListTile(
                    //   applicationName: 'Happy Wall',
                    //   applicationVersion: '1.0',
                    //   applicationLegalese: 'SoftLeads.com',
                    //   child: Text('About App',
                    //       style: TextStyle(fontWeight: FontWeight.bold)),
                    // );
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const AboutAppScreen(),
                    // ));
                  },
                  title: const AutoSizeText(
                    'অ্যাপ সম্পর্কে',
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  //
                  // Text('About App',
                  //     style: TextStyle(fontWeight: FontWeight.normal)),
                  leading: Icon(
                    Icons.info,
                    color: AppColors.primaryColor,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
                ListTile(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const PrivacyScreen(),
                    // ));
                  },
                  title: const AutoSizeText(
                    'প্রাইভেসি পলিসি',
                    style: TextStyle(fontSize: 10, color: Colors.black),
                    maxLines: 2,
                  ),

                  // Text('Privacy Policy',
                  //     style: TextStyle(fontWeight: FontWeight.normal)),
                  leading: Icon(
                    Icons.privacy_tip_outlined,
                    color: AppColors.primaryColor,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
                ListTile(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const RatingScreen(),
                    // ));
                  },
                  title: const AutoSizeText(
                    'রেটিং দিন',
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),

                  // Text('Rate Us',
                  //     style: TextStyle(fontWeight: FontWeight.normal)),
                  leading: Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.primaryColor,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),



                // ListTile(
                //   onTap: () {
                //     final Uri params = Uri(
                //       scheme: 'mailto',
                //       path: 'harvesthub_agro@gmail.com',
                //       query: 'HarvestHub Agro Feedback',
                //     );
                //     final url = params.toString();
                //     final urlPath = Uri.parse(url);
                //     launchUrl(urlPath);
                //   },
                //   title: const Text('Feedback',
                //       style: TextStyle(fontWeight: FontWeight.bold)),
                //   leading: const Icon(
                //     Icons.feedback_rounded,
                //     color: Colors.green,
                //   ),
                //   trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                // ),
                // ListTile(
                //   onTap: () {
                //     Navigator.pop(context);
                //     Share.share('com.example.harvest_hub_agro');
                //   },
                //   title: const Text('Share with friends',
                //       style: TextStyle(fontWeight: FontWeight.bold)),
                //   leading: const Icon(
                //     Icons.share,
                //     color: Colors.green,
                //   ),
                //   trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                // ),
                ListTile(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const AppUpdateScreen(),
                    // ));
                  },
                  title: const AutoSizeText(
                    'আপডেট',
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),

                  // Text('Update',
                  //     style: TextStyle(fontWeight: FontWeight.normal)),
                  leading: Icon(
                    Icons.update,
                    color: AppColors.primaryColor,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),

                // ListTile(
                //   onTap: () => auth.signOut().then((value) {
                //     Navigator.pushAndRemoveUntil(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const LoginScreen(),
                //         ),
                //             (route) => false);
                //     // Navigator.pushReplacement(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) => const SplashScreen()));
                //   }),
                //   title: const Text('Sign out',
                //       style: TextStyle(fontWeight: FontWeight.bold)),
                //   leading: const Icon(
                //     Icons.exit_to_app_rounded,
                //     color: Colors.green,
                //   ),
                //   trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                // ),
                // ListTile(
                //   onTap: () => exit(0),
                //   title: const Text('Exit',
                //       style: TextStyle(fontWeight: FontWeight.bold)),
                //   leading: const Icon(
                //     Icons.exit_to_app_rounded,
                //     color: Colors.green,
                //   ),
                //   trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                // ),
                // const Divider(
                //   indent: 20,
                //   thickness: 0.4,
                //   endIndent: 20,
                // ),
                const SizedBox(
                  height: 15,
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'অ্যাপ ভার্সন ১.০',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // body: SafeArea(
        //   child:
        //   SingleChildScrollView(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         const CircleAvatar(),
        //         ...MenuItems.allMenuList.map(buildMenuItem).toList(),
        //       ],
        //     ),
        //   ),
        // ),
      );

  // Widget buildMenuItem(MenuItem item) => ListTile(contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
  //   // contentPadding: EdgeInsets.zero,
  //
  //       // minLeadingWidth: 20,
  //       leading: Text(item.title),
  //       onTap: () {},
  //     );
}

// class MenuItems {
//   static const profile = MenuItem('Profile');
//   static const attendance = MenuItem('Attendance');
//   static const pay_slip = MenuItem('Pay Slip');
//   static const create_leave = MenuItem('Create Leave');
//   static const leave_history = MenuItem('Leave History');
//   static const pending_appl_approval = MenuItem('Pending Appl. Approvals');
//   static const leave_application = MenuItem('Leave Application');
//   static const create_short_leave = MenuItem('Create Short Leave');
//   static const pending_s_leave = MenuItem('Pending S.Leave');
//   static const live_calling = MenuItem('Live Calling');
//   static const hr_loan = MenuItem('HR Loan');
//   static const emp_tracking = MenuItem('Employee Tracking');
//   static const share_app = MenuItem('Share App');
//   static const logout = MenuItem('Logout');
//
//   static const allMenuList = [
//     profile,
//     attendance,
//     pay_slip,
//     create_leave,
//     leave_history,
//     pending_appl_approval,
//     pending_appl_approval,
//     leave_application,
//     create_short_leave,
//     pending_s_leave,
//     live_calling,
//     hr_loan,
//     emp_tracking,
//     share_app,
//     logout
//   ];
// }
