import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import '../models/leaderboard_data.dart';
import '../widgets/chart_banner.dart';
import '../widgets/custom_page_route.dart';
import '../screens/my_album_screen.dart';
import '../utils/user_prefs.dart';

import 'package:http/http.dart' as http;

class LeaderboardDetailsScreen extends StatefulWidget {
  final String _id;
  final Color _bannerColor;
  final String _title;
  final String _issue;

  LeaderboardDetailsScreen(
      this._id, this._bannerColor, this._title, this._issue);

  @override
  _LeaderboardDetailsScreenState createState() =>
      _LeaderboardDetailsScreenState();
}

class _LeaderboardDetailsScreenState extends State<LeaderboardDetailsScreen> {
  List<LeaderboardData> _rankings = [
    LeaderboardData('1', 'mizanxali', 180),
    LeaderboardData('2', 'zaid', 178.5),
    LeaderboardData('3', 'neel_boi', 160),
  ];

  //Get Leaderboard Data
  void getChartResult(String _id) async {
    final String _token = UserPreferences.getToken() ?? '';

    try {
      http.Response _response = await http.get(
        Uri.parse('https://charted-server.herokuapp.com/api/results/' + _id),
        headers: {
          'x-auth-token': _token,
        },
      );

      if (_response.statusCode == 200) {
        List _body = json.decode(_response.body) as List;

        List<LeaderboardData> _data = _body.map((e) {
          return LeaderboardData.fromJson(e);
        }).toList();

        print(_data.toString());

        setState(() {
          _rankings.clear();
          _rankings = []..addAll(_data);
        });
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getChartResult(widget._id);
  }

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
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              CustomPageRoute(
                MyAlbumScreen(
                  this.widget._id,
                  this.widget._bannerColor,
                  this.widget._title,
                  this.widget._issue,
                ),
              ),
            );
          },
          icon: Icon(
            Icons.album_rounded,
            color: _theme.accentColor,
            size: 30.0,
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
                title: widget._title,
                bannerColor: widget._bannerColor,
                issue: widget._issue),

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
                    itemCount: _rankings.length,
                    itemBuilder: (context, index) {
                      final item = _rankings[index];

                      //List tile
                      return ListTile(
                        tileColor: _theme.primaryColor,
                        leading: Text(
                          (index + 1).toString(),
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
                          item.getPoints().toStringAsFixed(2),
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
