import 'package:flutter/material.dart';
import 'package:music_cataloger/utils/styles.dart';

class CustomLabel extends StatelessWidget {
  final String labelText;
  const CustomLabel({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: const TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold
      ),
    );
  }
}