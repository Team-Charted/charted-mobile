import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/song_data.dart';

class SongResultListTile extends StatelessWidget {
  final int index;
  final Song item;

  const SongResultListTile(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      tileColor: _theme.primaryColor,
      leading: Image.network(
        item.imageURL,
        fit: BoxFit.fill,
        width: _size.width * 0.2,
        height: _size.width * 0.2,
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
      trailing: Container(
        width: _size.width * 0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Cost
            Text(
              '8.5',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _theme.highlightColor,
              ),
            ),

            //Add Button
            IconButton(
              onPressed: () {
                print('Item at ' +
                    index.toString() +
                    ' ' +
                    item.getTitle() +
                    ' added to album');
              },
              icon: Icon(
                Icons.add_circle_outline_rounded,
                color: _theme.accentColor,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
