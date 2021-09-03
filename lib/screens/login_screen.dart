import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/textFieldCustom.dart';
import '../widgets/wideButton.dart';
import 'sign_up_screen.dart';
import '../screens/home_screen.dart';
import '../utils/user_prefs.dart';
import '../widgets/custom_page_route.dart';
import '../widgets/passwordTextField.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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
                TextFieldCustom('Email', _emailValidator),

                SizedBox(
                  height: size.height * 0.04,
                ),

                //PasswordTextField
                //TextFieldCustom('Password', _passwordValidator),
                PasswordTextField('Password', _passwordValidator),

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
                    print('Signing user in');
                    //Login
                    await UserPreferences.setToken(
                        'Some Random token that is not null');
                    //Navigate to Home Screen
                    Navigator.of(context).pushReplacement(
                      CustomPageRoute(
                        HomeScreen(),
                      ),
                    );
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
