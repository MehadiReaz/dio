import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/configs/api_client.dart';
import 'package:smart_hrm/local/prefs.dart';
import 'package:smart_hrm/models/login_model.dart';
import 'package:smart_hrm/res/global_widgets/custom_snacber.dart';
import 'package:smart_hrm/utils/app_urls.dart';
import 'package:smart_hrm/utils/routes/app_routes.dart';

class LoginController extends GetxController {
  Rx<LoginModel> loginModel = LoginModel().obs;

  var token = "".obs;

  var isLoading = false.obs;

  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;

  login(String baseUrl) async {
    isLoading.value = true;
    await ApiClient.safeApiCall(
      AppUrls.login,
      RequestType.post,
      data: {
        "email": email.value.text.trim(),
        "password": password.value.text.trim(),
      },
      onSuccess: (response) {
        if (response.statusCode == 200) {
          loginModel.value = LoginModel.fromJson(response.data);

          print(loginModel.value);

          token.value = response.data["token"];
          print("tokenn----- $token");
          MySharedPref.saveBoolean(key: 'is-user', value: true);
          MySharedPref.saveString(key: 'token', value: response.data["token"]);
          print("tokenn----- $token");

          CustomSnackBar.showCustomToast(message: "Login successfully");
          Get.toNamed(AppRoute.homescreen);
        }
        isLoading.value = false;
        update();
      },
    );
  }
}
