import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/models/exports.dart';

class NotesDetail extends StatelessWidget {
  const NotesDetail(this.noteItemView);
  final NoteItemView noteItemView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              noteItemView.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              noteItemView.body,
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
