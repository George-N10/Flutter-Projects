import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 22),
      padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
      // height: 250,
      // width: 500,
      decoration: BoxDecoration(
        color: Color(0xffffce7f),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              'Flutter Tips',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
              child: Text(
                'Build your career with Tharwat Samy',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 20,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, size: 38, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: Text(
              'May 21, 2026',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
