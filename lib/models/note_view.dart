class NoteItemView {
  NoteItemView({
    required this.noteId,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.missionId,
  });
  final int noteId;
  final String title;
  final String body;
  final DateTime createdAt;
  final int missionId;
}

class NotesView {
  NotesView({
    required this.missionId,
    required this.notes,
  });
  final int missionId;
  final List<NoteItemView> notes;
}
