import 'package:flutter/material.dart';
import 'package:weather/routes/routes.dart';
import 'package:weather/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.deepPurple,
      ),
        debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.homePage,
      onGenerateRoute: RouteManager.routes,
    );
  }
}
