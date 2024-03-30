import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/home_view.dart';
import 'views/edit_note_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(KNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNotesCubit(),
        ),
       
      ],
      child: MaterialApp(
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
          }),
    );
  }
}
