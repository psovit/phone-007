import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: const Text(
        'START MISSION',
        style: TextStyle(
          fontFamily: 'Caveat',
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
