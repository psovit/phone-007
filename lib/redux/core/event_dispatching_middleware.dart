import 'dart:async';

import 'package:redux/redux.dart';

Middleware<State> createEventDispatchingMiddleware<State>(
    StreamController<dynamic> streamController) {
  return (
    Store<State> store,
    dynamic action,
    NextDispatcher next,
  ) {
    next(action);
    streamController.add(action);
  };
}
