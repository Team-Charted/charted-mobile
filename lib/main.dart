import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      title: 'charted',
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
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(127, 90, 240, 1),
            ),
          ),

          //Header text large
          headline1: GoogleFonts.manrope(
            textStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          //Header text small
          headline2: GoogleFonts.manrope(
            textStyle: TextStyle(
              fontSize: 24,
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
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color.fromRGBO(148, 161, 178, 1),
            ),
          ),

          //Highlight text small
          headline6: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Color.fromRGBO(148, 161, 178, 1),
            ),
          ),

          //Button text
          button: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 22,
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'charted',
          style: theme.textTheme.caption,
        ),
        backgroundColor: theme.primaryColorDark,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: theme.primaryColorDark,
        child: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Press",
              style: theme.textTheme.button,
            ),
            style: ElevatedButton.styleFrom(
              primary: theme.accentColor,
              minimumSize: Size(
                size.width * 0.8,
                size.height * 0.08,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
