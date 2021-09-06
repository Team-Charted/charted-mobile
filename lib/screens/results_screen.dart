import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import '../models/result_data.dart';
import '../widgets/result_card.dart';
import '../models/chart_data.dart';
import '../utils/user_prefs.dart';

import 'package:http/http.dart' as http;

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  //Result Data
  List<ResultData> _results = [];
  bool _isLoading = true;

  //Get results Data
  void fetchResults() async {
    final String _token = UserPreferences.getToken() ?? '';

    try {
      http.Response _response = await http.get(
        Uri.parse('https://charted-server.herokuapp.com/api/results'),
        headers: {
          'x-auth-token': _token,
        },
      );

      if (_response.statusCode == 200) {
        List _body = json.decode(_response.body) as List;

        List<ResultData> _data = _body.map((e) {
          e['chart'] = ChartData.fromJson(e['chart']);
          return ResultData.fromJson(e);
        }).toList();

        setState(() {
          _results.clear();
          _results = []..addAll(_data);
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
    fetchResults();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    final Color _billboardBlue = Color.fromRGBO(48, 193, 242, 1);
    final Color _spotifyGreen = Color.fromRGBO(39, 163, 112, 1);
    //final Color _appleMusicRed = Color.fromRGBO(225, 32, 54, 1);

    //Appbar
    final _appBar = AppBar(
      title: Text(
        'Results',
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
            fetchResults();
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

          child: _isLoading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: _theme.accentColor,
                    ),
                  ),
                )
              : ListView.separated(
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

                    return ResultCard(
                      id: item.getId(),
                      title: item.chart.getName(),
                      cardColor: _bgColor,
                      prizePool: item.chart.prizePool.toString(),
                      winnings: item.winnings.toString(),
                      issue: _issue,
                    );
                  }),
        ),
      ),
    );
  }
}
