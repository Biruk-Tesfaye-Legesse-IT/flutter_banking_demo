// import 'package:final_demo/application/bloc/AuthBloc/auth_bloc.dart';
// import 'package:final_demo/application/bloc/LoanBloc/loan_bloc.dart';
// import 'package:final_demo/insfrastructure/insfrastructure.dart';
// import 'package:final_demo/insfrastructure/repository/auth/accountRepository.dart';
// import 'package:final_demo/insfrastructure/data_provider/auth/accountProvider.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;

// class ManageLoan extends StatelessWidget {
//   ManageLoan({Key? key}) : super(key: key);

//   final repo =
//       LoanRepository(dataProvider: LoanDataProvider(httpClient: http.Client()));

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//         value: this.repo, child: ControlBloc(repo: repo));
//   }
// }

// class ControlBloc extends StatelessWidget {
//   ControlBloc({
//     Key? key,
//     required this.repo,
//   }) : super(key: key);

//   final TextController = TextEditingController();

//   final LoanRepository repo;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<LoanBloc>(
//       create: (context) =>
//           LoanBloc(loanRepository: this.repo)..add(GetLoanInfo()),
//       child: BlocConsumer<LoanBloc, LoanState>(listener: (context, state) {
//         if (state is AccountLoading) {
//           CircularProgressIndicator();
//         }
//         if (state is Proccessing) {
//           CircularProgressIndicator();
//         }
//         if (state is TopUpLoanSuccess) {
//           SnackBar(content: Text(state.message.toString()));
//         }
//       }, builder: (context, state) {
//         if (state is AccountLoaded) {
//           var user = state.user;

//           return Scaffold(
//             // backgroundColor: AppColors.primaryWhite,
//             body: SafeArea(
//               child: SingleChildScrollView(
//                 child: Container(
//                   //Top Container
//                   // color: AppColors.primaryWhite,
//                   child: Column(
//                     children: [
//                       BankImage(),
//                       ProfileCard('${user.accountNumber}', '${user.email}',
//                           '${user.fullName}'),
//                       PasswordField(
//                           amountTextController: passwordTextController),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       ChangePasswordButton(
//                         passwordTextController: passwordTextController,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         } else {
//           return Center();
//         }
//       }),
//     );
//   }
// }

// class BankImage extends StatelessWidget {
//   const BankImage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 400,
//       height: MediaQuery.of(context).size.height / 3,

//       // decoration: BoxDecoration(color: Colors.black),
//       child: Image.asset('assets/images/transfer.jpg'),
//     );
//   }
// }

// class TopUpButton extends StatelessWidget {
//   const TopUpButton({
//     Key? key,
//     required this.amountTextController,
//   }) : super(key: key);

//   final TextEditingController amountTextController;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         final loanBloc = BlocProvider.of<LoanBloc>(context);

//         loanBloc
//             .add(TopUpLoan(amount: double.parse(amountTextController.text)));
//       },
//       child: Text("Change Password"),
//     );
//   }
// }

// class PasswordField extends StatelessWidget {
//   const PasswordField({
//     Key? key,
//     required this.amountTextController,
//   }) : super(key: key);

//   final TextEditingController amountTextController;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: true,
//       controller: amountTextController,
//       decoration: InputDecoration(
//         icon: Icon(Icons.password),
//         hintText: "New Password",
//       ),
//     );
//   }
// }

// class PayInFull extends StatelessWidget {
//   const PayInFull({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         final authBloc = BlocProvider.of<LoanBloc>(context);

//         authBloc.add(PayLoanInfull());
//       },
//       child: Text("Change Password"),
//     );
//   }
// }

// class ProfileCard extends StatelessWidget {
//   final String accNum;
//   final String email;
//   final String fullName;

//   const ProfileCard(
//     this.accNum,
//     this.email,
//     this.fullName,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         return Container(
//           height: 250,
//           child: Card(
//             color: Colors.blue,
//             child: Stack(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 10),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         title: Text(
//                           'Name: ',
//                           style: TextStyle(
//                               color: Colors.cyanAccent,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         trailing: Text(
//                           this.fullName,
//                           style: TextStyle(
//                               color: Colors.yellowAccent,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       ListTile(
//                         title: Text(
//                           'Email ',
//                           style: TextStyle(
//                               color: Colors.cyanAccent,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         trailing: Text(
//                           this.email,
//                           style: TextStyle(
//                               color: Colors.yellowAccent,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       ListTile(
//                         title: Text(
//                           'Account Number ',
//                           style: TextStyle(
//                               color: Colors.cyanAccent,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         trailing: Text(
//                           this.accNum,
//                           style: TextStyle(
//                               color: Colors.yellowAccent,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             elevation: 10,
//             margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
//           ),
//         );
//       },
//     );
//   }
// }
