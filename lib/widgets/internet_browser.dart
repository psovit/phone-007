import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/redux/app_state.dart';
import 'package:flutter_redux_setup/utils/exports.dart';
import 'package:redux/redux.dart';

class InternetBrowser extends StatefulWidget {
  const InternetBrowser({Key? key, required this.missionId}) : super(key: key);
  final int missionId;

  @override
  _InternetBrowserState createState() => _InternetBrowserState();
}

class _InternetBrowserState extends State<InternetBrowser> {
  List<BrowserSearchItemView> _filteredSearchItems = <BrowserSearchItemView>[];
  List<BrowserSearchItemView> _searchItems = <BrowserSearchItemView>[];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, BrowserHistoryView?>(
        converter: (Store<AppState> store) {
          return store.state.internetBrowserState
              .getBrowserHistoryForMission(widget.missionId);
        },
        builder: (_, BrowserHistoryView? browserView) {
          if (browserView == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_searchItems.isEmpty) {
            _searchItems = browserView.searchItems;
            _filteredSearchItems =
                _searchItems.where((_) => _.isRecentSearch).toList();
          }
          if (_searchItems.isEmpty) {
            return const Center(
              child: Text(
                'No search history here.',
                style: TextStyle(fontSize: 22),
              ),
            );
          }
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: TextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      fillColor: AppColors.gray4,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onTap: () {
                      _focusNode.requestFocus();
                      setState(() {});
                    },
                    onChanged: (String text) {
                      if (StringUtils.isNullOrEmpty(text)) {
                        setState(() {
                          _filteredSearchItems = _searchItems
                              .where((_) => _.isRecentSearch)
                              .toList();
                        });
                        return;
                      }
                      setState(() {
                        _filteredSearchItems = _searchItems
                            .where((_) => _.searchText
                                .toLowerCase()
                                .contains(text.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ),
                _focusNode.hasFocus
                    ? Container(
                        child: Column(
                        children: <Widget>[
                          Column(
                            children: List<Widget>.generate(
                              _filteredSearchItems.length,
                              (int index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: const Icon(
                                        Icons.alarm_on_outlined,
                                        size: 16.0,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                    ),
                                    Text(
                                      _filteredSearchItems[index].searchText,
                                      style: const TextStyle(fontSize: 22.0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          StringUtils.isNullOrEmpty(_searchController.text)
                              ? const Text(
                                  'More search history available, type to filter',
                                )
                              : const SizedBox()
                        ],
                      ))
                    : Container(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              'You are offline.',
                              style: TextStyle(fontSize: 36.0),
                            ),
                            Text(
                              'Your recent searches are still available.',
                              style: TextStyle(fontSize: 22.0),
                            ),
                            Text(
                              'Click on the search bar to view them.',
                              style: TextStyle(fontSize: 22.0),
                            )
                          ],
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
