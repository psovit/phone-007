abstract class GalleryRepository {
  Future<List<String>> getGallery(int missionId);
}

class GalleryApi implements GalleryRepository {
  @override
  Future<List<String>> getGallery(int missionId) {
    throw UnimplementedError();
  }
}
