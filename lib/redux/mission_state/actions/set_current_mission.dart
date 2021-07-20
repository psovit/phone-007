import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/redux/core/exports.dart';
import 'package:flutter_redux_setup/redux/mission_state/mission_state.dart';

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
