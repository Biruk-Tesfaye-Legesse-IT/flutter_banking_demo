import 'dart:async';
import 'dart:convert';
import 'package:final_demo/domain/models/models.dart';
import 'package:final_demo/insfrastructure/data_provider/config.dart';
import 'package:http/http.dart' as http;

class TransactionDataProvider {
  final _baseUrl = baseURL;
  final http.Client httpClient;

  // UserDataProvider({required this.httpClient}) : assert(httpClient != null);

  TransactionDataProvider({required this.httpClient});

  // ===========================getHistory========================================

  Future getTransactions() async {
    final response = await httpClient.get(
      Uri.http('$_baseUrl', '/api/account/transactions'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token':
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X251bWJlciI6MTAwMDAwMDAwOSwiZXhwIjoxNjMwNzk2ODAzfQ.WFkOj6BFYOrkrsE1jxpJB7I3KkXIuO4Q3QzDV_xgFT8"
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var tranactionList =
          data.map((transaction) => TransactionHistory.fromJson(transaction));
      print(tranactionList);
      return tranactionList;
    } else {
      throw Exception("Can not find transaction.");
    }
  }

  Future transfer(String recieverAccountNumber, double amount) async {
    final response = await httpClient.post(
        Uri.http('$_baseUrl', '/api/client/transfer'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token':
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X251bWJlciI6MTAwMDAwMDAwOSwiZXhwIjoxNjMwODAwNzE1fQ.ZCMl0mUmmyTk1jvlKdnV9Z0lp3tR3rbSrseTDhF4bBQ"
        },
        body: jsonEncode({
          "reciever_account_number": recieverAccountNumber,
          "amount": amount
        }));

    if (response.statusCode == 201) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body)['message']);
      throw Exception("Tranfer Failed.");
    }
  }

  Future withdraw(String recieverAccountNumber, double amount) async {
    final response = await httpClient.post(
        Uri.http('$_baseUrl', '/api/client/withdraw'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token':
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X251bWJlciI6MTAwMDAwMDAwOSwiZXhwIjoxNjMwODAwNzE1fQ.ZCMl0mUmmyTk1jvlKdnV9Z0lp3tR3rbSrseTDhF4bBQ"
        },
        body: jsonEncode({
          "reciever_account_number": recieverAccountNumber,
          "amount": amount
        }));

    if (response.statusCode == 201) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body)['message']);
      throw Exception("Withdrawing Failed.");
    }
  }

  Future depositToClient(String recieverAccountNumber, double amount) async {
    final response = await httpClient.post(
        Uri.http('$_baseUrl', '/api/agent/deposit'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token':
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X251bWJlciI6MTAwMDAwMDAwOCwiZXhwIjoxNjMwODAxNDEwfQ.AZLwGQKBDgltPnKuTLMgNWo4xbYjPVz1v2nm-LOvn88"
        },
        body: jsonEncode({
          "reciever_account_number": recieverAccountNumber,
          "amount": amount
        }));

    if (response.statusCode == 201) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body)['message']);
      throw Exception("Deposit Failed.");
    }
  }

  Future agentWithdraw(String recieverAccountNumber, double amount) async {
    final response = await httpClient.post(
        Uri.http('$_baseUrl', '/api/agent/get_cash'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token':
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X251bWJlciI6MTAwMDAwMDAwOCwiZXhwIjoxNjMwODA1ODM3fQ.lQxziO7n7H1Iwyn7WT8Ksu2ld4atjbvD6PqcFMYaLKk"
        },
        body: jsonEncode({
          "reciever_account_number": recieverAccountNumber,
          "amount": amount
        }));

    if (response.statusCode == 201) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body)['message']);
      throw Exception("Withdraw Failed.");
    }
  }

  Future agentPayment() async {
    final http.Response response = await httpClient.put(
      Uri.http('$_baseUrl', '/api/agent/request_payment'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token':
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X251bWJlciI6MTAwMDAwMDAwOCwiZXhwIjoxNjMwODA1ODM3fQ.lQxziO7n7H1Iwyn7WT8Ksu2ld4atjbvD6PqcFMYaLKk"
      },
    );

    if (response.statusCode == 201) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body)['message']);
      throw Exception('Payment Failed.');
    }
  }

  Future transactionDelete(int transactionId) async {
    final http.Response response = await httpClient.delete(
      Uri.http('$_baseUrl', '/api/account/transaction/$transactionId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token':
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X251bWJlciI6MTAwMDAwMDAwOCwiZXhwIjoxNjMwODA1MDcxfQ.hiDqASVxWbY0Oz-msnsltB7FN-SU3Kz3TrUELXMeHjc"
      },
    );

    if (response.statusCode == 202) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body)['message']);
      throw Exception('Failed to delete transaction.');
    }
  }
}
