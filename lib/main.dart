import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:phone007/redux/app_state.dart';
import 'package:phone007/screens/home.dart';
import 'package:phone007/utils/exports.dart';
import 'package:redux/redux.dart';

void main() {
  Di();

  runApp(MyApp(
    store: Di().getStore(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Phone 007',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Caveat'),
        home: Home(),
      ),
    );
  }
}
