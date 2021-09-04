import 'package:final_demo/domain/models/models.dart';
import 'package:final_demo/domain/models/TransactionHistory.dart';
import 'package:final_demo/insfrastructure/data_provider/transaction/transactionProvider.dart';

class TransactionRepository {
  final TransactionDataProvider dataProvider;

  TransactionRepository({required this.dataProvider});

  Future getTransactions() async {
    return await dataProvider.getTransactions();
  }
}

// class NetworkError extends Error {}
