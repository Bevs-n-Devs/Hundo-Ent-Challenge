import 'package:flutter/material.dart';
import 'package:music_cataloger/screens/entry_screen.dart';
import 'package:music_cataloger/utils/helpers.dart';
import 'package:music_cataloger/utils/styles.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> opts;
  final Function(String, FieldType) callback;
  final FieldType fieldType;
  const CustomDropdownMenu(
    {
      super.key, 
      required this.opts, 
      required this.callback,
      required this.fieldType
    }
  );

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  late String dropdownValue = opts.first;
  late List<String> opts;

  @override
  Widget build(BuildContext context) {
    opts = widget.opts;
    return Container(
      decoration: boxDecoration_purpleAccent,
      child: SizedBox(
        width: 300,
        height: 50,
        child: 
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(5),
              elevation: 8,
              focusColor: Colors.white,
              autofocus: true,  // forces the focus color before a selection is made
              isExpanded: true, // stretches the field our horizontally
              dropdownColor: Colors.white,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                  widget.callback(dropdownValue, widget.fieldType);
                });
              },
              value: dropdownValue,
              items: opts.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Center(child: Text(value, style: TextStyle(shadows: [BoxShadowPurple]),)),
                  );
              }).toList(),
              ),
          ),
        ),
      
    );
  }
}