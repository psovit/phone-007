import 'package:flutter_redux_setup/models/exports.dart';

abstract class GalleryRepository {
  Future<GalleryView> getGallery(int missionId);
}

class GalleryApi implements GalleryRepository {
  @override
  Future<GalleryView> getGallery(int missionId) async {
    return GalleryView(
      galleryId: 1,
      missionId: missionId,
      galleryItems: <GalleryItemView>[
        GalleryItemView(
          id: 1,
          itemUrl: 'assets/images/daniel-eliashevsky.jpg',
          createdAt: DateTime.now().subtract(const Duration(days: 3)),
        ),
        GalleryItemView(
          id: 2,
          itemUrl: 'assets/images/antonio-sokic.jpg',
          createdAt: DateTime.now().subtract(const Duration(days: 3)),
        ),
        GalleryItemView(
          id: 3,
          itemUrl: 'assets/images/hamro-jatra.jpg',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
        ),
        GalleryItemView(
          id: 3,
          itemUrl: 'assets/images/prateek-katyal.jpg',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
        ),
      ],
    );
  }
}
