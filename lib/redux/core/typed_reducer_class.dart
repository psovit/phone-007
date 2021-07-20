import 'package:redux/redux.dart';

abstract class TypedReducerClass<State, Action> implements ReducerClass<State> {
  State reduce(State state, Action action);

  @override
  State call(State state, dynamic action) {
    return _callReduceForSpecificActionOnly(state, action);
  }

  State _callReduceForSpecificActionOnly(State state, dynamic action) {
    if (action is Action) {
      return reduce(state, action);
    }

    return state;
  }
}
