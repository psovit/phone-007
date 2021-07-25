import 'package:flutter_redux_setup/models/exports.dart';

abstract class ChatMessageRepository {
  Future<List<ChatThreadView>> getChatMessages(int missionId);
}

class ChatMessageApi implements ChatMessageRepository {
  @override
  Future<List<ChatThreadView>> getChatMessages(int missionId) async {
    if (missionId != 1) {
      return <ChatThreadView>[];
    }
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
            message:
                'Great to hear. Congratulations on your new house you bought from the Nepalese family.',
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
            message: 'Haha, thanks Dad! Later.',
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
        chatMessages: <ChatMessage>[
          ChatMessage(
            chatThreadId: 2,
            sentDate: DateTime.now().subtract(
              const Duration(days: 7, hours: 5),
            ),
            id: 1,
            message:
                'Hi sweetie... this is my new number... save it if you wish 😉',
            sender: 'Mom',
          ),
          ChatMessage(
            chatThreadId: 2,
            sentDate: DateTime.now().subtract(
              const Duration(days: 7, hours: 4),
            ),
            id: 2,
            message: 'Mom. I already saved it :)',
            sender: 'You',
          ),
          ChatMessage(
            chatThreadId: 2,
            sentDate: DateTime.now().subtract(
              const Duration(days: 1, hours: 3, minutes: 45),
            ),
            id: 3,
            message:
                'Can\'t believe I forgot your new home street name again...',
            sender: 'Mom',
          ),
          ChatMessage(
            chatThreadId: 2,
            sentDate: DateTime.now().subtract(
              const Duration(days: 1, hours: 3, minutes: 44),
            ),
            id: 4,
            message: 'No worries mom, it\'s Dhumbarahi Marg',
            sender: 'You',
          ),
          ChatMessage(
            chatThreadId: 2,
            sentDate: DateTime.now().subtract(
              const Duration(days: 1, hours: 3, minutes: 42),
            ),
            id: 5,
            message: 'Thanks sweetie',
            sender: 'Mom',
          ),
          ChatMessage(
            chatThreadId: 1,
            sentDate: DateTime.now().subtract(
              const Duration(days: 1, hours: 3, minutes: 41),
            ),
            id: 6,
            message: 'Will see you soon!',
            sender: 'Mom',
          ),
          ChatMessage(
            chatThreadId: 2,
            sentDate: DateTime.now().subtract(
              const Duration(days: 1, hours: 3, minutes: 40),
            ),
            id: 7,
            message: '🎀',
            sender: 'Mom',
          ),
        ],
      ),
    ];
    return chatMessages;
  }
}
