import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/song_data.dart';
import '../widgets/chart_banner.dart';

class MyAlbumScreen extends StatefulWidget {
  final String _id;
  final Color _bannerColor;
  final String _title;
  final String _issue;
  final List<Song> _songs;

  MyAlbumScreen(
      this._id, this._bannerColor, this._title, this._issue, this._songs);

  @override
  _MyAlbumScreenState createState() => _MyAlbumScreenState();
}

class _MyAlbumScreenState extends State<MyAlbumScreen> {
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
                    itemCount: widget._songs.length,
                    itemBuilder: (context, index) {
                      final item = widget._songs[index];

                      //List tile
                      return ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        tileColor: _theme.primaryColor,
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
                                FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/charted.png',
                                  image: item.imageURL,
                                  fit: BoxFit.cover,
                                  width: _size.width * 0.2,
                                  height: _size.width * 0.2,
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/charted.png',
                                      fit: BoxFit.cover,
                                      width: _size.width * 0.2,
                                      height: _size.width * 0.2,
                                    );
                                  },
                                ),
                              ]),
                        ),
                        title: Text(
                          item.getTitle(),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          item.getArtist(),
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: _theme.highlightColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        trailing: Container(
                          width: _size.width * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              item.leadSingle
                                  ? Icon(
                                      Icons.stars_rounded,
                                      color: _theme.accentColor,
                                      size: 30,
                                    )
                                  : Container(),
                              Text(
                                item.value.toStringAsFixed(2),
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  color: _theme.highlightColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
