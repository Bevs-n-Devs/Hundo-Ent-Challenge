import 'package:flutter/material.dart';
import 'package:music_cataloger/utils/helpers.dart';
import 'package:music_cataloger/utils/styles.dart';
import 'package:music_cataloger/widgets/fld_label.dart';

class CustomCheckBoxFld extends StatefulWidget {
  final String checkBoxText;
  const CustomCheckBoxFld({super.key, required this.checkBoxText});

  @override
  State<CustomCheckBoxFld> createState() => _CustomCheckBoxFldState();
}

class _CustomCheckBoxFldState extends State<CustomCheckBoxFld> {
  bool? isChecked = false;
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final String text = widget.checkBoxText;
    return Center(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(5),
      //   color: Colors.black,
      //   boxShadow: [BoxShadowPurple]
      // ),
      child: SizedBox(
        width: screen_width*0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Checkbox(value: isChecked, onChanged: (bool? value) {
              setState(() {
                isChecked = value;
                print("changed to $isChecked");
              });
            }),
            CustomLabel(labelText: text),
          ]
        ),
      ),
    );
  }
}