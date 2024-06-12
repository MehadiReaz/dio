// ignore_for_file: unused_field, unused_local_variable

import 'package:flutter/material.dart';

import '../../../res/global_widgets/custom_button.dart';

class SortLeaveForm extends StatefulWidget {
  const SortLeaveForm({super.key});

  @override
  SortLeaveFormState createState() => SortLeaveFormState();
}

class SortLeaveFormState extends State<SortLeaveForm> {
  final _formKey = GlobalKey<FormState>();
  final bool _loading = false;

  final List<String> errors = [];

  // void addError({String error}) {
  //   if (!errors.contains(error))
  //     setState(() {
  //       errors.add(error);
  //     });
  // }

  // void removeError({String error}) {
  //   if (errors.contains(error))
  //     setState(() {
  //       errors.remove(error);
  //     });
  // }

  DateTime selectFromDate = DateTime.now();

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectFromDate,
        firstDate: DateTime(1975, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectFromDate) {
      setState(() {
        selectFromDate = picked;
      });
    }
  }

  TimeOfDay _formTime = TimeOfDay.now();
  TimeOfDay _toTime = TimeOfDay.now();
  TimeOfDay _inTime = TimeOfDay.now();

  void selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _formTime,
    );
    if (newTime != null) {
      setState(() {
        _formTime = newTime;
      });
    }
  }

  void selectToTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _toTime,
    );
    if (newTime != null) {
      setState(() {
        _toTime = newTime;
      });
    }
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

  // Future<SortLeaveType> _future;
  var dropdownValue;

  @override
  void initState() {
    super.initState();
    // _future = fetchSortLeaveType();
  }

  // void submitLeave() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   submitSortLeave(
  //       formatDate(selectFromDate, [yyyy, '-', mm, '-', dd]).toString(),
  //       dropdownValue,
  //       reason,
  //       contact,
  //       contactDetails,
  //       _formTime.format(context).toString(),
  //       _toTime.format(context).toString(),
  //       _inTime.format(context).toString()
  //   )
  //       .then((value) {
  //     showSnackBar(value.message);
  //     setState(() {
  //       _loading = false;
  //     });
  //   });
  // }

  void showSnackBar(String s) {
    final snackBar = SnackBar(
      content: Text(s),
      backgroundColor: const Color(0xffae00f0),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    );
    // Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          primaryColor: Colors.redAccent,
          primaryColorDark: Colors.red,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              buildFromDate(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: buildFormTime(),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(child: buildToTime())
                ],
              ),
              const SizedBox(height: 20),
              buildInTime(),
              const SizedBox(height: 20),
              buildEmergencyPhone(),
              const SizedBox(height: 20),
              buildContactDetails(),
              const SizedBox(height: 20),
              buildReasonField(),
              // FormError(errors: errors),
              const SizedBox(height: 30),

              //submit button start
              InkWell(
                  onTap: () => print('Submit is clicked'),
                  child: const CustomButton(
                    buttonTitle: 'Submit',
                  )),
              //submit button end
            ],
          ),
        ));
  }

  DropdownButtonFormField buildLeaveSpinner(AsyncSnapshot snapshot) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: "Select Leave",
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: snapshot.data.data.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(e, style: const TextStyle(color: Colors.black)),
        );
      }).toList(),
      onTap: () => {setState(() {})},
    );
  }

  Widget buildFromDate() {
    return InkWell(
        child: TextFormField(
          controller: TextEditingController(
              text: "${selectFromDate.toLocal()}".split(' ')[0]),
          onSaved: (newValue) => newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              // removeError(error: 'error');
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
            labelText: "From",
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
        onTap: () {
          _selectFromDate(context);
        });
  }

  Widget buildFormTime() {
    return InkWell(
        child: TextFormField(
          controller: TextEditingController(text: _formTime.format(context)),
          onSaved: (newValue) => newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              // removeError(error: 'Enter from time');
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
            labelText: "From",
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
        onTap: () {
          selectTime();
        });
  }

  Widget buildToTime() {
    return InkWell(
        child: TextFormField(
          controller: TextEditingController(text: _toTime.format(context)),
          onSaved: (newValue) => newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              // removeError(error: 'Enter to time');
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
            labelText: "To",
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
        onTap: () {
          selectToTime();
        });
  }

  Widget buildInTime() {
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
            labelText: "In Time",
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

  TextFormField buildReasonField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onSaved: (newValue) {},
      onChanged: (value) {
        if (value.isNotEmpty) {
          // removeError(error: 'enter reason');
        }
        // reason = value;
      },
      validator: (value) {
        // if (value.isEmpty) {
        //   addError(error: 'enter reason');
        //   return "";
        // }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Enter Reason",
        fillColor: Colors.black87,
        focusColor: Colors.black,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        //fillColor: Colors.green
      ),
    );
  }

  TextFormField buildEmergencyPhone() {
    return TextFormField(
      initialValue: "+880",
      keyboardType: TextInputType.number,
      onSaved: (newValue) {},
      onChanged: (value) {
        // if (value.isNotEmpty && value.length == 14) {
        //   removeError(error: 'enter valid contact');
        // }
        // contact = value;
      },
      validator: (value) {
        return null;
      
        // if (value.isEmpty || value.length != 14) {
        //   addError(error: 'enter valid contact');
        //   return "";
        // }
        // return null;
      },
      decoration: InputDecoration(
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

  TextFormField buildContactDetails() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      onSaved: (newValue) {},
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: 'enter contact details');
        // }
        // contactDetails = value;
      },
      validator: (value) {
        return null;
      
        // if (value.isEmpty) {
        //   addError(error: 'enter contact details');
        //   return "";
        // }
        // return null;
      },
      decoration: InputDecoration(
        labelText: "Contact Details",
        hintText: "Enter your contact details",
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
