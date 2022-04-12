import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather/routes/routes.dart';
import 'package:weather/utils/colors.dart';
import 'package:weather/utils/string.dart';
import 'package:weather/views/weather_details.dart';

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({
    Key? key,
    required this.city,
    required this.main,
    required this.sys,
    required this.weather,
    required this.wind,
  }) : super(key: key);
  final String city;
  final Map<String, dynamic> weather;
  final Map<String, dynamic> main;
  final Map<String, dynamic> wind;
  final Map<String, dynamic> sys;
  @override
  Widget build(BuildContext context) {
    String icon = weather['icon'];
    return Scaffold(
    resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteManager.homePage);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 35,
            color: kTextColor,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 35, color: kTextColor, fontWeight: FontWeight.w600),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
                boxShadow: kElevationToShadow[2], color: kAccentolor),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      city,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: kTextColor,
                      ),
                    ),
                  ),
                ),
                CachedNetworkImage(
                  imageUrl: 'https://openweathermap.org/img/wn/$icon@2x.png',
                  imageBuilder: (context, imageProvider) => Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.transparent, BlendMode.colorBurn),
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: kErrorColor,
                    size: 100,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 48),
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(90),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: kPrimaryColor.withOpacity(0.8),
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    '${main['temp']} °C',
                    style: const TextStyle(fontSize: 35, color: kTextColor),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Divider(
                  height: 1,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: kBlackTextColor,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            desc,
                            style: TextStyle(
                              fontSize: 17,
                              color: kTextColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '${weather['description']}',
                              style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w900,
                                  color: kTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            feels,
                            style: TextStyle(
                              fontSize: 17,
                              color: kTextColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '${main['feels_like']}',
                              style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w900,
                                  color: kTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            humid,
                            style: TextStyle(
                              fontSize: 17,
                              color: kTextColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '${main['humidity']}',
                              style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w900,
                                  color: kTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // Navigator.pushNamed(context, RouteManager.details);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherDetails(
                        sys: sys,
                        main: main,
                        wind: wind,
                      ),
                    ),
                  );
                },
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      details,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
