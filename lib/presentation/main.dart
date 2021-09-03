import 'package:flutter/material.dart';
import 'package:final_demo/presentation/config/route_generator.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
