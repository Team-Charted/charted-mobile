import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final Color _primaryColor;
  final String _buttonText;
  final Function() _action;

  WideButton(this._primaryColor, this._buttonText, this._action);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: _action,
      child: Text(
        _buttonText,
        style: theme.textTheme.button,
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
