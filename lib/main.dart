import 'package:charted/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'charted',

      //App theme
      theme: ThemeData(
        //Colors
        primaryColor: Color.fromRGBO(28, 28, 31, 1), //surface
        primaryColorDark: Color.fromRGBO(20, 20, 26, 1), //background
        accentColor: Color.fromRGBO(127, 90, 240, 1), //primary
        highlightColor: Color.fromRGBO(148, 161, 178, 1), //text

        //text theme
        textTheme: TextTheme(
          //charted logo
          caption: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(127, 90, 240, 1),
            ),
          ),

          //Header text large
          headline1: GoogleFonts.manrope(
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          //Header text small
          headline2: GoogleFonts.manrope(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),

          //Body title
          headline3: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          //Body subtitle
          headline4: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          //Highlight text large
          headline5: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Color.fromRGBO(148, 161, 178, 1),
            ),
          ),

          //Highlight text small
          headline6: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: Color.fromRGBO(148, 161, 178, 1),
            ),
          ),

          //Button text
          button: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          //Body text large
          bodyText1: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),

          //Body text small
          bodyText2: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),

      //Home screen
      home: LoginScreen(),
    );
  }
}
