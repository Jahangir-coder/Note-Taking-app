import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
const grey = Color(0xFFEAEAEA);
const grey2 = Color(0xFF3F3F4F);
const black = Color(0xFF2E2E3F);
const black2 = Color(0xFF171717);
const headerColor = Color(0xFFFF3172);
const white = Colors.white;
var headerRideStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    color: white,
    fontSize: 17.0,
  ),
);
var headerNotesStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    color: white,
    fontSize: 47.0,
    fontWeight: FontWeight.bold,
  ),
);
enum EditMode {
  ADD,
  UPDATE,
}
var noNotesStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 24.0,
    color: black1,
    fontWeight: FontWeight.w620,
  ),
);
var boldPlus = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 32.0,
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
  ),
);
var itemTitle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 20.0,
    color: black1,
    fontWeight: FontWeight.bold,
  ),
);
var itemDateStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 13.0,
    color: grey1,
  ),
);
var itemContentStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 17.0,
    color: grey1,
  ),
);
var viewTitleStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w900,
  fontSize: 30.0,
);
var viewContentStyle = GoogleFonts.roboto(
    letterSpacing: 1.2,
    fontSize: 21.0,
    height: 1.8,
    fontWeight: FontWeight.w450);
var createTitle = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.w950,
    ));
var createContent = GoogleFonts.roboto(
  textStyle: TextStyle(
    letterSpacing: 1.2,
    fontSize: 22.0,
    height: 1.8,
    fontWeight: FontWeight.w450,
  ),
);
var shadow = [
  BoxShadow(
    color: Colors.grey[300],
    blurRadius: 25,
    offset: Offset(0, 10),
  )
];