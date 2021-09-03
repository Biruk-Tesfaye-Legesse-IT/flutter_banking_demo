import 'package:final_demo/domain/models/TransactionHistory.dart';
import 'package:final_demo/insfrastructure/data_provider/UserData.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({required this.dataProvider});

  Future<TransactionHistory> getHistory() async {
    return await dataProvider.getHistory();
  }
}

class NetworkError extends Error {}
