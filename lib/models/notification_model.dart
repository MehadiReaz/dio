// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    bool? status;
    List<Datum>? data;

    NotificationModel({
        this.status,
        this.data,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? key;
    String? title;
    int? count;

    Datum({
        this.key,
        this.title,
        this.count,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        key: json["key"],
        title: json["title"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "title": title,
        "count": count,
    };
}
