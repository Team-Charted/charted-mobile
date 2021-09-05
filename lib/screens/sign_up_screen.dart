import 'dart:convert';

import 'package:charted/models/register_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/textFieldCustom.dart';
import '../widgets/wideButton.dart';
import '../screens/home_screen.dart';
import '../utils/user_prefs.dart';
import '../widgets/custom_page_route.dart';
import '../widgets/passwordTextField.dart';

import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  //Text editing controllers
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _phoneNumberController.dispose();
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
          width: size.width,
          height: size.height -
              _appBar.preferredSize.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          color: theme.primaryColorDark,
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
                  child: Text(
                    'Hi,',
                    style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Text(
                    'Welcome to charted.',
                    style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.04,
                ),

                //Name text field
                TextFieldCustom(
                  'Name',
                  _nameController,
                  _nameValidator,
                ),

                SizedBox(
                  height: size.height * 0.04,
                ),

                //Username text field
                TextFieldCustom(
                  'Username',
                  _usernameController,
                  _usernameValidator,
                ),

                SizedBox(
                  height: size.height * 0.04,
                ),

                //Phone number text field
                TextFieldCustom(
                  'Phone Number',
                  _phoneNumberController,
                  _phoneNumberValidator,
                ),

                SizedBox(
                  height: size.height * 0.04,
                ),

                //Email text field
                TextFieldCustom(
                  'Email',
                  _emailController,
                  _emailValidator,
                ),

                SizedBox(
                  height: size.height * 0.04,
                ),

                //Password text field
                PasswordTextField(
                  'Password',
                  _passwordController,
                  _passwordValidator,
                ),

                Spacer(),

                //Sign Up Button
                WideButton(theme.accentColor, 'Sign Up', () async {
                  if (_formKey.currentState!.validate()) {
                    //Send Create User Request
                    final _userData = RegisterUser(
                      _nameController.text,
                      _emailController.text,
                      _usernameController.text,
                      _passwordController.text,
                      _phoneNumberController.text,
                    );

                    try {
                      final _response = await registerUser(_userData);

                      if (_response.statusCode == 200) {
                        //Set user pref
                        final _body = json.decode(_response.body);
                        UserPreferences.setToken(_body['token']);
                        //Navigate to Home screen
                        Navigator.of(context).pushReplacement(
                          CustomPageRoute(
                            HomeScreen(),
                          ),
                        );
                      } else {
                        print(_response.body);
                      }
                    } on Exception catch (e) {
                      print(e.toString());
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
  Future<http.Response> registerUser(RegisterUser _user) {
    return http.post(
      Uri.parse('https://charted-server.herokuapp.com/api/users'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(_user),
    );
  }

  //Name validator
  String? _nameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Name can\'t be empty';
    }
    return null;
  }

  //username validator
  String? _usernameValidator(value) {
    String pattern = r"^[a-z0-9_-]{3,15}$";
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Username can\'t be empty';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid input';
    }
    return null;
  }

  //phone number validator
  String? _phoneNumberValidator(value) {
    String pattern =
        r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$";
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Phone number can\'t be empty';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid input';
    }
    return null;
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
