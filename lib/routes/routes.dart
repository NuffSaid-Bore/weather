import 'package:flutter/material.dart';
import 'package:weather/views/home_screen.dart';

class RouteManager {
  static const String homePage = '/';
  static const String details = '/weatherDetails';

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      // case details:
      //   return MaterialPageRoute(
      //     builder: (context) =>  WeatherDetails(),
      //   );

      default:
        throw const FormatException('Route not found check if exist!');
    }
  }
}
