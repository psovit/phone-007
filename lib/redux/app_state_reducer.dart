import 'package:flutter_redux_setup/redux/app_state.dart';
import 'package:flutter_redux_setup/redux/chat_message_state/reducers.dart';
import 'package:flutter_redux_setup/redux/gallery_state/reducers.dart';
import 'package:flutter_redux_setup/redux/mission_state/reducers.dart';
import 'package:flutter_redux_setup/redux/notes_state/reducers.dart';

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
    missionState: MissionReducer()(state.missionState, action),
    galleryState: GalleryReducer()(state.galleryState, action),
    chatMessageState: ChatMessageReducer()(state.chatMessageState, action),
    notesState: NotesReducer()(state.notesState, action),
  );
}
