import 'package:final_demo/domain/models/Admin.dart';
import 'package:final_demo/domain/models/Agent.dart';
import 'package:final_demo/domain/models/Client.dart';
import 'package:flutter/material.dart';
import 'package:final_demo/presentation/config/route_generator.dart';
import 'package:final_demo/insfrastructure/data_provider/data_provider.dart';
import 'package:final_demo/insfrastructure/repository/repository.dart';
import 'package:http/http.dart' as http;

void main() {
  var data_provider = TransactionDataProvider(httpClient: http.Client());
  var repo = TransactionRepository(dataProvider: data_provider);

  repo.depositToClient('1000000009', 50);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
