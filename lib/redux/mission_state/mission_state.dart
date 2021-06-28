import 'package:flutter_redux_setup/models/exports.dart';

class MissionState {
  MissionState(
    this._missions,
  );
  final List<Mission> _missions;

  static MissionState init() {
    return MissionState(
      <Mission>[],
    );
  }

  MissionState loadMissions(List<Mission> missions) {
    return MissionState(
      missions,
    );
  }

  List<Mission> getMissions() {
    return _missions;
  }

  MissionState setCurrentMission(Mission mission) {
    return MissionState(
      _missions,
    );
  }
}
