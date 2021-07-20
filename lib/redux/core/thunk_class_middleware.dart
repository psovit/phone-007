import 'package:redux/redux.dart';

abstract class ThunkActionClass<T> {
  void run(Store<T> store);
}

void thunkClassMiddleware<State>(
  Store<State> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is ThunkActionClass<State>) {
    action.run(store);
  } else {
    next(action);
  }
}
