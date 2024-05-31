// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Storeheading extends StatelessWidget {
  const Storeheading({super.key, required this.heading, required this.padding});
  final String heading;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(left: padding),
            alignment: Alignment.topLeft,
            child: Text(
              heading,
              style: GoogleFonts.workSans(
                color: const Color(0xff1A7431),
                fontSize: 25,
                letterSpacing: -0.24,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
  }
}