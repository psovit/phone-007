import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/redux/core/exports.dart';
import 'package:flutter_redux_setup/redux/mission_state/mission_state.dart';

class LoadMissions {
  LoadMissions(this._missions);

  final List<Mission> _missions;
  List<Mission> get missions => _missions;
}

class LoadMissionsReducer
    extends TypedReducerClass<MissionState, LoadMissions> {
  @override
  MissionState reduce(MissionState state, LoadMissions action) =>
      state.loadMissions(action.missions);
}
