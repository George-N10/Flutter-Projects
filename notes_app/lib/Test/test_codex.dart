// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const NotesApp());
// }
//
// class NotesApp extends StatelessWidget {
//   const NotesApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Notes',
//       theme: ThemeData(
//         useMaterial3: true,
//         scaffoldBackgroundColor: const Color(0xFF1F1F1F),
//       ),
//       home: const NotesHomePage(),
//     );
//   }
// }
//
// class NoteModel {
//   const NoteModel({
//     required this.title,
//     required this.content,
//     required this.date,
//     required this.color,
//   });
//
//   final String title;
//   final String content;
//   final String date;
//   final Color color;
// }
//
// class NotesHomePage extends StatelessWidget {
//   const NotesHomePage({super.key});
//
//   static const List<NoteModel> _notes = [
//     NoteModel(
//       title: 'Flutter tips',
//       content: 'Build your Career with Tharwat Samy',
//       date: 'May 21, 2022',
//       color: Color(0xFFF3D67A),
//     ),
//     NoteModel(
//       title: 'Flutter tips',
//       content: 'Build your Career with Tharwat Samy',
//       date: 'May 21, 2022',
//       color: Color(0xFFC9E8B3),
//     ),
//     NoteModel(
//       title: 'Flutter tips',
//       content: 'Build your Career with Tharwat Samy',
//       date: 'May 21, 2022',
//       color: Color(0xFF96D7EE),
//     ),
//     NoteModel(
//       title: 'Flutter tips',
//       content: 'Build your Career with Tharwat Samy',
//       date: 'May 21, 2022',
//       color: Color(0xFFD7C4F6),
//     ),
//     NoteModel(
//       title: 'Flutter tips',
//       content: 'Build your Career with Tharwat Samy',
//       date: 'May 21, 2022',
//       color: Color(0xFFF7C5AE),
//     ),
//     NoteModel(
//       title: 'Flutter tips',
//       content: 'Build your Career with Tharwat Samy',
//       date: 'May 21, 2022',
//       color: Color(0xFFB6EAD7),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1F1F1F),
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         titleSpacing: 20,
//         title: const Text(
//           'Notes',
//           style: TextStyle(
//             fontSize: 36,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFFF2F2F2),
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.search_rounded, color: Color(0xFFF2F2F2)),
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//       body: SafeArea(
//         child: ListView.builder(
//           padding: const EdgeInsets.fromLTRB(0, 8, 0, 96),
//           itemCount: _notes.length,
//           itemBuilder: (context, index) {
//             final note = _notes[index];
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
//               child: Container(
//                 padding: const EdgeInsets.all(17),
//                 constraints: const BoxConstraints(minHeight: 145),
//                 decoration: BoxDecoration(
//                   color: note.color,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             note.title,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               fontSize: 31,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF1C1C1C),
//                               height: 1.05,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         const Icon(
//                           Icons.delete_outline_rounded,
//                           color: Color(0xFF2B2B2B),
//                           size: 24,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 7),
//                     Text(
//                       note.content,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Color(0xFF3E3E3E),
//                         height: 1.25,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: Text(
//                         note.date,
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Color(0xFF2F2F2F),
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xFF2EC4B6).withOpacity(0.38),
//               blurRadius: 14,
//               spreadRadius: 0.3,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: FloatingActionButton(
//           onPressed: () {},
//           backgroundColor: const Color(0xFF2EC4B6),
//           shape: const CircleBorder(),
//           child: const Icon(Icons.add, color: Colors.white, size: 34),
//         ),
//       ),
//     );
//   }
// }
