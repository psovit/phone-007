class ChatMessage {
  ChatMessage(
    this.id,
    this.missionId,
    this.sender,
    this.sentDate,
    this.message,
  );
  final int id;
  final int missionId;
  final String sender;
  final DateTime sentDate;
  final String message;
}
