import 'package:charted/providers/create_album_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_page_route.dart';
import '../widgets/smallButton.dart';
import '../screens/confirm_album_screen.dart';
import '../widgets/chart_banner.dart';
import '../widgets/song_result_list_tile.dart';

class CreateAlbumScreen extends StatefulWidget {
  final String _chartId;
  final String _title;
  final Color _bannerColor;
  final String _issue;

  CreateAlbumScreen(this._title, this._bannerColor, this._issue, this._chartId);

  @override
  _CreateAlbumScreenState createState() => _CreateAlbumScreenState();
}

class _CreateAlbumScreenState extends State<CreateAlbumScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CreateAlbum>(context, listen: false).searchResults.clear();
    Provider.of<CreateAlbum>(context, listen: false).selectedSongs.clear();
    Provider.of<CreateAlbum>(context, listen: false).getAlbum(widget._chartId);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    //Colors
    final Color _billboardBlue = Color.fromRGBO(48, 193, 242, 1);
    //final Color _spotifyGreen = Color.fromRGBO(39, 163, 112, 1);
    //final Color _appleMusicRed = Color.fromRGBO(225, 32, 54, 1);

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
              'Credits : ' + context.watch<CreateAlbum>().credits.toString(),
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
              bannerColor: widget._bannerColor,
              size: _size,
              theme: _theme,
              issue: widget._issue,
              title: widget._title,
            ),

            SizedBox(
              height: _size.height * 0.01,
            ),

            //Textfield
            Container(
              width: _size.width * 0.9,
              child: TextField(
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
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
                onSubmitted: (value) =>
                    context.read<CreateAlbum>().searchSongs(value),
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
                  itemCount: context.watch<CreateAlbum>().searchResults.length,
                  itemBuilder: (context, index) {
                    final item =
                        context.watch<CreateAlbum>().searchResults[index];

                    //List Tile
                    return SongResultListTile(
                        index,
                        item,
                        Icon(
                          Icons.add_circle_outline_rounded,
                          size: 25.0,
                          color: _theme.accentColor,
                        ),
                        () => context.read<CreateAlbum>().addSong(item));
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
                        context.watch<CreateAlbum>().selectedSongs,
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
                          widget._chartId,
                          widget._bannerColor,
                          widget._title,
                          widget._issue,
                          Provider.of<CreateAlbum>(context, listen: false)
                              .credits,
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
            return SongResultListTile(
                index,
                item,
                Icon(
                  Icons.remove_circle_outline,
                  size: 25.0,
                  color: _theme.accentColor,
                ),
                () => context.read<CreateAlbum>().removeSong(item));
          },
        ),
      );
}
