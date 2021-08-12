import 'package:flutter/material.dart';

ElevatedButton buildHomeViewButtons(
    {Color color, String text, Color textColor, Function onPress}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: onPress,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    ),
  );
}
