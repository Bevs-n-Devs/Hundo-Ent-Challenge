import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:music_cataloger/widgets/date_picker_fld.dart';
import 'package:music_cataloger/widgets/form_dropdown_menu.dart';
import 'package:music_cataloger/widgets/form_text_input.dart';

class EntryScreen extends StatelessWidget {
  static String routeName = "/entry_screen";
  static const List<String> freqOpts = [
    "44.1 kHz",
    "48 kHz",
    "128 kHz",
    "192 kHz",
    "256 kHz" 
  ];
  static const List<String> albumTypes = [
    "Single",
    "EP",
    "Album",
  ];
  static const List<String> releaseTypes = [
    "Original",
    "Cover",
    "Re-release",
    "Revised Re-release",
  ];

  const EntryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(199, 13, 10, 18),
      body: Row(
        children: [
          Padding(padding: EdgeInsets.all(15)),
          Column(
            children: [
              FormTextInput(labelText: "Track Name"),
              FormTextInput(labelText: "Album Name"),
              FormTextInput(labelText: "Artist Name"),
              FormDropDownInput(labelText: "Album Type", options: albumTypes)
            ]

          ),
          Padding(padding: EdgeInsets.all(15)),
          Column(
            children:[
              FormTextInput(labelText: "Genre"),
              FormTextInput(labelText: "Song Title"),
              FormDropDownInput(labelText: "Frequency", options: freqOpts),
              FormDropDownInput(labelText: "Release Type", options: releaseTypes),
              // CustomDatePicker(restorationId: 'releaseDate',)
            ]
          ),
        ],
      ),
      
    );
  }
}