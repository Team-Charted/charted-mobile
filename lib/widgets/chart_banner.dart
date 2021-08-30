import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChartBanner extends StatelessWidget {
  final theme;
  final size;
  final String title;
  final Color bannerColor;
  final String issue;

  ChartBanner(
      {required this.theme,
      required this.size,
      required this.title,
      required this.bannerColor,
      required this.issue});

  @override
  Widget build(BuildContext context) {
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
