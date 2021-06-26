import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/utils/exports.dart';

class GoBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          const Icon(Icons.arrow_back_sharp, color: AppColors.black40),
          const Text(
            'Go Back',
            style: TextStyle(color: AppColors.black40),
          )
        ],
      ),
    );
  }
}
