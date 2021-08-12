import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context, String label) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        CircularProgressIndicator(),
        SizedBox(
          width: 10,
        ),
        Container(margin: EdgeInsets.only(left: 7), child: Text(label)),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
