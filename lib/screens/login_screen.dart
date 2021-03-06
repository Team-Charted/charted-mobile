import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/textFieldCustom.dart';
import '../widgets/wideButton.dart';
import 'sign_up_screen.dart';
import '../screens/home_screen.dart';
import '../utils/user_prefs.dart';
import '../widgets/custom_page_route.dart';
import '../widgets/passwordTextField.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  //Text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    //Appbar
    final _appBar = AppBar(
      title: Text(
        'charted',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(127, 90, 240, 1),
          ),
        ),
      ),
      backgroundColor: theme.primaryColorDark,
      centerTitle: true,
      elevation: 0,
    );

    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Container(
          color: theme.primaryColorDark,
          width: size.width,
          height: size.height -
              _appBar.preferredSize.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          alignment: Alignment.topCenter,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.025,
                ),

                //Headertext
                Container(
                  width: size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Glad to see you back,',
                        style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Let\'s sign you in.',
                        style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.06,
                ),

                //emailTextfield
                TextFieldCustom('Email', _emailController, _emailValidator),

                SizedBox(
                  height: size.height * 0.04,
                ),

                //PasswordTextField
                //TextFieldCustom('Password', _passwordValidator),
                PasswordTextField(
                    'Password', _passwordController, _passwordValidator),

                Spacer(),

                //sign up prompt
                Container(
                  width: size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(148, 161, 178, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      GestureDetector(
                        //Navigate to Sign Up Screen
                        onTap: () {
                          Navigator.of(context).push(
                            CustomPageRoute(
                              SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),

                //Button
                WideButton(theme.accentColor, 'Sign In', () async {
                  if (_formKey.currentState!.validate()) {
                    print('Sign in button tapped');
                    _email = _emailController.text;
                    _password = _passwordController.text;

                    //Send request
                    try {
                      final _response = await _loginUser(_email, _password);

                      //if success then login and save token
                      if (_response.statusCode == 200) {
                        //Update shared pref
                        final _body = json.decode(_response.body);
                        await UserPreferences.setToken(_body['token']);

                        //Navigate to Home Screen
                        Navigator.of(context).pushReplacement(
                          CustomPageRoute(
                            HomeScreen(),
                          ),
                        );
                      } else {
                        print(_response.body);
                      }
                    } on Exception catch (e) {
                      print(
                        e.toString(),
                      );
                    }
                  }
                }),

                SizedBox(
                  height: size.height * 0.025,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Register Request
  Future<http.Response> _loginUser(String _email, String _password) {
    return http.post(
      Uri.parse('https://charted-server.herokuapp.com/api/auth'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {"email": _email, "password": _password},
      ),
    );
  }

  //Email validator
  String? _emailValidator(value) {
    String pattern = r"[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid input';
    }
    return null;
  }

  //Password validator
  String? _passwordValidator(value) {
    String pattern =
        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$";
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Password can\'t be empty';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid input';
    }
    return null;
  }
}
