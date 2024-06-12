// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:smart_hrm/local/prefs.dart';
import 'package:smart_hrm/utils/app_urls.dart';

import '../configs/api_client.dart';
import '../models/empAtten_Monthly_model.dart';

class AttendanceReportController extends GetxController {
  Rx<EmpAttenMonthly> profileModel = EmpAttenMonthly().obs;

  var isLoading = false.obs;

  getProfile() async {
    isLoading.value = true;
    await ApiClient.safeApiCall(
      AppUrls.monthlyEmployeeAttendance,
      RequestType.get,
      data: {
        'month':"2024-01"
      },
      queryParameters: {
        'token': MySharedPref.getToken("token".obs).toString()
      },
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      onSuccess: (response) {
        if (response.statusCode == 200) {
          profileModel.value = EmpAttenMonthly.fromJson(response.data);
          print(profileModel.value);
        }
        isLoading.value = false;
        update();
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }
}