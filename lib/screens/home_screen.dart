import 'package:charted/screens/account_screen.dart';
import 'package:charted/screens/charts_screen.dart';
import 'package:charted/screens/leaderboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _screens = [
    ChartsScreen(),
    LeaderboardScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: IndexedStack(
        children: _screens,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_rounded),
            label: 'Charts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Account',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: theme.accentColor,
        backgroundColor: theme.primaryColorDark,
        unselectedItemColor: theme.highlightColor,
        elevation: 8,
        iconSize: 30.0,
        selectedLabelStyle: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: theme.accentColor,
          ),
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: theme.highlightColor,
          ),
        ),
      ),
    );
  }
}
