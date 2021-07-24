import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/utils/exports.dart';
import 'package:flutter_redux_setup/widgets/exports.dart';
import 'package:flutter_redux_setup/widgets/gallery.dart';

class MissionOne extends StatefulWidget {
  static const String BACKGROUND_IMAGE = 'assets/images/gilberto-reyes.jpg';

  @override
  _MissionOneState createState() => _MissionOneState();
}

class _MissionOneState extends State<MissionOne> {
  late List<String> photos;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          color: AppColors.message,
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
                                  missionId: Di()
                                          .getStore()
                                          .state
                                          .missionState
                                          .getCurrentMission()
                                          ?.id ??
                                      -1,
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
                          color: AppColors.message,
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
                                  missionId: Di()
                                          .getStore()
                                          .state
                                          .missionState
                                          .getCurrentMission()
                                          ?.id ??
                                      -1,
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
                        final bool? confirmExit = await showDialog<bool>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return ConfirmExit();
                          },
                        );

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
                      onPressed: () {},
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
}
