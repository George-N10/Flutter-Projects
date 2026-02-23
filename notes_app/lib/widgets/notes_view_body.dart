import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_note_item.dart';
import 'custom_note_item.dart';
import 'custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(),
          SizedBox(height: 40),
          NoteItem(),
        ],
      ),
    );
  }
}
