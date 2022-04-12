import 'package:flutter/material.dart';
import 'package:weather/utils/colors.dart';
import 'package:weather/utils/string.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    Key? key,
    required this.main,
    required this.sys,
    required this.wind,
  }) : super(key: key);

  final Map<String, dynamic> main;
  final Map<String, dynamic> wind;
  final Map<String, dynamic> sys;
  @override
  Widget build(BuildContext context) {
    DateTime sunrise =
        DateTime.fromMillisecondsSinceEpoch(sys['sunrise'] * 1000);
    DateTime sunset = DateTime.fromMillisecondsSinceEpoch(sys['sunset'] * 1000);
    int pressure = main['pressure'];
    double windSpeed = wind['speed'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
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
              color:  kPrimaryColor.withOpacity(0.8),
              ),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      weatherString,
                      style: TextStyle(fontSize: 35, color: kTextColor),
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 const Text(
                                  sunrises,
                                  style:  TextStyle(
                                    fontSize: 17,
                                    color: kTextColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    '$sunrise',
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
                                  sunsets,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: kTextColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    '$sunset',
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
                              winds,
                              style: TextStyle(
                                fontSize: 17,
                                color: kTextColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '$windSpeed',
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
                              pressures,
                              style: TextStyle(
                                fontSize: 17,
                                color: kTextColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '$pressure',
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
          ],
        ),
      ),
    );
  }
}
