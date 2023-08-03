import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:phone007/models/exports.dart';
import 'package:phone007/redux/app_state.dart';
import 'package:phone007/utils/app_colors.dart';
import 'package:phone007/utils/exports.dart';
import 'package:phone007/widgets/chat_detail.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:redux/redux.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key, required this.missionId}) : super(key: key);
  final int missionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: StoreConnector<AppState, List<ChatThreadView>>(
        converter: (Store<AppState> store) {
          return store.state.chatMessageState
              .getChatThreadsForMission(missionId);
        },
        builder: (_, List<ChatThreadView> chatThreads) {
          return Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  top: 70,
                  left: 18.0,
                  right: 18.0,
                  bottom: 12.0,
                ),
                child: const Column(
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
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: chatThreads.length,
                  itemBuilder: (_, int index) {
                    final ChatThreadView chatThreadView = chatThreads[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.gray4,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            chatThreadView.senderImageUrl,
                          ),
                        ),
                        title: Text(chatThreadView.senderName),
                        subtitle:
                            Text(lastMessageText(chatThreadView.lastMessage())),
                        trailing: Text(
                          timeago.format(
                            chatThreadView.lastMessage().sentDate.toLocal(),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push<dynamic>(
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => ChatDetail(
                                chatThreadView: chatThreadView,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  String lastMessageText(ChatMessage chatMessage) {
    if (chatMessage.message != null) {
      if (chatMessage.messageType == MessageType.text) {
        return chatMessage.message ?? '';
      }
      if (chatMessage.messageType == MessageType.image) {
        return 'Image file';
      }
      if (chatMessage.messageType == MessageType.video) {
        return 'Image file';
      }
      if (chatMessage.messageType == MessageType.file) {
        return 'Attachment file';
      }
    }
    return '';
  }
}
