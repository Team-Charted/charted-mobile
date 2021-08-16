import 'package:flutter/material.dart';

import '../widgets/textFieldCustom.dart';
import '../widgets/wideButton.dart';

class SignUpScreen extends StatelessWidget {
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
          width: size.width,
          height: size.height -
              _appBar.preferredSize.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          color: theme.primaryColorDark,
          alignment: Alignment.topCenter,
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
                  style: theme.textTheme.headline2,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width * 0.8,
                child: Text(
                  'Welcome to charted.',
                  style: theme.textTheme.headline1,
                ),
              ),

              SizedBox(
                height: size.height * 0.04,
              ),

              //Name text field
              TextFieldCustom('Name', () {}),

              SizedBox(
                height: size.height * 0.04,
              ),

              //Username text field
              TextFieldCustom('Username', () {}),

              SizedBox(
                height: size.height * 0.04,
              ),

              //Phone number text field
              TextFieldCustom('Phone Number', () {}),

              SizedBox(
                height: size.height * 0.04,
              ),

              //Email text field
              TextFieldCustom('Email', () {}),

              SizedBox(
                height: size.height * 0.04,
              ),

              //Password text field
              TextFieldCustom('Password', () {}),

              Spacer(),

              //Sign Up Button
              WideButton(theme.accentColor, 'Sign Up', () {
                print('Button was pressed');
              }),

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
