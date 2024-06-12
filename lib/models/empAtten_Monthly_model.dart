// ignore_for_file: unnecessary_getters_setters

class EmpAttenMonthly {
  int? _status;
  String? _message;
  Data? _data;

  EmpAttenMonthly({int? status, String? message, Data? data}) {
    if (status != null) {
      _status = status;
    }
    if (message != null) {
      _message = message;
    }
    if (data != null) {
      _data = data;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  EmpAttenMonthly.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  EmployeeInfo? _employeeInfo;
  List<Attendances>? _attendances;
  AttendanceSummary? _attendanceSummary;

  Data(
      {EmployeeInfo? employeeInfo,
        List<Attendances>? attendances,
        AttendanceSummary? attendanceSummary}) {
    if (employeeInfo != null) {
      this._employeeInfo = employeeInfo;
    }
    if (attendances != null) {
      this._attendances = attendances;
    }
    if (attendanceSummary != null) {
      this._attendanceSummary = attendanceSummary;
    }
  }

  EmployeeInfo? get employeeInfo => _employeeInfo;
  set employeeInfo(EmployeeInfo? employeeInfo) => _employeeInfo = employeeInfo;
  List<Attendances>? get attendances => _attendances;
  set attendances(List<Attendances>? attendances) => _attendances = attendances;
  AttendanceSummary? get attendanceSummary => _attendanceSummary;
  set attendanceSummary(AttendanceSummary? attendanceSummary) =>
      _attendanceSummary = attendanceSummary;

  Data.fromJson(Map<String, dynamic> json) {
    _employeeInfo = json['employee_info'] != null
        ? new EmployeeInfo.fromJson(json['employee_info'])
        : null;
    if (json['attendances'] != null) {
      _attendances = <Attendances>[];
      json['attendances'].forEach((v) {
        _attendances!.add(new Attendances.fromJson(v));
      });
    }
    _attendanceSummary = json['attendance_summary'] != null
        ? new AttendanceSummary.fromJson(json['attendance_summary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._employeeInfo != null) {
      data['employee_info'] = this._employeeInfo!.toJson();
    }
    if (this._attendances != null) {
      data['attendances'] = this._attendances!.map((v) => v.toJson()).toList();
    }
    if (this._attendanceSummary != null) {
      data['attendance_summary'] = this._attendanceSummary!.toJson();
    }
    return data;
  }
}

class EmployeeInfo {
  int? _id;
  String? _employeeFullId;
  String? _name;
  String? _company;
  String? _department;
  String? _designation;
  String? _joiningDate;

  EmployeeInfo(
      {int? id,
        String? employeeFullId,
        String? name,
        String? company,
        String? department,
        String? designation,
        String? joiningDate}) {
    if (id != null) {
      this._id = id;
    }
    if (employeeFullId != null) {
      this._employeeFullId = employeeFullId;
    }
    if (name != null) {
      this._name = name;
    }
    if (company != null) {
      this._company = company;
    }
    if (department != null) {
      this._department = department;
    }
    if (designation != null) {
      this._designation = designation;
    }
    if (joiningDate != null) {
      this._joiningDate = joiningDate;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get employeeFullId => _employeeFullId;
  set employeeFullId(String? employeeFullId) =>
      _employeeFullId = employeeFullId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get company => _company;
  set company(String? company) => _company = company;
  String? get department => _department;
  set department(String? department) => _department = department;
  String? get designation => _designation;
  set designation(String? designation) => _designation = designation;
  String? get joiningDate => _joiningDate;
  set joiningDate(String? joiningDate) => _joiningDate = joiningDate;

  EmployeeInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _employeeFullId = json['employee_full_id'];
    _name = json['name'];
    _company = json['company'];
    _department = json['department'];
    _designation = json['designation'];
    _joiningDate = json['joining_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['employee_full_id'] = this._employeeFullId;
    data['name'] = this._name;
    data['company'] = this._company;
    data['department'] = this._department;
    data['designation'] = this._designation;
    data['joining_date'] = this._joiningDate;
    return data;
  }
}

class Attendances {
  String? _date;
  String? _day;
  String? _inTime;
  String? _outTime;
  String? _shiftName;
  String? _workedHour;
  String? _overTime;
  String? _lateTime;
  Null _earlyTime;
  String? _locationIn;
  Null _locationOut;
  String? _remark;

  Attendances(
      {String? date,
        String? day,
        String? inTime,
        String? outTime,
        String? shiftName,
        String? workedHour,
        String? overTime,
        String? lateTime,
        Null earlyTime,
        String? locationIn,
        Null locationOut,
        String? remark}) {
    if (date != null) {
      this._date = date;
    }
    if (day != null) {
      this._day = day;
    }
    if (inTime != null) {
      this._inTime = inTime;
    }
    if (outTime != null) {
      this._outTime = outTime;
    }
    if (shiftName != null) {
      this._shiftName = shiftName;
    }
    if (workedHour != null) {
      this._workedHour = workedHour;
    }
    if (overTime != null) {
      this._overTime = overTime;
    }
    if (lateTime != null) {
      this._lateTime = lateTime;
    }
    if (earlyTime != null) {
      this._earlyTime = earlyTime;
    }
    if (locationIn != null) {
      this._locationIn = locationIn;
    }
    if (locationOut != null) {
      this._locationOut = locationOut;
    }
    if (remark != null) {
      this._remark = remark;
    }
  }

  String? get date => _date;
  set date(String? date) => _date = date;
  String? get day => _day;
  set day(String? day) => _day = day;
  String? get inTime => _inTime;
  set inTime(String? inTime) => _inTime = inTime;
  String? get outTime => _outTime;
  set outTime(String? outTime) => _outTime = outTime;
  String? get shiftName => _shiftName;
  set shiftName(String? shiftName) => _shiftName = shiftName;
  String? get workedHour => _workedHour;
  set workedHour(String? workedHour) => _workedHour = workedHour;
  String? get overTime => _overTime;
  set overTime(String? overTime) => _overTime = overTime;
  String? get lateTime => _lateTime;
  set lateTime(String? lateTime) => _lateTime = lateTime;
  Null? get earlyTime => _earlyTime;
  set earlyTime(Null? earlyTime) => _earlyTime = earlyTime;
  String? get locationIn => _locationIn;
  set locationIn(String? locationIn) => _locationIn = locationIn;
  Null? get locationOut => _locationOut;
  set locationOut(Null? locationOut) => _locationOut = locationOut;
  String? get remark => _remark;
  set remark(String? remark) => _remark = remark;

  Attendances.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    _day = json['day'];
    _inTime = json['in_time'];
    _outTime = json['out_time'];
    _shiftName = json['shift_name'];
    _workedHour = json['worked_hour'];
    _overTime = json['over_time'];
    _lateTime = json['late_time'];
    _earlyTime = json['early_time'];
    _locationIn = json['location_in'];
    _locationOut = json['location_out'];
    _remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this._date;
    data['day'] = this._day;
    data['in_time'] = this._inTime;
    data['out_time'] = this._outTime;
    data['shift_name'] = this._shiftName;
    data['worked_hour'] = this._workedHour;
    data['over_time'] = this._overTime;
    data['late_time'] = this._lateTime;
    data['early_time'] = this._earlyTime;
    data['location_in'] = this._locationIn;
    data['location_out'] = this._locationOut;
    data['remark'] = this._remark;
    return data;
  }
}

class AttendanceSummary {
  int? _totalAttendDays;
  int? _totalHolidays;
  int? _totalAbsentDays;
  int? _totalRemainingDays;
  int? _totalLeaveDays;
  int? _totalMonthDays;
  int? _totalPresentInHolidays;
  int? _totalWithpay;
  int? _totalWithoutpay;
  int? _totalWorkingDays;
  int? _totalPayDays;
  int? _totalLateDays;
  String? _totalWorkHour;
  int? _workHour;
  String? _totalLateHour;
  String? _totalEarlyHour;
  int? _totalEarlyDays;
  String? _totalOtHour;
  String? _totalExtraOtHour;
  int? _totalNightDuty;
  String? _totalNotCheckedOut;

  AttendanceSummary(
      {int? totalAttendDays,
        int? totalHolidays,
        int? totalAbsentDays,
        int? totalRemainingDays,
        int? totalLeaveDays,
        int? totalMonthDays,
        int? totalPresentInHolidays,
        int? totalWithpay,
        int? totalWithoutpay,
        int? totalWorkingDays,
        int? totalPayDays,
        int? totalLateDays,
        String? totalWorkHour,
        int? workHour,
        String? totalLateHour,
        String? totalEarlyHour,
        int? totalEarlyDays,
        String? totalOtHour,
        String? totalExtraOtHour,
        int? totalNightDuty,
        String? totalNotCheckedOut}) {
    if (totalAttendDays != null) {
      this._totalAttendDays = totalAttendDays;
    }
    if (totalHolidays != null) {
      this._totalHolidays = totalHolidays;
    }
    if (totalAbsentDays != null) {
      this._totalAbsentDays = totalAbsentDays;
    }
    if (totalRemainingDays != null) {
      this._totalRemainingDays = totalRemainingDays;
    }
    if (totalLeaveDays != null) {
      this._totalLeaveDays = totalLeaveDays;
    }
    if (totalMonthDays != null) {
      this._totalMonthDays = totalMonthDays;
    }
    if (totalPresentInHolidays != null) {
      this._totalPresentInHolidays = totalPresentInHolidays;
    }
    if (totalWithpay != null) {
      this._totalWithpay = totalWithpay;
    }
    if (totalWithoutpay != null) {
      this._totalWithoutpay = totalWithoutpay;
    }
    if (totalWorkingDays != null) {
      this._totalWorkingDays = totalWorkingDays;
    }
    if (totalPayDays != null) {
      this._totalPayDays = totalPayDays;
    }
    if (totalLateDays != null) {
      this._totalLateDays = totalLateDays;
    }
    if (totalWorkHour != null) {
      this._totalWorkHour = totalWorkHour;
    }
    if (workHour != null) {
      this._workHour = workHour;
    }
    if (totalLateHour != null) {
      this._totalLateHour = totalLateHour;
    }
    if (totalEarlyHour != null) {
      this._totalEarlyHour = totalEarlyHour;
    }
    if (totalEarlyDays != null) {
      this._totalEarlyDays = totalEarlyDays;
    }
    if (totalOtHour != null) {
      this._totalOtHour = totalOtHour;
    }
    if (totalExtraOtHour != null) {
      this._totalExtraOtHour = totalExtraOtHour;
    }
    if (totalNightDuty != null) {
      this._totalNightDuty = totalNightDuty;
    }
    if (totalNotCheckedOut != null) {
      this._totalNotCheckedOut = totalNotCheckedOut;
    }
  }

  int? get totalAttendDays => _totalAttendDays;
  set totalAttendDays(int? totalAttendDays) =>
      _totalAttendDays = totalAttendDays;
  int? get totalHolidays => _totalHolidays;
  set totalHolidays(int? totalHolidays) => _totalHolidays = totalHolidays;
  int? get totalAbsentDays => _totalAbsentDays;
  set totalAbsentDays(int? totalAbsentDays) =>
      _totalAbsentDays = totalAbsentDays;
  int? get totalRemainingDays => _totalRemainingDays;
  set totalRemainingDays(int? totalRemainingDays) =>
      _totalRemainingDays = totalRemainingDays;
  int? get totalLeaveDays => _totalLeaveDays;
  set totalLeaveDays(int? totalLeaveDays) => _totalLeaveDays = totalLeaveDays;
  int? get totalMonthDays => _totalMonthDays;
  set totalMonthDays(int? totalMonthDays) => _totalMonthDays = totalMonthDays;
  int? get totalPresentInHolidays => _totalPresentInHolidays;
  set totalPresentInHolidays(int? totalPresentInHolidays) =>
      _totalPresentInHolidays = totalPresentInHolidays;
  int? get totalWithpay => _totalWithpay;
  set totalWithpay(int? totalWithpay) => _totalWithpay = totalWithpay;
  int? get totalWithoutpay => _totalWithoutpay;
  set totalWithoutpay(int? totalWithoutpay) =>
      _totalWithoutpay = totalWithoutpay;
  int? get totalWorkingDays => _totalWorkingDays;
  set totalWorkingDays(int? totalWorkingDays) =>
      _totalWorkingDays = totalWorkingDays;
  int? get totalPayDays => _totalPayDays;
  set totalPayDays(int? totalPayDays) => _totalPayDays = totalPayDays;
  int? get totalLateDays => _totalLateDays;
  set totalLateDays(int? totalLateDays) => _totalLateDays = totalLateDays;
  String? get totalWorkHour => _totalWorkHour;
  set totalWorkHour(String? totalWorkHour) => _totalWorkHour = totalWorkHour;
  int? get workHour => _workHour;
  set workHour(int? workHour) => _workHour = workHour;
  String? get totalLateHour => _totalLateHour;
  set totalLateHour(String? totalLateHour) => _totalLateHour = totalLateHour;
  String? get totalEarlyHour => _totalEarlyHour;
  set totalEarlyHour(String? totalEarlyHour) =>
      _totalEarlyHour = totalEarlyHour;
  int? get totalEarlyDays => _totalEarlyDays;
  set totalEarlyDays(int? totalEarlyDays) => _totalEarlyDays = totalEarlyDays;
  String? get totalOtHour => _totalOtHour;
  set totalOtHour(String? totalOtHour) => _totalOtHour = totalOtHour;
  String? get totalExtraOtHour => _totalExtraOtHour;
  set totalExtraOtHour(String? totalExtraOtHour) =>
      _totalExtraOtHour = totalExtraOtHour;
  int? get totalNightDuty => _totalNightDuty;
  set totalNightDuty(int? totalNightDuty) => _totalNightDuty = totalNightDuty;
  String? get totalNotCheckedOut => _totalNotCheckedOut;
  set totalNotCheckedOut(String? totalNotCheckedOut) =>
      _totalNotCheckedOut = totalNotCheckedOut;

  AttendanceSummary.fromJson(Map<String, dynamic> json) {
    _totalAttendDays = json['total_attend_days'];
    _totalHolidays = json['total_holidays'];
    _totalAbsentDays = json['total_absent_days'];
    _totalRemainingDays = json['total_remaining_days'];
    _totalLeaveDays = json['total_leave_days'];
    _totalMonthDays = json['total_month_days'];
    _totalPresentInHolidays = json['total_present_in_holidays'];
    _totalWithpay = json['total_withpay'];
    _totalWithoutpay = json['total_withoutpay'];
    _totalWorkingDays = json['total_working_days'];
    _totalPayDays = json['total_pay_days'];
    _totalLateDays = json['total_late_days'];
    _totalWorkHour = json['total_work_hour'];
    _workHour = json['work_hour'];
    _totalLateHour = json['total_late_hour'];
    _totalEarlyHour = json['total_early_hour'];
    _totalEarlyDays = json['total_early_days'];
    _totalOtHour = json['total_ot_hour'];
    _totalExtraOtHour = json['total_extra_ot_hour'];
    _totalNightDuty = json['total_night_duty'];
    _totalNotCheckedOut = json['total_not_checked_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_attend_days'] = this._totalAttendDays;
    data['total_holidays'] = this._totalHolidays;
    data['total_absent_days'] = this._totalAbsentDays;
    data['total_remaining_days'] = this._totalRemainingDays;
    data['total_leave_days'] = this._totalLeaveDays;
    data['total_month_days'] = this._totalMonthDays;
    data['total_present_in_holidays'] = this._totalPresentInHolidays;
    data['total_withpay'] = this._totalWithpay;
    data['total_withoutpay'] = this._totalWithoutpay;
    data['total_working_days'] = this._totalWorkingDays;
    data['total_pay_days'] = this._totalPayDays;
    data['total_late_days'] = this._totalLateDays;
    data['total_work_hour'] = this._totalWorkHour;
    data['work_hour'] = this._workHour;
    data['total_late_hour'] = this._totalLateHour;
    data['total_early_hour'] = this._totalEarlyHour;
    data['total_early_days'] = this._totalEarlyDays;
    data['total_ot_hour'] = this._totalOtHour;
    data['total_extra_ot_hour'] = this._totalExtraOtHour;
    data['total_night_duty'] = this._totalNightDuty;
    data['total_not_checked_out'] = this._totalNotCheckedOut;
    return data;
  }
}