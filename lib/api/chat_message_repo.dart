import 'package:flutter_redux_setup/models/exports.dart';

abstract class ChatMessageRepository {
  Future<List<ChatThreadView>> getChatMessages(int missionId);
}

class ChatMessageApi implements ChatMessageRepository {
  @override
  Future<List<ChatThreadView>> getChatMessages(int missionId) async {
    final List<ChatThreadView> chatMessages = <ChatThreadView>[
      ChatThreadView(
        missionId: 1,
        chatThreadId: 1,
        senderName: 'Dad',
        senderImageUrl: '',
        senderNumber: '',
        chatMessages: <ChatMessage>[],
      ),
      ChatThreadView(
        missionId: 1,
        chatThreadId: 2,
        senderName: 'Mom',
        senderImageUrl: '',
        senderNumber: '',
        chatMessages: <ChatMessage>[],
      ),
      // ChatThreadView(
      //   1,
      //   1,
      //   '',
      //   'Dad',
      //   '🤣',
      //   DateTime.now().subtract(const Duration(days: 1)),
      // ),
      // ChatThreadView(
      //   1,
      //   2,
      //   '',
      //   'Mom',
      //   '🐻',
      //   DateTime.now().subtract(const Duration(days: 1)),
      // ),
    ];
    return chatMessages;
  }
}
