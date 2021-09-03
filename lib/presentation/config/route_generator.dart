import 'package:final_demo/presentation/screens/history_page.dart';
import 'package:flutter/material.dart';
import 'package:final_demo/presentation/screens/account_info.dart';
import 'package:final_demo/presentation/screens/pages_frame.dart';
// import 'package:final_demo/screens/other.dart';

class RouteGenerator {
  static const String homePage = "/";

  static const String randomPage = "/random";

  static const String historyPage = "/history";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => Dashboard());

      case randomPage:
        return MaterialPageRoute(builder: (_) => AccountInfo());

      case historyPage:
        return MaterialPageRoute(builder: (_) => HistoryPage());

      default:
        throw FormatException("Route was not found");
    }
  }
}
