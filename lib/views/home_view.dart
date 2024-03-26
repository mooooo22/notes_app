import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff56EDD8),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: const NotesViewBody(),
    );
  }
}
