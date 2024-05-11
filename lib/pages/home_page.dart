// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weatherModel = WeatherModel(
    weather: [],
    main: Main(
      temp: 0.0,
      feelsLike: 0.0,
      tempMin: 0.0,
      tempMax: 0.0,
      pressure: 0,
      humidity: 0,
    ),
    visibility: 0,
    wind: Wind(speed: 0.0, deg: 0),
    name: "",
  );

  bool isLoading = false;
  String noDataFound = "Search a city to get started";

  WeatherService weatherService = WeatherService();

  searchWeather(String city) async {
    setState(() {
      isLoading = true;
    });

    try {
      weatherModel = await weatherService.getWeather(city);
      setState(() {});
    } catch (e) {
      setState(() {
        noDataFound = "Could not search the given city";
        weatherModel = WeatherModel(
          weather: [],
          main: Main(
            temp: 0.0,
            feelsLike: 0.0,
            tempMin: 0.0,
            tempMax: 0.0,
            pressure: 0,
            humidity: 0,
          ),
          visibility: 0,
          wind: Wind(speed: 0.0, deg: 0),
          name: "",
        );
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Color getBackgroundColor() {
    // Check weather conditions and return corresponding color
    if (weatherModel.weather != null && weatherModel.weather!.isNotEmpty) {
      switch (weatherModel.weather![0].main) {
        case 'Clear':
          return const Color(0xFFFFE142);
        case 'Clouds':
        case 'Mist':
        case 'Smoke':
        case 'Haze':
        case 'Fog':
        case 'Sand':
        case 'Dust':
        case 'Ash':
          return const Color(0xFF42C6FF);
        case 'Rain':
        case 'Drizzle':
        case 'Thunderstorm':
        case 'Snow':
        case 'Squall':
        case 'Tornado':
          return const Color(0xFFFF64D4);
        default:
          return Color(0xFFFFE142); // Default color
      }
    } else {
      return Color(0xFFFFE142); // Default color
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: getBackgroundColor(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                hintText: 'Search a city',
                onSubmitted: (value) {
                  searchWeather(value);
                },
                hintStyle: MaterialStateProperty.all(
                  GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                textStyle: MaterialStateProperty.all(
                  GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.all(
                  getBackgroundColor(),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            if (weatherModel.weather?.isNotEmpty ?? false)
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        DateFormat('EEEE, dd MMMM').format(DateTime.now()),
                        style: GoogleFonts.dmSans(
                            fontSize: 16, color: getBackgroundColor()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    weatherModel.name ?? "Unknown",
                    style: GoogleFonts.dmSans(
                        fontSize: 28, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    weatherModel.weather != null &&
                            weatherModel.weather!.isNotEmpty
                        ? weatherModel.weather![0].main ?? "Unknown"
                        : "",
                    style: GoogleFonts.dmSans(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    weatherModel.main != null && weatherModel.main!.temp != null
                        ? '${(weatherModel.main!.temp! - 273.15).toStringAsFixed(0)}°'
                        : "Unknown",
                    style: GoogleFonts.dmSans(
                      fontSize: 192,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Daily Summary',
                            style: GoogleFonts.dmSans(
                                fontSize: 24, fontWeight: FontWeight.w900)),
                        Text(
                          weatherModel.main != null &&
                                  weatherModel.main!.temp != null
                              ? 'Now it feels like ${(weatherModel.main!.feelsLike! - 273.15).toStringAsFixed(0)}°C, actually ${(weatherModel.main!.temp! - 273.15).toStringAsFixed(0)}°C'
                              : "Unknown",
                          style: GoogleFonts.dmSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Today, the temperature is in the range ${(weatherModel.main!.tempMax! - 273.15).toStringAsFixed(0)}°C to ${(weatherModel.main!.tempMin! - 273.15).toStringAsFixed(0)}°C',
                          style: GoogleFonts.dmSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.waves,
                                color: getBackgroundColor(),
                                size: 64,
                              ),
                              Text(
                                weatherModel.wind != null &&
                                        weatherModel.wind!.speed != null
                                    ? '${(weatherModel.wind!.speed! * 3.6).toStringAsFixed(0)} km/hr'
                                    : "Unknown",
                                style: GoogleFonts.dmSans(
                                  fontSize: 24,
                                  color: getBackgroundColor(),
                                ),
                              ),
                              Text(
                                'Wind',
                                style: GoogleFonts.dmSans(
                                    fontSize: 16, color: getBackgroundColor()),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.water_drop_outlined,
                                color: getBackgroundColor(),
                                size: 64,
                              ),
                              Text(
                                weatherModel.main != null &&
                                        weatherModel.main!.humidity != null
                                    ? '${weatherModel.main!.humidity}%'
                                    : "Unknown",
                                style: GoogleFonts.dmSans(
                                  fontSize: 24,
                                  color: getBackgroundColor(),
                                ),
                              ),
                              Text(
                                'Humidity',
                                style: GoogleFonts.dmSans(
                                    fontSize: 16, color: getBackgroundColor()),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: getBackgroundColor(),
                                size: 64,
                              ),
                              Text(
                                weatherModel.visibility != null
                                    ? '${(weatherModel.visibility! / 1000).toStringAsFixed(1)} km'
                                    : "Unknown",
                                style: GoogleFonts.dmSans(
                                  fontSize: 24,
                                  color: getBackgroundColor(),
                                ),
                              ),
                              Text(
                                'Visibility',
                                style: GoogleFonts.dmSans(
                                    fontSize: 16, color: getBackgroundColor()),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            else
              Center(
                child: Text(noDataFound,
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
              )
          ],
        ),
      ),
    );
  }
}
