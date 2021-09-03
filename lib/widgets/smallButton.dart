import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatelessWidget {
  final Color _primaryColor;
  final String _buttonText;
  final Function() _action;

  SmallButton(this._primaryColor, this._buttonText, this._action);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: _action,
      child: Text(
        _buttonText,
        style: GoogleFonts.inter(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: _primaryColor,
        minimumSize: Size(
          _size.width * 0.35,
          _size.height * 0.055,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
