import 'package:final_demo/presentation/widgets/bank_name.dart';
import 'package:final_demo/application/bloc/AuthBloc/auth_bloc.dart';
import 'package:final_demo/insfrastructure/repository/auth/accountRepository.dart';
import 'package:final_demo/insfrastructure/data_provider/auth/accountProvider.dart';
import 'package:final_demo/presentation/widgets/info_card.dart';
import 'package:final_demo/presentation/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AdminManageAccount extends StatelessWidget {
  final user;

  AdminManageAccount({
    required this.user,
  });

  final repo = AccountRepository(
      dataProvider: AccountDataProvider(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  //Top Container
                  // color: AppColors.primaryWhite,
                  child: Column(
                    children: [
                      BankName(),
                      InfoCard('${user.accountType}', '${user.accountNumber}',
                          '\$${user.balance}'),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
