import 'package:flutter/material.dart';
import 'package:final_demo/presentation/config/route_generator.dart';
import 'package:final_demo/insfrastructure/data_provider/data_provider.dart';
import 'package:final_demo/insfrastructure/repository/repository.dart';
import 'package:http/http.dart' as http;

WidgetsBinding ensureInitialized() {
  if (WidgetsBinding.instance == null) WidgetsFlutterBinding();
  return WidgetsBinding.instance!;
}

void main() {
  ensureInitialized();

  var data_provider = TransactionDataProvider(httpClient: http.Client());
  var repo = TransactionRepository(dataProvider: data_provider);

  repo.getTransactions();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
