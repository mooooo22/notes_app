import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: NoteTile(color: getColor(index)),
          );
        },
      ),
    );
  }

  Color getColor(int index) {
    return colorArray[index % colorArray.length];
  }
}
