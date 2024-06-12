// To parse this JSON data, do
//
//     final companyListModel = companyListModelFromJson(jsonString);

import 'dart:convert';

CompanyListModel companyListModelFromJson(String str) => CompanyListModel.fromJson(json.decode(str));

String companyListModelToJson(CompanyListModel data) => json.encode(data.toJson());

class CompanyListModel {
    List<CompanyDatum>? data;

    CompanyListModel({
        this.data,
    });

    factory CompanyListModel.fromJson(Map<String, dynamic> json) => CompanyListModel(
        data: json["data"] == null ? [] : List<CompanyDatum>.from(json["data"]!.map((x) => CompanyDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CompanyDatum {
    String? id;
    String? baseUrl;
    String? companyName;
    String? hrmApiKey;

    CompanyDatum({
        this.id,
        this.baseUrl,
        this.companyName,
        this.hrmApiKey,
    });

    factory CompanyDatum.fromJson(Map<String, dynamic> json) => CompanyDatum(
        id: json["id"],
        baseUrl: json["base_url"],
        companyName: json["company_name"],
        hrmApiKey: json["hrm_api_key"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "base_url": baseUrl,
        "company_name": companyName,
        "hrm_api_key": hrmApiKey,
    };
}


