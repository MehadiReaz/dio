import 'package:get/get.dart';
import 'package:smart_hrm/configs/api_client.dart';
import 'package:smart_hrm/local/prefs.dart';
import 'package:smart_hrm/models/notification_model.dart';
import 'package:smart_hrm/utils/app_urls.dart';

class NotificationServiceController extends GetxController {

  var isNotificationOpened = false.obs;

  void notificationToggle() {
    isNotificationOpened.value = !isNotificationOpened.value;
    update();
  }

  var isLoading = false.obs;

  Rx<NotificationModel> notificationModel = NotificationModel().obs;

  getNotification() async {
    ApiClient.safeApiCall(
      AppUrls.notifications,
      queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      RequestType.get,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          notificationModel.value = NotificationModel.fromJson(response.data);
        }
      },
    );
  }

  @override
  void onInit() {
   getNotification();
    super.onInit();
  }
}

