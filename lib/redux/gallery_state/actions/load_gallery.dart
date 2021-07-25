import 'package:phone007/models/exports.dart';
import 'package:phone007/redux/core/exports.dart';
import 'package:phone007/redux/gallery_state/gallery_state.dart';

class LoadGallery {
  LoadGallery(this.galleryView);
  final GalleryView galleryView;
}

class LoadGalleryReducer extends TypedReducerClass<GalleryState, LoadGallery> {
  @override
  GalleryState reduce(GalleryState state, LoadGallery action) =>
      state.loadGallery(action.galleryView);
}
