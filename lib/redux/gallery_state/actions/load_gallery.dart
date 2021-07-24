import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/redux/core/exports.dart';
import 'package:flutter_redux_setup/redux/gallery_state/gallery_state.dart';

class LoadGallery {
  LoadGallery(this.galleryView);
  final GalleryView galleryView;
}

class LoadGalleryReducer extends TypedReducerClass<GalleryState, LoadGallery> {
  @override
  GalleryState reduce(GalleryState state, LoadGallery action) =>
      state.loadGallery(action.galleryView);
}
