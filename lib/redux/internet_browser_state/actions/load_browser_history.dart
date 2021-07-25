import 'package:phone007/models/exports.dart';
import 'package:phone007/redux/core/exports.dart';
import 'package:phone007/redux/internet_browser_state/internet_browser_state.dart';

class LoadBrowserHistory {
  LoadBrowserHistory(this.browserHistoryView);
  final BrowserHistoryView browserHistoryView;
}

class LoadBrowserHistoryReducer
    extends TypedReducerClass<InternetBrowserState, LoadBrowserHistory> {
  @override
  InternetBrowserState reduce(
          InternetBrowserState state, LoadBrowserHistory action) =>
      state.loadBrowserHistory(action.browserHistoryView);
}
