import 'package:flutter_redux_setup/redux/gallery_state/gallery_state.dart';
import 'package:flutter_redux_setup/redux/group_reducer.dart';
import 'package:redux/redux.dart';

class GalleryReducer extends GroupReducer<GalleryState> {
  GalleryReducer() : super(<Reducer<GalleryState>>[]);
}
