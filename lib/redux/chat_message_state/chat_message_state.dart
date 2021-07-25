import 'package:phone007/models/exports.dart';

class ChatMessageState {
  ChatMessageState(
    this._chatThreads,
  );

  final List<ChatThreadView> _chatThreads;

  static ChatMessageState init() {
    return ChatMessageState(
      <ChatThreadView>[],
    );
  }

  ChatMessageState loadChatThreads(List<ChatThreadView> chatThreads,
      {bool reset = true}) {
    if (chatThreads.isEmpty) {
      return ChatMessageState(_chatThreads);
    }
    final List<ChatThreadView> newState =
        List<ChatThreadView>.from(_chatThreads);
    if (reset) {
      newState.removeWhere((_) => _.missionId == chatThreads.first.missionId);
    }
    newState.addAll(chatThreads);
    return ChatMessageState(newState);
  }

  List<ChatThreadView> getChatThreadsForMission(int missionId) {
    final List<ChatThreadView> result =
        _chatThreads.where((_) => _.missionId == missionId).toList();
    return result;
  }

  bool missionChatThreadLoaded(int missionId) {
    return getChatThreadsForMission(missionId).isNotEmpty;
  }
}
