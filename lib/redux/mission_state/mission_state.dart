import 'package:phone007/models/exports.dart';

class MissionState {
  MissionState(
    this._missions,
    this._mission,
  );
  final List<Mission> _missions;
  final Mission? _mission;

  static MissionState init() {
    return MissionState(<Mission>[], null);
  }

  MissionState loadMissions(List<Mission> missions) {
    return MissionState(missions, null);
  }

  List<Mission> getMissions() {
    return _missions;
  }

  MissionState setCurrentMission(Mission mission) {
    return MissionState(_missions, mission);
  }

  Mission? getCurrentMission() {
    return _mission;
  }

  Mission? getMissionById(int missionId) {
    if (_missions.isEmpty) {
      return null;
    }
    return _missions.firstWhere((_) => _.id == missionId, orElse: null);
  }

  MissionState unlockScreen() {
    _mission?.unlockScreen();
    return MissionState(_missions, _mission);
  }
}
