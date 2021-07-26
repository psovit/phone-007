import 'package:phone007/redux/core/exports.dart';
import 'package:phone007/redux/mission_state/mission_state.dart';

class UnlockScreen {}

class UnlockScreenReducer
    extends TypedReducerClass<MissionState, UnlockScreen> {
  @override
  MissionState reduce(MissionState state, UnlockScreen action) =>
      state.unlockScreen();
}
