import 'package:phone007/models/exports.dart';

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
        'assets/images/gilberto-reyes.jpg',
        MissionStatus.notStarted,
        "This one is simple. You sat down on a bench and found a phone. No one is around, so it is probably lost...\n\nFortunately, the phone is unlocked!\n\nLet's play nice this time... Your mission is to find the owner's address so you can return it.",
        'Type the phone owner\'s adress below, and we will check it for you.',
        <String>[
          'Dhumbarahi Marg 582/76',
          '582/76 Dhumbarahi Marg',
        ],
      ),
      Mission(
        2,
        '2. Missing Person',
        'assets/images/djordje-cvetkovic.jpg',
        'assets/images/mehendi.jpg',
        MissionStatus.notStarted,
        "Your cousin's daughter, Anite, disappeared two nights ago. Her parents believe she ran away from home after her boyfried broke up with her. \nShe left her phone behind, but it looks like she deleted everything from it. \n Can you check if there are any clues left on the device that can shed some light on Anita's location?",
        'Help her parents find the daughter. Any possible leads?',
        <String>[
          'Lake View Resort Pokhara',
        ],
        hasNotes: true,
        hasInternetBrowser: true,
      ),
      Mission(
        3,
        '3. Prevent Robbery',
        'assets/images/antonio-sokic.jpg',
        'assets/images/tima-miroshnichenko.jpg',
        MissionStatus.notStarted,
        'There has been an increase in robberies in your town. The most recent robbery happened yesterday at Mr. Jagannath’s house. They took all the cash and other valuables from the house. \nHowever, one of the thieves forgot his phone at the scene and now the local police have it. \n\nCan you help the police to catch the thieves? When and where is their next robbery going to happen?',
        '',
        <String>[],
        screenLocked: true,
        lockScreenView: LockScreenView('Fibonnaci 0-1', '0112'),
        hasSafe: true,
      ),
      Mission(
        4,
        '4. Suicide or Murder?',
        'assets/images/daria-sannikova.jpg',
        'assets/images/gilberto-reyes.jpg',
        MissionStatus.locked,
        "This one is simple. You sat down on a bench and found a phone. No one is around, so it is probably lost...\n\nFortunately, the phone is unlocked!\n\nLet's play nice this time... Your mission is to find the owner's address so you can return it.",
        '',
        <String>[],
      ),
    ];
  }
}
