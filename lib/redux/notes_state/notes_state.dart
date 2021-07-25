import 'package:phone007/models/exports.dart';
import 'package:collection/collection.dart' as collection;

class NotesState {
  NotesState(
    this._notesView,
  );

  final List<NotesView> _notesView;

  static NotesState init() {
    return NotesState(
      <NotesView>[],
    );
  }

  NotesState loadNotes(NotesView notesView, {bool reset = true}) {
    final List<NotesView> newState = List<NotesView>.from(_notesView);
    if (reset) {
      newState.removeWhere((_) => _.missionId == notesView.missionId);
    }
    newState.add(notesView);
    return NotesState(newState);
  }

  NotesView? getNotesForMission(int missionId) {
    return _notesView.firstWhereOrNull((_) => _.missionId == missionId);
  }

  bool notesLoaded(int missionId) {
    return getNotesForMission(missionId) != null;
  }
}
