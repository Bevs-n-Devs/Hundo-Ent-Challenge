import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_cataloger/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration_purpleAccent,
      child: SizedBox(
          width: 400,
          height: 50,
          child: TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              shadows: [BoxShadowPurple]
            ),
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )
              )
            ),
          ),
      ),
    );
  }
}