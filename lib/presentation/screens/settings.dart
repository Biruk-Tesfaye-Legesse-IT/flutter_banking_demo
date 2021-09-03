import 'package:flutter/material.dart';

import 'account_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("Goto About Page"),
        onPressed: () {
          // Navigator.pushNamed(context, '/second');
          // Navigator.of(context).pushNamed(RouteGenerator.randomPage);
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new AccountInfo()));
        },
      ),
    );
  }
}
