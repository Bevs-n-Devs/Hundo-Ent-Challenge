import 'package:flutter/material.dart';
import 'package:music_cataloger/widgets/fld_label.dart';
import 'package:music_cataloger/widgets/text_fld.dart';

class FormTextInput extends StatelessWidget {
  final String labelText;
  const FormTextInput({super.key, required this.labelText});
  

  @override
  Widget build(BuildContext context) {
    String hintText = "Please enter $labelText";
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            CustomLabel(labelText: labelText),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          children: [
            CustomTextField(hintText: hintText),
          ],
        )
      ],
    );
  }
}