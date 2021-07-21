import 'package:flutter/material.dart';
import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart' as collection;
import 'package:timeago/timeago.dart' as timeago;

class ChatDetail extends StatelessWidget {
  const ChatDetail({Key? key, required this.chatThreadView}) : super(key: key);
  final ChatThreadView chatThreadView;
  @override
  Widget build(BuildContext context) {
    chatThreadView.chatMessages.sort(
      (ChatMessage a, ChatMessage b) => a.sentDate.compareTo(b.sentDate),
    );
    final Map<String, List<ChatMessage>> groupedMessages =
        collection.groupBy<ChatMessage, String>(
      chatThreadView.chatMessages,
      (ChatMessage chatMessage) => timeago.format(
        chatMessage.sentDate.toLocal(),
      ),
    );
    print(groupedMessages.length);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(chatThreadView.senderName),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ListView.builder(
          itemCount: groupedMessages.keys.length,
          itemBuilder: (_, int i) {
            final String key = groupedMessages.keys.elementAt(i);
            final List<ChatMessage>? messages = groupedMessages[key];
            if (messages == null) {
              return Container();
            }

            return Column(
              children: List<Widget>.generate(messages.length + 1, (int j) {
                if (j == 0) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 18),
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      key,
                      style: const TextStyle(fontSize: 24.0),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.gray4,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  );
                }
                final ChatMessage chatMessage = messages[j - 1];
                final Row row = Row(
                  mainAxisAlignment: chatMessage.isSentByMe
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: <Widget>[
                    chatMessage.isSentByMe
                        ? Text(DateFormat.jm().format(chatMessage.sentDate))
                        : CircleAvatar(
                            backgroundImage: AssetImage(
                              chatThreadView.senderImageUrl,
                            ),
                          ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        margin: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: chatMessage.isSentByMe
                              ? AppColors.white
                              : AppColors.gray16,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          chatMessage.message ?? '',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    chatMessage.isSentByMe
                        ? const SizedBox()
                        : Text(DateFormat.jm().format(chatMessage.sentDate))
                  ],
                );
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: row,
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
