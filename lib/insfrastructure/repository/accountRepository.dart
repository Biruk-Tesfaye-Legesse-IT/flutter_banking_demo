import 'package:final_demo/domain/models/TransactionHistory.dart';
import 'package:final_demo/insfrastructure/data_provider/auth/accountProvider.dart';

class AccountRepository {
  final AccountDataProvider dataProvider;

  AccountRepository({required this.dataProvider});

  Future login(String username, String password) async {
    return await dataProvider.login(username, password);
  }
}

class NetworkError extends Error {}
