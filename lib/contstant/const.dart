import 'package:flutter/material.dart';

// colors
Color blackClr = Colors.black;
Color whiteClr = Colors.white;
Color greyClr = Colors.grey;

//font style
TextStyle kTextStyle(
    {required FontWeight fontWeight, required double size, Color? color}) {
  return TextStyle(
      fontWeight: fontWeight, fontSize: size, color: color ?? blackClr);
}
