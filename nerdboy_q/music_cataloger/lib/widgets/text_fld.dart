import 'package:flutter/material.dart';
import 'package:music_cataloger/utils/helpers.dart';
import 'package:music_cataloger/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Function(String,FieldType) callback;
  final FieldType fieldType;
  final bool isMultiLine;
  const CustomTextField({super.key, required this.hintText, required this.callback, required this.fieldType, this.isMultiLine=false});
  
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
      bool isMultiLine = widget.isMultiLine;
      return Container(
        decoration: boxDecoration_purpleAccent,
        child: SizedBox(
        width: isMultiLine ? screen_width*0.8 : screen_width*0.45,
        height: isMultiLine ? screen_height*0.2 : screen_height*0.06,
          child: TextField(
            minLines: isMultiLine ? 6 : 1,
            maxLines: isMultiLine ? 6 : 1,
            onChanged: (value) {
              widget.callback(value, widget.fieldType);
            },
            textAlign: isMultiLine ? TextAlign.justify : TextAlign.center,
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
                borderRadius: BorderRadius.circular(screen_width*.005),
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