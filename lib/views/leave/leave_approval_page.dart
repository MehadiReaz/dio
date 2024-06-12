import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/controllers/leave_setting_controller.dart';
import 'package:smart_hrm/views/leave/permission/approval_page.dart';
import 'package:smart_hrm/views/leave/permission/recomended_page.dart';
import 'package:smart_hrm/views/leave/permission/second_recomended_page.dart';

class LeaveApprovalPage extends StatefulWidget {
  const LeaveApprovalPage({super.key});

  @override
  State<LeaveApprovalPage> createState() => _LeaveApprovalPageState();
}

class _LeaveApprovalPageState extends State<LeaveApprovalPage> {
  /// List of Tab Bar Item
  List<String> items = [
    "Approval Leave",
    "Recomended Leave",
    "Second Recomended Leave",
  ];

  int current = 0;
  PageController pageController = PageController();

  bool isLoading = false;

  final controller = Get.put(LeaveSettingController());
  @override
  Widget build(BuildContext context) {
    controller.pendingfirstrecomeded();
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: customappbar(context),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              current=index;
            });
          },
          children: [
            ApprovalPage(),
            RecomendedPage(),
            SecondRecomendedPage(),
            
          ],
        )
        );
  }
// app bar start
  PreferredSize customappbar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          title: Text(
            'Pending Approval Leave Application',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          backgroundColor: Colors.blue,
          flexibleSpace: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.all(5),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                            pageController.animateToPage(
                              current,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease,
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            height: 55,
                            decoration: BoxDecoration(
                              color: current == index
                                  ? Colors.white70
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  items[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: current == index
                                        ? Colors.black
                                        : Colors.grey.shade400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
  // end appbar
}

