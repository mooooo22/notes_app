import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:uuid/uuid.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            label: "Title",
          ),
          const SizedBox(height: 20),
          CustomTextField(
            onSaved: (value) {
              content = value;
            },
            hintText: "Content",
            maxlines: 5,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var uuid = const Uuid();
                // Add note to database
                var noteModel = NoteModel(
                    id: uuid.v1(),
                    title: title!,
                    content: content!,
                    date: DateTime.now().toString(),
                    time: DateTime.now().toString());
                BlocProvider.of<AddNotesCubit>(context).addNote(
                  noteModel,
                );
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.onUserInteraction;
                });
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 50),
              backgroundColor: const Color(0xff56EDD8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child:
                const Text("Add Note", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
