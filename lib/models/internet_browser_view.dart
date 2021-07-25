class BrowserSearchItemView {
  BrowserSearchItemView(
    this.id,
    this.missionId,
    this.searchText, {
    this.isRecentSearch = true,
    this.isCached = false,
    this.cachedContentHtml = '',
  });
  final int id;
  final int missionId;
  final String searchText;
  final bool isCached;
  final String cachedContentHtml;
  final bool isRecentSearch;
}

class BrowserHistoryView {
  BrowserHistoryView(this.missionId, this.searchItems);
  final int missionId;
  final List<BrowserSearchItemView> searchItems;
}
