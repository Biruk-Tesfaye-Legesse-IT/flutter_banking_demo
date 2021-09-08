import 'package:final_demo/presentation/screens/auth_page/login.dart';
import 'package:final_demo/presentation/widgets/bank_name.dart';
import 'package:final_demo/application/bloc/account/account_bloc.dart';
import 'package:final_demo/insfrastructure/repository/auth/accountRepository.dart';
import 'package:final_demo/insfrastructure/data_provider/auth/accountProvider.dart';
import 'package:final_demo/presentation/widgets/custom_client_widgets/client_menu.dart';
import 'package:final_demo/presentation/widgets/info_card.dart';
// import 'package:final_demo/presentation/widgets/menu_card_layout.dart';
import 'package:final_demo/presentation/widgets/name_card.dart';
import 'package:final_demo/presentation/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AgentHomePage extends StatelessWidget {
  AgentHomePage({Key? key}) : super(key: key);

  final repo = AccountRepository(
      dataProvider: AccountDataProvider(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.repo,
      child: BlocProvider<AccountBloc>(
        create: (context) =>
            AccountBloc(accountRepository: this.repo)..add(GetAccount()),
        child:
            BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
          if (state is AccountLoading) {
            return CircularProgressIndicator();
          } else if (state is AccountLoaded) {
            var user = state.user;
            return Scaffold(
              backgroundColor: AppColors.primaryWhite,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    //Top Container
                    color: AppColors.primaryWhite,
                    child: Column(
                      children: [
                        BankName(),
                        NameCard('${user.fullName}', '${user.role}'),
                        InfoCard('Corporate', '${user.accountNumber}',
                            '\$${user.budget}'),
                        ClientMenuLayout(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return LoginScreen();
          }
        }),
      ),
    );
  }
}



// class AccountNumber extends StatelessWidget {
//   const AccountNumber({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       "1000 000 000",
//       style: TextStyle(
//           color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 15),
//     );
//   }
// }

// class AccountName extends StatelessWidget {
//   const AccountName({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       "Pauline Fischer",
//       style: TextStyle(
//           color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 20),
//     );
//   }
// }
