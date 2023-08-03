import 'package:collection/collection.dart' as collection;
import 'package:phone007/models/exports.dart';

class InternetBrowserState {
  InternetBrowserState(
    this._browserHistoryView,
  );

  final List<BrowserHistoryView> _browserHistoryView;

  static InternetBrowserState init() {
    return InternetBrowserState(
      <BrowserHistoryView>[],
    );
  }

  InternetBrowserState loadBrowserHistory(BrowserHistoryView browserHistoryView,
      {bool reset = true}) {
    final List<BrowserHistoryView> newState =
        List<BrowserHistoryView>.from(_browserHistoryView);
    if (reset) {
      newState.removeWhere((_) => _.missionId == browserHistoryView.missionId);
    }
    newState.add(browserHistoryView);
    return InternetBrowserState(newState);
  }

  BrowserHistoryView? getBrowserHistoryForMission(int missionId) {
    return _browserHistoryView
        .firstWhereOrNull((_) => _.missionId == missionId);
  }

  bool browserHistoryLoaded(int missionId) {
    return getBrowserHistoryForMission(missionId) != null;
  }
}
