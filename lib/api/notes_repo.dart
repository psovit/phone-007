import 'package:flutter_redux_setup/models/exports.dart';

abstract class NotesRepository {
  Future<NotesView> getNotes(int missionId);
}

class NotesApi implements NotesRepository {
  @override
  Future<NotesView> getNotes(int missionId) async {
    return NotesView(
      missionId: 2,
      notes: <NoteItemView>[
        NoteItemView(
          noteId: 1,
          title: 'Dear God',
          body:
              'Please forgive me \nI can\'t stop loving you \nPlease forgive me...',
          createdAt: DateTime.now(),
          missionId: missionId,
        ),
        NoteItemView(
          noteId: 2,
          title: 'What is life?',
          body: 'Should I be more serious or less? Should I be happy or...',
          createdAt: DateTime.now(),
          missionId: missionId,
        ),
      ],
    );
  }
}
