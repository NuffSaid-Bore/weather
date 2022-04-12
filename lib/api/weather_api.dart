import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:weather/utils/string.dart';

class WeatherApi with ChangeNotifier {

  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';
   String _city = '';
  Map<String, dynamic> get map => _map;
  String get errorMessage => _errorMessage;
  bool get error => _error;

  Future<void>getWeather(String city) async {
    _city = city;
    final url =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=f6d01b69f0fe49304ceb887c385fee87';

    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        // _jsonConvert(_map);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = errorString;
      _map = {};
    }
    notifyListeners();
  }

  //  _jsonConvert(_map) {
  //   final main = json['weather'].first['main'];
  //   final city = json['name'];
  //   final double degrees = (json['main']['temp']).toDouble();

  //   final icon = json['weather']['icon'];
  //   final weatherIcon = 'http://openweathermap.org/img/wn/$icon@2x.png';
  //   final weatherDescription = json['weather']['description'];
  //   final temperature = json['weather']['temp'];
  //   final feelsLike = json['weather']['feels_like'];
  //   final pressure = json['weather']['icon'];
  //   final humidity = json['weather']['icon'];
  //   final windspeed = json['weather']['icon'];
  //   final sunrise = json['weather']['icon'];
  //   final sunset = json['weather']['icon'];

  //   WeatherData data = WeatherData(
  //       weatherIcon: weatherIcon,
  //       weatherDescription: weatherDescription,
  //       temperature: temperature,
  //       feelsLike: feelsLike,
  //       pressure: pressure,
  //       humidity: humidity,
  //       windspeed: windspeed,
  //       sunrise: sunrise,
  //       sunset: sunset);

  // return WeatherData(
  //   weatherIcon: json['weather']['icon'],
  //   temperature: json['main']['temp'],
  //   weatherDescription: json['weather']['description'],
  //   feelsLike: json['weather']['feels_like'],
  //   humidity: json['main']['humidity'],
  //   pressure: json['main']['pressure'],
  //   windspeed: json['wind']['speed'],
  //   sunrise: json['sys']['sunrise'],
  //   sunset: json['sys']['sunset'],
  // );
}
