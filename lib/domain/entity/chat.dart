import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String userId;
  final String username;
  final String message;
  final Timestamp timestamp;

  Message(
      {required this.userId,
      required this.username,
      required this.message,
      required this.timestamp});
  factory Message.fromDocument(DocumentSnapshot doc) {
    return Message(
      userId: doc['userId'],
      username: doc['username'],
      message: doc['message'],
      timestamp: doc['timestamp'],
    );
  }
}