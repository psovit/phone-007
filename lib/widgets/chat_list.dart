import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/models/exports.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key, required this.chatMessages}) : super(key: key);
  final List<ChatMessage> chatMessages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 70,
          left: 18.0,
          right: 18.0,
          bottom: 12.0,
        ),
        child: Column(
          children: <Widget>[
            const Text(
              'Messages',
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'PermanentMarker',
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              'No unread messages',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (_, int index) {
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
