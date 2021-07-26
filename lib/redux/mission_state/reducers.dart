import 'package:phone007/redux/core/exports.dart';
import 'package:phone007/redux/mission_state/actions/export.dart';
import 'package:phone007/redux/mission_state/actions/unlock_screen.dart';
import 'package:phone007/redux/mission_state/mission_state.dart';
import 'package:redux/redux.dart';

class MissionReducer extends GroupReducer<MissionState> {
  MissionReducer()
      : super(<Reducer<MissionState>>[
          LoadMissionsReducer(),
          SetCurrentMissionReducer(),
          UnlockScreenReducer(),
        ]);
}
