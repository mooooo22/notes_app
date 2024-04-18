import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/widgets/custom_bottom_sheet.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) {
        if (state is NotesFaliure) {
          log(state.message);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is NotesSuccess) {
          BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Note added successfully")));
        }
      }, builder: (context, state) {
        return AbsorbPointer(
            absorbing: state is NotesLoading ? true : false,
            child: const ButtomSheet());
      }),
    );
  }
}
