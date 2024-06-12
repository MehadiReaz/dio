import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/configs/api_client.dart';
import 'package:smart_hrm/local/prefs.dart';
import 'package:smart_hrm/models/leave_check_setting_model.dart';
import 'package:smart_hrm/models/leave_model.dart';
import 'package:smart_hrm/res/global_widgets/custom_snacber.dart';
import 'package:smart_hrm/utils/app_urls.dart';

class LeaveController extends GetxController {
  Rx<LeaveModel> leaveModel = LeaveModel().obs;

  final selectedLeave = ''.obs;

  leaveFrom() async {
    await ApiClient.safeApiCall(
      AppUrls.leaveForm,
      RequestType.get,
      queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      onSuccess: (response) {
        if (response.statusCode == 200) {
          leaveModel.value = LeaveModel.fromJson(response.data);
        }
      },
    );
  }

  var isLoading = false.obs;

  TextEditingController phone = TextEditingController();
  TextEditingController reason = TextEditingController();

  leaveSubmit(String fromDate, String toDate, String leaveType) async {
    isLoading.value=true;
    await ApiClient.safeApiCall(
      AppUrls.leaveSubmit,
      RequestType.post,
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      data: {
        'from_date': fromDate,
        'to_date': toDate,
        'leave_type': leaveType,
        'emergency_phone': phone.text.trim(),
        'reason': reason.text.trim(),
        'token': MySharedPref.getToken("token".obs).toString()
      },
      onSuccess: (response) {
        if (response.statusCode == 200) {
          CustomSnackBar.showCustomToast(message: response.data['message']);
        }
        isLoading.value=false;
        update();
      },

    );
  }

  Rx<LeaveCheckSettingModel> checkSettingModel= LeaveCheckSettingModel().obs;
  leaveCheckSetting()async{
   await ApiClient.safeApiCall(
    AppUrls.leaveCheckSetting,
          queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},

     headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
     
    RequestType.get, 
    onSuccess: (response) {
      if (response.statusCode==200) {
        checkSettingModel.value=LeaveCheckSettingModel.fromJson(response.data);
      }
      update();
    },
    );
  }

  @override
  void onInit() {
    leaveFrom();
    leaveCheckSetting();

    super.onInit();
  }
}

