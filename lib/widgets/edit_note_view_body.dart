import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const CustomAppBar(title: 'Edit Note', icon: Icons.check),
          const SizedBox(height: 30),
          CustomTextField(
            // Replace TextField with CustomTextField
            onSaved: (value) {
              // Add the onSaved function
              
            },
            label: "Title",
          ),
          const SizedBox(height: 20),
          CustomTextField(
            // Replace TextField with CustomTextField
            onSaved: (value) {},
            hintText: "Description",
            maxlines: 5, // Increase the number of lines
          ),
        ],
      ),
    );
  }
}
