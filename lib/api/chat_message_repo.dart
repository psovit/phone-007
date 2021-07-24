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
        senderImageUrl: 'assets/images/prateek-katyal.jpg',
        senderNumber: '',
        chatMessages: <ChatMessage>[
          ChatMessage(
            chatThreadId: 1,
            sentDate: DateTime.now().subtract(
              const Duration(days: 1, hours: 4),
            ),
            id: 1,
            message: 'Hey, how is it going?',
            sender: 'Dad',
          ),
          ChatMessage(
            chatThreadId: 1,
            sentDate: DateTime.now().subtract(
              const Duration(hours: 6, seconds: 42),
            ),
            id: 2,
            message: 'Hey Dad, finally got my new phone.',
            sender: 'You',
          ),
          ChatMessage(
            chatThreadId: 1,
            sentDate: DateTime.now().subtract(
              const Duration(hours: 6, seconds: 40),
            ),
            id: 2,
            message: 'Going pretty good. How are you?',
            sender: 'You',
          ),
          ChatMessage(
            chatThreadId: 1,
            sentDate: DateTime.now().subtract(
              const Duration(hours: 6, seconds: 30),
            ),
            id: 3,
            message: 'Great to hear. Congratulations on your new house.',
            sender: 'Dad',
          ),
          ChatMessage(
            chatThreadId: 1,
            sentDate: DateTime.now().subtract(
              const Duration(hours: 6, seconds: 15),
            ),
            id: 4,
            message: 'Ok, Gotta go. Will talk later. Tc.',
            sender: 'Dad',
          ),
          ChatMessage(
            chatThreadId: 1,
            sentDate: DateTime.now().subtract(
              const Duration(hours: 6, seconds: 10),
            ),
            id: 5,
            message: 'Haha, thanks! Later.',
            sender: 'You',
          ),
          ChatMessage(
            chatThreadId: 1,
            sentDate: DateTime.now().subtract(const Duration(hours: 6)),
            id: 6,
            message: '🐻',
            sender: 'Dad',
          ),
        ],
      ),
      ChatThreadView(
        missionId: 1,
        chatThreadId: 2,
        senderName: 'Mom',
        senderImageUrl: 'assets/images/hamro-jatra.jpg',
        senderNumber: '',
        chatMessages: <ChatMessage>[],
      ),
    ];
    return chatMessages;
  }
}
