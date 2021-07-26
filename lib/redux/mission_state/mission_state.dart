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

  MissionState unlockScreen() {
    _mission?.unlockScreen();
    return MissionState(_missions, _mission);
  }
}
