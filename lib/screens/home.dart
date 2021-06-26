import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/models/enums.dart';
import 'package:flutter_redux_setup/models/mission.dart';
import 'package:flutter_redux_setup/utils/exports.dart';
import 'package:flutter_redux_setup/widgets/exports.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 70),
            Container(
              margin: const EdgeInsets.only(bottom: 6.0),
              child: const Text(
                'WELCOME, INVESTIGATOR',
                style: const TextStyle(
                  fontFamily: 'PermanentMarker',
                  fontSize: 24.0,
                  color: AppColors.black60,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24.0),
              child: const Text(
                '$PLAYER_NAME',
                style: const TextStyle(
                  fontFamily: 'PermanentMarker',
                  fontSize: 24.0,
                  color: AppColors.black60,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24.0),
              child: const Text(
                'Ready to solve these cases?',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Caveat',
                  color: AppColors.black60,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MissionCard(
                  cardColor: AppColors.gray16,
                  mission: Mission(
                    1,
                    '1. Introduction',
                    'assets/images/daniel-eliashevsky.jpg',
                    MissionStatus.inProgress,
                  ),
                ),
                const SizedBox(width: 20.0),
                MissionCard(
                  cardColor: AppColors.white,
                  mission: Mission(
                    2,
                    '2. Missing Person',
                    'assets/images/djordje-cvetkovic.jpg',
                    MissionStatus.completed,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MissionCard(
                  cardColor: AppColors.white,
                  mission: Mission(
                    3,
                    '3. Grandfather\'s secret',
                    'assets/images/antonio-sokic.jpg',
                    MissionStatus.completed,
                  ),
                ),
                const SizedBox(width: 20.0),
                MissionCard(
                  cardColor: AppColors.gray16,
                  mission: Mission(
                    4,
                    '4. Suicide or Murder?',
                    'assets/images/daria-sannikova.jpg',
                    MissionStatus.inProgress,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 24.0),
              child: const Text(
                'More missions coming soon...',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: AppColors.black60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
