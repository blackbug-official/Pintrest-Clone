import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final double elevation;
  final String icon;
  final VoidCallback onPress;
  const LoginButton({
    Key key,
    this.title,
    this.color,
    this.textColor,
    this.onPress,
    this.elevation,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(25),
      color: color,
      shadowColor: Colors.black,
      elevation: elevation,
      textStyle: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: _size.width * .8,
          child: icon != null
              ? Row(
                  children: [
                    SizedBox(width: 10),
                    Image.asset(
                      icon,
                      width: 20,
                    ),
                    Spacer(),
                    Text(title),
                    Spacer(),
                  ],
                )
              : Center(
                  child: Text(title),
                ),
        ),
      ),
    );
  }
}
