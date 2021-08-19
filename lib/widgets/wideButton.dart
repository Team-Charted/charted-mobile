import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WideButton extends StatelessWidget {
  final Color _primaryColor;
  final String _buttonText;
  final Function() _action;

  WideButton(this._primaryColor, this._buttonText, this._action);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: _action,
      child: Text(
        _buttonText,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: _primaryColor,
        minimumSize: Size(
          size.width * 0.8,
          size.height * 0.060,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
