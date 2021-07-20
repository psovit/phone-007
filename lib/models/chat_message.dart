enum MessageType { text, image, video, file }

class ChatMessage {
  ChatMessage({
    this.id,
    required this.chatThreadId,
    this.sender = 'You',
    required this.sentDate,
    this.message,
    this.messageType: MessageType.text,
  });
  late int? id;
  final int chatThreadId;
  final String sender;
  final DateTime sentDate;
  final String? message;
  final MessageType messageType;
  bool get isSentByMe => sender == 'You';
}

class ChatThreadView {
  ChatThreadView({
    required this.missionId,
    required this.chatThreadId,
    required this.senderName,
    required this.senderNumber,
    required this.senderImageUrl,
    required this.chatMessages,
  });
  final int missionId;
  final int chatThreadId;
  final String senderName;
  final String senderNumber;
  final String senderImageUrl;
  final List<ChatMessage> chatMessages;

  ChatMessage lastMessage() {
    if (chatMessages.isNotEmpty) {
      chatMessages.sort(
        (ChatMessage a, ChatMessage b) => b.sentDate.compareTo(a.sentDate),
      );
      return chatMessages.first;
    }
    return ChatMessage(chatThreadId: chatThreadId, sentDate: DateTime.now());
  }
}
