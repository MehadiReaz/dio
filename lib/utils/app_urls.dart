
class AppUrls {
  static String _baseUrl =
      "";
  static String get baseUrl => _baseUrl;
  static String _hrmKey =
      "";

  static String get key => _hrmKey;

  static void setBaseUrl(String newBaseUrl, String newHrm) {
    _baseUrl = newBaseUrl;
    _hrmKey = newHrm;
  }

  //url links
  static String developedByUrl = 'https://www.smartsoftware.com.bd/';
  static String login = baseUrl+ "/api/login";
  static String getProfile = baseUrl+ "/api/hrm/profile";
  static String attendanceLog = baseUrl+ "/api/hrm/v2/employee-attendance-reports";
  static String leaveForm = baseUrl+ "/api/hrm/leave/stats";
  static String leaveSubmit = baseUrl+ "/api/hrm/leave/apply";
  static String leaveCheckSetting = baseUrl+ "/api/hrm/authority-info";
  static String frecomended = baseUrl+ "/api/hrm/pending-for-recommend-leave-applications";
  static String secondrecomended = baseUrl+ "/api/hrm/pending-for-second-recommend-leave-applications";
  static String approvalList = baseUrl+ "/api/hrm/pending-for-approval-leave-applications";
  static String frecomendedApproval = baseUrl+ "/api/hrm/recommend-leave-applications";
  static String srecomendedApproval = baseUrl+ "/api/hrm/second-recommend-leave-applications";
  static String hireApproval = baseUrl+ "/api/hrm/approve-leave-applications";
  static String cancleLeaveApproval = baseUrl+ "/api/hrm/cancel-leave-applications";
  static String notifications = baseUrl+ "/api/notifications";
    static String monthlyEmployeeAttendance = baseUrl + "/api/hrm/v2/monthly-attendance-reports";
    static String permissionCheck = baseUrl + "/api/hrm/employee-permitted-slugs";



}