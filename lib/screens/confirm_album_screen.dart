import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/create_album_provider.dart';
import '../widgets/smallButton.dart';
import '../widgets/chart_banner.dart';

class ConfirmAlbumScreen extends StatelessWidget {
  final String _chartId;
  final Color _bannerColor;
  final String _title;
  final String _issue;
  final double _credits;

  ConfirmAlbumScreen(this._chartId, this._bannerColor, this._title, this._issue,
      this._credits);

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
              height: _size.height * 0.01,
            ),

            //Chart Banner
            ChartBanner(
                theme: _theme,
                size: _size,
                title: _title,
                bannerColor: _bannerColor,
                issue: _issue),

            SizedBox(
              height: _size.height * 0.01,
            ),

            Expanded(
              child: Container(
                width: _size.width * 0.9,
                child:
                    //List View
                    ReorderableListView.builder(
                  onReorder: (oldIndex, newIndex) =>
                      context.read<CreateAlbum>().reorder(oldIndex, newIndex),
                  itemCount: context.watch<CreateAlbum>().selectedSongs.length,
                  itemBuilder: (context, index) {
                    final item =
                        context.watch<CreateAlbum>().selectedSongs[index];

                    //List tile
                    return ListTile(
                      key: ValueKey(item.id),
                      contentPadding: EdgeInsets.all(0.0),
                      tileColor: _theme.primaryColor,
                      onTap: () {
                        //Change lead artist
                        context.read<CreateAlbum>().changeLeadIndex(index);
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
                      trailing: index == context.watch<CreateAlbum>().leadIndex
                          ? Icon(
                              Icons.stars_rounded,
                              color: _theme.accentColor,
                              size: 30,
                            )
                          : SizedBox(),
                    );
                  },
                ),
              ),
            ),

            SizedBox(
              height: _size.height * 0.01,
            ),

            //Confirm Button
            SmallButton(_theme.accentColor, 'Confirm', () {
              context.read<CreateAlbum>().createAlbum(_chartId, context);
            }),

            SizedBox(
              height: _size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
