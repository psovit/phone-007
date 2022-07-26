import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:phone007/models/exports.dart';
import 'package:phone007/redux/app_state.dart';
import 'package:phone007/utils/exports.dart';
import 'package:phone007/widgets/exports.dart';
import 'package:phone007/widgets/gallery.dart';
import 'package:phone007/widgets/internet_browser.dart';
import 'package:phone007/widgets/locked_screen.dart';
import 'package:phone007/widgets/mission_complete.dart';
import 'package:phone007/widgets/notes_list.dart';
import 'package:phone007/widgets/safe/safe_widget.dart';
import 'package:redux/redux.dart';

class MissionScreen extends StatefulWidget {
  @override
  _MissionScreenState createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  late List<String> photos;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  bool _checkingAnswer = false;
  String _answerErrorText = '';
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Mission?>(
        converter: (Store<AppState> store) {
      return store.state.missionState.getCurrentMission();
    }, builder: (_, Mission? mission) {
      if (mission == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (mission.screenLocked) {
        return LockedScreen(
          hintText: mission.lockScreenView!.hintText,
          validCode: mission.lockScreenView!.validCode,
        );
      }
      return Scaffold(
        key: _key,
        drawer: _drawer(mission),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mission.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 60,
                  left: 24.0,
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.blue400,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.chat_rounded,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).push<dynamic>(
                                MaterialPageRoute<dynamic>(
                                  builder: (BuildContext context) => ChatList(
                                    missionId: mission.id,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Text(
                          'Messages',
                          style: TextStyle(
                            backgroundColor: AppColors.black,
                            fontFamily: 'Caveat',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 32),
                    Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.gallery,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.photo,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).push<dynamic>(
                                MaterialPageRoute<dynamic>(
                                  builder: (BuildContext context) => Gallery(
                                    missionId: mission.id,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(
                            fontFamily: 'Caveat',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gallery,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 32),
                    _notes(mission),
                    const SizedBox(width: 32),
                    _internetBrowser(mission),
                    const SizedBox(width: 32),
                    _vault(mission),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                color: AppColors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 32,
                        ),
                        onPressed: () async {
                          final bool? confirmExit = await _confirmExit();

                          if (confirmExit != null && confirmExit) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: const Icon(
                          Icons.flag_outlined,
                          size: 32,
                        ),
                        onPressed: () {
                          setState(() {
                            _textEditingController.text = '';
                            _checkingAnswer = false;
                            _answerErrorText = '';
                          });
                          _key.currentState!.openDrawer();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _notes(Mission mission) {
    if (!mission.hasNotes) {
      return const SizedBox();
    }
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            color: AppColors.yellow,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.notes_outlined,
              size: 32,
              color: AppColors.black,
            ),
            onPressed: () {
              Navigator.of(context).push<dynamic>(
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => NotesList(
                    missionId: mission.id,
                  ),
                ),
              );
            },
          ),
        ),
        const Text(
          'Notes',
          style: TextStyle(
            backgroundColor: AppColors.black,
            fontFamily: 'Caveat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        )
      ],
    );
  }

  Widget _internetBrowser(Mission mission) {
    if (!mission.hasInternetBrowser) {
      return const SizedBox();
    }
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            color: AppColors.gray16,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.wifi,
              size: 32,
              color: AppColors.blue400,
            ),
            onPressed: () {
              Navigator.of(context).push<dynamic>(
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => InternetBrowser(
                    missionId: mission.id,
                  ),
                ),
              );
            },
          ),
        ),
        const Text(
          'Internet',
          style: TextStyle(
            backgroundColor: AppColors.black,
            fontFamily: 'Caveat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _vault(Mission mission) {
    if (!mission.hasSafe) {
      return const SizedBox();
    }
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            color: AppColors.gray16,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.lock,
              size: 32,
              color: AppColors.red,
            ),
            onPressed: () {
              Navigator.of(context).push<dynamic>(
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => SafeWidget(
                    missionId: mission.id,
                  ),
                ),
              );
            },
          ),
        ),
        const Text(
          'Safe',
          style: TextStyle(
            backgroundColor: AppColors.black,
            fontFamily: 'Caveat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        )
      ],
    );
  }

  Widget _drawer(Mission mission) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.gray4,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Think you got it?',
                    style: TextStyle(fontSize: 26),
                  ),
                  Text(
                    mission.questionText,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  _checkingAnswer
                      ? const SizedBox(
                          child: CircularProgressIndicator(),
                          height: 20.0,
                          width: 20.0,
                        )
                      : _answerErrorText == ''
                          ? const SizedBox()
                          : Text(
                              _answerErrorText,
                              style: const TextStyle(
                                color: AppColors.red,
                                fontSize: 16.0,
                              ),
                            ),
                  TextField(
                    controller: _textEditingController,
                    style: const TextStyle(
                      color: AppColors.green,
                      fontSize: 22.0,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.black40,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      enabled: !_checkingAnswer,
                    ),
                  ),
                  ElevatedButton(
                    onPressed:
                        _checkingAnswer ? null : () => _checkAnswer(mission),
                    child: const Text('Check Answer'),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              'I Need A Hint!',
              style: TextStyle(color: AppColors.blue400, fontSize: 22.0),
            ),
            onTap: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: AppColors.yellow,
                  content: Text(
                    'Coming soon..',
                    style: TextStyle(color: AppColors.black40),
                  ),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Exit Mission',
              style: TextStyle(color: AppColors.blue400, fontSize: 22.0),
            ),
            onTap: () async {
              final bool? confirmExit = await _confirmExit();

              if (confirmExit != null && confirmExit) {
                Navigator.pop(context);
                Navigator.of(context).pop();
              }
            },
          ),
          const Divider(),
        ],
      ),
    );
  }

  Future<void> _checkAnswer(Mission mission) async {
    final String answer = _textEditingController.text;
    if (answer.isEmpty || answer == '') {
      setState(() {
        _answerErrorText = 'This answer does not look right.';
      });
    }
    setState(() {
      _checkingAnswer = true;
    });
    final AnswerResultView answerResultView =
        await Di().getAnswerRepository().checkAnswer(mission.id, answer.trim());
    setState(() {});
    if (!answerResultView.correctAnswer) {
      setState(() {
        _checkingAnswer = false;
        _answerErrorText = answerResultView.hintText;
      });
    } else {
      setState(() {
        _checkingAnswer = false;
        _answerErrorText = '';
      });
      Navigator.pop(context);
      await _completedMission();
      Navigator.of(context).popUntil((_) => _.settings.name == '/');
    }
  }

  Future<bool?> _completedMission() async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MissionComplete();
      },
    );
  }

  Future<bool?> _confirmExit() async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ConfirmExit();
      },
    );
  }
}
