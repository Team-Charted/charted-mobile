import 'package:charted/providers/user_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/wallet_details_card.dart';
import '../screens/login_screen.dart';
import '../utils/user_prefs.dart';
import '../widgets/custom_page_route.dart';
import '../widgets/wideButton.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<UserDetails>(context, listen: false).getUserData();
    setState(() {
      _isLoading = false;
    });
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
            Provider.of<UserDetails>(context, listen: false).getUserData();
            setState(() {
              _isLoading = false;
            });
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
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: _theme.accentColor,
                      ),
                    ),
                  )
                : _userInfoCard(
                    _theme,
                    _size,
                    context.read<UserDetails>().name,
                    context.read<UserDetails>().username,
                    context.read<UserDetails>().email,
                    context.read<UserDetails>().phoneNumber),

            SizedBox(
              height: _size.height * 0.02,
            ),

            //Wallet Card
            _isLoading
                ? Container()
                : WalletDetailsCard(
                    theme: _theme,
                    size: _size,
                    balance:
                        context.watch<UserDetails>().balance.toStringAsFixed(2),
                    email: context.read<UserDetails>().email,
                    name: context.read<UserDetails>().name,
                    phoneNumber: context.read<UserDetails>().phoneNumber,
                  ),

            Spacer(),

            //Signout Button
            WideButton(_theme.highlightColor, 'Sign Out', () {
              //Delete token
              UserPreferences.removeToken();
              //Navigate to Login Screen
              Navigator.of(context).pushAndRemoveUntil(
                  CustomPageRoute(
                    LoginScreen(),
                  ),
                  (route) => false);
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
