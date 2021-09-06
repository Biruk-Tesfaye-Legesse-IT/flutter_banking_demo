import 'package:final_demo/presentation/config/route_generator.dart';
import 'package:final_demo/presentation/screens/client_pages/client_home.dart';
import 'package:final_demo/presentation/screens/history_page.dart';
import 'package:final_demo/presentation/widgets/menu_card_layout.dart';
import 'package:final_demo/presentation/widgets/route_cards.dart';
import 'package:flutter/material.dart';

class ClientMenuLayout extends StatelessWidget {
  const ClientMenuLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MenuCardLayout(
      InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed('/userhome');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoryPage()),
          );
        },
        child: RouteCard("Withdraw", Icon(Icons.ac_unit), Colors.blue),
      ),
      InkWell(
        child: RouteCard("Withdraw", Icon(Icons.ac_unit), Colors.lightGreen),
      ),
      InkWell(
        child: RouteCard("Withdraw", Icon(Icons.ac_unit), Colors.blue),
      ),
      InkWell(
        child: RouteCard("Withdraw", Icon(Icons.ac_unit), Colors.lightGreen),
      ),
    ));
  }
}
