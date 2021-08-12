import 'package:flutter/material.dart';
import '../../theme/colors.dart';

TextFormField buildAddPinTextField({String labelText, String hintText}) {
  return TextFormField(
    cursorColor: kPrimaryColor,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.black),
      hintText: hintText,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w600,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
    ),
  );
}
