import 'package:flutter/material.dart';
import 'package:testforfirebaseflutter/domain/entity/chat.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageWidget extends StatelessWidget {
  final Message message;
  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
      ),
      title: Text(message.message),
      subtitle: Text(
        timeago.format(
          message.timestamp.toDate(),
        ),
      ),
    );
  }
}
