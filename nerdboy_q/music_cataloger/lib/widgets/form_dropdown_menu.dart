import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_cataloger/widgets/dropdown_input_fld.dart';
import 'package:music_cataloger/widgets/fld_label.dart';

class FormDropDownInput extends StatelessWidget {
  final String labelText;
  final List<String> options;
  const FormDropDownInput({super.key, required this.labelText, required this.options});

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
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          children: [
            CustomDropdownMenu(opts: options)
          ],
        )
      ],
    );
  }
}