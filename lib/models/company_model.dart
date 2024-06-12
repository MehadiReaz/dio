// ignore_for_file: non_constant_identifier_names

import 'package:firebase_database/firebase_database.dart';

class Company {
  String ?base_url;
  String ?company_name;
  String ?hrm_api_key;

  Company({this.base_url, this.company_name, this.hrm_api_key});

  Company.fromJson(Map<Object, dynamic> json) {
    base_url = json['base_url'];
    company_name = json['company_name'];
    hrm_api_key = json['hrm_api_key'];
  }

  Company.fromSnapshot(DatabaseEvent snapshot) {
    base_url = (snapshot.snapshot.value as Map)['baseUrl'];
    company_name = (snapshot.snapshot.value as Map)['companyName'];
    hrm_api_key  = (snapshot.snapshot.value as Map)['hrm_api_key'];
  }

   toJson() {
     return {
       "baseUrl": base_url,
       "companyName": company_name,
       'hrm_api_key': hrm_api_key
     };
  }
}