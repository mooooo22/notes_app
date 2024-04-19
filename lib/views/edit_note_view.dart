import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';

import '../widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
  static String id = 'edit_note_view';
  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: EditNoteViewBody(note: note),
      ),
    );
  }
}
