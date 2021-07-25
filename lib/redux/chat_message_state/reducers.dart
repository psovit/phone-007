import 'package:phone007/redux/chat_message_state/actions/load_chat_threads.dart';
import 'package:phone007/redux/chat_message_state/chat_message_state.dart';
import 'package:phone007/redux/core/exports.dart';
import 'package:redux/redux.dart';

class ChatMessageReducer extends GroupReducer<ChatMessageState> {
  ChatMessageReducer()
      : super(<Reducer<ChatMessageState>>[
          LoadChatThreadsReducer(),
        ]);
}
