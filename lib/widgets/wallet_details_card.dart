import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletDetailsCard extends StatelessWidget {
  final theme;
  final size;
  final String balance;

  const WalletDetailsCard(this.theme, this.size, this.balance);

  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.28,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: theme.accentColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //title
          Text(
            'My Wallet',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          //Amount
          Text(
            '\$' + balance,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          //Icon Buttons
          Container(
            width: size.width * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Add Button
                _walletCardIconButton(
                    theme, size, 'Add', Icons.arrow_downward_rounded),

                //Withdraw Button
                _walletCardIconButton(
                    theme, size, 'Withdraw', Icons.arrow_upward_rounded),

                //History Button
                _walletCardIconButton(
                    theme, size, 'More', Icons.more_horiz_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _walletCardIconButton(
    final theme,
    final size,
    String label,
    IconData icon,
  ) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Icon
          GestureDetector(
            onTap: () {
              print(label + ' button pressed');
            },
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColorDark,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),

          //Label
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
