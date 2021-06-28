import 'package:flutter_redux_setup/api/chat_message_repo.dart';
import 'package:flutter_redux_setup/api/mission_repo.dart';
import 'package:flutter_redux_setup/redux/app_state.dart';
import 'package:flutter_redux_setup/redux/app_state_reducer.dart';
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
    );

    return services['Store<AppState>'];
  }

  MissionRepository getMissionRepository() {
    return MissionApi();
  }

  ChatMessageRepository getChatMessageRepository() {
    return ChatMessageApi();
  }
}
