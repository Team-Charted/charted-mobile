import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/chart_card.dart';

class ChartsScreen extends StatefulWidget {
  @override
  _ChartsScreenState createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    final Color _billboardBlue = Color.fromRGBO(48, 193, 242, 1);
    final Color _spotifyGreen = Color.fromRGBO(39, 163, 112, 1);
    final Color _appleMusicRed = Color.fromRGBO(225, 32, 54, 1);

    //Appbar
    final _appBar = AppBar(
      title: Text(
        'Charts',
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

    //Bottom Navigation bar
    final _bottomNavigationBar = BottomNavBar();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _size.height * 0.02,
            ),

            //Billboard Chart
            ChartCard(
              title: 'Billboard Hot 100',
              cardColor: _billboardBlue,
              cost: '30',
              prizePool: '150000',
              time: '10 : 02 : 30',
            ),

            SizedBox(
              height: _size.height * 0.02,
            ),

            //Spotify Chart
            ChartCard(
              title: 'Spotify Global Top 50',
              cardColor: _spotifyGreen,
              cost: '25',
              prizePool: '100000',
              time: '12 : 00 : 45',
            ),

            SizedBox(
              height: _size.height * 0.02,
            ),

            //Billboard Chart
            ChartCard(
              title: 'Apple Music Top 50',
              cardColor: _appleMusicRed,
              cost: '20',
              prizePool: '80000',
              time: '08 : 10 : 15',
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }
}
