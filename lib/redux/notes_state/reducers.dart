import 'package:flutter_redux_setup/redux/core/exports.dart';
import 'package:flutter_redux_setup/redux/notes_state/actions/exports.dart';
import 'package:flutter_redux_setup/redux/notes_state/notes_state.dart';
import 'package:redux/redux.dart';

class NotesReducer extends GroupReducer<NotesState> {
  NotesReducer() : super(<Reducer<NotesState>>[LoadNotesReducer()]);
}
