import 'package:flutter_redux_setup/models/exports.dart';

class LoadMissions {
  LoadMissions(this._missions);

  final List<Mission> _missions;
  List<Mission> get missions => _missions;
}

class SetCurrentMission {
  SetCurrentMission(this._mission);

  final Mission _mission;
  Mission get mission => _mission;
}

class SetMissionChatMessages {
  SetMissionChatMessages(this._missionId, this._chatMessages);

  final Map<String, List<ChatMessage>> _chatMessages;
  final int _missionId;

  Map<String, List<ChatMessage>> get chatMessages => _chatMessages;
  int get missionId => _missionId;
}

class SetMissionGallery {
  SetMissionGallery(this._images);

  final List<String> _images;
  List<String> get images => _images;
}
