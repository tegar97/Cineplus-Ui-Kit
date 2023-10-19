import 'dart:ui';
import 'package:cineplus/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Default Margin
const double defaultMargin = 16.0;

// Colors
const Color primaryColor = Color(0xff9D24C7);
const Color backgroundColor = Color(0xff121212);

const Color neutral100 = Color(0xff0A0A0A);
const Color neutral90 = Color(0xff404040);
const Color neutral70 = Color(0xff757575);
const Color neutral60 = Color(0xff9E9E9E);
const Color neutral30 = Color(0xffEDEDED);
const Color neutral20 = Color(0xffFFFFFF);

// Text Styles
final TextStyle regularText = GoogleFonts.plusJakartaSans(
  color: neutral20,
  fontSize: 14,
);

final TextStyle headingTextStyle = GoogleFonts.plusJakartaSans(
  color: neutral20,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final TextStyle subHeadingTextStyle = GoogleFonts.plusJakartaSans(
  color: neutral20,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

final TextStyle subtitleTextStyle = GoogleFonts.plusJakartaSans(
  color: neutral60,
  fontSize: 12,
);

final TextStyle buttonTextStyle = GoogleFonts.plusJakartaSans(
  color: neutral20,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

final TextStyle errorTextStyle = GoogleFonts.plusJakartaSans(
  color: Colors.red,
  fontSize: 14,
);

