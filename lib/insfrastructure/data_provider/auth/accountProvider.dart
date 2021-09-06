import 'dart:async';
import 'dart:convert';
import 'package:final_demo/domain/models/models.dart';
import 'package:final_demo/insfrastructure/data_provider/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_demo/insfrastructure/data_provider/getToken.dart';

class AccountDataProvider {
  final _baseUrl = baseURL;
  final http.Client httpClient;

  AccountDataProvider({required this.httpClient});

  // shared preference methods \\
// ###################################################### \\
  Future<void> setToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user');

    if (user == null) {
      return null;
    } else if (jsonDecode(user)['role'] == 'client') {
      print(Client.fromJson(jsonDecode(user)));
      return Client.fromJson(jsonDecode(user));
    } else if (jsonDecode(user)['role'] == 'agent') {
      print(Agent.fromJson(jsonDecode(user)));
      return Agent.fromJson(jsonDecode(user));
    } else if (jsonDecode(user)['role'] == 'admin') {
      print(Admin.fromJson(jsonDecode(user)));
      return Admin.fromJson(jsonDecode(user));
    }
  }

  Future<void> saveLoggedInUser(user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

// ###################################################### \\
  // shared preference methods end \\
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
      await setToken(data['token']);
      if (data['role'] == 'client') {
        print(Client.fromJson(data));
        saveLoggedInUser(Client.fromJson(data));
        return Client.fromJson(data);
      } else if (data['role'] == 'agent') {
        print(Agent.fromJson(data));
        saveLoggedInUser(Agent.fromJson(data));
        return Agent.fromJson(data);
      } else if (data['role'] == 'admin') {
        print(Admin.fromJson(data));
        saveLoggedInUser(Admin.fromJson(data));
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
          'token': await getToken()
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
          'token': await getToken()
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
    final token = await getToken();
    final response = await httpClient.get(
      Uri.http('$_baseUrl', '/api/account/$accountNumber'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': token
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

  Future changePassword(String newPassword) async {
    final http.Response response = await httpClient.put(
      Uri.http('$_baseUrl', '/api/account/password_reset'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': await getToken()
      },
      body: jsonEncode(<String, String>{"password": newPassword}),
    );

    if (response.statusCode == 201) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update password.');
    }
  }

  Future saveAccount(String accountNumber) async {
    final http.Response response = await httpClient.put(
      Uri.http('$_baseUrl', '/api/client/save_account/$accountNumber'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': await getToken()
      },
    );

    if (response.statusCode == 201) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to save account.');
    }
  }

  Future removeSaveAccount(String accountNumber) async {
    final http.Response response = await httpClient.delete(
      Uri.http('$_baseUrl', '/api/client/save_account/$accountNumber'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': await getToken()
      },
    );

    if (response.statusCode == 202) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to save account.');
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

  // Future<void> updateCourse(Course course) async {
  //   final http.Response response = await httpClient.put(
  //     '$_baseUrl/courses/${course.id}',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'id': course.id,
  //       'title': course.title,
  //       'code': course.code,
  //       'description': course.description,
  //       'ects': course.ects,
  //     }),
  //   );

  //   if (response.statusCode != 204) {
  //     throw Exception('Failed to update course.');
  //   }
  // }


