import 'package:final_demo/domain/models/models.dart';
import 'package:final_demo/domain/models/TransactionHistory.dart';
import 'package:final_demo/insfrastructure/data_provider/transaction/transactionProvider.dart';

class TransactionRepository {
  final TransactionDataProvider dataProvider;

  TransactionRepository({required this.dataProvider});

  Future getTransactions() async {
    return await dataProvider.getTransactions();
  }

  Future transfer(String recieverAccountNumber, double amount) async {
    return await dataProvider.transfer(recieverAccountNumber, amount);
  }

  Future withdraw(String recieverAccountNumber, double amount) async {
    return await dataProvider.withdraw(recieverAccountNumber, amount);
  }

  Future depositToClient(String recieverAccountNumber, double amount) async {
    return await dataProvider.depositToClient(recieverAccountNumber, amount);
  }
}

// class NetworkError extends Error {}
