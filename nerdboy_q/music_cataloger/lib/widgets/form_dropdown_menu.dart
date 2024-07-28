// import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_cataloger/utils/helpers.dart';
import 'package:music_cataloger/widgets/dropdown_input_fld.dart';
import 'package:music_cataloger/widgets/fld_label.dart';

class FormDropDownInput extends StatelessWidget {
  final String labelText;
  final List<String> options;
  final Function(String, FieldType) callback;
  final FieldType fieldType;
  const FormDropDownInput(
    {
      super.key, 
      required this.labelText, 
      required this.options,
      required this.callback,
      required this.fieldType
    }
  );

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            CustomLabel(labelText: labelText),
          ],
        ),
        Padding(padding: EdgeInsets.all(screen_width*0.005,)),
        Row(
          children: [
            CustomDropdownMenu(opts: options, callback: callback, fieldType: fieldType,)
          ],
        )
      ],
    );
  }
}