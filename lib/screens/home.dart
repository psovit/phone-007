import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_setup/models/mission.dart';
import 'package:flutter_redux_setup/redux/app_state.dart';
import 'package:flutter_redux_setup/redux/mission_state/actions/export.dart';
import 'package:flutter_redux_setup/utils/exports.dart';
import 'package:flutter_redux_setup/widgets/exports.dart';
import 'package:redux/redux.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _loadMissions();
  }

  Future<void> _loadMissions() async {
    final List<Mission> missions =
        await Di().getMissionRepository().getMissions();
    Di().getStore().dispatch(LoadMissions(missions));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: StoreConnector<AppState, List<Mission>>(
        converter: (Store<AppState> store) {
          return store.state.missionState.getMissions();
        },
        builder: (_, List<Mission> missions) {
          if (missions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
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
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: missions.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return MissionCard(
                        cardColor:
                            index % 3 == 0 ? AppColors.gray16 : AppColors.white,
                        mission: missions[index],
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24.0),
                  child: const Text(
                    'More missions coming soon...',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: AppColors.black60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
