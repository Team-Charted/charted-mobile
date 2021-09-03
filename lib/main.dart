import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../utils/user_prefs.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await UserPreferences.init();

  print(UserPreferences.getToken());

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
        highlightColor: Color.fromRGBO(148, 161, 178, 1),
        errorColor: Color.fromRGBO(180, 20, 20, 1),
      ),

      //Home screen
      home: UserPreferences.getToken() == null ? LoginScreen() : HomeScreen(),
    );
  }
}
