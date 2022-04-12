import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/utils/colors.dart';
import 'package:weather/utils/string.dart';
import 'package:weather/views/weather_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: (cityName.isEmpty)
          ? 
          Container(
              decoration: BoxDecoration(
                color: kBGColor.withOpacity(0.4),
              ),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      height: MediaQuery.of(context).size.height * 0.32,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        boxShadow: kElevationToShadow[6],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 35,
                                  color: kTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 50.0, right: 50.0, bottom: 10),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              onChanged: ((value) {
                                cityName = value;
                              }),
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.search_outlined,
                                  color: kTextColor,
                                ),
                                labelText: searchString,
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                focusColor: kTextColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              controller: controller,
                              style: const TextStyle(
                                fontSize: 18,
                                color: kAccentolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                cityName = controller.text;
                              });
                            },
                            child: const Text(
                              search,
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.only(
                              top: 50, left: 10, right: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(90),
                            ),
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  containerText,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: kBlackTextColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Pacifico',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width,
                                child: const Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        history1,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width,
                                child: const Card(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        history2,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ChangeNotifierProvider(
              create: (context) => WeatherApi(),
              builder: (context, child) {
                return Weather(city: cityName);
              },
            ),
    );
  }
}
