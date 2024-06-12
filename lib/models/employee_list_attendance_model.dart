// To parse this JSON data, do
//
//     final employeeAttendance = employeeAttendanceFromJson(jsonString);

import 'dart:convert';

EmployeeAttendance employeeAttendanceFromJson(String str) => EmployeeAttendance.fromJson(json.decode(str));

String employeeAttendanceToJson(EmployeeAttendance data) => json.encode(data.toJson());

class EmployeeAttendance {
  bool? status;
  List<Datum>? data;

  EmployeeAttendance({
    this.status,
    this.data,
  });

  factory EmployeeAttendance.fromJson(Map<String, dynamic> json) => EmployeeAttendance(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? name;
  String? employeeFullId;
  dynamic fingerPrintId;
  dynamic cardNo;

  Datum({
    this.id,
    this.name,
    this.employeeFullId,
    this.fingerPrintId,
    this.cardNo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    employeeFullId: json["employee_full_id"],
    fingerPrintId: json["finger_print_id"],
    cardNo: json["card_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "employee_full_id": employeeFullId,
    "finger_print_id": fingerPrintId,
    "card_no": cardNo,
  };
}