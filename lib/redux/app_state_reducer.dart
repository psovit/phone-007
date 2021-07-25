import 'package:phone007/redux/app_state.dart';
import 'package:phone007/redux/chat_message_state/reducers.dart';
import 'package:phone007/redux/gallery_state/reducers.dart';
import 'package:phone007/redux/internet_browser_state/reducers.dart';
import 'package:phone007/redux/mission_state/reducers.dart';
import 'package:phone007/redux/notes_state/reducers.dart';

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
    missionState: MissionReducer()(state.missionState, action),
    galleryState: GalleryReducer()(state.galleryState, action),
    chatMessageState: ChatMessageReducer()(state.chatMessageState, action),
    notesState: NotesReducer()(state.notesState, action),
    internetBrowserState:
        InternetBrowserHistoryReducer()(state.internetBrowserState, action),
  );
}
