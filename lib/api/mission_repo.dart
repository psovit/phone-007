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
        "This one is simple. You sat down on a bench and found a phone. No one is around, so it is probably lost...\n\nFortunately, the phone is unlocked!\n\nLet's play nice this time... Your mission is to find the owner's address so you can return it.",
      ),
      Mission(
        2,
        '2. Missing Person',
        'assets/images/djordje-cvetkovic.jpg',
        MissionStatus.completed,
        "This one is simple. You sat down on a bench and found a phone. No one is around, so it is probably lost...\n\nFortunately, the phone is unlocked!\n\nLet's play nice this time... Your mission is to find the owner's address so you can return it.",
      ),
      Mission(
        3,
        '3. Grandfather\'s secret',
        'assets/images/antonio-sokic.jpg',
        MissionStatus.completed,
        "This one is simple. You sat down on a bench and found a phone. No one is around, so it is probably lost...\n\nFortunately, the phone is unlocked!\n\nLet's play nice this time... Your mission is to find the owner's address so you can return it.",
      ),
      Mission(
        4,
        '4. Suicide or Murder?',
        'assets/images/daria-sannikova.jpg',
        MissionStatus.inProgress,
        "This one is simple. You sat down on a bench and found a phone. No one is around, so it is probably lost...\n\nFortunately, the phone is unlocked!\n\nLet's play nice this time... Your mission is to find the owner's address so you can return it.",
      ),
    ];
  }
}
