import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:music_cataloger/models/audio_record.dart';
import 'package:music_cataloger/utils/helpers.dart';
import 'package:music_cataloger/widgets/date_picker_fld.dart';
import 'package:music_cataloger/widgets/form_dropdown_menu.dart';
import 'package:music_cataloger/widgets/form_text_input.dart';

class EntryScreen extends StatefulWidget {
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
  State<StatefulWidget> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  Map<FieldType, dynamic> record = {
    FieldType.fieldAlbumName: '', 
    FieldType.fieldArtistName: '', 
    FieldType.fieldGenreName: '',  
    FieldType.fieldTrackName: '', 
    FieldType.fieldFrequency: '', 
    FieldType.fieldReleaseType: '', 
    FieldType.fieldReleaseDate: '', 
  };
  List<String> get releaseTypes => EntryScreen.releaseTypes; 
  List<String> get albumTypes => EntryScreen.albumTypes; 
  List<String> get freqOpts => EntryScreen.freqOpts; 

  void updateRecord(String value, FieldType fieldType) {
    setState(() {
      record[fieldType] = value;
      print("Submitting records: $record");
    });
  } 

  void submitRecord(String value){
    setState(() {
      print(record);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(199, 13, 10, 18),
      body: Column(
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(15)),
              Column(
                children: [
                  FormTextInput(labelText: "Track Name", callback: updateRecord, fieldType: FieldType.fieldTrackName,),
                  FormTextInput(labelText: "Album Name", callback: updateRecord, fieldType: FieldType.fieldAlbumName,),
                  FormTextInput(labelText: "Artist Name", callback: updateRecord, fieldType: FieldType.fieldArtistName,),
                  FormDropDownInput(labelText: "Album Type", options: albumTypes, callback: updateRecord, fieldType: FieldType.fieldAlbumType,)
                ]
          
              ),
              const Padding(padding: EdgeInsets.all(15)),
              Column(
                children:[
                  FormTextInput(labelText: "Genre", callback: updateRecord, fieldType: FieldType.fieldGenreName,),
                  FormDropDownInput(labelText: "Frequency", options: freqOpts, callback: updateRecord, fieldType: FieldType.fieldFrequency,),
                  FormDropDownInput(labelText: "Release Type", options: releaseTypes, callback: updateRecord, fieldType: FieldType.fieldReleaseType,),
                  // CustomDatePicker(restorationId: 'releaseDate',)
                ]
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(15)),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(15)),
              Center(
                widthFactor: 6,
                child: ElevatedButton(
                  onPressed: () {
                    submitRecord("test");
                  },
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                    
                    backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  ),
                  child: const Text(
                    "Submit Record", 
                    style: TextStyle(
                      color: Colors.deepPurple
                    ),
                  )
                ),
              )
            ],
          )
        ],
      ),
      
    );
  }

}