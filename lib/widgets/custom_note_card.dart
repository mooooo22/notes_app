import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNoteView.id);
      },
      child: Container(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text("Flutter Course",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text("the best course ever, and it's free!",
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color(0xff896333),
                          fontFamily: GoogleFonts.poppins().fontFamily)),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.black,
                      size: 25,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, bottom: 10),
                child: Text("May 20, 2021",
                    style: TextStyle(
                        color: const Color(0xffAD803F),
                        fontFamily: GoogleFonts.poppins().fontFamily)),
              ),
            ],
          )),
    );
  }
}
