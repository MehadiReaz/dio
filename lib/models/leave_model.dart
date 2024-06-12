// To parse this JSON data, do
//
//     final leaveModel = leaveModelFromJson(jsonString);

import 'dart:convert';

LeaveModel leaveModelFromJson(String str) => LeaveModel.fromJson(json.decode(str));

String leaveModelToJson(LeaveModel data) => json.encode(data.toJson());

class LeaveModel {
    List<Datum>? data;
    bool? status;

    LeaveModel({
        this.data,
        this.status,
    });

    factory LeaveModel.fromJson(Map<String, dynamic> json) => LeaveModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
    };
}

class Datum {
    int? id;
    String? name;
    Data? data;

    Datum({
        this.id,
        this.name,
        this.data,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data?.toJson(),
    };
}

class Data {
    String? ttl;
    int? approved;
    int? unapproved;
    String? balance;
    int? simultaneouslyLimit;
    int? monthlyLimit;

    Data({
        this.ttl,
        this.approved,
        this.unapproved,
        this.balance,
        this.simultaneouslyLimit,
        this.monthlyLimit,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        ttl: json["TTL"],
        approved: json["Approved"],
        unapproved: json["Unapproved"],
        balance: json["Balance"],
        simultaneouslyLimit: json["simultaneously_limit"],
        monthlyLimit: json["monthly_limit"],
    );

    Map<String, dynamic> toJson() => {
        "TTL": ttl,
        "Approved": approved,
        "Unapproved": unapproved,
        "Balance": balance,
        "simultaneously_limit": simultaneouslyLimit,
        "monthly_limit": monthlyLimit,
    };
}
