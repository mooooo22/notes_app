import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  widget.note.save();
                  Navigator.pop(context);
                  BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.onUserInteraction;
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              // Replace TextField with CustomTextField
              controller: TextEditingController(text: widget.note.title),
              onSaved: (value) {
                // Add the onSaved function
                widget.note.title = value!;
              },
              label: "Title",
            ),
            const SizedBox(height: 20),
            CustomTextField(
              // Replace TextField with CustomTextField
              controller: TextEditingController(text: widget.note.content),
              onSaved: (value) {
                // Add the onSaved function
                widget.note.content = value!;
              },
              hintText: "Description",
              maxlines: 5, // Increase the number of lines
            ),
          ],
        ),
      ),
    );
  }
}
