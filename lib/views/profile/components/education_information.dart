// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EducationInformation extends StatefulWidget {
  const EducationInformation({super.key});

  @override
  State<EducationInformation> createState() => _EducationInformationState();
}

class _EducationInformationState extends State<EducationInformation> {
  String educationalQualifications = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (educationalQualifications.isEmpty)
          Center(
            heightFactor: MediaQuery.of(context).size.height * 0.03,
            child: const Text("No Educational Qualifications"),
          ),
        _educationItemEditor(),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget _educationItemEditor({
    examinationName,
    grade,
    passingYear,
    board,
    enableEditView,
  }) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 1,
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            child: enableEditView
                ? Column(
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {},
                            splashRadius: 25,
                            icon: const Icon(Icons.close),
                          ))

                      /// Examination
                      ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Examination: "),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              // readOnly: profileModel.initialEducationalQualificationsCount > index,
                              controller:
                                  TextEditingController(text: examinationName),
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: "Ex. hsc, bsc, etc.",
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  constraints: BoxConstraints(maxHeight: 40)),
                            ),
                          ),
                        ],
                      ),

                      ///Grade
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("CGPA/GPA: "),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller: TextEditingController(text: grade),
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                  hintText: "Ex. 5.00",
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  constraints: BoxConstraints(maxHeight: 40)),
                            ),
                          ),
                        ],
                      ),

                      /// Passing Year
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Passing Year: "),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller:
                                  TextEditingController(text: passingYear),
                              maxLines: 1,
                              onChanged: (value) {},
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                  hintText: "Ex. 2009",
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  constraints: BoxConstraints(maxHeight: 40)),
                            ),
                          ),
                        ],
                      ),

                      /// Board
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Board: "),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller: TextEditingController(text: board),
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                  hintText: "Ex. dhaka",
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  constraints: BoxConstraints(maxHeight: 40)),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(examinationName),
                      const SizedBox(
                        height: 10,
                      ),
                      _item(context, grade, FontAwesomeIcons.graduationCap),
                      const SizedBox(
                        height: 10,
                      ),
                      _item(context, passingYear, FontAwesomeIcons.bookOpen),
                      const SizedBox(
                        height: 10,
                      ),
                      _item(context, board, FontAwesomeIcons.pollH),
                    ],
                  )));
  }

  Widget _item(BuildContext context, var title, var icon) => Row(
        children: [
          Container(
            height: 40,
            width: 40,
            color: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color(0xffE1E1E1),
              ),
              child: Icon(
                icon,
                size: 18,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(title)
        ],
      );
}
