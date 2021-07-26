import 'package:phone007/models/exports.dart';

abstract class ChatMessageRepository {
  Future<List<ChatThreadView>> getChatMessages(int missionId);
}

class ChatMessageApi implements ChatMessageRepository {
  @override
  Future<List<ChatThreadView>> getChatMessages(int missionId) async {
    if (missionId != 1) {
      if (missionId == 3) {
        return _mission3();
      }
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

  List<ChatThreadView> _mission3() {
    return <ChatThreadView>[
      ChatThreadView(
        missionId: 3,
        chatThreadId: 4,
        senderName: 'Punte',
        senderImageUrl: 'assets/images/arianna-jada.jpg',
        senderNumber: '',
        chatMessages: <ChatMessage>[
          ChatMessage(
            chatThreadId: 4,
            sentDate: DateTime.now().subtract(
              const Duration(days: 24, hours: 4),
            ),
            id: 1,
            message: 'Torpe, whats up mate.',
            sender: 'Punte',
          ),
          ChatMessage(
            chatThreadId: 1,
            sentDate: DateTime.now().subtract(
              const Duration(days: 24, hours: 3),
            ),
            id: 4,
            message:
                'Welcome onboard. I have asked Dhokre to add you to the Vault.',
            sender: 'Torpe',
          ),
          ChatMessage(
            chatThreadId: 4,
            sentDate: DateTime.now().subtract(
              const Duration(days: 24, hours: 2),
            ),
            id: 3,
            message: 'Thanks, Punte! Got it.',
            sender: 'You',
          ),
        ],
      ),
      ChatThreadView(
        missionId: 3,
        chatThreadId: 5,
        senderName: 'Dhokre',
        senderImageUrl: 'assets/images/koolshooters.jpg',
        senderNumber: '',
        chatMessages: <ChatMessage>[
          ChatMessage(
            chatThreadId: 5,
            sentDate: DateTime.now().subtract(
              const Duration(days: 22, hours: 13),
            ),
            id: 1,
            message: 'Yo bro, welcome to the club.',
            sender: 'Dhokre',
          ),
          ChatMessage(
            chatThreadId: 5,
            sentDate: DateTime.now().subtract(
              const Duration(days: 22, hours: 12),
            ),
            id: 2,
            message: 'Hey bro, thanks! Looking forward to kick things off *__*',
            sender: 'You',
          ),
          ChatMessage(
            chatThreadId: 5,
            sentDate: DateTime.now().subtract(
              const Duration(days: 22, hours: 11),
            ),
            id: 1,
            message: 'Great great great!',
            sender: 'Dhokre',
          ),
          ChatMessage(
            chatThreadId: 5,
            sentDate: DateTime.now().subtract(
              const Duration(days: 22, hours: 11),
            ),
            id: 1,
            message:
                'I heard about your job in the k-Town. Pretty clean work bro that \$50K job.',
            sender: 'Dhokre',
          ),
          ChatMessage(
            chatThreadId: 5,
            sentDate: DateTime.now().subtract(
              const Duration(days: 22, hours: 10),
            ),
            id: 1,
            message: 'Anyways, Pass is your YOB k?',
            sender: 'Dhokre',
          ),
          ChatMessage(
            chatThreadId: 5,
            sentDate: DateTime.now().subtract(
              const Duration(days: 22, hours: 9),
            ),
            id: 2,
            message: 'Ok mate. See you around.',
            sender: 'You',
          ),
        ],
      ),
      ChatThreadView(
        missionId: 3,
        chatThreadId: 6,
        senderName: 'Sweet Love',
        senderImageUrl: 'assets/images/tima-miroshnichenko.jpg',
        senderNumber: '',
        chatMessages: <ChatMessage>[
          ChatMessage(
            chatThreadId: 6,
            sentDate: DateTime.now().subtract(
              const Duration(
                days: 8,
                hours: 5,
                minutes: 37,
              ),
            ),
            id: 1,
            message:
                'Babe, Where were you last night? I came to your place but you were not there.',
            sender: 'Sweet Love',
          ),
          ChatMessage(
            chatThreadId: 6,
            sentDate: DateTime.now().subtract(
              const Duration(
                days: 8,
                hours: 5,
                minutes: 36,
              ),
            ),
            id: 1,
            message:
                'Ohh you did! I was out with some new friends exploring the city ;)',
            sender: 'You',
          ),
          ChatMessage(
            chatThreadId: 6,
            sentDate: DateTime.now().subtract(
              const Duration(
                days: 8,
                hours: 5,
                minutes: 33,
              ),
            ),
            id: 1,
            message: 'Grrrr...',
            sender: 'Sweet Love',
          ),
          ChatMessage(
            chatThreadId: 6,
            sentDate: DateTime.now().subtract(
              const Duration(
                days: 3,
                hours: 4,
                minutes: 37,
              ),
            ),
            id: 1,
            message: 'Hey babe, Happy Birthday ❤️',
            sender: 'Sweet Love',
          ),
          ChatMessage(
            chatThreadId: 6,
            sentDate: DateTime.now().subtract(
              const Duration(
                days: 3,
                hours: 4,
                minutes: 35,
              ),
            ),
            id: 2,
            message: ':D',
            sender: 'You',
          ),
          ChatMessage(
            chatThreadId: 6,
            sentDate: DateTime.now().subtract(
              const Duration(
                days: 3,
                hours: 4,
                minutes: 34,
              ),
            ),
            id: 3,
            message: 'You remember! Thanks babe. Dinner at my place ok?',
            sender: 'You',
          ),
          ChatMessage(
            chatThreadId: 6,
            sentDate: DateTime.now().subtract(
              const Duration(
                days: 3,
                hours: 4,
                minutes: 31,
              ),
            ),
            id: 3,
            message:
                'Oh yeaah! Can\'t wait to meet my macho man who just turned 31!',
            sender: 'Sweet Love',
          ),
          ChatMessage(
            chatThreadId: 6,
            sentDate: DateTime.now().subtract(
              const Duration(
                days: 3,
                hours: 4,
                minutes: 30,
              ),
            ),
            id: 3,
            message: '🍷❤️🍷',
            sender: 'You',
          ),
        ],
      ),
      ChatThreadView(
        missionId: 3,
        chatThreadId: 7,
        senderName: 'Dad',
        senderImageUrl: 'assets/images/gilberto-reyes.jpg',
        senderNumber: '',
        chatMessages: <ChatMessage>[
          ChatMessage(
            chatThreadId: 7,
            sentDate: DateTime.now().subtract(
              const Duration(days: 329, minutes: 25),
            ),
            id: 1,
            message:
                'What\'s wrong with you? Why don\'t you go visit your mom?',
            sender: 'Dad',
          ),
          ChatMessage(
            chatThreadId: 7,
            sentDate: DateTime.now().subtract(
              const Duration(days: 329, minutes: 13),
            ),
            id: 2,
            message:
                'She is not my mom and you are not my dad. Don\'t text me ever.',
            sender: 'You',
          ),
        ],
      ),
    ];
  }
}
