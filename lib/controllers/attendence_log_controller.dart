import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/configs/api_client.dart';
import 'package:smart_hrm/local/prefs.dart';
import 'package:smart_hrm/res/global_widgets/custom_snacber.dart';
import 'package:smart_hrm/utils/app_urls.dart';

class AttendanceLogController extends GetxController {
  var isLoading = false.obs;



  var permissions = [].obs;

  @override
  void onInit() {
    super.onInit();
    checkPermissions();
  }

  void checkPermissions() async {
    isLoading.value = true;

    try {
      final response = await Dio().get(
        AppUrls.permissionCheck,
        options: Options(headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"}),
        data: {
          "token": MySharedPref.getToken("token".obs).toString(),
        },
      );
      if (response.statusCode == 200) {
        permissions.value = response.data['data']['employee_access'];
      } else {
        CustomSnackBar.showCustomToast(message: 'Failed to load permissions');
      }
    } catch (e) {
      CustomSnackBar.showCustomToast(message: 'Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  bool hasPermission(String permission) {
    return permissions.contains(permission);
  }


  attendenceLog( String attendMode, String location, double lat, double lng) async {
    isLoading.value = true;
    await ApiClient.safeApiCall(
      AppUrls.attendanceLog,
      RequestType.post,
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      data: {
        "atnd_mode": attendMode,
        "location": location,
        "latitude": lat,
        "longitude": lng,
        "token": MySharedPref.getToken("token".obs).toString()
      },
      onSuccess: (response) {
        if (response.statusCode == 200) {
          CustomSnackBar.showCustomToast(message: 'Check $attendMode successfully');
        }
        isLoading.value = false;
        update();
      },
    );
  }
}
