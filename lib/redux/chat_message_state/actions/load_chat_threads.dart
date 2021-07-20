import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/redux/chat_message_state/chat_message_state.dart';
import 'package:flutter_redux_setup/redux/core/exports.dart';

class LoadChatThreads {
  LoadChatThreads(this.chatThreads);
  final List<ChatThreadView> chatThreads;
}

class LoadChatThreadsReducer
    extends TypedReducerClass<ChatMessageState, LoadChatThreads> {
  @override
  ChatMessageState reduce(ChatMessageState state, LoadChatThreads action) =>
      state.loadChatThreads(action.chatThreads);
}
