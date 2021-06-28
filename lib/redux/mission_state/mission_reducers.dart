import 'package:flutter_redux_setup/redux/group_reducer.dart';
import 'package:flutter_redux_setup/redux/mission_state/mission_actions.dart';
import 'package:flutter_redux_setup/redux/mission_state/mission_state.dart';
import 'package:flutter_redux_setup/redux/typed_reducer_class.dart';
import 'package:redux/redux.dart';

class ArticlesDecrementedReducer
    extends TypedReducerClass<MissionState, LoadMissions> {
  @override
  MissionState reduce(MissionState state, LoadMissions action) =>
      state.loadMissions(action.missions);
}

class MissionReducer extends GroupReducer<MissionState> {
  MissionReducer()
      : super(<Reducer<MissionState>>[
          ArticlesDecrementedReducer(),
        ]);
}
