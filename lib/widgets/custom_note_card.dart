import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/cubits/delete_cubit/delete_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key, required this.color, required this.note});
  final Color color;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNoteView.id);
      },
      child: Container(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(note.title,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(note.content,
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color(0xff896333),
                          fontFamily: GoogleFonts.poppins().fontFamily)),
                ),
                trailing: IconButton(
                    onPressed: () {
                      BlocProvider.of<DeleteCubit>(context).deleteNote(note);
                      BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.black,
                      size: 25,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, bottom: 10),
                child: Text('${note.date} ',
                    style: TextStyle(
                        color: const Color(0xffAD803F),
                        fontFamily: GoogleFonts.poppins().fontFamily)),
              ),
            ],
          )),
    );
  }
}
