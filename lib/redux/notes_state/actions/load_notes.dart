import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/redux/core/exports.dart';
import 'package:flutter_redux_setup/redux/notes_state/notes_state.dart';

class LoadNotes {
  LoadNotes(this.notesView);
  final NotesView notesView;
}

class LoadNotesReducer extends TypedReducerClass<NotesState, LoadNotes> {
  @override
  NotesState reduce(NotesState state, LoadNotes action) =>
      state.loadNotes(action.notesView);
}
