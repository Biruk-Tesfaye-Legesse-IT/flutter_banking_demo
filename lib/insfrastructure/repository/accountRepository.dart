import 'package:final_demo/domain/models/models.dart';
import 'package:final_demo/domain/models/TransactionHistory.dart';
import 'package:final_demo/insfrastructure/data_provider/auth/accountProvider.dart';

class AccountRepository {
  final AccountDataProvider dataProvider;

  AccountRepository({required this.dataProvider});

  Future login(String username, String password) async {
    return await dataProvider.login(username, password);
  }

  Future registerAgent(Agent agent) async {
    return await dataProvider.registerAgent(agent);
  }

  Future registerClient(Client client) async {
    return await dataProvider.registerClient(client);
  }
}

class NetworkError extends Error {}
