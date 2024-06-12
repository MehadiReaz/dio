import 'package:http/http.dart' as http;
class LeaveHistoryService {

  Future<http.Response> getLeaveHistory() async{
    http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    return response;
  }
}