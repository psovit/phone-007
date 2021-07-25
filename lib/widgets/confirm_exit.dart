import 'package:flutter/material.dart';
import 'package:phone007/utils/exports.dart';

class ConfirmExit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Are you sure you want to leave this mission?',
        style: TextStyle(
          fontSize: 20.0,
          color: AppColors.black60,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 18.0,
              color: AppColors.black60,
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text(
            'Exit mission',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
