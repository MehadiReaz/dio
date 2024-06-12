// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    bool? status;
    Profile? profile;
    String? message;

    ProfileModel({
        this.status,
        this.profile,
        this.message,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "profile": profile?.toJson(),
        "message": message,
    };
}

class Profile {
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
    dynamic fatherOrHusbandName;
    dynamic motherName;
    dynamic dateOfBirth;
    String? gender;
    String? maritalStatus;
    String? religion;
    dynamic presentAddress;
    dynamic presentPhoneNumber;
    dynamic permanentAddress;
    dynamic permanentPhoneNumber;
    String? email;
    String? nationality;
    dynamic district;
    dynamic nationalId;
    dynamic passportNo;
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
    Company? company;
    Department? department;
    Department? designation;
    dynamic grade;
    List<dynamic>? educationalQualification;
    List<dynamic>? experience;
    dynamic personalInformation;
    dynamic guardian;
    dynamic referencePerson;
    List<dynamic>? bankInformations;

    Profile({
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
        this.company,
        this.department,
        this.designation,
        this.grade,
        this.educationalQualification,
        this.experience,
        this.personalInformation,
        this.guardian,
        this.referencePerson,
        this.bankInformations,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
        dateOfBirth: json["date_of_birth"],
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
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        department: json["department"] == null ? null : Department.fromJson(json["department"]),
        designation: json["designation"] == null ? null : Department.fromJson(json["designation"]),
        grade: json["grade"],
        educationalQualification: json["educational_qualification"] == null ? [] : List<dynamic>.from(json["educational_qualification"]!.map((x) => x)),
        experience: json["experience"] == null ? [] : List<dynamic>.from(json["experience"]!.map((x) => x)),
        personalInformation: json["personal_information"],
        guardian: json["guardian"],
        referencePerson: json["reference_person"],
        bankInformations: json["bank_informations"] == null ? [] : List<dynamic>.from(json["bank_informations"]!.map((x) => x)),
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
        "date_of_birth": dateOfBirth,
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
        "company": company?.toJson(),
        "department": department?.toJson(),
        "designation": designation?.toJson(),
        "grade": grade,
        "educational_qualification": educationalQualification == null ? [] : List<dynamic>.from(educationalQualification!.map((x) => x)),
        "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x)),
        "personal_information": personalInformation,
        "guardian": guardian,
        "reference_person": referencePerson,
        "bank_informations": bankInformations == null ? [] : List<dynamic>.from(bankInformations!.map((x) => x)),
    };
}

class Company {
    int? id;
    int? groupId;
    dynamic businessTypeId;
    String? name;
    String? code;
    dynamic isMotherCompany;
    String? shortName;
    String? headOffice;
    String? companyFactory;
    String? contactName;
    String? position;
    String? phoneNumber;
    String? fax;
    String? email;
    String? dayOff;
    String? startingMonth;
    String? country;
    String? topText;
    String? logo;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic latitude;
    dynamic longitude;
    dynamic circumstanceArea;
    String? businessType;
    int? status;
    Group? group;

    Company({
        this.id,
        this.groupId,
        this.businessTypeId,
        this.name,
        this.code,
        this.isMotherCompany,
        this.shortName,
        this.headOffice,
        this.companyFactory,
        this.contactName,
        this.position,
        this.phoneNumber,
        this.fax,
        this.email,
        this.dayOff,
        this.startingMonth,
        this.country,
        this.topText,
        this.logo,
        this.createdAt,
        this.updatedAt,
        this.latitude,
        this.longitude,
        this.circumstanceArea,
        this.businessType,
        this.status,
        this.group,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        groupId: json["group_id"],
        businessTypeId: json["business_type_id"],
        name: json["name"],
        code: json["code"],
        isMotherCompany: json["is_mother_company"],
        shortName: json["short_name"],
        headOffice: json["head_office"],
        companyFactory: json["factory"],
        contactName: json["contact_name"],
        position: json["position"],
        phoneNumber: json["phone_number"],
        fax: json["fax"],
        email: json["email"],
        dayOff: json["day_off"],
        startingMonth: json["starting_month"],
        country: json["country"],
        topText: json["top_text"],
        logo: json["logo"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
        circumstanceArea: json["circumstance_area"],
        businessType: json["business_type"],
        status: json["status"],
        group: json["group"] == null ? null : Group.fromJson(json["group"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "group_id": groupId,
        "business_type_id": businessTypeId,
        "name": name,
        "code": code,
        "is_mother_company": isMotherCompany,
        "short_name": shortName,
        "head_office": headOffice,
        "factory": companyFactory,
        "contact_name": contactName,
        "position": position,
        "phone_number": phoneNumber,
        "fax": fax,
        "email": email,
        "day_off": dayOff,
        "starting_month": startingMonth,
        "country": country,
        "top_text": topText,
        "logo": logo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "latitude": latitude,
        "longitude": longitude,
        "circumstance_area": circumstanceArea,
        "business_type": businessType,
        "status": status,
        "group": group?.toJson(),
    };
}

class Group {
    int? id;
    String? name;
    String? email;
    String? phone;
    String? address;
    dynamic logo;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic favIcon;
    dynamic loginBackgroundImage;

    Group({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.logo,
        this.createdAt,
        this.updatedAt,
        this.favIcon,
        this.loginBackgroundImage,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        logo: json["logo"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        favIcon: json["fav_icon"],
        loginBackgroundImage: json["login_background_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "logo": logo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "fav_icon": favIcon,
        "login_background_image": loginBackgroundImage,
    };
}

class Department {
    int? id;
    int? createdBy;
    int? updatedBy;
    int? groupId;
    int? companyId;
    String? name;
    String? code;
    DateTime? createdAt;
    DateTime? updatedAt;

    Department({
        this.id,
        this.createdBy,
        this.updatedBy,
        this.groupId,
        this.companyId,
        this.name,
        this.code,
        this.createdAt,
        this.updatedAt,
    });

    factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        groupId: json["group_id"],
        companyId: json["company_id"],
        name: json["name"],
        code: json["code"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "group_id": groupId,
        "company_id": companyId,
        "name": name,
        "code": code,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
