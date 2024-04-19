import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 22)),
        CustomButton(onPressed: onPressed, icon: icon),
      ],
    );
  }
}
