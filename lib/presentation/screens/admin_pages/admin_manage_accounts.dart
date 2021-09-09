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
                      Dropdown(),
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

/// This is the stateful widget that the main application instantiates.
class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<Dropdown> {
  String dropdownValue = 'Bronze';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      // icon: const Icon(Icons.arrow_downward),
      // iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 4,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Gold', 'Silver', 'Bronze']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
