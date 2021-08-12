import 'package:flutter/material.dart';
import '../../theme/colors.dart';

Container buildTermsAndCondition(Size _size) {
  return Container(
    width: _size.width * .8,
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "By continuing, you agree to Pinterest's ",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: "Terms of Service",
            style: TextStyle(
              color: kFacebookColor,
            ),
          ),
          TextSpan(
            text: " and acknowledge you've read our ",
          ),
          TextSpan(
            text: "Privacy Policy.",
            style: TextStyle(
              color: kFacebookColor,
            ),
          ),
        ],
      ),
    ),
  );
}
