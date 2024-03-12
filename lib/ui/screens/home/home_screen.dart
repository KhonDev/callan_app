import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testforfirebaseflutter/domain/entity/user.dart';
import 'package:testforfirebaseflutter/ui/screens/create_user.dart';
import 'package:testforfirebaseflutter/ui/pages/home_page.dart';
import 'package:testforfirebaseflutter/ui/screens/unauth.dart';

final googleSignIn = GoogleSignIn();
final userDB = FirebaseFirestore.instance.collection('users');
final chatDB = FirebaseFirestore.instance.collection('chat');

User? currentUser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAuthenticated = false;
  // int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
      checkAndRegister(account);
    }, onError: (e) {
      debugPrint('error: $e');
    });
    googleSignIn.signInSilently(suppressErrors: false).then(
      (account) => checkAndRegister(account),
      onError: (e) {
        debugPrint('error: $e');
      },
    );
  }

  void checkAndRegister(GoogleSignInAccount? account) {
    if (account != null) {
      createUserFirestore();
      isAuthenticated = true;
    } else {
      isAuthenticated = false;
    }
    setState(() {});
  }

  void login() => googleSignIn.signIn();

  void signOut() => googleSignIn.signOut();

  Future<void> createUserFirestore() async {
    final GoogleSignInAccount? user = googleSignIn.currentUser;
    if (user != null) {
      DocumentSnapshot document = await userDB.doc(user.id).get();
      if (!document.exists) {
        final userName = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateUser(),
          ),
        );

        if (userName != null) {
          userDB.doc(user.id).set({
            'id': user.id,
            'score': 5,
            'username': userName,
            'photoUrl': user.photoUrl.toString(),
            'email': user.email,
            'displayName': user.displayName,
            'isadmin': false,
          });
          document = await userDB.doc(user.id).get();
        }
      }
      currentUser = User.fromDocument(document);
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isAuthenticated && currentUser != null) {
      return HomePage();
    }
    return unAuth(onTap: login);
  }
}
