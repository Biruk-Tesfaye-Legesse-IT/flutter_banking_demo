import 'package:flutter/material.dart';
import 'package:final_demo/presentation/config/route_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/bloc/AuthBloc/auth_bloc.dart';
// import 'package:final_demo/insfrastructure/data_provider/data_provider.dart';
// import 'package:final_demo/insfrastructure/repository/repository.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   var data_provider = LoanDataProvider(httpClient: http.Client());
//   var repo = LoanRepository(dataProvider: data_provider);

//   repo.loanPayInFull();

// void main() {
// var data_provider = AccountDataProvider(httpClient: http.Client());
// final repo = AccountRepository(dataProvider: data_provider);
// print(repo.login('new', '1234'));

// void main() => runApp(MyApp());

void main() {
  // ignore: non_constant_identifier_names
  // var data_provider = AccountDataProvider(httpClient: http.Client());
  // var repo = AccountRepository(dataProvider: data_provider);
  // print(repo.login('new', '1234'));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => AuthBloc()),
        //We can add another BlocProvider Here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.LoginPage,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}


// void main() {
//   // ignore: non_constant_identifier_names
//   var data_provider = AccountDataProvider(httpClient: http.Client());
//   var repo = AccountRepository(dataProvider: data_provider);
//   print(repo.login('new', '1234'));

//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: RouteGenerator.LoginPage,
//       onGenerateRoute: RouteGenerator.generateRoute,
//     ),
//   );
// }
