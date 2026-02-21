import 'package:flutter/material.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NotesHomePage(),
    );
  }
}

class NotesHomePage extends StatelessWidget {
  const NotesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

