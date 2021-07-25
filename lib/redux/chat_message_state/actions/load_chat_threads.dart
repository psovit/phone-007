import 'package:phone007/models/exports.dart';
import 'package:phone007/redux/chat_message_state/chat_message_state.dart';
import 'package:phone007/redux/core/exports.dart';

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
