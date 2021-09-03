import 'package:charted/widgets/wallet_details_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/wideButton.dart';

class AccountScreen extends StatelessWidget {
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
          onPressed: () {},
          icon: Icon(
            Icons.menu_rounded,
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
            _userInfoCard(_theme, _size, 'Mizanali Panjwani', 'aliJ',
                'mizanalip@gmail.com', '1234567890'),

            SizedBox(
              height: _size.height * 0.02,
            ),

            //Wallet Card
            WalletDetailsCard(_theme, _size, '1000000'),

            Spacer(),

            //Signout Button
            WideButton(_theme.highlightColor, 'Sign Out', () {}),

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
