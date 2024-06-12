import 'package:get/get.dart';
import 'package:smart_hrm/configs/api_client.dart';
import 'package:smart_hrm/local/prefs.dart';
import 'package:smart_hrm/models/profile_model.dart';
import 'package:smart_hrm/utils/app_urls.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel> profileModel = ProfileModel().obs;

  var isLoading = false.obs;

  getProfile() async {
    isLoading.value = true;
    await ApiClient.safeApiCall(
      AppUrls.getProfile,
      RequestType.post,
      queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      onSuccess: (response) {
        if (response.statusCode == 200) {
          profileModel.value = ProfileModel.fromJson(response.data);
          print(profileModel.value);
        }
        isLoading.value = false;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }
}






