import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/routes/routes.dart';
import 'package:weather/utils/colors.dart';
import 'package:weather/utils/string.dart';
import 'package:weather/widgets/weather_display.dart';

class Weather extends StatelessWidget {
  const Weather({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String city;

  @override
  Widget build(BuildContext context) {
    context.read<WeatherApi>().getWeather(city);
    return Center(
      child: Consumer<WeatherApi>(
        builder: (context, value, child) {
          return value.map.isEmpty && !value.error
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : value.error
                  ?
                   BottomSheet(
                      onClosing: () => Navigator.pop(context),
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.54,
                          width: MediaQuery.of(context).size.width - 20,
                          decoration: BoxDecoration(
                              boxShadow: kElevationToShadow[1],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                              color: kAccentolor),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Icon(
                                Icons.error_sharp,
                                size: 100,
                                color: kErrorColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 15, left: 20, right: 20),
                                child: Text(
                                  value.errorMessage,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: kErrorColor, fontSize: 25),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    boxShadow: kElevationToShadow[7],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, RouteManager.homePage),
                                    child: const Text(
                                      ok,
                                      style: TextStyle(
                                        color: kBlackTextColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      })
                  : WeatherDisplay(
                      city: city,
                      weather: value.map['weather'][0],
                      main: value.map['main'],
                      sys: value.map['sys'],
                      wind: value.map['wind'],
                    );
        },
      ),
    );
  }
}
