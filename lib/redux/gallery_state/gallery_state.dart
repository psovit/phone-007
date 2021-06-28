class GalleryState {
  GalleryState(
    this._images,
  );

  final List<String> _images;

  static GalleryState init() {
    return GalleryState(
      <String>[],
    );
  }
}
