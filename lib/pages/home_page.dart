// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFE142),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                  hintText: 'Search a city',
                  hintStyle: MaterialStateProperty.all(GoogleFonts.dmSans(
                      fontSize: 24, fontWeight: FontWeight.bold)),
                  textStyle: MaterialStateProperty.all(GoogleFonts.dmSans(
                      fontSize: 24, fontWeight: FontWeight.bold)),
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFFFE142)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)))),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Friday, 10 May',
                  style: GoogleFonts.dmSans(
                      fontSize: 16, color: Color(0xFFFFE142)),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Sunny',
              style:
                  GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '31°',
              style: GoogleFonts.dmSans(
                  fontSize: 192, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Daily Summary',
                      style: GoogleFonts.dmSans(
                          fontSize: 24, fontWeight: FontWeight.w900)),
                  Text('Now it feels like 35°, actually 31°',
                      style: GoogleFonts.dmSans(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  Text('Today, the temperature is in the range 31° to 27°',
                      style: GoogleFonts.dmSans(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
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
                          color: Color(0xFFFFE142),
                          size: 64,
                        ),
                        Text(
                          '4 km/hr',
                          style: GoogleFonts.dmSans(
                              fontSize: 24, color: Color(0xFFFFE142)),
                        ),
                        Text(
                          'Wind',
                          style: GoogleFonts.dmSans(
                              fontSize: 16, color: Color(0xFFFFE142)),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                          color: Color(0xFFFFE142),
                          size: 64,
                        ),
                        Text(
                          '48%',
                          style: GoogleFonts.dmSans(
                              fontSize: 24, color: Color(0xFFFFE142)),
                        ),
                        Text(
                          'Humidity',
                          style: GoogleFonts.dmSans(
                              fontSize: 16, color: Color(0xFFFFE142)),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color(0xFFFFE142),
                          size: 64,
                        ),
                        Text(
                          '4 km/hr',
                          style: GoogleFonts.dmSans(
                              fontSize: 24, color: Color(0xFFFFE142)),
                        ),
                        Text(
                          'Visibility',
                          style: GoogleFonts.dmSans(
                              fontSize: 16, color: Color(0xFFFFE142)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
