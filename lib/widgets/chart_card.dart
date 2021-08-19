import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChartCard extends StatelessWidget {
  final String title;
  final Color cardColor;
  final String prizePool;
  final String cost;
  final String time;

  ChartCard(
      {required this.title,
      required this.cardColor,
      required this.prizePool,
      required this.cost,
      required this.time});

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
                Text(
                  time,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),

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
                        '\$' + prizePool,
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
                        '\$' + cost,
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
            width: size.width * 0.85,
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
                  'Week of July 17 2021',
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
                  },
                  icon: Icon(
                    Icons.add_circle_outline_rounded,
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
