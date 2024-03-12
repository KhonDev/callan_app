import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String groups;
  final String id;
  final String username;
  final String email;
  final String photoUrl;
  final int score;
  final bool isadmin;

  User({
    required this.groups,
    required this.id,
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.score,
    required this.isadmin,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc['id'],
      username: doc['username'],
      email: doc['email'],
      photoUrl: doc['photoUrl'].toString(),
      score: doc['score'],
      isadmin: doc['isadmin'],
      groups: doc['groups'],
    );
  }
}
