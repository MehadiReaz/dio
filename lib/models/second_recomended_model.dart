// To parse this JSON data, do
//
//     final secondRecomemdedModel = secondRecomemdedModelFromJson(jsonString);

import 'dart:convert';

SecondRecomemdedModel secondRecomemdedModelFromJson(String str) => SecondRecomemdedModel.fromJson(json.decode(str));

String secondRecomemdedModelToJson(SecondRecomemdedModel data) => json.encode(data.toJson());

class SecondRecomemdedModel {
    bool? status;
    Data? data;

    SecondRecomemdedModel({
        this.status,
        this.data,
    });

    factory SecondRecomemdedModel.fromJson(Map<String, dynamic> json) => SecondRecomemdedModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    int? currentPage;
    List<Datum>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    dynamic nextPageUrl;
    String? path;
    int? perPage;
    dynamic prevPageUrl;
    int? to;
    int? total;

    Data({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    int? id;
    int? createdBy;
    int? updatedBy;
    int? companyId;
    dynamic branchId;
    int? employeeId;
    String? year;
    String? month;
    int? leaveTypeId;
    DateTime? from;
    DateTime? to;
    int? dayCount;
    String? emergencyPhone;
    String? contactDetails;
    dynamic file;
    String? reason;
    int? isRecommender;
    int? recommendedBy;
    String? recommendationNote;
    int? is2NdRecommender;
    dynamic secondRecommenderBy;
    dynamic secondRecommenderNote;
    dynamic approvedBy;
    dynamic approvalNote;
    dynamic approvalFile;
    int? cancel;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? shortLeaveAdjust;
    int? positionId;
    dynamic openingLeave;
    dynamic isLateFine;
    int? totalDays;
    Company? company;
    Employee? employee;
    LeaveType? leaveType;
    ActiveEmployment? activeEmployment;
    Recommender? recommender;
    dynamic approved;

    Datum({
        this.id,
        this.createdBy,
        this.updatedBy,
        this.companyId,
        this.branchId,
        this.employeeId,
        this.year,
        this.month,
        this.leaveTypeId,
        this.from,
        this.to,
        this.dayCount,
        this.emergencyPhone,
        this.contactDetails,
        this.file,
        this.reason,
        this.isRecommender,
        this.recommendedBy,
        this.recommendationNote,
        this.is2NdRecommender,
        this.secondRecommenderBy,
        this.secondRecommenderNote,
        this.approvedBy,
        this.approvalNote,
        this.approvalFile,
        this.cancel,
        this.createdAt,
        this.updatedAt,
        this.shortLeaveAdjust,
        this.positionId,
        this.openingLeave,
        this.isLateFine,
        this.totalDays,
        this.company,
        this.employee,
        this.leaveType,
        this.activeEmployment,
        this.recommender,
        this.approved,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        companyId: json["company_id"],
        branchId: json["branch_id"],
        employeeId: json["employee_id"],
        year: json["year"],
        month: json["month"],
        leaveTypeId: json["leave_type_id"],
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
        dayCount: json["day_count"],
        emergencyPhone: json["emergency_phone"],
        contactDetails: json["contact_details"],
        file: json["file"],
        reason: json["reason"],
        isRecommender: json["is_recommender"],
        recommendedBy: json["recommended_by"],
        recommendationNote: json["recommendation_note"],
        is2NdRecommender: json["is_2nd_recommender"],
        secondRecommenderBy: json["second_recommender_by"],
        secondRecommenderNote: json["second_recommender_note"],
        approvedBy: json["approved_by"],
        approvalNote: json["approval_note"],
        approvalFile: json["approval_file"],
        cancel: json["cancel"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        shortLeaveAdjust: json["short_leave_adjust"],
        positionId: json["position_id"],
        openingLeave: json["opening_leave"],
        isLateFine: json["is_late_fine"],
        totalDays: json["total_days"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        employee: json["employee"] == null ? null : Employee.fromJson(json["employee"]),
        leaveType: json["leave_type"] == null ? null : LeaveType.fromJson(json["leave_type"]),
        activeEmployment: json["active_employment"] == null ? null : ActiveEmployment.fromJson(json["active_employment"]),
        recommender: json["recommender"] == null ? null : Recommender.fromJson(json["recommender"]),
        approved: json["approved"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "company_id": companyId,
        "branch_id": branchId,
        "employee_id": employeeId,
        "year": year,
        "month": month,
        "leave_type_id": leaveTypeId,
        "from": "${from!.year.toString().padLeft(4, '0')}-${from!.month.toString().padLeft(2, '0')}-${from!.day.toString().padLeft(2, '0')}",
        "to": "${to!.year.toString().padLeft(4, '0')}-${to!.month.toString().padLeft(2, '0')}-${to!.day.toString().padLeft(2, '0')}",
        "day_count": dayCount,
        "emergency_phone": emergencyPhone,
        "contact_details": contactDetails,
        "file": file,
        "reason": reason,
        "is_recommender": isRecommender,
        "recommended_by": recommendedBy,
        "recommendation_note": recommendationNote,
        "is_2nd_recommender": is2NdRecommender,
        "second_recommender_by": secondRecommenderBy,
        "second_recommender_note": secondRecommenderNote,
        "approved_by": approvedBy,
        "approval_note": approvalNote,
        "approval_file": approvalFile,
        "cancel": cancel,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "short_leave_adjust": shortLeaveAdjust,
        "position_id": positionId,
        "opening_leave": openingLeave,
        "is_late_fine": isLateFine,
        "total_days": totalDays,
        "company": company?.toJson(),
        "employee": employee?.toJson(),
        "leave_type": leaveType?.toJson(),
        "active_employment": activeEmployment?.toJson(),
        "recommender": recommender?.toJson(),
        "approved": approved,
    };
}

class ActiveEmployment {
    int? id;
    int? designationId;
    int? departmentId;
    Department? designation;
    Department? department;

    ActiveEmployment({
        this.id,
        this.designationId,
        this.departmentId,
        this.designation,
        this.department,
    });

    factory ActiveEmployment.fromJson(Map<String, dynamic> json) => ActiveEmployment(
        id: json["id"],
        designationId: json["designation_id"],
        departmentId: json["department_id"],
        designation: json["designation"] == null ? null : Department.fromJson(json["designation"]),
        department: json["department"] == null ? null : Department.fromJson(json["department"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "designation_id": designationId,
        "department_id": departmentId,
        "designation": designation?.toJson(),
        "department": department?.toJson(),
    };
}

class Department {
    int? id;
    String? name;

    Department({
        this.id,
        this.name,
    });

    factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Company {
    int? id;
    String? name;
    String? shortName;

    Company({
        this.id,
        this.name,
        this.shortName,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
    };
}

class Employee {
    int? id;
    int? createdBy;
    int? updatedBy;
    int? companyId;
    int? departmentId;
    int? designationId;
    dynamic gradeId;
    dynamic lineId;
    dynamic employeeGroupId;
    dynamic shiftId;
    DateTime? joiningDate;
    dynamic previousIdNumber;
    String? idNumber;
    String? givenIdNumber;
    String? employeeFullId;
    String? name;
    dynamic banglaName;
    String? image;
    String? fatherOrHusbandName;
    String? motherName;
    DateTime? dateOfBirth;
    String? gender;
    String? maritalStatus;
    String? religion;
    String? presentAddress;
    String? presentPhoneNumber;
    String? permanentAddress;
    String? permanentPhoneNumber;
    String? email;
    String? nationality;
    dynamic district;
    dynamic nationalId;
    dynamic passportNo;
    dynamic passportIssueDate;
    dynamic passportExpiryDate;
    String? employeeType;
    dynamic volunteerType;
    dynamic pBonusType;
    dynamic deviceId;
    dynamic fingerPrintId;
    dynamic mfsType;
    dynamic mfs;
    dynamic cardNo;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? overTimeStatus;
    dynamic signature;
    dynamic spouseName;
    dynamic spousePhoneNumber;
    String? employmentStatus;
    dynamic cv;
    int? hierarchy;
    dynamic employeeFacility;
    int? designationCode;
    dynamic branchId;
    dynamic zoneId;
    dynamic payerCategoryId;
    String? payerZone;
    int? probationPeriod;
    int? trackPermission;

    Employee({
        this.id,
        this.createdBy,
        this.updatedBy,
        this.companyId,
        this.departmentId,
        this.designationId,
        this.gradeId,
        this.lineId,
        this.employeeGroupId,
        this.shiftId,
        this.joiningDate,
        this.previousIdNumber,
        this.idNumber,
        this.givenIdNumber,
        this.employeeFullId,
        this.name,
        this.banglaName,
        this.image,
        this.fatherOrHusbandName,
        this.motherName,
        this.dateOfBirth,
        this.gender,
        this.maritalStatus,
        this.religion,
        this.presentAddress,
        this.presentPhoneNumber,
        this.permanentAddress,
        this.permanentPhoneNumber,
        this.email,
        this.nationality,
        this.district,
        this.nationalId,
        this.passportNo,
        this.passportIssueDate,
        this.passportExpiryDate,
        this.employeeType,
        this.volunteerType,
        this.pBonusType,
        this.deviceId,
        this.fingerPrintId,
        this.mfsType,
        this.mfs,
        this.cardNo,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.overTimeStatus,
        this.signature,
        this.spouseName,
        this.spousePhoneNumber,
        this.employmentStatus,
        this.cv,
        this.hierarchy,
        this.employeeFacility,
        this.designationCode,
        this.branchId,
        this.zoneId,
        this.payerCategoryId,
        this.payerZone,
        this.probationPeriod,
        this.trackPermission,
    });

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        companyId: json["company_id"],
        departmentId: json["department_id"],
        designationId: json["designation_id"],
        gradeId: json["grade_id"],
        lineId: json["line_id"],
        employeeGroupId: json["employee_group_id"],
        shiftId: json["shift_id"],
        joiningDate: json["joining_date"] == null ? null : DateTime.parse(json["joining_date"]),
        previousIdNumber: json["previous_id_number"],
        idNumber: json["id_number"],
        givenIdNumber: json["given_id_number"],
        employeeFullId: json["employee_full_id"],
        name: json["name"],
        banglaName: json["bangla_name"],
        image: json["image"],
        fatherOrHusbandName: json["father_or_husband_name"],
        motherName: json["mother_name"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        maritalStatus: json["marital_status"],
        religion: json["religion"],
        presentAddress: json["present_address"],
        presentPhoneNumber: json["present_phone_number"],
        permanentAddress: json["permanent_address"],
        permanentPhoneNumber: json["permanent_phone_number"],
        email: json["email"],
        nationality: json["nationality"],
        district: json["district"],
        nationalId: json["national_id"],
        passportNo: json["passport_no"],
        passportIssueDate: json["passport_issue_date"],
        passportExpiryDate: json["passport_expiry_date"],
        employeeType: json["employee_type"],
        volunteerType: json["volunteer_type"],
        pBonusType: json["p_bonus_type"],
        deviceId: json["device_id"],
        fingerPrintId: json["finger_print_id"],
        mfsType: json["mfs_type"],
        mfs: json["mfs"],
        cardNo: json["card_no"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        overTimeStatus: json["over_time_status"],
        signature: json["signature"],
        spouseName: json["spouse_name"],
        spousePhoneNumber: json["spouse_phone_number"],
        employmentStatus: json["employment_status"],
        cv: json["cv"],
        hierarchy: json["hierarchy"],
        employeeFacility: json["employee_facility"],
        designationCode: json["designation_code"],
        branchId: json["branch_id"],
        zoneId: json["zone_id"],
        payerCategoryId: json["payer_category_id"],
        payerZone: json["payer_zone"],
        probationPeriod: json["probation_period"],
        trackPermission: json["track_permission"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "company_id": companyId,
        "department_id": departmentId,
        "designation_id": designationId,
        "grade_id": gradeId,
        "line_id": lineId,
        "employee_group_id": employeeGroupId,
        "shift_id": shiftId,
        "joining_date": "${joiningDate!.year.toString().padLeft(4, '0')}-${joiningDate!.month.toString().padLeft(2, '0')}-${joiningDate!.day.toString().padLeft(2, '0')}",
        "previous_id_number": previousIdNumber,
        "id_number": idNumber,
        "given_id_number": givenIdNumber,
        "employee_full_id": employeeFullId,
        "name": name,
        "bangla_name": banglaName,
        "image": image,
        "father_or_husband_name": fatherOrHusbandName,
        "mother_name": motherName,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "marital_status": maritalStatus,
        "religion": religion,
        "present_address": presentAddress,
        "present_phone_number": presentPhoneNumber,
        "permanent_address": permanentAddress,
        "permanent_phone_number": permanentPhoneNumber,
        "email": email,
        "nationality": nationality,
        "district": district,
        "national_id": nationalId,
        "passport_no": passportNo,
        "passport_issue_date": passportIssueDate,
        "passport_expiry_date": passportExpiryDate,
        "employee_type": employeeType,
        "volunteer_type": volunteerType,
        "p_bonus_type": pBonusType,
        "device_id": deviceId,
        "finger_print_id": fingerPrintId,
        "mfs_type": mfsType,
        "mfs": mfs,
        "card_no": cardNo,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "over_time_status": overTimeStatus,
        "signature": signature,
        "spouse_name": spouseName,
        "spouse_phone_number": spousePhoneNumber,
        "employment_status": employmentStatus,
        "cv": cv,
        "hierarchy": hierarchy,
        "employee_facility": employeeFacility,
        "designation_code": designationCode,
        "branch_id": branchId,
        "zone_id": zoneId,
        "payer_category_id": payerCategoryId,
        "payer_zone": payerZone,
        "probation_period": probationPeriod,
        "track_permission": trackPermission,
    };
}

class LeaveType {
    int? id;
    String? name;
    String? paymentMode;
    dynamic bgColor;
    int? specialForBd;
    List<dynamic>? details;

    LeaveType({
        this.id,
        this.name,
        this.paymentMode,
        this.bgColor,
        this.specialForBd,
        this.details,
    });

    factory LeaveType.fromJson(Map<String, dynamic> json) => LeaveType(
        id: json["id"],
        name: json["name"],
        paymentMode: json["payment_mode"],
        bgColor: json["bg_color"],
        specialForBd: json["special_for_bd"],
        details: json["details"] == null ? [] : List<dynamic>.from(json["details"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "payment_mode": paymentMode,
        "bg_color": bgColor,
        "special_for_bd": specialForBd,
        "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x)),
    };
}

class Recommender {
    int? id;
    int? companyId;
    dynamic branchId;
    String? name;
    String? email;
    dynamic emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? employeeId;
    int? status;
    String? apiToken;
    String? employeeFullId;
    dynamic phoneNumber;
    dynamic deviceToken;

    Recommender({
        this.id,
        this.companyId,
        this.branchId,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.employeeId,
        this.status,
        this.apiToken,
        this.employeeFullId,
        this.phoneNumber,
        this.deviceToken,
    });

    factory Recommender.fromJson(Map<String, dynamic> json) => Recommender(
        id: json["id"],
        companyId: json["company_id"],
        branchId: json["branch_id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        employeeId: json["employee_id"],
        status: json["status"],
        apiToken: json["api_token"],
        employeeFullId: json["employee_full_id"],
        phoneNumber: json["phone_number"],
        deviceToken: json["device_token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "branch_id": branchId,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "employee_id": employeeId,
        "status": status,
        "api_token": apiToken,
        "employee_full_id": employeeFullId,
        "phone_number": phoneNumber,
        "device_token": deviceToken,
    };
}
