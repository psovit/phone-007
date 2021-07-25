import 'package:flutter/material.dart';
import 'package:phone007/utils/exports.dart';

class MissionComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: const <Widget>[
          const Text(
            '🎉 Congratulations 🎉',
            style: TextStyle(
              fontSize: 26.0,
              color: AppColors.black60,
            ),
          ),
          const Text(
            'You got the right answer!',
            style: TextStyle(
              fontSize: 20.0,
              color: AppColors.black60,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text(
            'Back To Home',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
