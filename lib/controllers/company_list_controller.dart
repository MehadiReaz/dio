import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hrm/configs/api_client.dart';
import 'package:smart_hrm/models/comapny_list_model.dart';

class CompanyListController extends GetxController {

  TextEditingController searchFieldController= TextEditingController();
  
  Rx<CompanyListModel> companyListModel= CompanyListModel().obs;

    final selectedCompany = ''.obs;


  var isLoading= false.obs;

 getCompanyList() async {
    isLoading.value = true;
    await ApiClient.safeApiCall(
      "https://hrapi.smartsoft-bd.com",
      RequestType.get,
      queryParameters: {'key': '5eKHR5SBi4Zflamk23q5akwQR72E7F3V2uBb'},
      onSuccess: (response) {
        if (response.statusCode == 200) {
          companyListModel.value = CompanyListModel.fromJson(response.data);
          print(companyListModel.value);
        }
        isLoading.value = false;
        update();
      },
    );
  }

  @override
  void onInit() {
    getCompanyList();
    super.onInit();
   
  }
}