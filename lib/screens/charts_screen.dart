import 'package:charted/models/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    //Charts data
    final List<ChartData> _charts = [
      ChartData(
        '1',
        'Billboard Hot 100',
        50,
        'Weekly',
        '2021-07-12',
        '1234567891234',
        0,
      ),
      ChartData(
        '2',
        'Spotify Top 200: Global',
        25,
        'Daily',
        '2021-07-12',
        '1234567891234',
        0,
      ),
      ChartData(
        '3',
        'Billboard Hot 100',
        50,
        'Weekly',
        '2021-07-12',
        '1234567891234',
        0,
      ),
      ChartData(
        '4',
        'Spotify Top 200: Global',
        25,
        'Daily',
        '2021-07-12',
        '1234567891234',
        0,
      ),
      ChartData(
        '5',
        'Billboard Hot 100',
        50,
        'Weekly',
        '2021-07-12',
        '1234567891234',
        0,
      ),
      ChartData(
        '6',
        'Spotify Top 200: Global',
        25,
        'Daily',
        '2021-07-12',
        '1234567891234',
        0,
      ),
    ];

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
        child: Container(
          width: _size.width * 0.9,

          //Main List View

          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: _size.height * 0.02,
                  ),
              itemCount: _charts.length,
              itemBuilder: (context, index) {
                final item = _charts[index];

                //Determine color of card
                final _bgColor = (item.name == 'Billboard Hot 100')
                    ? _billboardBlue
                    : _spotifyGreen;

                //Determine issue
                final String _issue = (item.type == 'Weekly')
                    ? 'Week of ' + item.date
                    : 'Day of ' + item.date;

                return ChartCard(
                  title: item.getName(),
                  cardColor: _bgColor,
                  prizePool: item.get_v().toString(),
                  cost: item.cost.toString(),
                  time: item.endTime,
                  issue: _issue,
                );
              }),
        ),
      ),
    );
  }
}
