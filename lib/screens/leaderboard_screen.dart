import 'package:charted/widgets/leaderboard_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardScreen extends StatelessWidget {
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
        'Leaderboard',
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
      //Appbar
      appBar: _appBar,

      //body
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
            LeaderboardCard(
              title: 'Billboard Hot 100',
              cardColor: _billboardBlue,
              prizePool: '150000',
              winnings: '300',
              dateOfIssue: 'Week of July 15 2021',
            ),
            SizedBox(
              height: _size.height * 0.02,
            ),
            LeaderboardCard(
              title: 'Spotify Global Top 50',
              cardColor: _spotifyGreen,
              prizePool: '100000',
              winnings: '200',
              dateOfIssue: 'Week of July 8 2021',
            ),
            SizedBox(
              height: _size.height * 0.02,
            ),
            LeaderboardCard(
              title: 'Apple Music Top 50',
              cardColor: _appleMusicRed,
              prizePool: '80000',
              winnings: '150',
              dateOfIssue: 'Week of July 8 2021',
            ),
          ],
        ),
      ),
    );
  }
}
