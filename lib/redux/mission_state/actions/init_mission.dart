import 'package:flutter_redux_setup/redux/chat_message_state/actions/exports.dart';
import 'package:flutter_redux_setup/redux/gallery_state/actions/exports.dart';
import 'package:flutter_redux_setup/redux/notes_state/actions/load_notes.dart';
import 'package:flutter_redux_setup/utils/exports.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/redux/app_state.dart';
import 'package:flutter_redux_setup/redux/core/exports.dart';

class InitMission extends ThunkActionClass<AppState> {
  InitMission(this.mission);

  final Mission mission;

  @override
  Future<void> run(Store<AppState> store) async {
    if (mission.hasChatMessages) {
      _fetchChatMessages();
    }
    if (mission.hasGallery) {
      _fetchGallery();
    }
    if (mission.hasNotes) {
      _fetchNotes();
    }
    if (mission.hasInternetBrowser) {}
  }

  Future<void> _fetchChatMessages() async {
    final bool fetched = Di()
        .getStore()
        .state
        .chatMessageState
        .missionChatThreadLoaded(mission.id);
    if (!fetched) {
      final List<ChatThreadView> chatThreads =
          await Di().getChatMessageRepository().getChatMessages(mission.id);
      Di().getStore().dispatch(LoadChatThreads(chatThreads));
    }
  }

  Future<void> _fetchGallery() async {
    final bool fetched =
        Di().getStore().state.galleryState.galleryLoaded(mission.id);
    if (!fetched) {
      final GalleryView galleryView =
          await Di().getGalleryRepository().getGallery(mission.id);
      Di().getStore().dispatch(LoadGallery(galleryView));
    }
  }

  Future<void> _fetchNotes() async {
    final bool fetched =
        Di().getStore().state.notesState.notesLoaded(mission.id);
    if (!fetched) {
      final NotesView notesView =
          await Di().getNotesRepository().getNotes(mission.id);
      Di().getStore().dispatch(LoadNotes(notesView));
    }
  }
}
