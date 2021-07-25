import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/utils/exports.dart';
import 'package:flutter_redux_setup/widgets/exports.dart';
import 'package:flutter_redux_setup/widgets/gallery.dart';

class MissionOne extends StatefulWidget {
  const MissionOne({Key? key, required this.mission}) : super(key: key);

  static const String BACKGROUND_IMAGE = 'assets/images/gilberto-reyes.jpg';
  final Mission mission;

  @override
  _MissionOneState createState() => _MissionOneState();
}

class _MissionOneState extends State<MissionOne> {
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
    return Scaffold(
      key: _key,
      drawer: _drawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage(
              MissionOne.BACKGROUND_IMAGE,
            ),
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
                                  missionId: widget.mission.id,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        'Messages',
                        style: TextStyle(
                          fontFamily: 'Caveat',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue400,
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
                                  missionId: widget.mission.id,
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
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
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
                        Icons.circle_outlined,
                        size: 32,
                      ),
                      onPressed: () {},
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
  }

  Widget _drawer() {
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
                    widget.mission.questionText,
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
                              style: const TextStyle(color: AppColors.red),
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
                    onPressed: _checkingAnswer ? null : _checkAnswer,
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

  Future<void> _checkAnswer() async {
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
        await Di().getAnswerRepository().checkAnswer(widget.mission.id, answer);
    setState(() {});
    if (!answerResultView.correctAnswer) {
      setState(() {
        _checkingAnswer = false;
        _answerErrorText = answerResultView.hintText;
      });
    } else {
      setState(() {
        _checkingAnswer = false;
        _answerErrorText = answerResultView.hintText;
      });
    }
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
