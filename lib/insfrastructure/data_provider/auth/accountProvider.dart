import 'dart:async';
import 'dart:convert';
import 'package:final_demo/domain/models/models.dart';
import 'package:final_demo/insfrastructure/data_provider/config.dart';
import 'package:http/http.dart' as http;

class AccountDataProvider {
  final _baseUrl = baseURL;
  final http.Client httpClient;

  // UserDataProvider({required this.httpClient}) : assert(httpClient != null);

  AccountDataProvider({required this.httpClient});

  // ===========================getHistory========================================

  Future login(String username, String password) async {
    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

    final response = await httpClient.get(
      Uri.http('$_baseUrl', '/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': basicAuth
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['role'] == 'client') {
        print(Client.fromJson(data));
        return Client.fromJson(data);
      } else if (data['role'] == 'agent') {
        print(Agent.fromJson(data));
        return Agent.fromJson(data);
      } else if (data['role'] == 'admin') {
        print(Admin.fromJson(data));
        return Admin.fromJson(data);
      } else {
        return "No user found";
      }
      // Text('$TransctionHistory.fromJson(jsonDecode(response.body))');
      // return TransactionHistory.fromJson(jsonDecode(response.body));
    } else {
      // Text("data");
      throw Exception('Login in failed.');
    }
  }

  Future registerAgent(Agent agent) async {
    final response = await httpClient.post(
        Uri.http('$_baseUrl', '/api/admin/register_agent'),
        headers: <String, String>{
          "Content-Type": "application/json",
          'token':
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X251bWJlciI6MTAwMSwiZXhwIjoxNjMwNzYwNjMyfQ.GZun0AGl9BD1CBbL3JcRCzDCsHGyi4WU_U9IMjjL2fY"
        },
        body: json.encode(agent.toJson()));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to create agent account");
    }
  }

  Future registerClient(Client client) async {
    print(client.toJson());
    final response = await httpClient.post(
        Uri.http('$_baseUrl', '/api/agent/register_client'),
        headers: <String, String>{
          "Content-Type": "application/json",
          'token':
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X251bWJlciI6MTAwMDAwMDAwNiwiZXhwIjoxNjMwNzYzMTYwfQ.TuzD7KsMCKJTQStk5Ks0kaBWGMXH8ud7aj4z67m_o3Q"
        },
        body: json.encode(client.toJson()));

    if (response.statusCode == 201) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to create client account");
    }
  }

  Future getAccount(String accountNumber) async {
    final response = await httpClient.get(
      Uri.http('$_baseUrl', '/api/account/$accountNumber'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token':
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X251bWJlciI6MTAwMDAwMDAwOCwiZXhwIjoxNjMwNzk1MDg3fQ.Do0xuRUkKKO4_33Qf52zURSMmCvIbVJy8JNSivVSm2c"
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['role'] == 'client') {
        print(Client.fromJson(data));
        return Client.fromJson(data);
      } else if (data['role'] == 'agent') {
        print(Agent.fromJson(data));
        return Agent.fromJson(data);
      } else if (data['role'] == 'admin') {
        print(Admin.fromJson(data));
        return Admin.fromJson(data);
      } else {
        return "No user found";
      }
    } else {
      throw Exception('Failed to get account information.');
    }
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


