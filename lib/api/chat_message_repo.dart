import 'package:flutter_redux_setup/models/exports.dart';

abstract class ChatMessageRepository {
  Future<List<ChatMessage>> getChatMessages(int missionId);
}

class ChatMessageApi implements ChatMessageRepository {
  @override
  Future<List<ChatMessage>> getChatMessages(int missionId) async {
    final List<ChatMessage> chatMessages = <ChatMessage>[
      ChatMessage(
        1,
        1,
        'Dad',
        DateTime.now().subtract(const Duration(hours: 17)),
        'Hey son, how are things?',
      ),
      ChatMessage(
        2,
        1,
        'Me',
        DateTime.now().subtract(const Duration(hours: 16)),
        'Going good Dad.',
      ),
      ChatMessage(
        3,
        1,
        'Me',
        DateTime.now().subtract(const Duration(hours: 16)),
        'How are you?',
      ),
      ChatMessage(
        4,
        1,
        'Dad',
        DateTime.now().subtract(const Duration(hours: 16)),
        'Good so far. So are you coming later today?',
      ),
      ChatMessage(
        5,
        1,
        'Me',
        DateTime.now().subtract(const Duration(hours: 16)),
        'Yes, of course',
      ),
      ChatMessage(
        6,
        1,
        'Dad',
        DateTime.now().subtract(const Duration(hours: 16)),
        'Great, see ya then.',
      ),
    ];
    return chatMessages;
  }
}
