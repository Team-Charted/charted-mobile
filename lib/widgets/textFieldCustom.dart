import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String _label;
  final Function() _validator;

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
        style: theme.textTheme.headline5,
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
          labelText: _label,
          labelStyle: theme.textTheme.headline5,
          filled: true,
          fillColor: theme.primaryColor,
        ),
      ),
    );
  }
}
