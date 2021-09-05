import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [_recieverAccount(), _recieverAccount()]));
  }
}

Widget _recieverAccount() {
  return TextFormField();
}
