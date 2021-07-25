import 'package:phone007/models/exports.dart';
import 'package:phone007/redux/core/exports.dart';
import 'package:phone007/redux/mission_state/mission_state.dart';

class SetCurrentMission {
  SetCurrentMission(this._mission);

  final Mission _mission;
  Mission get mission => _mission;
}

class SetCurrentMissionReducer
    extends TypedReducerClass<MissionState, SetCurrentMission> {
  @override
  MissionState reduce(MissionState state, SetCurrentMission action) =>
      state.setCurrentMission(action.mission);
}
