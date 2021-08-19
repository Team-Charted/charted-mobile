import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldCustom extends StatelessWidget {
  final String _label;
  final String? Function(String?) _validator;

  TextFieldCustom(this._label, this._validator);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: theme.highlightColor,
          ),
        ),
        validator: _validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: theme.highlightColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: theme.highlightColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: theme.accentColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: theme.accentColor,
            ),
          ),
          labelText: _label,
          labelStyle: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: theme.highlightColor,
            ),
          ),
          filled: true,
          fillColor: theme.primaryColor,
          errorStyle: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: theme.accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
