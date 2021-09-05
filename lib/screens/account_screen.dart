import 'package:charted/models/user_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import '../widgets/wallet_details_card.dart';
import '../screens/login_screen.dart';
import '../utils/user_prefs.dart';
import '../widgets/custom_page_route.dart';
import '../widgets/wideButton.dart';

import 'package:http/http.dart' as http;

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late UserDetails _user;
  bool _isLoading = true;

  //Get User Data
  void getUserData() async {
    final String _token = UserPreferences.getToken() ?? '';

    try {
      http.Response _response = await http.get(
        Uri.parse('https://charted-server.herokuapp.com/api/auth'),
        headers: {
          'x-auth-token': _token,
        },
      );

      if (_response.statusCode == 200) {
        Map<String, dynamic> _body =
            json.decode(_response.body) as Map<String, dynamic>;

        UserDetails _data = UserDetails.fromJson(_body);

        setState(() {
          _user = _data;
          _isLoading = false;
        });
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    //Appbar
    final _appBar = AppBar(
      title: Text(
        'Account',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _isLoading = true;
            });
            getUserData();
          },
          icon: Icon(
            Icons.refresh_rounded,
            color: Colors.white,
            size: 25.0,
          ),
        )
      ],
      backgroundColor: _theme.primaryColorDark,
      elevation: 2,
    );

    return Scaffold(
      appBar: _appBar,
      body: Container(
        color: _theme.primaryColorDark,
        width: _size.width,
        height: _size.height -
            _appBar.preferredSize.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _size.height * 0.02,
            ),

            //User Details Card
            _isLoading
                ? Container()
                : _userInfoCard(_theme, _size, _user.name, _user.username,
                    _user.email, _user.phoneNumber),

            SizedBox(
              height: _size.height * 0.02,
            ),

            //Wallet Card
            _isLoading
                ? Container()
                : WalletDetailsCard(
                    theme: _theme,
                    size: _size,
                    balance: _user.balance.toStringAsFixed(2),
                    email: _user.email,
                    name: _user.name,
                    phoneNumber: _user.phoneNumber,
                  ),

            Spacer(),

            //Signout Button
            WideButton(_theme.highlightColor, 'Sign Out', () {
              //Delete token
              UserPreferences.removeToken();
              //Navigate to Login Screen
              Navigator.of(context).pushReplacement(
                CustomPageRoute(
                  LoginScreen(),
                ),
              );
            }),

            SizedBox(
              height: _size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  Widget _userInfoCard(
    final theme,
    final size,
    String name,
    String username,
    String email,
    String phoneNumber,
  ) {
    return Container(
      height: size.height * 0.25,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Name
          Container(
            width: size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  size: 25,
                  color: theme.highlightColor,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  name,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          //Username
          Container(
            width: size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.alternate_email_rounded,
                  size: 25,
                  color: theme.highlightColor,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  '@' + username,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          //Phone Number
          Container(
            width: size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.phone_rounded,
                  size: 25,
                  color: theme.highlightColor,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  phoneNumber,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          //Email
          Container(
            width: size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.email_rounded,
                  size: 25,
                  color: theme.highlightColor,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  email,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
