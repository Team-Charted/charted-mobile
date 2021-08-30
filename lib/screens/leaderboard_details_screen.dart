import 'package:charted/widgets/chart_banner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardDetailsScreen extends StatelessWidget {
  final Color _bannerColor;
  final String _title;
  final String _issue;

  LeaderboardDetailsScreen(this._bannerColor, this._title, this._issue);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: _size.height * 0.02,
            ),

            //Chart Banner
            ChartBanner(
                theme: _theme,
                size: _size,
                title: _title,
                bannerColor: _bannerColor,
                issue: _issue),

            SizedBox(
              height: _size.height * 0.02,
            ),

            //Main List View
            Expanded(
              child: Container(
                width: _size.width * 0.9,
                color: _theme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
