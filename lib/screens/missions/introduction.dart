import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/redux/chat_message_state/actions/exports.dart';
import 'package:flutter_redux_setup/redux/gallery_state/actions/load_gallery.dart';
import 'package:flutter_redux_setup/screens/missions/one/mission_one.dart';
import 'package:flutter_redux_setup/utils/exports.dart';
import 'package:flutter_redux_setup/widgets/exports.dart';
import 'package:flutter_redux_setup/widgets/start_button.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key, required this.mission}) : super(key: key);
  final Mission mission;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            new Container(
              child: ClipPath(
                clipper: ClipPathClass(),
                child: Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage(
                        mission.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height / 3,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                mission.title,
                style: const TextStyle(
                  fontFamily: 'PermanentMarker',
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 24.0),
              child: Text(
                mission.description,
                style: const TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            StartButton(onPressed: () {
              _loadMissionObjects();
              Navigator.of(context).push<dynamic>(
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => MissionOne(
                    mission: mission,
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 12.0,
            ),
            GoBack(),
          ],
        ),
      ),
    );
  }

  void _loadMissionObjects() {
    if (mission.hasChatMessages) {
      _fetchChatMessages();
    }
    if (mission.hasGallery) {
      _fetchGallery();
    }
  }

  Future<void> _fetchChatMessages() async {
    final bool fetched = Di()
        .getStore()
        .state
        .chatMessageState
        .missionChatThreadLoaded(mission.id);
    if (!fetched) {
      final List<ChatThreadView> chatThreads =
          await Di().getChatMessageRepository().getChatMessages(mission.id);
      Di().getStore().dispatch(LoadChatThreads(chatThreads));
    }
  }

  Future<void> _fetchGallery() async {
    final bool fetched =
        Di().getStore().state.galleryState.galleryLoaded(mission.id);
    if (!fetched) {
      final GalleryView galleryView =
          await Di().getGalleryRepository().getGallery(mission.id);
      Di().getStore().dispatch(LoadGallery(galleryView));
    }
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height - 60);

    final Offset secondControlPoint = Offset(
      size.width - (size.width / 4),
      size.height,
    );
    final Offset secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
