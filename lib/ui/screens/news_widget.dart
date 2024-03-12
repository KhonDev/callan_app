import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testforfirebaseflutter/domain/entity/chat.dart';
import 'package:testforfirebaseflutter/ui/screens/home/home_screen.dart';
import 'package:testforfirebaseflutter/ui/widgets/message.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final _commentController = TextEditingController();
  late Stream<QuerySnapshot<Map<String, dynamic>>> _messagetrim;
  @override
  void initState() {
    super.initState();
    _messagetrim = chatDB
        .doc('NewScreen')
        .collection('NewScreen')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  void addComment() async {
    final textData = _commentController.text.trim();
    if (textData == '') {
      const ScaffoldMessenger(
        child: SnackBar(
          content: Text('Biror Izoh yozing'),
        ),
      );
    } else {
      await chatDB.doc('NewScreen').collection('NewScreen').add({
        'userId': currentUser!.id,
        'username': currentUser!.username,
        'message': textData,
        'timestamp': DateTime.now(),
      });
    }
    _commentController.clear();
    // ignore: use_build_context_synchronously
    FocusScope.of(context).unfocus();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('NewScreen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _messagetrim,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final List message = snapshot.data.docs
                    .map((doc) => Message.fromDocument(doc))
                    .toList();
                if (message.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Comment',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: message.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MessageWidget(
                      message: message[index],
                    ),
                  ),
                );
              },
            ),
          ),
          if (currentUser!.isadmin == true)
            Padding(
              padding: EdgeInsets.only(bottom: Platform.isIOS ? 20.0 : 0.0),
              child: ListTile(
                tileColor: Colors.transparent,
                title: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    labelText: 'Izoh yozish',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    isDense: true,
                  ),
                ),
                trailing: IconButton(
                  onPressed: addComment,
                  splashRadius: 25.0,
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
