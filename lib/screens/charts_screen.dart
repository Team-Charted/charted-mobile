import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/chart_card.dart';
import '../models/chart_data.dart';
import 'login_screen.dart';
import '../utils/user_prefs.dart';
import '../widgets/custom_page_route.dart';

import 'package:http/http.dart' as http;

class ChartsScreen extends StatefulWidget {
  @override
  _ChartsScreenState createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  //Charts data
  List<ChartData> _charts = [];
  bool isLoading = true;

  //Get Chart Data
  void fetchCharts() async {
    final String _token = UserPreferences.getToken() ?? '';

    try {
      http.Response _response = await http.get(
        Uri.parse('https://charted-server.herokuapp.com/api/charts'),
        headers: {
          'x-auth-token': _token,
        },
      );

      if (_response.statusCode == 200) {
        List _body = json.decode(_response.body) as List;

        List<ChartData> _data =
            _body.map((e) => ChartData.fromJson(e)).toList();

        setState(() {
          _charts.clear();
          _charts = []..addAll(_data);
          isLoading = false;
        });
      } else if (_response.statusCode == 401) {
        //User unauthorized
        //Logout and navigate
        //Snackbar
        final snackBar =
            SnackBar(content: Text('Session expired. Please login again'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        //Delete token
        UserPreferences.removeToken();
        Navigator.of(context).pushReplacement(
          CustomPageRoute(
            LoginScreen(),
          ),
        );
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCharts();
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
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            fetchCharts();
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
        child: Container(
          width: _size.width * 0.9,

          //Main List View

          child: isLoading
              ? Container()
              : ListView.separated(
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
                      chartId: item.id,
                      title: item.getName(),
                      cardColor: _bgColor,
                      prizePool: item.getPrizePool().toString(),
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
