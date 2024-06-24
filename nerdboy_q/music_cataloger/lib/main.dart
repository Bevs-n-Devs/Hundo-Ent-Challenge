import 'package:flutter/material.dart';
import 'package:music_cataloger/screens/entry_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '<Music Cataloger>',
      debugShowCheckedModeBanner: false,
      routes: {
        EntryScreen.routeName : (context) => const EntryScreen(),
      },
      home: const EntryScreen(),
    );
  }
}
