import 'package:phone007/models/exports.dart';
import 'package:collection/collection.dart' as collection;

class GalleryState {
  GalleryState(
    this._galleries,
  );

  final List<GalleryView> _galleries;

  static GalleryState init() {
    return GalleryState(
      <GalleryView>[],
    );
  }

  GalleryState loadGallery(GalleryView galleryView, {bool reset = true}) {
    final List<GalleryView> newState = List<GalleryView>.from(_galleries);
    if (reset) {
      newState.removeWhere((_) => _.missionId == galleryView.missionId);
    }
    newState.add(galleryView);
    return GalleryState(newState);
  }

  GalleryView? getGalleryForMission(int missionId) {
    return _galleries.firstWhereOrNull((_) => _.missionId == missionId);
  }

  bool galleryLoaded(int missionId) {
    return getGalleryForMission(missionId) != null;
  }
}
