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
}
