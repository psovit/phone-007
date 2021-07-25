import 'package:flutter_redux_setup/redux/core/exports.dart';
import 'package:flutter_redux_setup/redux/internet_browser_state/actions/load_browser_history.dart';
import 'package:flutter_redux_setup/redux/internet_browser_state/internet_browser_state.dart';
import 'package:redux/redux.dart';

class InternetBrowserHistoryReducer extends GroupReducer<InternetBrowserState> {
  InternetBrowserHistoryReducer()
      : super(<Reducer<InternetBrowserState>>[LoadBrowserHistoryReducer()]);
}
