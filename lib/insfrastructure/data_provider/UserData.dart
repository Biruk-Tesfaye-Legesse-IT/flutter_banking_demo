import 'dart:convert';
import 'package:final_demo/domain/models/TransactionHistory.dart';
import 'package:final_demo/insfrastructure/data_provider/config.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final _baseUrl = baseURL;
  final http.Client httpClient;

  // UserDataProvider({required this.httpClient}) : assert(httpClient != null);

  UserDataProvider({required this.httpClient});

  // ===========================getHistory========================================

  Future<TransactionHistory> getHistory() async {
    final response = await httpClient.get(
      Uri.http('$_baseUrl', '/placeholder/route'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // Text('$TransctionHistory.fromJson(jsonDecode(response.body))');
      return TransactionHistory.fromJson(jsonDecode(response.body));
    } else {
      // Text("data");
      throw Exception('');
    }
  }

  // ============================== Create =========================================

  // Future<Client> createCourse(Client client) async {
  //   final response = await httpClient.post(
  //     Uri.http('192.168.56.1:3000', '/courses'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{

  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     return Course.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to create course.');
  //   }
  // }

  // ============================GetBalance================================

  // Future<Client> getBalance() async {
  //   final response = await httpClient.get(Uri.http('$_baseUrl', 'users/12345'));

  //   if (response.statusCode == 200) {
  //     final userInfo = jsonDecode(response.body); // // // // HIGHLY DOUBT
  //     print(userInfo.balance);
  //     return userInfo.balnce;
  //   } else {
  //     throw Exception('');
  //   }
  // }

  // =================================Delete====================================

  // Future<void> deleteCourse(String id) async {
  //   final http.Response response = await httpClient.delete(
  //     '$_baseUrl/courses/$id',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );

  //   if (response.statusCode != 204) {
  //     throw Exception('Failed to delete course.');
  //   }
  // }

  // ======================================Update=====================================

//   Future<void> updateCourse(Course course) async {
//     final http.Response response = await httpClient.put(
//       '$_baseUrl/courses/${course.id}',
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         'id': course.id,
//         'title': course.title,
//         'code': course.code,
//         'description': course.description,
//         'ects': course.ects,
//       }),
//     );

//     if (response.statusCode != 204) {
//       throw Exception('Failed to update course.');
//     }
//   }

}
