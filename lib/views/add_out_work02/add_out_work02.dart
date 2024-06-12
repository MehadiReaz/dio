// ignore_for_file: unused_local_variable, camel_case_types

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:smart_hrm/local/prefs.dart';
import 'package:smart_hrm/res/style/font_family/text_font_family.dart';
import 'package:smart_hrm/views/add_out_work02/custom_text_field.dart';
import 'package:smart_hrm/views/home/home_page_copy.dart';

import '../../res/global_widgets/custom_button.dart';

class OutWork extends StatefulWidget {

  const OutWork({
    super.key,

  });

  @override
  State<OutWork> createState() => _outWorkState();
}

class _outWorkState extends State<OutWork> {
  final _noteController = TextEditingController();
  final _dateController = TextEditingController();
  bool isCheck = true;
  TimeOfDay _inTime = TimeOfDay.now();
  DateTime selectDate = DateTime.now();

  collectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(200),
      lastDate: DateTime(20254),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  void createBlog(String note, String selectDate) async {
    try {
      final response = await post(
          Uri.parse("https://demo2.hrmsoftwarebd.com/api/hrm/out-work/apply")
              .replace(queryParameters: {
            "token": MySharedPref.getToken("token".obs).toString()
               
          }),
          headers: {
            "hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb",
          },
          body: {
            'date': selectDate,
            'note': note,
          });

      if (response.statusCode == 200) {
        log('success');
        print('body: ${response.body}');

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Out Work Successfully Done"),
          backgroundColor: Colors.blue,
        )
        );
      }
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[200],
      appBar: AppBar(
        
        leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreenCopy(),));
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.blue,
        title:  Text('Create Add out work',style: textStyle(textColor: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),

        child: SingleChildScrollView(

          child: Column(
            children: [
              Image.asset(
                'assets/icons/manager.png',
                height: 180,
              ),
              const SizedBox(
                height: 10,
              ),

              //enteranote
              CustomTextField1(
                  labelText: "Enter a Note",
                  textEditingController: _noteController),

              //enteradate
              Container(

                  // padding: const EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  height: MediaQuery.of(context).size.width / 3,
                  child: Center(
                      child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      ),
                      labelText: "Enter Date",
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        // print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          _dateController.text = formattedDate;
                        });
                      } else {}
                    },
                  ))),

              buildReturnTime(),

              //return time
              // InkWell(
              //     child: TextFormField(
              //       controller:
              //           TextEditingController(text: _inTime.format(context)),
              //       onSaved: (newValue) => newValue,
              //       onChanged: (value) {
              //         if (value.isNotEmpty) {
              //           // removeError(error: 'Enter in time');
              //         }
              //       },
              //       validator: (value) {
              //         // if (value.isEmpty) {
              //         //   addError(error: 'error');
              //         //   return "";
              //         // }
              //         return null;
              //       },
              //       decoration: InputDecoration(
              //         labelStyle: const TextStyle(
              //           color: Colors.blueGrey,
              //           fontSize: 15,
              //         ),
              //         labelText: "Return Time",
              //         contentPadding:
              //             const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //         border: OutlineInputBorder(
              //           borderSide: const BorderSide(color: Colors.blueGrey),
              //           borderRadius: BorderRadius.circular(25.0),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderSide: const BorderSide(color: Colors.green),
              //           borderRadius: BorderRadius.circular(25.0),
              //         ),
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: const BorderSide(color: Colors.blueGrey),
              //           borderRadius: BorderRadius.circular(25.0),
              //         ),
              //         filled: true,
              //         fillColor: Colors.grey.shade100,
              //       ),
              //     ),
              //     onTap: () {
              //       selectInTime();
              //     }),

              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("Not return"),
                value: isCheck,
                onChanged: (newValue) {
                  setState(() {
                    isCheck = newValue!;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),

              InkWell(
                  onTap: () {
                    createBlog(_noteController.text, _dateController.text);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreenCopy(),));
                  },
                  child: const CustomButton(
                    buttonTitle: 'Submit',
                  )),
            ],
          ),
        ),
      ),
    );


  }

  //build return time start
  Widget buildReturnTime() {
    return InkWell(
        child: TextFormField(
          controller: TextEditingController(text: _inTime.format(context)),
          onSaved: (newValue) => newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              // removeError(error: 'Enter in time');
            }
          },
          validator: (value) {
            // if (value.isEmpty) {
            //   addError(error: 'error');
            //   return "";
            // }
            return null;
          },
          decoration: InputDecoration(
            enabled: false,
            labelText: "Return Time",
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
        onTap: () {
          selectInTime();
        });
  }


  void selectInTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _inTime,
    );
    if (newTime != null) {
      setState(() {
        _inTime = newTime;
      });
    }
  }
}
