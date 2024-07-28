import 'package:flutter/material.dart';
import 'package:music_cataloger/utils/helpers.dart';
import 'package:music_cataloger/widgets/fld_label.dart';
import 'package:music_cataloger/widgets/text_fld.dart';

class FormTextInput extends StatelessWidget {
  final String labelText;
  final Function(String,FieldType) callback;
  final FieldType fieldType;
  const FormTextInput({
    super.key, 
    required this.labelText, 
    required this.callback,
    required this.fieldType}
  );
  

  @override
  Widget build(BuildContext context) {
    String value;
    String hintText = "Please enter $labelText";

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            CustomLabel(labelText: labelText),
          ],
        ),
        Padding(padding: EdgeInsets.all(screen_width*.005)),
        Row(
          children: [
            CustomTextField(
              hintText: hintText, 
              callback: callback,
              fieldType: fieldType
            ),
          ],
        )
      ],
    );
  }
}