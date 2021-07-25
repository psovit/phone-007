import 'package:phone007/models/exports.dart';
import 'package:phone007/redux/core/exports.dart';
import 'package:phone007/redux/notes_state/notes_state.dart';

class LoadNotes {
  LoadNotes(this.notesView);
  final NotesView notesView;
}

class LoadNotesReducer extends TypedReducerClass<NotesState, LoadNotes> {
  @override
  NotesState reduce(NotesState state, LoadNotes action) =>
      state.loadNotes(action.notesView);
}
