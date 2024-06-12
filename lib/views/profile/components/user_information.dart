// ignore_for_file: deprecated_member_use
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/controllers/profile_controller.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    controller.getProfile();
    return Column(
      children: [
        _details(context),
        const SizedBox(
          height: 5,
        ),
        _contact(context)
      ],
    );
  }

  Widget _details(BuildContext context) => Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Details'),
            const SizedBox(
              height: 10,
            ),
            _item(
              context,
              title: controller.profileModel.value.profile != null
                  ? controller.profileModel.value.profile?.name.toString()
                  : "",
              icon: Icons.person,
            ),
            const SizedBox(
              height: 10,
            ),
            _item(
              context,
              title: 'Date',
              icon: Icons.cake,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            _item(
              context,
              title: controller.profileModel.value.profile != null
                  ? controller.profileModel.value.profile?.gender.toString()
                  : "",
              icon: FontAwesomeIcons.venusMars,
            ),
            const SizedBox(
              height: 10,
            ),
            _item(
              context,
              title: controller.profileModel.value.profile != null
                  ? controller.profileModel.value.profile?.religion.toString()
                  : "",
              icon: FontAwesomeIcons.prayingHands,
            ),
            const SizedBox(
              height: 10,
            ),
            _item(
              context,
              title: controller.profileModel.value.profile != null
                  ? controller.profileModel.value.profile?.maritalStatus
                      .toString()
                  : "",
              icon: FontAwesomeIcons.ring,
            ),

            // DateTimePicker(
            //   initialValue: '',
            //   firstDate: DateTime(2000),
            //   lastDate: DateTime(2100),
            //   dateLabelText: 'Date',
            //   onChanged: (val) => print(val),
            //   validator: (val) {
            //     print(val);
            //     return null;
            //   },
            //   onSaved: (val) => print(val),
            // ),
            // _dateOfBirth(
            //     date: profileModel.birthDate,
            //      date: DateFormat("yyyy-MM-dd").format(profileModel.birthDate),
            //     icon: Icons.cake,
            //     enableEditView: profileModel.enableEditor),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),
            // _dropDownEditorItem(
            //     enableEditView: profileModel.enableEditor,
            //     icon: FontAwesomeIcons.handHoldingWater,
            //     hint: "Blood Group",
            //     value: profileModel.bloodGroup,
            //     items: ['A+', 'B+', 'A-', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
            //     onChange: (value) {
            //       profileModel.bloodGroup = value;
            //     }),
          ],
        ),
      ));

  Widget _item(BuildContext context,
          {title,
          icon,
          hint,
          enableEditView = false,
          canEdit = true,
          keyBoardType,
          controller,
          maxLength}) =>
      Row(
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
          Expanded(child: Text(title)),
          Expanded(
              child: TextField(
            controller: controller,
            readOnly: !enableEditView,
            enabled: enableEditView && canEdit,
            maxLines: 1,
            maxLength: maxLength,
            keyboardType: keyBoardType,
            decoration: InputDecoration(
                hintText: enableEditView ? hint : '',
                border: enableEditView && canEdit
                    ? const UnderlineInputBorder()
                    : InputBorder.none,
                suffixIcon:
                    canEdit && enableEditView ? const Icon(Icons.edit) : null),
          ))
        ],
      );

  Widget _contact(BuildContext context) => Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Contact'),
            const SizedBox(
              height: 10,
            ),
            _item(
              context,
              title: controller.profileModel.value.profile != null
                  ? controller.profileModel.value.profile?.company?.phoneNumber
                      .toString()
                  : "",
              icon: Icons.phone_android,
              maxLength: 11,
              hint: 'Your Mobile Number',
            ),
            const SizedBox(
              height: 10,
            ),
            _item(
              context,
              title: controller.profileModel.value.profile != null
                  ? controller.profileModel.value.profile?.email.toString()
                  : "",
              icon: Icons.email,
              hint: 'aziz.swe71@gmail.com',
              canEdit: false,
            ),
            const SizedBox(
              height: 10,
            ),
            _item(
              context,
              title: 'Location',
              icon: FontAwesomeIcons.locationDot,
              hint: 'Your Location',
              canEdit: false,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ));
}
