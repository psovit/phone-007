import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/redux/chat_message_state/chat_message_state.dart';
import 'package:flutter_redux_setup/redux/gallery_state/gallery_state.dart';
import 'package:flutter_redux_setup/redux/internet_browser_state/internet_browser_state.dart';
import 'package:flutter_redux_setup/redux/mission_state/mission_state.dart';
import 'package:flutter_redux_setup/redux/notes_state/notes_state.dart';

@immutable
class AppState {
  const AppState({
    required this.missionState,
    required this.galleryState,
    required this.chatMessageState,
    required this.notesState,
    required this.internetBrowserState,
  });
  AppState.initialState()
      : missionState = MissionState.init(),
        galleryState = GalleryState.init(),
        chatMessageState = ChatMessageState.init(),
        notesState = NotesState.init(),
        internetBrowserState = InternetBrowserState.init();
  final MissionState missionState;
  final GalleryState galleryState;
  final ChatMessageState chatMessageState;
  final NotesState notesState;
  final InternetBrowserState internetBrowserState;
}
