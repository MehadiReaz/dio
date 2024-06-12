// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_hrm/controllers/company_list_controller.dart';
import 'package:smart_hrm/models/comapny_list_model.dart';
import 'package:smart_hrm/views/authentication/login/login.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../res/global_widgets/custom_button.dart';
import '../../res/style/app_string.dart';
import '../../res/style/font_family/text_font_family.dart';
import '../../utils/app_urls.dart';
class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  //for select company
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = Get.put(CompanyListController());

  @override
  Widget build(BuildContext context) {
    controller.getCompanyList();

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Obx(
            () => Center(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                //logo start
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Image.asset(
                    'assets/icons/smart.png',
                    width: size.width * .35,
                    fit: BoxFit.cover,
                  ),
                ),
                //logo end
                Column(
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        dropdownSearchData: DropdownSearchData(
                          searchController: controller.searchFieldController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 50,
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              left: 8,
                              right: 8,
                            ),
                            child: TextField(
                              controller: controller.searchFieldController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 9, horizontal: 5),
                                hintText: 'Search company',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return (item.value!
                                .toLowerCase()
                                .contains(searchValue));
                          },
                        ),
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            controller.searchFieldController.clear();
                          }
                        },
                        isExpanded: true,
                        hint: Text(
                          'Select Company',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        value: controller.selectedCompany.value.isEmpty
                            ? null
                            : controller.selectedCompany.value,
                        items: (controller.companyListModel.value.data ?? [])
                            .map((e) {
                          return DropdownMenuItem<String>(
                              value: e.companyName.toString(),
                              child: Text(e.companyName.toString()));
                        }).toList(),
                        onChanged: (String? value) {
                          final selectedZone = (controller
                              .companyListModel.value.data ??
                              [])
                              .firstWhere((zone) => zone.companyName == value);

                          // Check if the selected zone is not null and has an ID
                          if (selectedZone != null &&
                              selectedZone.baseUrl != null) {
                            controller.selectedCompany.value = value.toString();
                            print(selectedZone.baseUrl);
                            print(selectedZone.hrmApiKey);
                          }
                        },
                        buttonStyleData: ButtonStyleData(
                          height: size.height / 14,
                          width: size.width,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: size.height / 3,
                          width: size.width,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility:
                            MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        if (controller.selectedCompany.value != null &&
                            controller.selectedCompany.value.isNotEmpty) {
                          CompanyDatum selectedCompany =
                          (controller.companyListModel.value.data ?? [])
                              .firstWhere((zone) =>
                          zone.companyName ==
                              controller.selectedCompany.value);

                          if (selectedCompany.baseUrl != null) {
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            prefs.setString(
                              'baseUrl',
                              selectedCompany.baseUrl.toString(),
                            );
                            prefs.setString(
                              'key',
                              selectedCompany.hrmApiKey.toString(),
                            );
                            prefs.setString(
                              'company',
                              selectedCompany.companyName.toString(),
                            );

                            // Update the baseUrl in the AppUrls class
                            AppUrls.setBaseUrl(
                                selectedCompany.baseUrl.toString(),
                                selectedCompany.hrmApiKey.toString());
                            print('Appurls ${AppUrls.baseUrl}');
                            print('hrm ${AppUrls.key}');
                            Get.offAll(()=>LoginScreen(
                              company:
                              selectedCompany.companyName.toString(),
                            ));
                          }
                        } else {
                          // customToast(
                          //     msg: 'No company selected.', color: Colors.red);
                        }
                      },
                      child: const CustomButton(buttonTitle: 'Submit'),
                    ),
                  ],
                ),

                //bottom part start
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          AppConfig.developedBy,
                          style: textStyle(
                            textColor: Colors.black.withOpacity(0.5),
                            fontSize: 8,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () => launch(AppConfig.companyName),
                          child: AutoSizeText(
                            AppConfig.companyName,
                            style: textStyle(
                                textColor: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                //bottom part end
              ],
            ),
          ),
        ),
      ),
    );
  }
}