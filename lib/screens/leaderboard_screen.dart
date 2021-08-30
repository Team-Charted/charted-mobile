import 'package:charted/models/chart_data.dart';
import 'package:charted/models/result_chart.dart';
import 'package:charted/models/result_data.dart';
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

    //Result Data
    final List<Result> _results = [
      Result(
        '611ed0d18fafe12e9c6e3942',
        ResultChart(
          '6111311849009b0df46203ae',
          'Billboard Hot 100',
          10000,
          25,
          'Weekly',
        ),
        '2021-08-21',
        '2021-08-19T21:44:49.451Z',
        0,
      ),
      Result(
        '611ed0d18fafe12e9c6e3942',
        ResultChart(
          '6111311849009b0df46203ae',
          'Spotify Top 200: Global',
          10000,
          25,
          'Daily',
        ),
        '2021-08-21',
        '2021-08-19T21:44:49.451Z',
        0,
      ),
    ];

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
        child: Container(
          width: _size.width * 0.9,

          //Main List View

          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: _size.height * 0.02,
                  ),
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final item = _results[index];

                //Determine color of card
                final _bgColor = (item.chart.name == 'Billboard Hot 100')
                    ? _billboardBlue
                    : _spotifyGreen;

                //Determine issue
                final String _issue = (item.chart.type == 'Weekly')
                    ? 'Week of ' + item.date
                    : 'Day of ' + item.date;

                return LeaderboardCard(
                  title: item.chart.getName(),
                  cardColor: _bgColor,
                  prizePool: item.chart.prizePool.toString(),
                  winnings: item.chart.cost.toString(),
                  issue: _issue,
                );
              }),
        ),
      ),
    );
  }
}
