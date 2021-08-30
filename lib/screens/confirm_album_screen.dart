import 'package:charted/models/song_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/chart_banner.dart';

class ConfirmAlbumScreen extends StatelessWidget {
  final Color _bannerColor;
  final String _title;
  final String _issue;
  final double _credits;

  ConfirmAlbumScreen(
      this._bannerColor, this._title, this._issue, this._credits);

  final List<Song> _songsData = [
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: true,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
    Song(
      title: 'God’s Plan',
      artist: 'Drake',
      imageURL:
          'https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg',
      credits: 8.5,
      leadSingle: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    //Appbar
    final _appBar = AppBar(
      title: Text(
        'Confirm Album',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        Container(
          child: Center(
            child: Text(
              'Credits : ' + _credits.toString(),
              style: GoogleFonts.inter(
                color: _theme.highlightColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
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
                title: _title,
                bannerColor: _bannerColor,
                issue: _issue),

            SizedBox(
              height: _size.height * 0.02,
            ),

            Expanded(
              child: Container(
                width: _size.width * 0.9,
                child: Stack(
                  children: [
                    //List View
                    ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: _theme.highlightColor,
                      ),
                      itemCount: _songsData.length,
                      itemBuilder: (context, index) {
                        final item = _songsData[index];

                        //List tile
                        return ListTile(
                          tileColor: _theme.primaryColor,
                          onTap: () {
                            //Change lead artist
                            print('List tile of index ' +
                                index.toString() +
                                ' pressed');
                          },
                          leading: Image.network(
                            item.imageURL,
                            fit: BoxFit.fill,
                            width: _size.height * 0.08,
                            height: _size.height * 0.1,
                          ),
                          title: Text(
                            item.getTitle(),
                            style: GoogleFonts.inter(
                              fontSize: 16,
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
                      },
                    ),

                    //Confirm Button
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            //Save and register album
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Confirm',
                            style: GoogleFonts.inter(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: _theme.accentColor,
                            minimumSize: Size(
                              _size.width * 0.35,
                              _size.height * 0.055,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
