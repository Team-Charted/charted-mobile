import 'package:charted/widgets/custom_page_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/leaderboard_details_screen.dart';

class LeaderboardCard extends StatelessWidget {
  final String title;
  final Color cardColor;
  final String prizePool;
  final String winnings;
  final String issue;

  LeaderboardCard({
    required this.title,
    required this.cardColor,
    required this.prizePool,
    required this.winnings,
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

                //Prize pool
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),

                //Winnings
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.military_tech_rounded,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: size.width * 0.005,
                    ),
                    Text(
                      '\$' + winnings,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Date and View button
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

                //View Button
                IconButton(
                  onPressed: () {
                    print('Show ' + title + ' leaderboard');

                    //Custom Navigation
                    Navigator.of(context).push(
                      CustomPageRoute(
                        LeaderboardDetailsScreen(
                            this.cardColor, this.title, this.issue),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.leaderboard_rounded,
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
