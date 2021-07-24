import 'package:flutter_redux_setup/redux/gallery_state/actions/exports.dart';
import 'package:flutter_redux_setup/redux/gallery_state/gallery_state.dart';
import 'package:flutter_redux_setup/redux/core/exports.dart';
import 'package:redux/redux.dart';

class GalleryReducer extends GroupReducer<GalleryState> {
  GalleryReducer() : super(<Reducer<GalleryState>>[LoadGalleryReducer()]);
}
