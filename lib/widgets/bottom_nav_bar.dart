import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart_rounded),
          label: 'Charts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_rounded),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Account',
        ),
      ],
      //currentIndex: _selectedIndex,
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
      onTap: _navButtonTapped,
    );
  }

  //on tap
  void _navButtonTapped(int index) {
    //Navigate to index selected
    print('Button Pressed');
  }
}
