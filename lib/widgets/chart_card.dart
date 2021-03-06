import 'package:charted/widgets/countdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_page_route.dart';
import '../screens/create_album_screen.dart';

class ChartCard extends StatelessWidget {
  final String chartId;
  final String title;
  final Color cardColor;
  final String prizePool;
  final String cost;
  final String time;
  final String issue;

  ChartCard({
    required this.chartId,
    required this.title,
    required this.cardColor,
    required this.prizePool,
    required this.cost,
    required this.time,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.24,
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Chart details
          Container(
            height: size.height * 0.18,
            width: size.width * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Title
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //Time remaining
                CountDown(time),

                //Prize and fee
                Container(
                  width: size.width * 0.75,
                  child: Row(
                    children: [
                      //Prize pool
                      Icon(
                        Icons.emoji_events_rounded,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: size.width * 0.005,
                      ),
                      Text(
                        '\???' + prizePool,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),

                      Spacer(),

                      //Fee
                      Icon(
                        Icons.sell_rounded,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: size.width * 0.005,
                      ),
                      Text(
                        '\???' + cost,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //Add and edit
          Container(
            width: size.width * 0.9,
            height: size.height * 0.06,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.05,
                ),

                //Date of issue
                Text(
                  issue,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),

                Spacer(),

                //Add/Edit
                IconButton(
                  onPressed: () {
                    print('Add ' + title + ' chart');
                    Navigator.of(context).push(
                      CustomPageRoute(
                        CreateAlbumScreen(this.title, this.cardColor,
                            this.issue, this.chartId),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),

                SizedBox(
                  width: size.width * 0.05,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
