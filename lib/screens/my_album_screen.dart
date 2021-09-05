import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import '../models/song_data.dart';
import '../widgets/chart_banner.dart';
import '../utils/user_prefs.dart';

import 'package:http/http.dart' as http;

class MyAlbumScreen extends StatefulWidget {
  final String _id;
  final Color _bannerColor;
  final String _title;
  final String _issue;

  MyAlbumScreen(
    this._id,
    this._bannerColor,
    this._title,
    this._issue,
  );

  @override
  _MyAlbumScreenState createState() => _MyAlbumScreenState();
}

class _MyAlbumScreenState extends State<MyAlbumScreen> {
  List<Song> _songs = [
    Song(
      id: '1',
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      value: 8.5,
      leadSingle: false,
    ),
    Song(
      id: '2',
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      value: 8.5,
      leadSingle: true,
    ),
    Song(
      id: '3',
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      value: 8.5,
      leadSingle: false,
    ),
  ];

  void getAlbum(String _id) async {
    final _token = UserPreferences.getToken();

    try {
      http.Response _response = await http.post(
        Uri.parse('http://localhost:5000/api/results/' + _id + '/album'),
        headers: {'x-auth-token': _token as String},
      );

      if (_response.statusCode == 200) {
        final List<Song> _data = jsonDecode(_response.body);
        setState(() {
          _songs.clear();
          _songs = []..addAll(_data);
        });
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    //Appbar
    final _appBar = AppBar(
      title: Text(
        'My Album',
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
                    itemCount: _songs.length,
                    itemBuilder: (context, index) {
                      final item = _songs[index];

                      //List tile
                      return ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        tileColor: _theme.primaryColor,
                        onTap: () {
                          //Change lead artist
                          print('List tile of index ' +
                              index.toString() +
                              ' pressed');
                        },
                        leading: Container(
                          width: _size.width * 0.3,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Prediction
                                Text(
                                  (index + 1).toString(),
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                //Thumbnail
                                Image.network(
                                  item.imageURL,
                                  fit: BoxFit.fill,
                                  width: _size.width * 0.2,
                                  height: _size.width * 0.2,
                                ),
                              ]),
                        ),
                        title: Text(
                          item.getTitle(),
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          item.getArtist(),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: _theme.highlightColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        trailing: item.leadSingle
                            ? Icon(
                                Icons.stars_rounded,
                                color: _theme.accentColor,
                                size: 30,
                              )
                            : SizedBox(),
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
