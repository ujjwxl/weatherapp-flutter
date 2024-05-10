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
      backgroundColor: Color(0xFFFFE142),
      body: Column(
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
          )
        ],
      ),
    );
  }
}
