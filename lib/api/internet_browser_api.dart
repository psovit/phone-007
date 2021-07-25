import 'package:flutter_redux_setup/models/exports.dart';

abstract class InternetBrowserRepository {
  Future<BrowserHistoryView> loadBrowserHistory(int missionId);
}

class InternetBrowserApi implements InternetBrowserRepository {
  @override
  Future<BrowserHistoryView> loadBrowserHistory(int missionId) async {
    return BrowserHistoryView(
      missionId,
      <BrowserSearchItemView>[
        BrowserSearchItemView(1, missionId, 'my boyfriend broke up with me'),
        BrowserSearchItemView(2, missionId, 'hotels in Pokhara'),
        BrowserSearchItemView(3, missionId, 'how to delete browsing history'),
        BrowserSearchItemView(4, missionId, 'dealing with anxiety'),
        BrowserSearchItemView(5, missionId, 'how to fake a smile'),
        BrowserSearchItemView(
          6,
          missionId,
          'dog parks near kathmandu',
          isRecentSearch: false,
        ),
        BrowserSearchItemView(
          6,
          missionId,
          'Lake View Resort Address',
          isRecentSearch: false,
        ),
      ],
    );
  }
}
