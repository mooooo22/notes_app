import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/delete_cubit/delete_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/notes_model.dart';

import 'custom_note_card.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
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
        List<double> offsets =
            BlocProvider.of<NotesCubitCubit>(context).offsets;
        log(offsets.toString());
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
                log('Index: $index');
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: BlocListener<DeleteCubit, DeleteState>(
                    listener: (context, state) {
                      if (state is DeleteSuccess && state.index == index) {
                        // Update the offset to screen width for the deleted item
                        setState(() {
                          BlocProvider.of<NotesCubitCubit>(context)
                                  .offsets[index] =
                              MediaQuery.of(context).size.width;
                        });
                        // Wait for 300ms before removing the item from the list
                        Future.delayed(const Duration(milliseconds: 300), () {
                          setState(() {
                            context.read<NotesCubitCubit>().fetchAllNotes();
                          });
                        });

                        // Fetch all notes again
                      }
                    },
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        transform:
                            Matrix4.translationValues(offsets[index], 0, 0),
                        child: NoteTile(
                            color: getColor(index),
                            note: notes[index],
                            index: index)),
                  ),
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
