import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_page_route.dart';
import '../widgets/smallButton.dart';
import '../models/song_data.dart';
import '../screens/confirm_album_screen.dart';
import '../widgets/chart_banner.dart';
import '../widgets/song_result_list_tile.dart';

class CreateAlbumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    //Colors
    final Color _billboardBlue = Color.fromRGBO(48, 193, 242, 1);
    //final Color _spotifyGreen = Color.fromRGBO(39, 163, 112, 1);
    //final Color _appleMusicRed = Color.fromRGBO(225, 32, 54, 1);

    //Search Data
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
      actions: [
        Container(
          child: Center(
            child: Text(
              'Credits : 98.5',
              style: GoogleFonts.inter(
                color: _theme.highlightColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _size.height * 0.01,
            ),

            //Banner
            ChartBanner(
              bannerColor: _billboardBlue,
              size: _size,
              theme: _theme,
              issue: 'Week of July 31 2021',
              title: 'Billboard Hot 100',
            ),

            SizedBox(
              height: _size.height * 0.01,
            ),

            //Textfield
            Container(
              width: _size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: _theme.highlightColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: _theme.highlightColor,
                    ),
                  ),
                  filled: true,
                  fillColor: _theme.primaryColor,
                  labelText: 'Search',
                  labelStyle: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: _theme.highlightColor,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: _size.height * 0.01,
            ),

            //Main list View
            Expanded(
              child: Container(
                width: _size.width * 0.9,
                child:
                    //List View
                    ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: _theme.highlightColor,
                  ),
                  itemCount: _songsData.length,
                  itemBuilder: (context, index) {
                    final item = _songsData[index];

                    //List Tile
                    return SongResultListTile(index, item);
                  },
                ),
              ),
            ),

            SizedBox(
              height: _size.height * 0.01,
            ),

            //Buttons
            Container(
              width: _size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SmallButton(
                    _theme.highlightColor, 'Preview',
                    //Open Bottom Modal Sheet
                    () => showModalBottomSheet(
                      context: context,
                      builder: (context) => _previewSheet(
                        _theme,
                        _size,
                        _songsData,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      //backgroundColor: Colors.transparent,
                    ),
                  ),
                  SmallButton(_theme.accentColor, 'Save', () {
                    //Navigate to Confirm Album Screen
                    print('Save Button Pressed');
                    Navigator.of(context).push(
                      CustomPageRoute(
                        ConfirmAlbumScreen(
                          _billboardBlue,
                          'Billboard Hot 100',
                          'Week of July 31 2021',
                          7.5,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),

            SizedBox(
              height: _size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  Widget _previewSheet(final _theme, final _size, final _songsData) =>
      Container(
        decoration: BoxDecoration(
          color: _theme.primaryColorDark,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: _theme.highlightColor,
          ),
          itemCount: _songsData.length,
          itemBuilder: (context, index) {
            final item = _songsData[index];

            //List tile
            return SongResultListTile(index, item);
          },
        ),
      );
}
