import 'package:flutter/material.dart';

import '../widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotesViewBody(),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2EC4B6).withOpacity(0.38),
                blurRadius: 14,
                spreadRadius: 0.3,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xFF2EC4B6),
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Colors.black, size: 34),
          ),
        ),
      ),
    );
  }
}
