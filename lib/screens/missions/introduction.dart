import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phone007/models/exports.dart';
import 'package:phone007/redux/mission_state/actions/init_mission.dart';
import 'package:phone007/screens/missions/mission_screen.dart';
import 'package:phone007/utils/exports.dart';
import 'package:phone007/widgets/exports.dart';
import 'package:phone007/widgets/start_button.dart';

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
              Di().getStore().dispatch(InitMission(mission));
              Navigator.of(context).push<dynamic>(
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => MissionScreen(
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
