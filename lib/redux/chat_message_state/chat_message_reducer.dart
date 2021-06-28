import 'package:flutter_redux_setup/redux/chat_message_state/chat_message_state.dart';
import 'package:flutter_redux_setup/redux/group_reducer.dart';
import 'package:redux/redux.dart';

class ChatMessageReducer extends GroupReducer<ChatMessageState> {
  ChatMessageReducer() : super(<Reducer<ChatMessageState>>[]);
}
