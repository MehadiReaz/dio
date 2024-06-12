// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    bool? status;
    String? token;
    String? message;
    dynamic deviceToken;
    int? companyId;
    int? userId;
    int? employeeId;
    String? employeeFullId;
    bool? isActive;

    LoginModel({
        this.status,
        this.token,
        this.message,
        this.deviceToken,
        this.companyId,
        this.userId,
        this.employeeId,
        this.employeeFullId,
        this.isActive,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        token: json["token"],
        message: json["message"],
        deviceToken: json["device_token"],
        companyId: json["company_id"],
        userId: json["user_id"],
        employeeId: json["employee_id"],
        employeeFullId: json["employee_full_id"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "message": message,
        "device_token": deviceToken,
        "company_id": companyId,
        "user_id": userId,
        "employee_id": employeeId,
        "employee_full_id": employeeFullId,
        "is_active": isActive,
    };
}
