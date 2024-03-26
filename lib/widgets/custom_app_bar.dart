import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Notes", style: TextStyle(fontSize: 22)),
        CustomButton(onPressed: () {}),
      ],
    );
  }
}
