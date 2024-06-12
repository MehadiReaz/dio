// To parse this JSON data, do
//
//     final leaveCheckSettingModel = leaveCheckSettingModelFromJson(jsonString);

import 'dart:convert';

LeaveCheckSettingModel leaveCheckSettingModelFromJson(String str) => LeaveCheckSettingModel.fromJson(json.decode(str));

String leaveCheckSettingModelToJson(LeaveCheckSettingModel data) => json.encode(data.toJson());

class LeaveCheckSettingModel {
    Data? data;
    bool? status;

    LeaveCheckSettingModel({
        this.data,
        this.status,
    });

    factory LeaveCheckSettingModel.fromJson(Map<String, dynamic> json) => LeaveCheckSettingModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
    };
}

class Data {
    AuthorityInfo? authorityInfo;

    Data({
        this.authorityInfo,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        authorityInfo: json["authority_info"] == null ? null : AuthorityInfo.fromJson(json["authority_info"]),
    );

    Map<String, dynamic> toJson() => {
        "authority_info": authorityInfo?.toJson(),
    };
}

class AuthorityInfo {
    int? id;
    int? leaveAuthorityRecommenderId;
    int? employeeId;
    Authority? authority;

    AuthorityInfo({
        this.id,
        this.leaveAuthorityRecommenderId,
        this.employeeId,
        this.authority,
    });

    factory AuthorityInfo.fromJson(Map<String, dynamic> json) => AuthorityInfo(
        id: json["id"],
        leaveAuthorityRecommenderId: json["leave_authority_recommender_id"],
        employeeId: json["employee_id"],
        authority: json["authority"] == null ? null : Authority.fromJson(json["authority"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "leave_authority_recommender_id": leaveAuthorityRecommenderId,
        "employee_id": employeeId,
        "authority": authority?.toJson(),
    };
}

class Authority {
    int? id;
    int? recommenderCompanyId;
    int? recommenderId;
    int? secondRecommenderId;
    int? approvalCompanyId;
    int? approvalId;

    Authority({
        this.id,
        this.recommenderCompanyId,
        this.recommenderId,
        this.secondRecommenderId,
        this.approvalCompanyId,
        this.approvalId,
    });

    factory Authority.fromJson(Map<String, dynamic> json) => Authority(
        id: json["id"],
        recommenderCompanyId: json["recommender_company_id"],
        recommenderId: json["recommender_id"],
        secondRecommenderId: json["second_recommender_id"],
        approvalCompanyId: json["approval_company_id"],
        approvalId: json["approval_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "recommender_company_id": recommenderCompanyId,
        "recommender_id": recommenderId,
        "second_recommender_id": secondRecommenderId,
        "approval_company_id": approvalCompanyId,
        "approval_id": approvalId,
    };
}