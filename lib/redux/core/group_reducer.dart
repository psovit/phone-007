import 'package:redux/redux.dart';

class GroupReducer<State> extends ReducerClass<State> {
  GroupReducer(List<Reducer<State>> reducers) {
    _combinedReducer = combineReducers(reducers);
  }

  late Reducer<State> _combinedReducer;

  @override
  State call(State state, dynamic action) {
    return _combinedReducer(state, action);
  }
}
