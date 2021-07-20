import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/models/exports.dart';

class ChatDetail extends StatelessWidget {
  const ChatDetail({Key? key, required this.chatMessages}) : super(key: key);
  final List<ChatMessage> chatMessages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
