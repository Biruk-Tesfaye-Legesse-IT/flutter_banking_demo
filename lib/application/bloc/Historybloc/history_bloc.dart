import 'dart:async';
// import 'dart:html';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_demo/domain/models/TransactionHistory.dart';
import 'package:final_demo/insfrastructure/repository/accountRepository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final AccountRepository userRepository;

  HistoryBloc({required this.userRepository}) : super(HistoryLoading());

  // HistoryBloc() : super(HistoryInitial());

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if (event is GetTransactionsList) {
      try {
        yield HistoryLoading();
        // final mList = await userRepository.getHistory();
        // yield HistoryLoaded(mList);
        // if (mList.error != null) {
        //   yield HistoryError(mList.error);
        // }
      } on NetworkError {
        yield HistoryError("Failed to fetch data. is your device online?");
      }
    }
  }
}
