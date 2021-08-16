import 'package:flutter/material.dart';

import '../widgets/textFieldCustom.dart';
import '../widgets/wideButton.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    //Appbar
    final _appBar = AppBar(
      title: Text(
        'charted',
        style: theme.textTheme.caption,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.025,
              ),

              //Headertext
              Text(
                'Glad to see you back,',
                style: theme.textTheme.headline2,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                'Let\'s sign you in.',
                style: theme.textTheme.headline1,
              ),

              SizedBox(
                height: size.height * 0.06,
              ),

              //emailTextfield
              TextFieldCustom('Email', () {}),

              SizedBox(
                height: size.height * 0.04,
              ),

              //PasswordTextField
              TextFieldCustom('Password', () {}),

              Spacer(),

              //sign up prompt
              Container(
                width: size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: theme.textTheme.headline6,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    GestureDetector(
                      //Navigate to Sign Up Screen
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: theme.textTheme.headline4,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.02,
              ),

              //Button
              WideButton(theme.accentColor, 'Sign In', () {}),

              SizedBox(
                height: size.height * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
