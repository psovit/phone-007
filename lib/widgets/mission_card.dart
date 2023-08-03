import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone007/models/exports.dart';

class MissionCard extends StatelessWidget {
  const MissionCard({
    Key? key,
    required this.mission,
    required this.cardColor,
    this.useNetworkImage = false,
  }) : super(key: key);

  final Mission mission;
  final Color cardColor;
  final bool useNetworkImage;
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
            child: useNetworkImage
                ? Image.network(
                    'https://images.pexels.com/photos/2228552/pexels-photo-2228552.jpeg',
                    height: 120,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
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
          ScaffoldMessenger.of(context).clearSnackBars();
          if (mission.status == MissionStatus.locked) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('This mission is locked at the moment'),
              ),
            );
            return;
          }
          context.go('/mission-intro/${mission.id}');
        },
      ),
    );
  }
}
