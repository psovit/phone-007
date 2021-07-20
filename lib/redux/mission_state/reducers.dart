import 'package:flutter_redux_setup/redux/core/exports.dart';
import 'package:flutter_redux_setup/redux/mission_state/actions/export.dart';
import 'package:flutter_redux_setup/redux/mission_state/mission_state.dart';
import 'package:redux/redux.dart';

class MissionReducer extends GroupReducer<MissionState> {
  MissionReducer()
      : super(<Reducer<MissionState>>[
          LoadMissionsReducer(),
          SetCurrentMissionReducer(),
        ]);
}
