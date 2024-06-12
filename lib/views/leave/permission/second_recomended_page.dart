import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_hrm/controllers/leave_setting_controller.dart';

class SecondRecomendedPage extends StatefulWidget {
  const SecondRecomendedPage({super.key});

  @override
  State<SecondRecomendedPage> createState() => _SecondRecomendedPageState();
}

class _SecondRecomendedPageState extends State<SecondRecomendedPage> {
  final controller = Get.put(LeaveSettingController());
  @override
  Widget build(BuildContext context) {
    controller.pendingseecondRecomemded();
    return Scaffold(body: Obx(() {
      if (controller.issecondLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.secondRModel.value.data?.data?.isEmpty ?? true) {
        return Center(child: Text("No Application Found"));
      } else {
        return Container(
          height: Get.height,
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 8,
            ),
            itemCount: controller.secondRModel.value.data?.data?.length ?? 0,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var fRData = controller.secondRModel.value.data?.data?[index];
              return Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fRData!.employee!.name.toString()),
                    info(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        detalsview(
                            fRData.company!.name.toString(),
                            fRData.employee!.name.toString(),
                            fRData.employee!.employeeFullId.toString(),
                            fRData.leaveType!.name.toString(),
                            DateFormat('y-M-d').format(fRData.from!.toLocal()),
                            DateFormat('y-M-d').format(
                              fRData.to!.toLocal(),
                            ),
                            fRData.totalDays.toString(),
                            0.toString(),
                            fRData.reason.toString(), () {
                          Get.back();
                          tapApprovedDetailsdialog(() {
                            controller
                                .secondRecomemdedApproval(fRData.id!.toInt());
                            print(fRData.id);
                            Get.back();
                            controller.srecomededNoteController.value.clear();
                            controller.pendingseecondRecomemded();
                          });
                        }, () {
                          controller
                              .cancleRecomemdedApproval(fRData.id!.toInt());
                          print('cancle id${fRData.id}');
                          Get.back();
                          controller.pendingseecondRecomemded();
                        }),
                        SizedBox(
                          width: 10,
                        ),
                        iconView(Icons.edit, Colors.blue, () {}),
                        SizedBox(
                          width: 10,
                        ),
                        iconView(Icons.done, Colors.green, () {
                          tapApproved(
                            onPressed: () {
                              controller
                                  .secondRecomemdedApproval(fRData.id!.toInt());
                              print(fRData.id);
                              Get.back();
                              // controller.srecomededNoteController.value
                              // .clear();
                              controller.pendingseecondRecomemded();
                            },
                          );
                        }),
                        SizedBox(
                          width: 10,
                        ),
                        iconView(Icons.close, Colors.red, () {
                          tapApprovedcvancle(() {
                            controller
                                .cancleRecomemdedApproval(fRData.id!.toInt());
                            print(fRData.id);
                            Get.back();
                            // controller.srecomededNoteController.value
                            // .clear();
                            controller.pendingseecondRecomemded();
                          });
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 3,
                      endIndent: 3,
                    )
                  ],
                ),
              );
            },
          ),
        );
      }
    }));
  }

  GestureDetector iconView(IconData icon, Color color, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  icon,
                  color: color,
                ))),
      ),
    );
  }

  GestureDetector detalsview(
      String company,
      String name,
      String id,
      String type,
      String fromdate,
      String todate,
      String total,
      String available,
      String reason,
      Function()? onPressed,
      Function()? onPressed2) {
    return GestureDetector(
      onTap: () {
        tapDetails(context, company, name, id, type, fromdate, todate, total,
            available, reason, onPressed, onPressed2);
      },
      child: Container(
        height: 35,
        width: 120,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text('View Details'),
        )),
      ),
    );
  }

  Row info() {
    return Row(
      children: [
        RichText(
          text: TextSpan(
              text: '1 days ',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: 'CL ',
                    style: TextStyle(decoration: TextDecoration.underline),
                    children: [
                      TextSpan(
                          text: 'form ',
                          style: TextStyle(decoration: TextDecoration.none),
                          children: [
                            TextSpan(
                                text: 'Demo company 1',
                                style: TextStyle(
                                    decoration: TextDecoration.underline))
                          ])
                    ]),
              ]),
        )
      ],
    );
  }

  // details dialog

  tapDetails(
      BuildContext context,
      String company,
      String name,
      String id,
      String type,
      String fromdate,
      String todate,
      String total,
      String available,
      String reason,
      Function()? onPressed,
      Function()? onPressed2) {
    // set up the button
    Widget cancelButton = TextButton(
        child: const Text(
          "Refuse",
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
        onPressed: onPressed2);
    Widget okButton = TextButton(
        child: const Text(
          "Approved",
          style: TextStyle(color: Colors.green, fontSize: 16),
        ),
        onPressed: onPressed);

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(15)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Applicant Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
          Text(
            'Company: $company',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          Divider(),
          Text('Name: $name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Divider(),
          Text('id: $id',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Divider(),
          Text('Leave Type: $type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Divider(),
          Text('$fromdate to $todate',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Divider(),
          Text('Total: $total',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Divider(),
          Text('Available: $available',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Divider(),
          Text('Reason: $reason',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        ],
      ),
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

// page view approved
  tapApproved({required Function()? onPressed}) {
    // set up the button
    Widget cancelButton = TextButton(
      child: const Text(
        "No",
        style: TextStyle(color: Colors.blue, fontSize: 16),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Widget okButton = TextButton(
      child: Text(
        "Yes",
        style: TextStyle(color: Colors.blue, fontSize: 16),
      ),
      onPressed: onPressed,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(15)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are you sure to approve this Application?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            maxLength: 30,
            controller: controller.srecomededNoteController.value,
            decoration:
                InputDecoration(icon: Icon(Icons.note), hintText: 'Note'),
          )
        ],
      ),
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

// details dialog approved
  tapApprovedDetailsdialog(Function()? onPressed) {
    // set up the button

    Widget okButton = TextButton(
      child: const Text(
        "Submit",
        style: TextStyle(color: Colors.blue, fontSize: 16),
      ),
      onPressed: onPressed,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(15)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Confirm Approval',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
          TextFormField(
            maxLength: 30,
            controller: controller.srecomededNoteController.value,
            decoration: InputDecoration(hintText: 'Approval Note'),
          ),
        ],
      ),
      actions: [
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

  tapApprovedcvancle(Function()? onPressed) {
    // set up the button

    Widget noButton = TextButton(
      child: const Text(
        "No",
        style: TextStyle(color: Colors.blue, fontSize: 16),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Widget okButton = TextButton(
      child: const Text(
        "Yes",
        style: TextStyle(color: Colors.blue, fontSize: 16),
      ),
      onPressed: onPressed,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(15)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are you sure to cancle this Application?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        noButton,
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
}
