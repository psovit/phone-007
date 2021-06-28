import 'package:flutter_redux_setup/models/exports.dart';

abstract class MissionRepository {
  Future<List<Mission>> getMissions();
}

class MissionApi implements MissionRepository {
  @override
  Future<List<Mission>> getMissions() async {
    return <Mission>[
      Mission(
        1,
        '1. Introduction',
        'assets/images/daniel-eliashevsky.jpg',
        MissionStatus.inProgress,
      ),
      Mission(
        2,
        '2. Missing Person',
        'assets/images/djordje-cvetkovic.jpg',
        MissionStatus.completed,
      ),
      Mission(
        3,
        '3. Grandfather\'s secret',
        'assets/images/antonio-sokic.jpg',
        MissionStatus.completed,
      ),
      Mission(
        4,
        '4. Suicide or Murder?',
        'assets/images/daria-sannikova.jpg',
        MissionStatus.inProgress,
      ),
    ];
  }
}
