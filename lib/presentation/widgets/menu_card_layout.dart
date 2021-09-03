import 'package:flutter/material.dart';
import 'package:final_demo/presentation/widgets/route_cards.dart';

class MenuCardLayout extends StatelessWidget {
  const MenuCardLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RouteCard("Withdraw", Icon(Icons.ac_unit), Colors.blue),
              RouteCard("Withdraw", Icon(Icons.ac_unit), Colors.lightGreen),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RouteCard("Withdraw", Icon(Icons.ac_unit), Colors.blue),
              RouteCard("Withdraw", Icon(Icons.ac_unit), Colors.lightGreen),
            ],
          ),
        ],
      ),
    );
  }
}
