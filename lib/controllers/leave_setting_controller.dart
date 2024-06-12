import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/configs/api_client.dart';
import 'package:smart_hrm/local/prefs.dart';
import 'package:smart_hrm/models/approval_model.dart';
import 'package:smart_hrm/models/first_recomemded_model.dart';
import 'package:smart_hrm/models/second_recomended_model.dart';
import 'package:smart_hrm/res/global_widgets/custom_snacber.dart';
import 'package:smart_hrm/utils/app_urls.dart';

class LeaveSettingController extends GetxController {
  var isLoading = false.obs;
  var issecondLoading = false.obs;
  var isapprovedLoading = false.obs;

  Rx<FirstRecomemdedModel> fRModel = FirstRecomemdedModel().obs;

  Rx<SecondRecomemdedModel> secondRModel = SecondRecomemdedModel().obs;

  Rx<ApprovalModel> approvalModel= ApprovalModel().obs;

  Rx<TextEditingController> frecomededNoteController =
      TextEditingController().obs;
  Rx<TextEditingController> srecomededNoteController =
      TextEditingController().obs;
  Rx<TextEditingController> approlvedNoteController =
      TextEditingController().obs;
// first recomended list 
  pendingfirstrecomeded() async {
    isLoading.value = true;
    await ApiClient.safeApiCall(
      AppUrls.frecomended,
      RequestType.get,
      queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      onSuccess: (response) {
        if (response.statusCode == 200) {
          fRModel.value = FirstRecomemdedModel.fromJson(response.data);
        }
        isLoading.value = false;
        update();
      },
    );
  }

  pendingseecondRecomemded() async {
    issecondLoading.value = true;
    await ApiClient.safeApiCall(
      AppUrls.secondrecomended,
      RequestType.get,
      queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      onSuccess: (response) {
        if (response.statusCode == 200) {
          secondRModel.value = SecondRecomemdedModel.fromJson(response.data);
        }
        issecondLoading.value = false;
        update();
      },
    );
  }

  approvalList() async {
    isapprovedLoading.value = true;
    await ApiClient.safeApiCall(
      AppUrls.approvalList,
      RequestType.get,
      queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      onSuccess: (response) {
        if (response.statusCode == 200) {
          approvalModel.value = ApprovalModel.fromJson(response.data);
        }
        isapprovedLoading.value = false;
        update();
      },
    );
  }



  // first recomemded approval
  firstRecomemdedApproval(int id) async {
    await ApiClient.safeApiCall(
      AppUrls.frecomendedApproval,
      RequestType.post,
      queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      data: {
        'id': id,
        'note': frecomededNoteController.value.text.trim(),
      },
      onSuccess: (response) {
        if (response.statusCode == 200) {
          CustomSnackBar.showCustomToast(message: response.data['message']);
        }
        update();
      },
    );
  }


  // first recomemded approval
  secondRecomemdedApproval(int id) async {
    await ApiClient.safeApiCall(
      AppUrls.srecomendedApproval,
      RequestType.post,
      queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      data: {
        'id': id,
        'note': srecomededNoteController.value.text.trim(),
      },
      onSuccess: (response) {
        if (response.statusCode == 200) {
          CustomSnackBar.showCustomToast(message: response.data['message']);
        }
        update();
      },
    );
  }

  hireAuthorityApproval(int id) async {
    await ApiClient.safeApiCall(
      AppUrls.hireApproval,
      RequestType.post,
      queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      data: {
        'id': id,
        'note': approlvedNoteController.value.text.trim(),
      },
      onSuccess: (response) {
        if (response.statusCode == 200) {
          CustomSnackBar.showCustomToast(message: response.data['message']);
        }
        update();
      },
    );
  }

  cancleRecomemdedApproval(int id) async {
    await ApiClient.safeApiCall(
      AppUrls.cancleLeaveApproval,
      RequestType.post,
      queryParameters: {'token': MySharedPref.getToken("token".obs).toString()},
      headers: {"hrm-api-key": "5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb"},
      data: {
        'id': id,
      },
      onSuccess: (response) {
        if (response.statusCode == 200) {
          CustomSnackBar.showCustomToast(message: response.data['message']);
        }
        update();
      },
    );
  }






  @override
  void onInit() {
    pendingfirstrecomeded();
    pendingseecondRecomemded();
    super.onInit();
  }
}
