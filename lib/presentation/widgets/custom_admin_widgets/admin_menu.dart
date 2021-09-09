import 'package:final_demo/presentation/screens/admin_pages/admin_search_accounts.dart';
import 'package:final_demo/presentation/screens/history_page.dart';
import 'package:final_demo/presentation/widgets/menu_card_layout.dart';
import 'package:final_demo/presentation/widgets/route_cards.dart';
import 'package:flutter/material.dart';

class AdminMenuLayout extends StatelessWidget {
  const AdminMenuLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MenuCardLayout(
      InkWell(
        child: RouteCard("Add Agent", Icon(Icons.ac_unit), Colors.blue),
      ),
      InkWell(
        child: RouteCard(
            "Deposit to Agent", Icon(Icons.ac_unit), Colors.lightGreen),
      ),
      InkWell(
        child: RouteCard("Manage Users", Icon(Icons.ac_unit), Colors.blue),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminSearchUser()),
          );
        },
      ),
      InkWell(
        child:
            RouteCard("Transactions", Icon(Icons.ac_unit), Colors.lightGreen),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoryPage()),
          );
        },
      ),
    ));
  }
}
