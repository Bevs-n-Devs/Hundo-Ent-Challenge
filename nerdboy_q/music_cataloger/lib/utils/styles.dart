
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


BoxShadow generateBoxShadow(Color shadowColor) {
  return BoxShadow(
    color: shadowColor,
        spreadRadius: 3.0,
        blurRadius: 7.0
  );
}

BoxShadow BoxShadowPurple = generateBoxShadow(Colors.purple);
class CustomBoxDecoration {
  BoxDecoration addCustomBoxDecoration (Color shadowColor){
    return BoxDecoration(
      boxShadow: [
        BoxShadowPurple
      ]
    );
  }
}

BoxDecoration boxDecoration_lightGreenAccent = CustomBoxDecoration().addCustomBoxDecoration(Colors.lightGreenAccent);
BoxDecoration boxDecoration_purpleAccent = CustomBoxDecoration().addCustomBoxDecoration(Colors.deepPurpleAccent);