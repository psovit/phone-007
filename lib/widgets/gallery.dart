import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/redux/app_state.dart';
import 'package:flutter_redux_setup/widgets/image_full_screen.dart';
import 'package:redux/redux.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key, required this.missionId}) : super(key: key);
  final int missionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gallery',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: StoreConnector<AppState, GalleryView?>(
        converter: (Store<AppState> store) {
          return store.state.galleryState.getGalleryForMission(missionId);
        },
        builder: (_, GalleryView? galleryView) {
          if (galleryView == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: galleryView.galleryItems.length,
              itemBuilder: (BuildContext ctx, int index) {
                final GalleryItemView galleryItemView =
                    galleryView.galleryItems[index];
                final Widget imageChild = Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage(galleryItemView.itemUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                );
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push<dynamic>(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => ImageFullScreen(
                          child: imageChild,
                        ),
                      ),
                    );
                  },
                  child: imageChild,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
