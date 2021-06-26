import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/screens/missions/one/introduction.dart';

class MissionCard extends StatelessWidget {
  const MissionCard({
    Key? key,
    required this.mission,
    required this.cardColor,
  }) : super(key: key);

  final Mission mission;
  final Color cardColor;
  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    final Container card = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 14.0,
      ),
      width: (mediaSize.width / 2) - 32,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: cardColor,
            blurRadius: 3.0,
            offset: const Offset(0.0, 1),
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              mission.image,
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            mission.title,
            style: const TextStyle(
              fontSize: 18.0,
              fontFamily: 'Caveat',
            ),
            maxLines: 2,
          )
        ],
      ),
    );

    return Material(
      child: InkWell(
        child: card,
        onTap: () {
          Navigator.of(context, rootNavigator: true).push<dynamic>(
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => Introduction(
                mission: mission,
              ),
            ),
          );
        },
      ),
    );
  }
}
