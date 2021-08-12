import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class ConfirmPasswordTextInput extends StatelessWidget {
  const ConfirmPasswordTextInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFFEEEEEF),
      ),
      width: _size.width * .8,
      child: TextField(
        // autofocus: true,
        obscureText: true,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Confirm Password',
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          contentPadding: EdgeInsets.only(left: 20),
        ),
      ),
    );
  }
}
