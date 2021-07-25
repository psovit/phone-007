import 'package:phone007/models/exports.dart';

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
          title: 'Dear Parents',
          body:
              'Do not try to look for me. I am going on a long long journey. Not sure when I will return but remember I will always love you both. Take care.',
          createdAt: DateTime.now(),
          missionId: missionId,
        ),
      ],
    );
  }
}
