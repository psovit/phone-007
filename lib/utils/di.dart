import 'dart:async';

import 'package:phone007/api/answer_repo.dart';
import 'package:phone007/api/chat_message_repo.dart';
import 'package:phone007/api/gallery_repo.dart';
import 'package:phone007/api/internet_browser_api.dart';
import 'package:phone007/api/mission_repo.dart';
import 'package:phone007/api/notes_repo.dart';
import 'package:phone007/redux/app_state.dart';
import 'package:phone007/redux/app_state_reducer.dart';
import 'package:phone007/redux/core/exports.dart';
import 'package:redux/redux.dart';

class Di {
  factory Di() {
    return _singleton;
  }

  Di._internal();

  static final Di _singleton = Di._internal();
  Map<String, dynamic> services = <String, dynamic>{};

  Store<AppState> getStore() {
    if (services['Store<AppState>'] != null) {
      return services['Store<AppState>'];
    }
    services['Store<AppState>'] ??= Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: <Middleware<AppState>>[
        thunkClassMiddleware,
        createEventDispatchingMiddleware(getEventStreamController()),
      ],
    );
    _initEventStreamController();

    return services['Store<AppState>'];
  }

  StreamController<dynamic> getEventStreamController() {
    return services['EventStreamController'] ??=
        StreamController<dynamic>.broadcast();
  }

  void _initEventStreamController() {
    final Stream<dynamic> stream = getEventStreamController().stream;
  }

  MissionRepository getMissionRepository() {
    return MissionApi();
  }

  ChatMessageRepository getChatMessageRepository() {
    return ChatMessageApi();
  }

  GalleryRepository getGalleryRepository() {
    return GalleryApi();
  }

  AnswerRepository getAnswerRepository() {
    return AnswerApi();
  }

  NotesRepository getNotesRepository() {
    return NotesApi();
  }

  InternetBrowserRepository getInternetBrowserRepository() {
    return InternetBrowserApi();
  }
}
