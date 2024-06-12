import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_hrm/controllers/leave_controller.dart';
import '../../../res/global_widgets/custom_attachment_button.dart';
import '../../../res/global_widgets/custom_button.dart';

class LeaveForm extends StatefulWidget {
  const LeaveForm({super.key});

  @override
  State<LeaveForm> createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  final formKey = GlobalKey<FormState>();

  final controller = Get.put(LeaveController());
  DateTime selectedDate = DateTime.now();
  DateTime selectedTODate = DateTime.now();

    // Format dates with only the date portion



  Future<void> selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1975),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
        }
  }

  Future<void> selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedTODate,
      firstDate: DateTime(1975, 1),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedTODate) {
      setState(() {
        selectedTODate = picked;
      });
    }
  }

  void printFormattedDate(DateTime date) {
  // Format the selected date
  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
  print('Formatted Date: $formattedDate');
}

  @override
  Widget build(BuildContext context) {
    controller.leaveFrom();
    return Obx(
      () => Form(
        key: formKey,
        child: Column(
          children: [
            Image.asset(
              'assets/images/leave.png',
              height: 160,
            ),

            //select leave section start
            buildSelectLeave(),
            //select leave section end

            const SizedBox(height: 20),
            //leave from & to start
            Row(
              children: [
                Expanded(
                  child: buildFromDate(),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(child: buildToDate()),
              ],
            ),
            //leave from & to end

            const SizedBox(height: 20),
            //contact section start
            buildContactFormField(),
            //contact section end

            const SizedBox(height: 20),
            //leave reason section start
            buildReasonField(),
            //leave reason section end

            const SizedBox(height: 50),
            //attachment section start
            InkWell(
                onTap: () => buildModalBottomSheet(),
                child: const CustomAttachmentButton()),
            //attachment section end

            const SizedBox(height: 50),
            //submit button start
            InkWell(
                onTap: () {
                  if (controller.leaveModel.value.data!.first.id != null) {

                   String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      String formattedSelectedTODate = DateFormat('yyyy-MM-dd').format(selectedTODate);

                    controller.leaveSubmit(
                        formattedSelectedDate.toString(),
                        formattedSelectedTODate.toString(),
                        controller.leaveModel.value.data!.first.id.toString());
                  }
   String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      String formattedSelectedTODate = DateFormat('yyyy-MM-dd').format(selectedTODate);

                  print(' leave data print here ${controller.leaveSubmit(
                    formattedSelectedDate.toString(),
                        formattedSelectedTODate.toString(),
                      controller.leaveModel.value.data!.first.id.toString())}');
                },
                child: const CustomButton(
                  buttonTitle: 'Submit',
                )),
            //submit button end
          ],
        ),
      ),
    );
  }

  //modal bottom sheet start
  Future buildModalBottomSheet() {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.2),
        builder: (context) {
          return SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          OutlinedButton(
                              onPressed: () async {
                                // await ImagePickerUtils.cameraImage();
                                // if(ImagePickerUtils.image != null){
                                //   selectedFiles.add(ImagePickerUtils.image);
                                // }
                                // Navigator.pop(context);
                                // setState(() {});
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(20),
                                side: const BorderSide(
                                    width: 1.5, color: Colors.blue),
                                shape: const StadiumBorder(),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.blue,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Camera")
                        ],
                      ),
                      Column(
                        children: [
                          OutlinedButton(
                              onPressed: () async {
                                // await ImagePickerUtils.galleryImage();
                                // if(ImagePickerUtils.image != null){
                                //   selectedFiles.add(ImagePickerUtils.image);
                                // }
                                // Navigator.pop(context);
                                // setState(() {});
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(20),
                                side: const BorderSide(
                                    width: 1.5, color: Colors.blue),
                                shape: const StadiumBorder(),
                              ),
                              child: const Icon(
                                Icons.file_upload_outlined,
                                color: Colors.blue,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Gallery")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  //modal bottom sheet end

  //leave spinner start
  Widget buildLeaveSpinner() {
    return DropdownButtonFormField(
      value: controller.selectedLeave.value.isEmpty
          ? null
          : controller.selectedLeave.value,
      isExpanded: true,
      iconEnabledColor: Colors.white,
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      decoration: InputDecoration(
        labelText: "Select Leave",
        hintText: "Select Leave Type",
        hintStyle: const TextStyle(color: Colors.white),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        labelStyle: const TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: (value) {
        setState(() {
          controller.selectedLeave.value = value!;
        });
      },
      items: controller.leaveModel.value.data?.map((val) {
        return DropdownMenuItem(
          value: val.name.toString(),
          child: Text(
            val.name.toString(),
          ),
        );
      }).toList(),
    );
  }

  //leave spinner end

  //select leave start
  Widget buildSelectLeave() {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.blue[400]),
        child: Column(
          children: [
            buildLeaveSpinner(),
            const SizedBox(
              height: 10,
            ),
            buildleaveInfo(),
          ],
        ));
  }

  Padding buildleaveInfo() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Leave:  ${controller.selectedLeave.value.isEmpty ? "0" : controller.leaveModel.value.data?.first.data?.ttl?.split('.')[0] ?? "0"}",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Yearly limit: ${controller.selectedLeave.value.isEmpty ? "0" : 0}",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Balance: ${controller.selectedLeave.value.isEmpty ? "0" : controller.leaveModel.value.data?.first.data?.balance?.split('.')[0] ?? "0"}",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Monthly limit: ${controller.selectedLeave.value.isEmpty ? "0" : controller.leaveModel.value.data?.first.data?.monthlyLimit ?? "0"}",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            VerticalDivider(
              color: Colors.white,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.selectedLeave.value.isEmpty ? "0" : controller.leaveModel.value.data?.first.data?.approved ?? "0"} :Approved",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "${controller.selectedLeave.value.isEmpty ? "0" : controller.leaveModel.value.data?.first.data?.unapproved ?? "0"} :UnApprove",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "${controller.selectedLeave.value.isEmpty ? "0" : controller.leaveModel.value.data?.first.data?.simultaneouslyLimit ?? "0"} :Simultaneously",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//build from date start
  Widget buildFromDate() {
    return GestureDetector(
      onTap: () {
        selectFromDate(context);
      },
      child: TextFormField(
        readOnly: true,
        controller: TextEditingController(
          text: "${selectedDate.toLocal()}".split(' ')[0],
        ),
        onSaved: (newValue) => newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {}
        },
        decoration: InputDecoration(
          enabled: false,
          labelText: "From",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }

//build To date start
  Widget buildToDate() {
    return GestureDetector(
      onTap: () {
        selectToDate(context);
      },
      child: TextFormField(
        readOnly: true,
        controller: TextEditingController(
          text: "${selectedTODate.toLocal()}".split(' ')[0],
        ),
        onSaved: (newValue) => newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {}
        },
        decoration: InputDecoration(
          enabled: false,
          labelText: "From",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }

  //contact form start
  Widget buildContactFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller.phone,
      // onSaved: (newValue) => contact = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // removeError(error: 'enter valid contact');
        }
        // contact = value;
      },
      // validator: (value) {
      //   // if (value.isEmpty) {
      //   //   addError(error: 'enter valid contact');
      //   //   return "";
      //   // }
      //   return null;
      // },
      maxLength: 14,
      decoration: InputDecoration(
        counter: const Offstage(),
        labelText: "Emergency Contact",
        hintText: "Enter your contact number",
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        suffixIcon: const Icon(Icons.call),
      ),
    );
  }
//contact form end

//reason field start
  Widget buildReasonField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      controller: controller.reason,
      // onSaved: (newValue) => reason = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // removeError(error: 'enter reason');
        }
        // reason = "$value\n";
      },
      validator: (value) {
        // if (value.isEmpty) {
        //   addError(error: 'enter reason');
        //   return "";
        // }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Enter Leave Reason",
        hintText: 'Enter Leave Reason',
        fillColor: Colors.black87,
        focusColor: Colors.black,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide:  BorderSide(color: Colors.black),
        ),
        //fillColor: Colors.green
      ),
    );
  }
//reason filed end
}