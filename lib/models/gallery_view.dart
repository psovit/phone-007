import 'package:phone007/models/exports.dart';

class GalleryItemView {
  GalleryItemView({
    required this.id,
    this.itemType = GalleryItemType.image,
    required this.itemUrl,
    required this.createdAt,
  });
  final int id;
  final GalleryItemType itemType;
  final String itemUrl;
  final DateTime createdAt;
}

class GalleryView {
  GalleryView({
    required this.missionId,
    required this.galleryId,
    required this.galleryItems,
  });
  final int missionId;
  final int galleryId;
  final List<GalleryItemView> galleryItems;
}
