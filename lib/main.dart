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
  // repo.login('new', '1234');
  // repo.login('@administrator', '1234');
  // repo.login('agent', '1234');
  repo.getTransactions();
  // Agent agent = Agent(
  //     firstName: "firstName",
  //     lastName: "lastName",
  //     role: 1,
  //     dob: "dob",
  //     email: "agent@email",
  //     phoneNumber: "1234",
  //     address: "address",
  //     budget: 50.0);

  // repo.registerAgent(agent);

  // Client client = Client(
  //     firstName: "firstName",
  //     lastName: "lastName",
  //     dob: "dob",
  //     email: "newone",
  //     phoneNumber: "phoneNumber",
  //     address: "address",
  //     balance: 50);

  // repo.registerClient(client);

  // repo.getAccount('1000000002');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
