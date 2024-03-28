import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/views/home_view.dart';

import 'views/edit_note_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          focusColor: Colors.blue,
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        initialRoute: MyHomePage.id,
        routes: {
          EditNoteView.id: (context) => const EditNoteView(),
          MyHomePage.id: (context) => const MyHomePage(),
        });
  }
}
