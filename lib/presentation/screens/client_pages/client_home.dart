import 'package:final_demo/presentation/widgets/bank_name.dart';
import 'package:final_demo/presentation/widgets/custom_client_widgets/client_menu.dart';
import 'package:final_demo/presentation/widgets/info_card.dart';
// import 'package:final_demo/presentation/widgets/menu_card_layout.dart';
import 'package:final_demo/presentation/widgets/name_card.dart';
import 'package:final_demo/presentation/theme/color_const.dart';
import 'package:flutter/material.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                NameCard('Frank Sinatra', 'Client'),
                InfoCard('Gold', '1000 000 000', '\$2500.00'),
                ClientMenuLayout(),
              ],
            ),
          ),
        ),
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
