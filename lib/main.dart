import 'package:flutter/material.dart';
import 'package:final_demo/presentation/config/route_generator.dart';
import 'package:final_demo/insfrastructure/data_provider/auth/accountProvider.dart';
import 'package:final_demo/insfrastructure/repository/accountRepository.dart';
import 'package:http/http.dart' as http;

void main() {
  var data_provider = AccountDataProvider(httpClient: http.Client());
  var repo = AccountRepository(dataProvider: data_provider);
  print(repo.login('new', '1234'));

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
