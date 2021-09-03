import 'package:flutter/material.dart';

class BankName extends StatelessWidget {
  const BankName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Bank Name and Logo
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_balance,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Text(
            'Bank de Internacionale',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
