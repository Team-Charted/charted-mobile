import 'package:charted/models/leaderboard_data.dart';
import 'package:charted/widgets/chart_banner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardDetailsScreen extends StatelessWidget {
  final Color _bannerColor;
  final String _title;
  final String _issue;

  LeaderboardDetailsScreen(this._bannerColor, this._title, this._issue);

  final List<LeaderboardData> _data = [
    LeaderboardData('1', 'mizanxali', '180'),
    LeaderboardData('2', 'zaid', '178.5'),
    LeaderboardData('3', 'neel_boi', '160'),
    LeaderboardData('4', 'cuber69', '150'),
    LeaderboardData('5', 'sharma.aman', '140'),
    LeaderboardData('6', 'smit.barmase', '130'),
    LeaderboardData('7', 'itsaadarsh', '120'),
    LeaderboardData('8', 'usktuber', '110'),
    LeaderboardData('9', 'chiru69', '90'),
    LeaderboardData('10', 'mizanxali', '180'),
    LeaderboardData('11', 'zaid', '178.5'),
    LeaderboardData('12', 'neel_boi', '160'),
    LeaderboardData('13', 'cuber69', '150'),
    LeaderboardData('14', 'sharma.aman', '140'),
    LeaderboardData('15', 'smit.barmase', '130'),
    LeaderboardData('16', 'itsaadarsh', '120'),
    LeaderboardData('17', 'usktuber', '110'),
    LeaderboardData('18', 'chiru69', '90'),
    LeaderboardData('19', 'mizanxali', '180'),
    LeaderboardData('20', 'zaid', '178.5'),
    LeaderboardData('21', 'neel_boi', '160'),
    LeaderboardData('22', 'cuber69', '150'),
    LeaderboardData('23', 'sharma.aman', '140'),
    LeaderboardData('24', 'smit.barmase', '130'),
    LeaderboardData('25', 'itsaadarsh', '120'),
    LeaderboardData('26', 'usktuber', '110'),
    LeaderboardData('27', 'chiru69', '90'),
  ];

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
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: _theme.highlightColor,
                        ),
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      final item = _data[index];

                      //List tile
                      return ListTile(
                        tileColor: _theme.primaryColor,
                        leading: Text(
                          item.getId(),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        title: Text(
                          item.getUsername(),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        trailing: Text(
                          item.getPoints(),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: _theme.highlightColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
