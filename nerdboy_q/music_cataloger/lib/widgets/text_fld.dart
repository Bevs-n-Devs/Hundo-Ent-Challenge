import 'package:flutter/material.dart';
import 'package:music_cataloger/utils/helpers.dart';
import 'package:music_cataloger/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Function(String,FieldType) callback;
  final FieldType fieldType;
  const CustomTextField({super.key, required this.hintText, required this.callback, required this.fieldType});
  
  @override
  State<StatefulWidget> createState() => _CustomTextFldState();
}

class _CustomTextFldState extends State<CustomTextField> {

  @override
  void initState() {
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
      return Container(
        decoration: boxDecoration_purpleAccent,
        child: SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            onChanged: (value) {
              widget.callback(value, widget.fieldType);
            },
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              shadows: [BoxShadowPurple]
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
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