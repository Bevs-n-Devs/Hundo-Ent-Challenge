import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:music_cataloger/models/audio_record.dart';
import 'package:music_cataloger/utils/helpers.dart';
import 'package:music_cataloger/widgets/checkbox_widget.dart';
// import 'package:music_cataloger/widgets/date_picker_fld.dart';
import 'package:music_cataloger/widgets/fld_label.dart';
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
  static const List<String> mediaTypes = [
    "Casette",
    "CD",
    "Vinyl",
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
    FieldType.fieldMediaType: '', 
  };
  List<String> get releaseTypes => EntryScreen.releaseTypes; 
  List<String> get mediaTypes => EntryScreen.mediaTypes; 
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
    
    screen_height = MediaQuery.of(context).size.height;
    screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(199, 13, 10, 18),
      body: screen_width > 600 
      ? ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(screen_width*0.015)),
                  Column(
                    children: [
                      FormTextInput(labelText: "Track Name", callback: updateRecord, fieldType: FieldType.fieldTrackName,),
                      FormTextInput(labelText: "Album Name", callback: updateRecord, fieldType: FieldType.fieldAlbumName,),
                      FormTextInput(labelText: "Artist Name", callback: updateRecord, fieldType: FieldType.fieldArtistName,),
                      FormDropDownInput(labelText: "Album Type", options: albumTypes, callback: updateRecord, fieldType: FieldType.fieldAlbumType,),
                    ]
              
                  ),
                  Padding(padding: EdgeInsets.all(screen_width*0.01)),
                  Column(
                    children:[
                      FormTextInput(labelText: "Genre", callback: updateRecord, fieldType: FieldType.fieldGenreName,),
                      FormDropDownInput(labelText: "Frequency", options: freqOpts, callback: updateRecord, fieldType: FieldType.fieldFrequency,),
                      FormDropDownInput(labelText: "Release Type", options: releaseTypes, callback: updateRecord, fieldType: FieldType.fieldReleaseType,),
                      FormDropDownInput(labelText: "Media Type", options: mediaTypes, callback: updateRecord, fieldType: FieldType.fieldMediaType,),
                      // CustomDatePicker(restorationId: 'releaseDate',)
                    ]
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0,screen_height*0.1,0,0)),
                  const CustomLabel(labelText: "Media Formatting")
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Padding(padding: EdgeInsets.fromLTRB(50,0,0,0)),
                  CustomCheckBoxFld(checkBoxText: "Azimuth"),
                  CustomCheckBoxFld(checkBoxText: "Baked"),
                  CustomCheckBoxFld(checkBoxText: "New Reel"),
                  CustomCheckBoxFld(checkBoxText: "CWF"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0,screen_height*0.1,0,0)),
                  const CustomLabel(labelText: "Condition")
                ],
              ),
              const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCheckBoxFld(checkBoxText: "Starts Abruptly"),
                      CustomCheckBoxFld(checkBoxText: "Ends Abruptly"),
                      CustomCheckBoxFld(checkBoxText: "Ground Hum"),
                    ],
              ),
              const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCheckBoxFld(checkBoxText: "Distortion"),
                      CustomCheckBoxFld(checkBoxText: "Intermittent Dropouts"),
                    ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0,screen_height*0.1,0,screen_height*0.1)),
                  FormTextInput(labelText: "Other Conditions", callback: updateRecord, fieldType: FieldType.fieldDetails, isMultiLine: true,)
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0,screen_width*0.010,0,0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0,screen_width*0.01,0,0)),
                  Center(
                    widthFactor: 4,
                    child: ElevatedButton(
                      onPressed: () {
                        submitRecord("test");
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screen_width*0.005)
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
        ]
      )
      : ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  FormTextInput(labelText: "Track Name", callback: updateRecord, fieldType: FieldType.fieldTrackName,),
                  FormTextInput(labelText: "Album Name", callback: updateRecord, fieldType: FieldType.fieldAlbumName,),
                  FormTextInput(labelText: "Artist Name", callback: updateRecord, fieldType: FieldType.fieldArtistName,),
                  FormDropDownInput(labelText: "Album Type", options: albumTypes, callback: updateRecord, fieldType: FieldType.fieldAlbumType,),
               
                  FormTextInput(labelText: "Genre", callback: updateRecord, fieldType: FieldType.fieldGenreName,),
                  FormDropDownInput(labelText: "Frequency", options: freqOpts, callback: updateRecord, fieldType: FieldType.fieldFrequency,),
                  FormDropDownInput(labelText: "Release Type", options: releaseTypes, callback: updateRecord, fieldType: FieldType.fieldReleaseType,),
                  FormDropDownInput(labelText: "Media Type", options: mediaTypes, callback: updateRecord, fieldType: FieldType.fieldMediaType,),
                  // CustomDatePicker(restorationId: 'releaseDate',)
                  Padding(padding: EdgeInsets.all(screen_width*0.01)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0,screen_height*0.1,0,0)),
                      const CustomLabel(labelText: "Media Formatting")
                        ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCheckBoxFld(checkBoxText: "Azimuth"),
                      CustomCheckBoxFld(checkBoxText: "Baked"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCheckBoxFld(checkBoxText: "New Reel"),
                      CustomCheckBoxFld(checkBoxText: "CWF"),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(screen_width*0.01)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0,screen_height*0.1,0,0)),
                      const CustomLabel(labelText: "Condition")
                        ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  CustomCheckBoxFld(checkBoxText: "Starts Abruptly"),
                  CustomCheckBoxFld(checkBoxText: "Ends Abruptly"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  CustomCheckBoxFld(checkBoxText: "Ground Hum"),
                  CustomCheckBoxFld(checkBoxText: "Distortion"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCheckBoxFld(checkBoxText: "Intermittent Dropouts"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0,screen_height*0.1,0,screen_height*0.1)),
                      FormTextInput(labelText: "Other Conditions", callback: updateRecord, fieldType: FieldType.fieldDetails, isMultiLine: true,)
                    ],
                  ),
              Center(
                // widthFactor: 4,
                child: ElevatedButton(
                  onPressed: () {
                    submitRecord("test");
                  },
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screen_width*0.005)
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
                ]
              ),
            ],
          ),
        ],
      ),
    );
  }

}