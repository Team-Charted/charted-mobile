import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAlbumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    //Colors
    final Color _billboardBlue = Color.fromRGBO(48, 193, 242, 1);
    final Color _spotifyGreen = Color.fromRGBO(39, 163, 112, 1);
    final Color _appleMusicRed = Color.fromRGBO(225, 32, 54, 1);

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
                fontSize: 18,
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
              height: _size.height * 0.02,
            ),

            //Banner
            _chartBanner(_theme, _size, 'Billboard Hot 100', _billboardBlue,
                'Week of July 27, 2021'),

            SizedBox(
              height: _size.height * 0.02,
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
              height: _size.height * 0.02,
            ),

            //Main list View
            Expanded(
              child: Container(
                width: _size.width * 0.9,
                color: Colors.white,
              ),
            ),

            SizedBox(
              height: _size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  //Banner Widget
  Widget _chartBanner(
    final theme,
    final size,
    String title,
    Color bannerColor,
    String issue,
  ) {
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: bannerColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Title
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          //Issue
          Text(
            issue,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
