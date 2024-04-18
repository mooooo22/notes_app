import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/notes_model.dart';

import 'custom_note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  final List<Color> colorArray = const [
    Color(0xFFFFCD7A),
    Color(0xFFE8E897),
    Color(0xFF76D6EE),
    Color(0xFFD0A3D6),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubitCubit>(context).notes;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<NotesCubitCubit>().fetchAllNotes();
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: NoteTile(color: getColor(index), note: notes[index]),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Color getColor(int index) {
    return colorArray[index % colorArray.length];
  }
}
