import 'package:flutter/material.dart';
import 'package:phone007/models/exports.dart';
import 'package:phone007/redux/mission_state/actions/export.dart';
import 'package:phone007/redux/mission_state/actions/init_mission.dart';
import 'package:phone007/screens/missions/mission_screen.dart';
import 'package:phone007/utils/exports.dart';
import 'package:phone007/widgets/exports.dart';

class Introduction extends StatefulWidget {
  const Introduction({
    Key? key,
    required this.missionId,
  }) : super(key: key);

  final int missionId;
  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  Mission? mission;
  @override
  void initState() {
    super.initState();

    mission =
        Di().getStore().state.missionState.getMissionById(widget.missionId);
    if (mission != null) {
      Di().getStore().dispatch(SetCurrentMission(mission!));
    }
  }

  @override
  void didUpdateWidget(covariant Introduction oldWidget) {
    if (oldWidget.missionId != widget.missionId) {
      mission =
          Di().getStore().state.missionState.getMissionById(widget.missionId);
      if (mission != null) {
        Di().getStore().dispatch(SetCurrentMission(mission!));
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (mission == null) {
      return const Center(
        child: Material(
          child: Text(
            'Mission not found!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    }
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
                        mission!.image,
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
                mission!.title,
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
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 80.0),
              child: Text(
                mission!.description,
                style: const TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            StartButton(onPressed: () {
              Di().getStore().dispatch(InitMission(mission!));
              Navigator.of(context).push<dynamic>(
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => MissionScreen(),
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
