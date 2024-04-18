import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class ButtomSheet extends StatelessWidget {
  const ButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Add a new note",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 8.0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const AddNoteForm(),
          ),
        ),
      ],
    );
  }
}
