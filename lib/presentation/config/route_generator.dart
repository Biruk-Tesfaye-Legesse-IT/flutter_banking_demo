import 'package:final_demo/insfrastructure/insfrastructure.dart';
import 'package:final_demo/presentation/screens/auth_page/login.dart';
import 'package:final_demo/presentation/screens/history_page.dart';
import 'package:final_demo/presentation/screens/saved_accounts.dart';
import 'package:flutter/material.dart';
import 'package:final_demo/presentation/screens/account_info.dart';
import 'package:final_demo/presentation/screens/client_pages/client_pages_frame.dart';
// import 'package:final_demo/screens/other.dart';

class RouteGenerator {
  static const String LoginPage = "/";

  // static const String userRandomPage = "/random";

  //Client
  static const String userHomePage = "/userhome";
  static const String userHistoryPage = "/userhistory";
  static const String check = "";

  //Agent
  // static const String agentHomePage = "/agenthistory";

  //Admin
  // static const String adminHomePage = "/adminhistory";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings
    //     .arguments; //We will use it if we need to pass data to another screen There is anf if code in comment below to implement it.
    switch (settings.name) {
      case LoginPage:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case userHistoryPage:
        return MaterialPageRoute(builder: (_) => HistoryPage());

      case userHomePage:
        return MaterialPageRoute(builder: (_) => ClientDashboard());

      // Client Routes

      // case userHomePage:
      //   return MaterialPageRoute(builder: (_) => ClientDashboard());

      // case userRandomPage:
      // if (args is String) {
      // builder: (_) => theOtherPage(
      // data: args,
      // )};
      //   return MaterialPageRoute(builder: (_) => AccountInfo());

      case '/saved':
        return MaterialPageRoute(builder: (_) => SavedAccounts());

      // Agent Routes
      // case agentHomePage:
      //   return MaterialPageRoute(builder: (_) => ClientDashboard());

      // User Routes

      // case adminHomePage:
      //   return MaterialPageRoute(builder: (_) => ClientDashboard());

      default:
        throw FormatException("Route was not found");
    }
  }
}

// We can create a Route<dynamic> classed error handler like in Flutter Routes & Navigation – Parameters, Named Routes, onGenerateRoute video on Reso Coder
