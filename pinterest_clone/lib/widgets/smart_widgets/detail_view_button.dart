import 'package:flutter/material.dart';

class DetailViewButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final Function onTap;
  const DetailViewButton(
      {Key key, this.color, this.text, this.textColor, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: color,
        elevation: 0,
        textStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Text(text),
            ),
          ),
        ),
      ),
    );
  }
}
