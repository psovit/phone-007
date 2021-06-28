import 'package:flutter_redux_setup/models/exports.dart';

class ChatMessageState {
  ChatMessageState(
    this._chatMessages,
  );

  final List<ChatMessage> _chatMessages;

  static ChatMessageState init() {
    return ChatMessageState(
      <ChatMessage>[],
    );
  }
}
